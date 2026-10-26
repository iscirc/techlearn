package com.techlearn.techlearn_api;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/chat")
public class ChatbotController {

    private final ChatbotService chatbotService;

    public ChatbotController(ChatbotService chatbotService) {
        this.chatbotService = chatbotService;
    }

    @PostMapping
    public ResponseEntity<?> perguntar(@RequestBody PerguntaRequest dados) {
        String pergunta = dados.pergunta() == null ? "" : dados.pergunta().trim();

        if (pergunta.isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of("erro", "Digite uma pergunta."));
        }
        if (pergunta.length() > 500) {
            return ResponseEntity.badRequest()
                    .body(Map.of("erro", "A pergunta pode ter no máximo 500 caracteres."));
        }

        try {
            String resposta = chatbotService.enviarPergunta(pergunta);
            return ResponseEntity.ok(Map.of("resposta", resposta));
        } catch (ChatbotException e) {
            return ResponseEntity.status(e.getStatus()).body(Map.of("erro", e.getMessage()));
        }
    }
}
