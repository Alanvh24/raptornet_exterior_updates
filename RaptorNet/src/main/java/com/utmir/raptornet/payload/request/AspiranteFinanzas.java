package com.utmir.raptornet.payload.request;
import java.util.List;

public class AspiranteFinanzas {
    private String matricula;
    private String nombre;
    private String ap_paterno;
    private String ap_materno;
    private String programa_educativo;
    private List<String> roles;
    private String id_carrera_1;
    private String formato_numerico;
    private List<String> concatenaciones;
    private String fecha_registro;
    private String fecha_registro2;

    private List<String> cuota;
    private List<String> formato_numerico_cuota;
    private List <String> referencia;
    private String verificarPago;
    private List <String> costo;

    private String fecha_generacion;
    private String fecha_limite;
    
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
    public String getPrograma_educativo() {
        return programa_educativo;
    }
    public void setPrograma_educativo(String programa_educativo) {
        this.programa_educativo = programa_educativo;
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
    public String getFormato_numerico() {
        return formato_numerico;
    }
    public void setFormato_numerico(String formato_numerico) {
        this.formato_numerico = formato_numerico;
    }
    public List<String> getConcatenaciones() {
        return concatenaciones;
    }
    public void setConcatenaciones(List<String> concatenaciones) {
        this.concatenaciones = concatenaciones;
    }
    public String getFecha_registro() {
        return fecha_registro;
    }
    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
    public String getFecha_registro2() {
        return fecha_registro2;
    }
    public void setFecha_registro2(String fecha_registro2) {
        this.fecha_registro2 = fecha_registro2;
    }
    public List<String> getCuota() {
        return cuota;
    }
    public void setCuota(List<String> cuota) {
        this.cuota = cuota;
    }
    public List<String> getFormato_numerico_cuota() {
        return formato_numerico_cuota;
    }
    public void setFormato_numerico_cuota(List<String> formato_numerico_cuota) {
        this.formato_numerico_cuota = formato_numerico_cuota;
    }
    public List<String> getReferencia() {
        return referencia;
    }
    public void setReferencia(List<String> referencia) {
        this.referencia = referencia;
    }
    public String getVerificarPago() {
        return verificarPago;
    }
    public void setVerificarPago(String verificarPago) {
        this.verificarPago = verificarPago;
    }
    public List<String> getCosto() {
        return costo;
    }
    public void setCosto(List<String> costo) {
        this.costo = costo;
    }
    public String getFecha_generacion() {
        return fecha_generacion;
    }
    public void setFecha_generacion(String fecha_generacion) {
        this.fecha_generacion = fecha_generacion;
    }
    public String getFecha_limite() {
        return fecha_limite;
    }
    public void setFecha_limite(String fecha_limite) {
        this.fecha_limite = fecha_limite;
    }

}
