package com.techlearn.techlearn_api;


import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface ProgressoAulaRepository extends JpaRepository<ProgressoAula, Long> {
 List<ProgressoAula> findByUsuarioId(Long usuarioId);
 Optional<ProgressoAula> findByUsuarioIdAndAulaId(Long usuarioId, Long aulaId);
}