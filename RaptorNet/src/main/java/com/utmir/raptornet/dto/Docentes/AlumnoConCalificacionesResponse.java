package com.utmir.raptornet.dto.Docentes;

import java.util.ArrayList;
import java.util.List;

public class AlumnoConCalificacionesResponse {
    private String matricula;
    private String nombre;
    private String apPaterno;
    private String apMaterno;
    private String carrera;
    private String cuatrimestre;
    private String grupo;
    private Long idGrupo;
    private List<CalificacionDetalle> calificaciones;
    private Integer calificacionFinal;

    // Constructor con todos los parámetros necesarios
    public AlumnoConCalificacionesResponse(String matricula, String nombre, String apPaterno, String apMaterno,
            String carrera, String cuatrimestre, String grupo, Long idGrupo,
            List<CalificacionDetalle> calificaciones) {
        this.matricula = matricula;
        this.nombre = nombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.carrera = carrera;
        this.cuatrimestre = cuatrimestre;
        this.grupo = grupo;
        this.idGrupo = idGrupo;
        this.calificaciones = new ArrayList<>(calificaciones); // Crea una copia de la lista para asegurar la
                                                               // inmutabilidad
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getApMaterno() {
        return apMaterno;
    }

    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
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

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public Long getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(Long idGrupo) {
        this.idGrupo = idGrupo;
    }

    public List<CalificacionDetalle> getCalificaciones() {
        return calificaciones;
    }

    public void setCalificaciones(List<CalificacionDetalle> calificaciones) {
        this.calificaciones = calificaciones;
    }

    public Integer getCalificacionFinal() {
        return calificacionFinal;
    }

    public void setCalificacionFinal(Integer calificacionFinal) {
        this.calificacionFinal = calificacionFinal;
    }

}