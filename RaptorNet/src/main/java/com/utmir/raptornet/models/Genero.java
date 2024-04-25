package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Table (name = "utmir_genero")
@Entity
public class Genero {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_genero;

    private String genero;

    public Long getId_genero() {
        return id_genero;
    }

    public void setId_genero(Long id_genero) {
        this.id_genero = id_genero;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

}
