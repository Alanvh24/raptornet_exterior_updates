package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_examen_admision")
public class AspiranteCalificaciones {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_examen_admision;

    @OneToOne
    @JoinColumn(name = "matricula", referencedColumnName = "matricula")
    private Alumno alumno;

    private String calificacion;

    private Integer aciertos;

    private Integer total_aciertos;

    public AspiranteCalificaciones(Alumno alumno2) {
    }

    public AspiranteCalificaciones() {
    }

    public Long getId_examen_admision() {
        return id_examen_admision;
    }

    public void setId_examen_admision(Long id_examen_admision) {
        this.id_examen_admision = id_examen_admision;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public String getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(String calificacion) {
        this.calificacion = calificacion;
    }

    public Integer getAciertos() {
        return aciertos;
    }

    public void setAciertos(Integer aciertos) {
        this.aciertos = aciertos;
    }

    public Integer getTotal_aciertos() {
        return total_aciertos;
    }

    public void setTotal_aciertos(Integer total_aciertos) {
        this.total_aciertos = total_aciertos;
    }

}
