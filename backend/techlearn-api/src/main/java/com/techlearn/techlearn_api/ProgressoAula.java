package com.techlearn.techlearn_api;


import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "progresso_aulas")
public class ProgressoAula {

 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id;

 @Column(name = "usuario_id")
 private Long usuarioId;

 @Column(name = "aula_id")
 private Long aulaId;

 @Column(name = "concluido_em")
 private LocalDateTime concluidoEm;

 private String status;

 public Long getId() { return id; }
 public void setId(Long id) { this.id = id; }
 public Long getUsuarioId() { return usuarioId; }
 public void setUsuarioId(Long usuarioId) { this.usuarioId = usuarioId; }
 public Long getAulaId() { return aulaId; }
 public void setAulaId(Long aulaId) { this.aulaId = aulaId; }
 public LocalDateTime getConcluidoEm() { return concluidoEm; }
 public void setConcluidoEm(LocalDateTime c) { this.concluidoEm = c; }
 public String getStatus() { return status; }
 public void setStatus(String status) { this.status = status; }
}