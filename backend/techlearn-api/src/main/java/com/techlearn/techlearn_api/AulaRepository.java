package com.techlearn.techlearn_api;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface AulaRepository extends JpaRepository<Aula, Long> {

    List<Aula> findByCursoIdOrderByOrdem(Long cursoId);
}