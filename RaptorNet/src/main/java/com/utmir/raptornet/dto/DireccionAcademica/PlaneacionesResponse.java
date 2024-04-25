package com.utmir.raptornet.dto.DireccionAcademica;

import java.time.LocalDate;

public class PlaneacionesResponse {

    private Long idPlaneacion;
    private String noSemana;
    private LocalDate fechaInicio;
    private LocalDate fechaFin;
    private String descripcion;

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

}
