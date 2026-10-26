package com.techlearn.techlearn_api;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/favoritos")
public class FavoritoController {

    private final FavoritoRepository repository;

    public FavoritoController(FavoritoRepository repository) {
        this.repository = repository;
    }

    @GetMapping("/usuario/{usuarioId}")
    public List<Favorito> listarDoUsuario(@PathVariable Long usuarioId) {
        return repository.findByUsuarioId(usuarioId);
    }

    @PostMapping
    public ResponseEntity<Favorito> adicionar(@RequestBody Favorito f) {
        if (repository.existsByUsuarioIdAndCursoId(f.getUsuarioId(), f.getCursoId())) {
            return ResponseEntity.status(409).build();
        }
        f.setId(null);
        return ResponseEntity.status(201).body(repository.save(f));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> remover(@PathVariable Long id) {
        if (!repository.existsById(id)) return ResponseEntity.notFound().build();
        repository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
