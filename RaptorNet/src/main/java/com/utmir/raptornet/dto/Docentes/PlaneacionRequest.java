package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;

public class PlaneacionRequest {

    private Long idAsignatura;
    private Long idGrupo;
    private String noSemana;
    private LocalDate fechaInicio;
    private LocalDate fechaFin;
    private String descripcion;
    private String matriculaDocente;
    
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
    public String getNoSemana() {
        return noSemana;
    }
    public void setNoSemana(String noSemana) {
        this.noSemana = noSemana;
    }
    public LocalDate getFechaInicio() {
        return fechaInicio;
    }
    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }
    public LocalDate getFechaFin() {
        return fechaFin;
    }
    public void setFechaFin(LocalDate fechaFin) {
        this.fechaFin = fechaFin;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public String getMatriculaDocente() {
        return matriculaDocente;
    }
    public void setMatriculaDocente(String matriculaDocente) {
        this.matriculaDocente = matriculaDocente;
    }


}
