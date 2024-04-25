package com.utmir.raptornet.dto.ServiciosEscolares;

import java.util.List;

public class AlumnosAsignar {

    private String matricula;
    private String nombre;
    private String ap_paterno;
    private String ap_materno;
    private String genero;
    private String programa_educativo;
    private String calificacion;
    private String cuatrimestre;
    private String grupo;
    private List<String> roles;
    private String asp_etapa;

    public String getAsp_etapa() {
        return asp_etapa;
    }
    public void setAsp_etapa(String asp_etapa) {
        this.asp_etapa = asp_etapa;
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
    public String getAp_paterno() {
        return ap_paterno;
    }
    public void setAp_paterno(String ap_paterno) {
        this.ap_paterno = ap_paterno;
    }
    public String getAp_materno() {
        return ap_materno;
    }
    public void setAp_materno(String ap_materno) {
        this.ap_materno = ap_materno;
    }
    public String getGenero() {
        return genero;
    }
    public void setGenero(String genero) {
        this.genero = genero;
    }
    public String getPrograma_educativo() {
        return programa_educativo;
    }
    public void setPrograma_educativo(String programa_educativo) {
        this.programa_educativo = programa_educativo;
    }
    public String getCalificacion() {
        return calificacion;
    }
    public void setCalificacion(String calificacion) {
        this.calificacion = calificacion;
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
    public List<String> getRoles() {
        return roles;
    }
    public void setRoles(List<String> roles) {
        this.roles = roles;
    }

}
