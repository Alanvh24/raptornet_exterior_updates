package com.utmir.raptornet.payload.request;

public class AspirantesEtapa1 {

    private String matricula;
    private String nombre;
    private String ap_paterno;
    private String ap_materno;
    private String asp_etapa;
    private Integer folio;

    public Integer getFolio() {
        return folio;
    }

    public void setFolio(Integer folio) {
        this.folio = folio;
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

    public String getAsp_etapa() {
        return asp_etapa;
    }

    public void setAsp_etapa(String asp_etapa) {
        this.asp_etapa = asp_etapa;
    }
}
