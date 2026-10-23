package com.techlearn.techlearn_api;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController  
public class AulaController {

    private final AulaRepository repository;

    public AulaController(AulaRepository repository) {
        this.repository = repository;
    }

    @GetMapping("/cursos/{cursoId}/aulas")
    public List<Aula> listarPorCurso(@PathVariable Long cursoId) {
        return repository.findByCursoIdOrderByOrdem(cursoId);
    }

    @GetMapping("/aulas/{id}")   
    public ResponseEntity<Aula> buscar(@PathVariable Long id) {
        return repository.findById(id)
                .map(ResponseEntity::ok)                
                .orElse(ResponseEntity.notFound().build());   
    }
}