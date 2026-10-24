
package com.techlearn.techlearn_api;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = {
    "http://127.0.0.1:5500",
    "http://localhost:5500"
})
@RestController
@RequestMapping("/aulas")
public class AulaController {

    private final AulaRepository repository;

    public AulaController(AulaRepository repository) {
        this.repository = repository;
    }


    @GetMapping("/curso/{cursoId}")
    public List<Aula> listarPorCurso(
            @PathVariable("cursoId") Long cursoId) {

        return repository.findByCursoIdOrderByOrdemAsc(cursoId);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Aula> buscar(
            @PathVariable("id") Long id) {

        return repository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}
