package com.utmir.raptornet.models;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_pagos")
public class Pagos {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_pago;

    @ManyToOne
    @JoinColumn(name = "id_cuota")
    private Cuotas id_cuota;

    @ManyToOne
    @JoinColumn(name = "matricula", referencedColumnName = "matricula")
    private Alumno alumno;

    private String concatenado;

    private String referencia;

    private String verificar_pago;

    private LocalDate fecha_generacion;

    private LocalDate fecha_limite;

    private Boolean referenciaAsignada;

    private Integer folio;

    public Integer getFolio() {
        return folio;
    }

    public void setFolio(Integer folio) {
        this.folio = folio;
    }

    public Boolean getReferenciaAsignada() {
        return referenciaAsignada;
    }

    public void setReferenciaAsignada(Boolean referenciaAsignada) {
        this.referenciaAsignada = referenciaAsignada;
    }

    public LocalDate getFecha_generacion() {
        return fecha_generacion;
    }

    public void setFecha_generacion(LocalDate fecha_generacion) {
        this.fecha_generacion = fecha_generacion;
    }

    public LocalDate getFecha_limite() {
        return fecha_limite;
    }

    public void setFecha_limite(LocalDate fecha_limite) {
        this.fecha_limite = fecha_limite;
    }

    public String getVerificar_pago() {
        return verificar_pago;
    }

    public void setVerificar_pago(String verificar_pago) {
        this.verificar_pago = verificar_pago;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getConcatenado() {
        return concatenado;
    }

    public void setConcatenado(String concatenado) {
        this.concatenado = concatenado;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public Cuotas getId_cuota() {
        return id_cuota;
    }

    public void setId_cuota(Cuotas id_cuota) {
        this.id_cuota = id_cuota;
    }

    public Long getId_pago() {
        return id_pago;
    }

    public void setId_pago(Long id_pago) {
        this.id_pago = id_pago;
    }
}
