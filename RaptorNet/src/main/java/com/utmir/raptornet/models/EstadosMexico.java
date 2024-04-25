package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "estados_mexico")
public class EstadosMexico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long id_estado_mexico;

    private String estado;

    public Long getId_estado_mexico() {
        return id_estado_mexico;
    }

    public void setId_estado_mexico(Long id_estado_mexico) {
        this.id_estado_mexico = id_estado_mexico;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

}
