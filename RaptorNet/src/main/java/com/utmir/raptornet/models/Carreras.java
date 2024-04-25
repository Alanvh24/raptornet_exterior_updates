package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_catalogo_carreras")
public class Carreras {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_carrera;

    private String carrera;

    private String statusCarrera;

    public String getStatusCarrera() {
        return statusCarrera;
    }

    public void setStatusCarrera(String statusCarrera) {
        this.statusCarrera = statusCarrera;
    }

    private String formato_numerico;

    public String getFormato_numerico() {
        return formato_numerico;
    }

    public void setFormato_numerico(String formato_numerico) {
        this.formato_numerico = formato_numerico;
    }

    public Long getId_carrera() {
        return id_carrera;
    }

    public void setId_carrera(Long id_carrera) {
        this.id_carrera = id_carrera;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

}
