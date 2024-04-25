package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;

public class CrearProyectoAsignaturaRequest {

    private Long idAsignatura;
    private Long idGrupo;
    private String titulo;
    private String objetivo;
    private LocalDate fecha;
    
    public Long getIdAsignatura() {
        return idAsignatura;
    }
    public void setIdAsignatura(Long idAsignatura) {
        this.idAsignatura = idAsignatura;
    }
    public Long getIdGrupo() {
        return idGrupo;
    }
    public void setIdGrupo(Long idGrupo) {
        this.idGrupo = idGrupo;
    }
    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public String getObjetivo() {
        return objetivo;
    }
    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }
    public LocalDate getFecha() {
        return fecha;
    }
    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

}
