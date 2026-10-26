package com.techlearn.techlearn_api;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/matriculas")  
public class MatriculaController {

    private final MatriculaRepository repository;

    public MatriculaController(MatriculaRepository repository) {
        this.repository = repository;
    }

    @GetMapping("/usuario/{usuarioId}")
    public List<Matricula> listarDoUsuario(@PathVariable Long usuarioId) {
        return repository.findByUsuarioId(usuarioId);
    }

    @PostMapping 
    public ResponseEntity<Matricula> matricular(@RequestBody Matricula m) {
        if (repository.existsByUsuarioIdAndCursoId(m.getUsuarioId(), m.getCursoId())) {
            return ResponseEntity.status(409).build(); 
        }
        m.setId(null); 
        return ResponseEntity.status(201).body(repository.save(m));  
    }

    @DeleteMapping("/{id}")   
    public ResponseEntity<Void> cancelar(@PathVariable Long id) {
        if (!repository.existsById(id)) return ResponseEntity.notFound().build();
        repository.deleteById(id);
        return ResponseEntity.noContent().build(); 
    }
}
