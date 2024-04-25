package com.utmir.raptornet.dto.ServiciosEscolares;

import java.util.ArrayList;
import java.util.List;

public class HistorialAcademico {

    private String matricula; // este proviene de la entidad Alumno
    private String carrera; // La carrera proviene de idAsignacionAsignatura que viene de la entidad
    // AsignacionAsignatura, asignacion asignatura tiene el idAsignatura, que viene
    // de la entidad
    // Asignatura, la asignatura almacena el id carrera que viene de la entidad
    // Carreras y de aqui viene "carrera" que es el nombre de la carrera
    private String cuatrimestre; // misma situacion que el anterior
    private String docente; // viene de AsignacionAsignatura y matricula (que es la del docente)
    private String nombreAsignatura; // misma situacion, primero está idAsignacionasig, luego idAsignatura y luego de
    private String periodo;
    private Integer calificacionOrdinaria; // entidad principal calificaciones
    private boolean remedial; // entidad principal calificaciones
    private Integer calificacionRemedial; // entidad principal calificaciones
    private List<CalificacionUnidadDTO> calificacionesUnidades = new ArrayList<>();

    public List<CalificacionUnidadDTO> getCalificacionesUnidades() {
        return calificacionesUnidades;
    }

    public void setCalificacionesUnidades(List<CalificacionUnidadDTO> calificacionesUnidades) {
        this.calificacionesUnidades = calificacionesUnidades;
    }

    public static class CalificacionUnidadDTO {
        private String nombreUnidad;
        private Double calificacion;

        public String getNombreUnidad() {
            return nombreUnidad;
        }

        public void setNombreUnidad(String nombreUnidad) {
            this.nombreUnidad = nombreUnidad;
        }

        public Double getCalificacion() {
            return calificacion;
        }

        public void setCalificacion(Double calificacion) {
            this.calificacion = calificacion;
        }

    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getCuatrimestre() {
        return cuatrimestre;
    }

    public void setCuatrimestre(String cuatrimestre) {
        this.cuatrimestre = cuatrimestre;
    }

    public String getDocente() {
        return docente;
    }

    public void setDocente(String docente) {
        this.docente = docente;
    }

    public String getNombreAsignatura() {
        return nombreAsignatura;
    }

    public void setNombreAsignatura(String nombreAsignatura) {
        this.nombreAsignatura = nombreAsignatura;
    }

    public Integer getCalificacionOrdinaria() {
        return calificacionOrdinaria;
    }

    public void setCalificacionOrdinaria(Integer calificacionOrdinaria) {
        this.calificacionOrdinaria = calificacionOrdinaria;
    }

    public boolean isRemedial() {
        return remedial;
    }

    public void setRemedial(boolean remedial) {
        this.remedial = remedial;
    }

    public Integer getCalificacionRemedial() {
        return calificacionRemedial;
    }

    public void setCalificacionRemedial(Integer calificacionRemedial) {
        this.calificacionRemedial = calificacionRemedial;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

}
