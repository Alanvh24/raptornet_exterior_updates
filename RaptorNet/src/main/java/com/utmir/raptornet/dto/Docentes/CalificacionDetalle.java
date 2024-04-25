package com.utmir.raptornet.dto.Docentes;

public class CalificacionDetalle {
    private Long idUnidadAsignatura;
    private Double calificacionOrdinaria;
    private boolean recuperacion;
    private Double calificacionRecuperacion;
    private boolean reqAsistencias;
    private String nombreUnidad; // Nuevo campo para el nombre de la unidad

    public CalificacionDetalle(
            Long idUnidadesAsignatura,
            Double calificacionOrdinaria,
            boolean recuperacion,
            Double calificacionRecuperacion,
            boolean reqAsistencias,
            String nombreUnidad) {
        this.idUnidadAsignatura = idUnidadesAsignatura;
        this.calificacionOrdinaria = calificacionOrdinaria;
        this.recuperacion = recuperacion;
        this.calificacionRecuperacion = calificacionRecuperacion;
        this.reqAsistencias = reqAsistencias;
        this.nombreUnidad = nombreUnidad; // Asigna el nombre de la unidad
    }

    public Long getIdUnidadAsignatura() {
        return idUnidadAsignatura;
    }

    public void setIdUnidadAsignatura(Long idUnidadAsignatura) {
        this.idUnidadAsignatura = idUnidadAsignatura;
    }

    public Double getCalificacionOrdinaria() {
        return calificacionOrdinaria;
    }

    public void setCalificacionOrdinaria(Double calificacionOrdinaria) {
        this.calificacionOrdinaria = calificacionOrdinaria;
    }

    public boolean isRecuperacion() {
        return recuperacion;
    }

    public void setRecuperacion(boolean recuperacion) {
        this.recuperacion = recuperacion;
    }

    public Double getCalificacionRecuperacion() {
        return calificacionRecuperacion;
    }

    public void setCalificacionRecuperacion(Double calificacionRecuperacion) {
        this.calificacionRecuperacion = calificacionRecuperacion;
    }

    public boolean isReqAsistencias() {
        return reqAsistencias;
    }

    public void setReqAsistencias(boolean reqAsistencias) {
        this.reqAsistencias = reqAsistencias;
    }

    public String getNombreUnidad() {
        return nombreUnidad;
    }

    public void setNombreUnidad(String nombreUnidad) {
        this.nombreUnidad = nombreUnidad;
    }

}
