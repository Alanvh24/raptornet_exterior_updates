package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_estadistica_aspirantes_carrera")
public class EstadisticaAspirantesCarrera {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "id_carrera")
    private Carreras carrera;

    private int cantidadAspirantesNoCompletados;
    private int cantidadAspirantesCompletos;
    private int cantidadAspirantes;
    private int anio;

    public EstadisticaAspirantesCarrera(Carreras carrera) {
    }

    public EstadisticaAspirantesCarrera() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Carreras getCarrera() {
        return carrera;
    }

    public void setCarrera(Carreras carrera) {
        this.carrera = carrera;
    }

    public int getCantidadAspirantesNoCompletados() {
        return cantidadAspirantesNoCompletados;
    }

    public void setCantidadAspirantesNoCompletados(int cantidadAspirantesNoCompletados) {
        this.cantidadAspirantesNoCompletados = cantidadAspirantesNoCompletados;
    }

    public int getCantidadAspirantesCompletos() {
        return cantidadAspirantesCompletos;
    }

    public void setCantidadAspirantesCompletos(int cantidadAspirantesCompletos) {
        this.cantidadAspirantesCompletos = cantidadAspirantesCompletos;
    }

    public int getCantidadAspirantes() {
        return cantidadAspirantes;
    }

    public void setCantidadAspirantes(int cantidadAspirantes) {
        this.cantidadAspirantes = cantidadAspirantes;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }
}
