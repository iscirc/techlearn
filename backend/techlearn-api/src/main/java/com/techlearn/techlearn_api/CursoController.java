
package com.techlearn.techlearn_api;

import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;


@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/cursos")
public class CursoController {

    private final CursoRepository cursoRepository;

    public CursoController(CursoRepository cursoRepository) {
        this.cursoRepository = cursoRepository;
    }

    @GetMapping
    public List<Curso> listarTodos() {
        return cursoRepository.findAll();
    }
}


