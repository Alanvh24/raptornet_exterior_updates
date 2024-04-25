package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;

public class PlaneacionResponse {

    private Long idPlaneacion;
    private String noSemana;
    private LocalDate fechaInicio;
    private LocalDate fechaFin;
    private String descripcion;
    private Long idGrupo;
    private Long Asignatura;

    public PlaneacionResponse(Long idPlaneacion, String noSemana, LocalDate fechaInicio, LocalDate fechaFin, String descripcion) {
        this.idPlaneacion = idPlaneacion;
        this.noSemana = noSemana;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.descripcion = descripcion;
    }

    public Long getIdPlaneacion() {
        return idPlaneacion;
    }

    public void setIdPlaneacion(Long idPlaneacion) {
        this.idPlaneacion = idPlaneacion;
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

    public Long getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(Long idGrupo) {
        this.idGrupo = idGrupo;
    }

    public Long getAsignatura() {
        return Asignatura;
    }

    public void setAsignatura(Long asignatura) {
        Asignatura = asignatura;
    }

}
