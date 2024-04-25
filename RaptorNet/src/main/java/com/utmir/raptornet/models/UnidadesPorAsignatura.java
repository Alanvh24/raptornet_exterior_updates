package com.utmir.raptornet.models;

import java.util.List;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_unidades_asignatura")
public class UnidadesPorAsignatura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idUnidadesAsignatura;

    @ManyToOne
    @JoinColumn(name = "idAsignaturas", referencedColumnName = "idAsignaturas")
    private Asignaturas asignaturas;

    private String nombre_unidad;
    private String total_horas_unidad;
    private double porcentaje;

    @OneToMany(mappedBy = "unidadesAsignatura", cascade = CascadeType.ALL)
    private List<CalificacionesUnidad> calificacionesUnidad;

    public double getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(double porcentaje) {
        this.porcentaje = porcentaje;
    }

    public Long getIdUnidadesAsignatura() {
        return idUnidadesAsignatura;
    }

    public void setIdUnidadesAsignatura(Long idUnidadesAsignatura) {
        this.idUnidadesAsignatura = idUnidadesAsignatura;
    }

    public Asignaturas getAsignaturas() {
        return asignaturas;
    }

    public void setAsignaturas(Asignaturas asignaturas) {
        this.asignaturas = asignaturas;
    }

    public String getNombre_unidad() {
        return nombre_unidad;
    }

    public void setNombre_unidad(String nombre_unidad) {
        this.nombre_unidad = nombre_unidad;
    }

    public String getTotal_horas_unidad() {
        return total_horas_unidad;
    }

    public void setTotal_horas_unidad(String total_horas_unidad) {
        this.total_horas_unidad = total_horas_unidad;
    }

}
