package com.techlearn.techlearn_api;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/auth")
public class AuthController {

    private final UsuarioRepository usuarioRepository;
    private final SessaoService sessaoService;
    private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    public AuthController(UsuarioRepository usuarioRepository, SessaoService sessaoService) {
        this.usuarioRepository = usuarioRepository;
        this.sessaoService = sessaoService;
    }

    @PostMapping("/cadastro")
    public ResponseEntity<?> cadastrar(@RequestBody CadastroRequest dados) {
        if (dados.nome() == null || dados.nome().isBlank()
                || dados.email() == null || !dados.email().contains("@")
                || dados.senha() == null || dados.senha().length() < 6) {
            return ResponseEntity.badRequest()
                    .body(Map.of("erro", "Informe nome, e-mail válido e senha com pelo menos 6 caracteres."));
        }

        String email = dados.email().trim().toLowerCase();

        if (usuarioRepository.findByEmail(email).isPresent()) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                    .body(Map.of("erro", "Este e-mail já está cadastrado."));
        }

        Usuario usuario = new Usuario();
        usuario.setNome(dados.nome().trim());
        usuario.setEmail(email);
        usuario.setSenhaHash(encoder.encode(dados.senha()));
        usuario.setPerfil("Aluno");
        usuarioRepository.save(usuario);

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(Map.of("mensagem", "Conta criada com sucesso."));
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest dados) {
        if (dados.email() == null || dados.senha() == null) {
            return ResponseEntity.badRequest()
                    .body(Map.of("erro", "Informe e-mail e senha."));
        }

        Usuario usuario = usuarioRepository
                .findByEmail(dados.email().trim().toLowerCase())
                .orElse(null);

        if (usuario == null || !encoder.matches(dados.senha(), usuario.getSenhaHash())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("erro", "E-mail ou senha incorretos."));
        }

        String token = sessaoService.criar(usuario.getId());

        return ResponseEntity.ok(Map.of(
                "token", token,
                "id", usuario.getId(),
                "nome", usuario.getNome(),
                "perfil", usuario.getPerfil()));
    }
}
