package com.techlearn.techlearn_api;


import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "matriculas")
public class Matricula {

 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id;

 @Column(name = "usuario_id")
 private Long usuarioId;

 @Column(name = "curso_id")
 private Long cursoId;

 
 @Column(name = "matriculado_em", insertable = false, updatable = false)
 private LocalDateTime matriculadoEm;

 public Long getId() { return id; }
 public void setId(Long id) { this.id = id; }
 public Long getUsuarioId() { return usuarioId; }
 public void setUsuarioId(Long usuarioId) { this.usuarioId = usuarioId; }
 public Long getCursoId() { return cursoId; }
 public void setCursoId(Long cursoId) { this.cursoId = cursoId; }
 public LocalDateTime getMatriculadoEm() { return matriculadoEm; }
}