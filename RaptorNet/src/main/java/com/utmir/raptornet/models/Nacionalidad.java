package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table (name = "utmir_nacionalidad")
public class Nacionalidad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_nacionalidad;

    private String nacionalidad;

    public Long getId_nacionalidad() {
        return id_nacionalidad;
    }

    public void setId_nacionalidad(Long id_nacionalidad) {
        this.id_nacionalidad = id_nacionalidad;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }
    
}
