package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;

public class AsistenciasGeneralResponse {

    private String matriculaAlumno;
    private LocalDate fechaAsistencia;
    private Integer tipoAsistencia;
    private String nombreUnidad;

    public String getNombreUnidad() {
        return nombreUnidad;
    }

    public void setNombreUnidad(String nombreUnidad) {
        this.nombreUnidad = nombreUnidad;
    }

    public String getMatriculaAlumno() {
        return matriculaAlumno;
    }

    public void setMatriculaAlumno(String matriculaAlumno) {
        this.matriculaAlumno = matriculaAlumno;
    }

    public LocalDate getFechaAsistencia() {
        return fechaAsistencia;
    }

    public void setFechaAsistencia(LocalDate fechaAsistencia) {
        this.fechaAsistencia = fechaAsistencia;
    }

    public Integer getTipoAsistencia() {
        return tipoAsistencia;
    }

    public void setTipoAsistencia(Integer tipoAsistencia) {
        this.tipoAsistencia = tipoAsistencia;
    }

    public AsistenciasGeneralResponse(String matricula, LocalDate fechaAsistencia, Integer tipoAsistencia, String nombreUnidad) {

        this.matriculaAlumno = matricula;
        this.fechaAsistencia = fechaAsistencia;
        this.tipoAsistencia = tipoAsistencia;
        this.nombreUnidad = nombreUnidad;
    }

}
