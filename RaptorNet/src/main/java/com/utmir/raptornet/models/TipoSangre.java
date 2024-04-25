package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table (name = "utmir_tipo_sangre")
public class TipoSangre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_tipo_sangre;

    private String tipo_sangre;

    public Long getId_tipo_sangre() {
        return id_tipo_sangre;
    }

    public void setId_tipo_sangre(Long id_tipo_sangre) {
        this.id_tipo_sangre = id_tipo_sangre;
    }

    public String getTipo_sangre() {
        return tipo_sangre;
    }

    public void setTipo_sangre(String tipo_sangre) {
        this.tipo_sangre = tipo_sangre;
    }


    
}
