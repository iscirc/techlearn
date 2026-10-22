package com.techlearn.techlearn_api;


import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface FavoritoRepository extends JpaRepository<Favorito, Long> {
 List<Favorito> findByUsuarioId(Long usuarioId);
 boolean existsByUsuarioIdAndCursoId(Long usuarioId, Long cursoId);
}