package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_datos_generales")
public class DatosGenerales {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_datos_generales;

    private String habla_indigena;

    private String lengua_indigena;

    private String tiene_discapacidad;

    private String discapacidad;

    @OneToOne
    @JoinColumn(name = "matricula", referencedColumnName = "matricula")
    private Alumno alumno;

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public Long getId_datos_generales() {
        return id_datos_generales;
    }

    public void setId_datos_generales(Long id_datos_generales) {
        this.id_datos_generales = id_datos_generales;
    }

    public String getHabla_indigena() {
        return habla_indigena;
    }

    public void setHabla_indigena(String habla_indigena) {
        this.habla_indigena = habla_indigena;
    }

    public String getLengua_indigena() {
        return lengua_indigena;
    }

    public void setLengua_indigena(String lengua_indigena) {
        this.lengua_indigena = lengua_indigena;
    }

    public String getTiene_discapacidad() {
        return tiene_discapacidad;
    }

    public void setTiene_discapacidad(String tiene_discapacidad) {
        this.tiene_discapacidad = tiene_discapacidad;
    }

    public String getDiscapacidad() {
        return discapacidad;
    }

    public void setDiscapacidad(String discapacidad) {
        this.discapacidad = discapacidad;
    }

}
