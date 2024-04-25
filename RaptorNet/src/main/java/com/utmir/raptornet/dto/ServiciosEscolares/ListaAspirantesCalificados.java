package com.utmir.raptornet.dto.ServiciosEscolares;

import java.time.LocalDate;
import java.util.List;

public class ListaAspirantesCalificados {
    private String matricula;
    private String nombre;
    private String ap_paterno;
    private String ap_materno;
    private String id_carrera_1;
    private String genero;
    private LocalDate fecha_registro;
    private List<String> roles;
    private Integer aciertos;
    private Integer total_aciertos;
    private String calificacion;
    private String grupoPerteneciente;
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
    public String getId_carrera_1() {
        return id_carrera_1;
    }
    public void setId_carrera_1(String id_carrera_1) {
        this.id_carrera_1 = id_carrera_1;
    }
    public String getGenero() {
        return genero;
    }
    public void setGenero(String genero) {
        this.genero = genero;
    }
    public LocalDate getFecha_registro() {
        return fecha_registro;
    }
    public void setFecha_registro(LocalDate fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
    public List<String> getRoles() {
        return roles;
    }
    public void setRoles(List<String> roles) {
        this.roles = roles;
    }
    public Integer getAciertos() {
        return aciertos;
    }
    public void setAciertos(Integer aciertos) {
        this.aciertos = aciertos;
    }
    public Integer getTotal_aciertos() {
        return total_aciertos;
    }
    public void setTotal_aciertos(Integer total_aciertos) {
        this.total_aciertos = total_aciertos;
    }
    public String getCalificacion() {
        return calificacion;
    }
    public void setCalificacion(String calificacion) {
        this.calificacion = calificacion;
    }
    public String getGrupoPerteneciente() {
        return grupoPerteneciente;
    }
    public void setGrupoPerteneciente(String grupoPerteneciente) {
        this.grupoPerteneciente = grupoPerteneciente;
    }
}