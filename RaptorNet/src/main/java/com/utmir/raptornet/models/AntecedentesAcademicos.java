package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_antecedentes_academicos")
public class AntecedentesAcademicos {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_antecedentes_academicos;

    private String nombre_bachillerato;

    private String promedio_bachillerato;

    private String periodo_bachillerato;

    @ManyToOne
    @JoinColumn(name = "id_carrera_1")
    private Carreras id_carrera_1;

    @ManyToOne
    @JoinColumn(name = "id_carrera_2")
    private Carreras id_carrera_2;

    @OneToOne
    @JoinColumn(name = "matricula", referencedColumnName = "matricula")
    private Alumno alumno;

    public Long getId_antecedentes_academicos() {
        return id_antecedentes_academicos;
    }

    public void setId_antecedentes_academicos(Long id_antecedentes_academicos) {
        this.id_antecedentes_academicos = id_antecedentes_academicos;
    }

    public String getNombre_bachillerato() {
        return nombre_bachillerato;
    }

    public void setNombre_bachillerato(String nombre_bachillerato) {
        this.nombre_bachillerato = nombre_bachillerato;
    }

    public String getPromedio_bachillerato() {
        return promedio_bachillerato;
    }

    public void setPromedio_bachillerato(String promedio_bachillerato) {
        this.promedio_bachillerato = promedio_bachillerato;
    }

    public String getPeriodo_bachillerato() {
        return periodo_bachillerato;
    }

    public void setPeriodo_bachillerato(String periodo_bachillerato) {
        this.periodo_bachillerato = periodo_bachillerato;
    }

    public Carreras getId_carrera_1() {
        return id_carrera_1;
    }

    public void setId_carrera_1(Carreras id_carrera_1) {
        this.id_carrera_1 = id_carrera_1;
    }

    public Carreras getId_carrera_2() {
        return id_carrera_2;
    }

    public void setId_carrera_2(Carreras id_carrera_2) {
        this.id_carrera_2 = id_carrera_2;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

}
