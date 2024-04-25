package com.utmir.raptornet.dto;

import java.time.LocalDate;
import java.util.List;

public class AspiranteCalificacionDTO {

    private String matricula;
    private String nombre;
    private String ap_paterno;
    private String ap_materno;
    private String email;
    private String genero;
    private String numero_telefonico;
    private LocalDate fecha_registro;
    private String nombre_contacto_e;
    private String telefono_contacto_e;
    private String email_contacto_e;
    private String parentesco_contacto_e;
    private List<String> roles;
    private String id_carrera_1;
    private Integer aciertos;
    private Integer total_aciertos;
    private String calificacion;
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
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getGenero() {
        return genero;
    }
    public void setGenero(String genero) {
        this.genero = genero;
    }
    public String getNumero_telefonico() {
        return numero_telefonico;
    }
    public void setNumero_telefonico(String numero_telefonico) {
        this.numero_telefonico = numero_telefonico;
    }
    public LocalDate getFecha_registro() {
        return fecha_registro;
    }
    public void setFecha_registro(LocalDate fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
    public String getNombre_contacto_e() {
        return nombre_contacto_e;
    }
    public void setNombre_contacto_e(String nombre_contacto_e) {
        this.nombre_contacto_e = nombre_contacto_e;
    }
    public String getTelefono_contacto_e() {
        return telefono_contacto_e;
    }
    public void setTelefono_contacto_e(String telefono_contacto_e) {
        this.telefono_contacto_e = telefono_contacto_e;
    }
    public String getEmail_contacto_e() {
        return email_contacto_e;
    }
    public void setEmail_contacto_e(String email_contacto_e) {
        this.email_contacto_e = email_contacto_e;
    }
    public String getParentesco_contacto_e() {
        return parentesco_contacto_e;
    }
    public void setParentesco_contacto_e(String parentesco_contacto_e) {
        this.parentesco_contacto_e = parentesco_contacto_e;
    }
    public List<String> getRoles() {
        return roles;
    }
    public void setRoles(List<String> roles) {
        this.roles = roles;
    }
    public String getId_carrera_1() {
        return id_carrera_1;
    }
    public void setId_carrera_1(String id_carrera_1) {
        this.id_carrera_1 = id_carrera_1;
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

}
