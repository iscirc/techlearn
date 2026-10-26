package com.techlearn.techlearn_api;

import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/progresso")
public class ProgressoAulaController {

    private final ProgressoAulaRepository repository;

    public ProgressoAulaController(ProgressoAulaRepository repository) {
        this.repository = repository;
    }

    @GetMapping("/usuario/{usuarioId}")
    public List<ProgressoAula> listarDoUsuario(@PathVariable Long usuarioId) {
        return repository.findByUsuarioId(usuarioId);
    }

    @PostMapping("/concluir")
    public ProgressoAula concluir(@RequestBody ProgressoAula p) {
        ProgressoAula registro = repository
                .findByUsuarioIdAndAulaId(p.getUsuarioId(), p.getAulaId())
                .orElseGet(() -> {     
                    ProgressoAula novo = new ProgressoAula();
                    novo.setUsuarioId(p.getUsuarioId());
                    novo.setAulaId(p.getAulaId());
                    return novo;
                });
        registro.setStatus("CONCLUIDA");
        registro.setConcluidoEm(LocalDateTime.now());
        return repository.save(registro);   
    }
}
