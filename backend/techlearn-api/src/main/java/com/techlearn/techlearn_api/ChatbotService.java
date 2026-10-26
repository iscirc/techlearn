package com.techlearn.techlearn_api;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestClientResponseException;

@Service
public class ChatbotService {

    private static final Logger log =
            LoggerFactory.getLogger(ChatbotService.class);

    private static final String URL_BASE =
            "https://generativelanguage.googleapis.com/v1beta/models/";

    private static final String SEM_RESPOSTA =
            "Não consegui gerar uma resposta. Tente reformular a pergunta.";

    private final CursoRepository cursoRepository;
    private final RestClient restClient;
    private final String apiKey;
    private final String modelo;

    public ChatbotService(
            CursoRepository cursoRepository,
            @Value("${chatbot.api-key:}") String apiKey,
            @Value("${chatbot.modelo:gemini-3.5-flash-lite}") String modelo) {

        this.cursoRepository = cursoRepository;
        this.restClient = RestClient.create();
        this.apiKey = apiKey != null ? apiKey.trim() : "";
        String mod = (modelo != null && !modelo.isBlank()) ? modelo.trim() : "gemini-3.5-flash-lite";
        if (mod.startsWith("models/")) {
            mod = mod.substring("models/".length());
        }
        this.modelo = mod;
    }

    public String enviarPergunta(String pergunta) {

        if (apiKey == null || apiKey.isBlank()
                || modelo == null || modelo.isBlank()) {

            log.error("A chave da API ou o modelo da IA não foi configurado.");

            throw new ChatbotException(
                    HttpStatus.SERVICE_UNAVAILABLE,
                    "O assistente de IA está indisponível no momento."
            );
        }

        if (pergunta == null || pergunta.isBlank()) {
            throw new ChatbotException(
                    HttpStatus.BAD_REQUEST,
                    "Digite uma pergunta antes de enviar."
            );
        }

        Map<String, Object> corpo = Map.of(
                "systemInstruction",
                Map.of(
                        "parts",
                        List.of(
                                Map.of("text", instrucoes())
                        )
                ),
                "contents",
                List.of(
                        Map.of(
                                "role", "user",
                                "parts", List.of(
                                        Map.of("text", pergunta.trim())
                                )
                        )
                )
        );

        List<String> modelosParaTentar = new ArrayList<>();
        if (this.modelo != null && !this.modelo.isBlank()) {
            modelosParaTentar.add(this.modelo);
        }
        for (String m : List.of("gemini-3.5-flash-lite", "gemini-3.5-flash", "gemini-3.8-flash")) {
            if (!modelosParaTentar.contains(m)) {
                modelosParaTentar.add(m);
            }
        }

        RestClientResponseException ultimoErroHttp = null;
        RestClientException ultimoErroClient = null;

        for (String mod : modelosParaTentar) {
            try {
                RespostaIA resposta = restClient.post()
                        .uri(URL_BASE + mod + ":generateContent")
                        .header("x-goog-api-key", apiKey)
                        .contentType(MediaType.APPLICATION_JSON)
                        .body(corpo)
                        .retrieve()
                        .body(RespostaIA.class);

                return obterResposta(resposta);

            } catch (RestClientResponseException e) {
                log.warn("Modelo {} falhou (HTTP {}). Tentando fallback...", mod, e.getStatusCode());
                ultimoErroHttp = e;
            } catch (RestClientException e) {
                log.warn("Modelo {} falhou ({}). Tentando fallback...", mod, e.getMessage());
                ultimoErroClient = e;
            }
        }

        if (ultimoErroHttp != null) {
            throw tratarErro(
                    ultimoErroHttp.getStatusCode().value(),
                    ultimoErroHttp.getResponseBodyAsString()
            );
        }

        throw tratarErro(
                0,
                ultimoErroClient != null ? ultimoErroClient.getMessage() : "Erro de conexao"
        );
    }

    private String instrucoes() {

        String cursos = cursoRepository.findAll()
                .stream()
                .map(Curso::getTitulo)
                .collect(Collectors.joining("; "));

        return "Você é o assistente virtual do TechLearn, "
                + "uma plataforma de cursos online de tecnologia. "
                + "Responda sempre em português do Brasil. "
                + "Use linguagem simples, clara e amigável. "
                + "Seja objetivo e procure responder em até 6 frases. "
                + "Ajude com dúvidas de programação, Python, Java "
                + "e bancos de dados. "
                + "Quando for útil, indique cursos do catálogo. "
                + "Cursos disponíveis: " + cursos + ". "
                + "Se a pergunta não tiver relação com tecnologia "
                + "ou com a plataforma, explique gentilmente que "
                + "seu foco é ajudar com esses assuntos. "
                + "Não invente informações sobre o TechLearn.";
    }

    private String obterResposta(RespostaIA resposta) {

        if (resposta == null || resposta.candidates() == null
                || resposta.candidates().isEmpty()) {

            return SEM_RESPOSTA;
        }

        Candidato candidato = resposta.candidates().get(0);

        if (candidato == null) {
            return SEM_RESPOSTA;
        }

        Conteudo conteudo = candidato.content();

        if (conteudo == null || conteudo.parts() == null) {
            return SEM_RESPOSTA;
        }

        StringBuilder texto = new StringBuilder();

        for (Parte parte : conteudo.parts()) {

            if (parte != null && parte.text() != null) {
                texto.append(parte.text());
            }
        }

        String resultado = texto.toString().trim();

        if (resultado.isEmpty()) {
            return SEM_RESPOSTA;
        }

        return resultado;
    }

    private ChatbotException tratarErro(int status, String detalhe) {

        String resumo = detalhe == null
                ? ""
                : detalhe.substring(0, Math.min(detalhe.length(), 300));

        log.error(
                "Falha ao chamar a API do Gemini. Status: {}. Detalhe: {}",
                status,
                resumo
        );

        if (status == 429) {
            return new ChatbotException(
                    HttpStatus.TOO_MANY_REQUESTS,
                    "Muitas perguntas em pouco tempo. "
                            + "Aguarde um instante e tente novamente."
            );
        }

        return new ChatbotException(
                HttpStatus.SERVICE_UNAVAILABLE,
                "O assistente de IA está indisponível no momento. "
                        + "Tente novamente em alguns instantes."
        );
    }

    public record RespostaIA(List<Candidato> candidates) {
    }

    public record Candidato(Conteudo content) {
    }

    public record Conteudo(List<Parte> parts) {
    }

    public record Parte(String text) {
    }
}
