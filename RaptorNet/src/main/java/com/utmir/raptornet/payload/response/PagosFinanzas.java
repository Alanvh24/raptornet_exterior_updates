package com.utmir.raptornet.payload.response;

public class PagosFinanzas {

    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    private String matricula;
    private String nombre;
    private String ap_paterno;
    private String ap_materno;
    private String programa_educativo;
    private String cuota;
    private String costo;
    private String referencia;
    private String verificarPago;
    private String id_carrera_1;
    private Integer folio;

    public Integer getFolio() {
        return folio;
    }

    public void setFolio(Integer folio) {
        this.folio = folio;
    }

    public String getId_carrera_1() {
        return id_carrera_1;
    }

    public void setId_carrera_1(String id_carrera_1) {
        this.id_carrera_1 = id_carrera_1;
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

    public String getPrograma_educativo() {
        return programa_educativo;
    }

    public void setPrograma_educativo(String programa_educativo) {
        this.programa_educativo = programa_educativo;
    }

    public String getCuota() {
        return cuota;
    }

    public void setCuota(String cuota) {
        this.cuota = cuota;
    }

    public String getCosto() {
        return costo;
    }

    public void setCosto(String costo) {
        this.costo = costo;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getVerificarPago() {
        return verificarPago;
    }

    public void setVerificarPago(String verificarPago) {
        this.verificarPago = verificarPago;
    }

}
