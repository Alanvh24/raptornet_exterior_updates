package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_cuotas")
public class Cuotas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_cuota;

    private String cuota;

    private String formato_numerico_cuota;

    private String costo;

    public String getCosto() {
        return costo;
    }

    public void setCosto(String costo) {
        this.costo = costo;
    }

    public Long getId_cuota() {
        return id_cuota;
    }

    public void setId_cuota(Long id_cuota) {
        this.id_cuota = id_cuota;
    }

    public String getCuota() {
        return cuota;
    }

    public void setCuota(String cuota) {
        this.cuota = cuota;
    }

    public String getFormato_numerico_cuota() {
        return formato_numerico_cuota;
    }

    public void setFormato_numerico_cuota(String formato_numerico_cuota) {
        this.formato_numerico_cuota = formato_numerico_cuota;
    }
}
