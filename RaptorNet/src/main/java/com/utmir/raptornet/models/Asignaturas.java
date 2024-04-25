package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_asignatura")
public class Asignaturas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAsignaturas;

    private String nombre_asignatura;
    @ManyToOne
    @JoinColumn(name = "id_carrera", referencedColumnName = "id_carrera")
    private Carreras carreras;
    @ManyToOne
    @JoinColumn(name = "id_cuatrimestre", referencedColumnName = "id")
    private Cuatrimestre cuatrimestre;
    private String total_horas;

    public Long getIdAsignaturas() {
        return idAsignaturas;
    }

    public void setIdAsignaturas(Long idAsignaturas) {
        this.idAsignaturas = idAsignaturas;
    }

    public String getNombre_asignatura() {
        return nombre_asignatura;
    }

    public void setNombre_asignatura(String nombre_asignatura) {
        this.nombre_asignatura = nombre_asignatura;
    }

    public Carreras getCarreras() {
        return carreras;
    }

    public void setCarreras(Carreras carreras) {
        this.carreras = carreras;
    }

    public Cuatrimestre getCuatrimestre() {
        return cuatrimestre;
    }

    public void setCuatrimestre(Cuatrimestre cuatrimestre) {
        this.cuatrimestre = cuatrimestre;
    }

    public String getTotal_horas() {
        return total_horas;
    }

    public void setTotal_horas(String total_horas) {
        this.total_horas = total_horas;
    }

}
