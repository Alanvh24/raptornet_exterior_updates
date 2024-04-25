package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;

public class UnidadAsignaturaDetalle {

    private Long idUnidadesAsignatura;
    private String nombreUnidad;
    private String totalHorasUnidad;
    private LocalDate fechaInicio;
    private LocalDate fechaCierre;
    private LocalDate fechaRemedial;
    private Boolean status;
    private Integer clasesActivas;
    private double porcentaje;
    private LocalDate fechaEvaluacion;

    public Long getIdUnidadesAsignatura() {
        return idUnidadesAsignatura;
    }

    public void setIdUnidadesAsignatura(Long idUnidadesAsignatura) {
        this.idUnidadesAsignatura = idUnidadesAsignatura;
    }

    public String getNombreUnidad() {
        return nombreUnidad;
    }

    public void setNombreUnidad(String nombreUnidad) {
        this.nombreUnidad = nombreUnidad;
    }

    public String getTotalHorasUnidad() {
        return totalHorasUnidad;
    }

    public void setTotalHorasUnidad(String totalHorasUnidad) {
        this.totalHorasUnidad = totalHorasUnidad;
    }

    public LocalDate getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public LocalDate getFechaCierre() {
        return fechaCierre;
    }

    public void setFechaCierre(LocalDate fechaCierre) {
        this.fechaCierre = fechaCierre;
    }

    public LocalDate getFechaRemedial() {
        return fechaRemedial;
    }

    public void setFechaRemedial(LocalDate fechaRemedial) {
        this.fechaRemedial = fechaRemedial;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getClasesActivas() {
        return clasesActivas;
    }

    public void setClasesActivas(Integer clasesActivas) {
        this.clasesActivas = clasesActivas;
    }

    public double getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(double porcentaje) {
        this.porcentaje = porcentaje;
    }

    public LocalDate getFechaEvaluacion() {
        return fechaEvaluacion;
    }

    public void setFechaEvaluacion(LocalDate fechaEvaluacion) {
        this.fechaEvaluacion = fechaEvaluacion;
    }

}
