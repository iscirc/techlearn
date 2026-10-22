package com.techlearn.techlearn_api;

import jakarta.persistence.*;

@Entity                       
@Table(name = "aulas")        
public class Aula {

    @Id                                               
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private Long id;

    @Column(name = "curso_id")  
    private Long cursoId;

    private String titulo;

    @Column(name = "video_youtube_id")
    private String videoYoutubeId;

    private Integer ordem;
    private String descricao;

 
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getCursoId() { return cursoId; }
    public void setCursoId(Long cursoId) { this.cursoId = cursoId; }
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }
    public String getVideoYoutubeId() { return videoYoutubeId; }
    public void setVideoYoutubeId(String v) { this.videoYoutubeId = v; }
    public Integer getOrdem() { return ordem; }
    public void setOrdem(Integer ordem) { this.ordem = ordem; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String d) { this.descricao = d; }
}