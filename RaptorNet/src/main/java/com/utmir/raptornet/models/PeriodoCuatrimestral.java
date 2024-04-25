package com.utmir.raptornet.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_periodo_cuatrimestral")
public class PeriodoCuatrimestral {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idPeriodoCuatrimestre;

    @Column(name = "periodo")
    private String periodo;

    @Column(name = "mes_inicio")
    private String mesInicio;

    @Column(name = "mes_fin")
    private String mesFin;

    @Column(name = "anio")
    private Integer anio;

    private Boolean status;

    public Long getIdPeriodoCuatrimestre() {
        return idPeriodoCuatrimestre;
    }

    public void setIdPeriodoCuatrimestre(Long idPeriodoCuatrimestre) {
        this.idPeriodoCuatrimestre = idPeriodoCuatrimestre;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getMesInicio() {
        return mesInicio;
    }

    public void setMesInicio(String mesInicio) {
        this.mesInicio = mesInicio;
    }

    public String getMesFin() {
        return mesFin;
    }

    public void setMesFin(String mesFin) {
        this.mesFin = mesFin;
    }

    public Integer getAnio() {
        return anio;
    }

    public void setAnio(Integer anio) {
        this.anio = anio;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }



}
