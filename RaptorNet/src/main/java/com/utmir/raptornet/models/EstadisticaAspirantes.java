package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_estadistica_aspirantes")
public class EstadisticaAspirantes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int matriculasGeneradas;
    private int cantidadAspirantesNoCompletados;
    private int cantidadAspirantesCompletos;
    private int anio;

    public EstadisticaAspirantes() {
    }

    // GS

    public EstadisticaAspirantes(int anio) {
        this.anio = anio;
    }
    
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getMatriculasGeneradas() {
        return matriculasGeneradas;
    }

    public void setMatriculasGeneradas(int matriculasGeneradas) {
        this.matriculasGeneradas = matriculasGeneradas;
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

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

}
