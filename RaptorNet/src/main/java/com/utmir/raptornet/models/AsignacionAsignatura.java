package com.utmir.raptornet.models;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_asignacion_asignatura")
public class AsignacionAsignatura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAsignacionAsignatura;

    @ManyToOne
    @JoinColumn(name = "matricula", referencedColumnName = "matricula")
    private Alumno alumno;

    @ManyToOne
    @JoinColumn(name = "id_asignatura", referencedColumnName = "idAsignaturas")
    private Asignaturas asignaturas;

    @ManyToOne
    @JoinColumn(name = "id_grupo", referencedColumnName = "id")
    private Grupo grupo;

    @ManyToOne
    @JoinColumn(name = "idPeriodoCuatrimestre", referencedColumnName = "idPeriodoCuatrimestre")
    private PeriodoCuatrimestral periodoCuatrimestrales;

    private Boolean status;

    @OneToMany(mappedBy = "asignacionAsignatura")
    private List<Planeaciones> planeaciones;

    @OneToMany(mappedBy = "asignacionAsignatura", cascade = CascadeType.ALL)
    private List<ObjetivosAsignatura> objetivosAsignaturas;

    @OneToMany(mappedBy = "asignacionAsignatura", cascade = CascadeType.ALL)
    private List<HorariosClase> horariosClases;

    @OneToMany(mappedBy = "asignacionAsignatura", cascade = CascadeType.ALL)
    private List<EvaluacionUnidad> evaluacionUnidad;

    @OneToMany(mappedBy = "asignacionAsignatura", cascade = CascadeType.ALL)
    private List<CalificacionesUnidad> calificacionUnidad;

    @Column(name = "habilitar_candado")
    private boolean habilitarCandado = false;

    public boolean getHabilitarCandado() {
        return habilitarCandado;
    }

    public void setHabilitarCandado(boolean habilitarCandado) {
        this.habilitarCandado = habilitarCandado;
    }

    public List<EvaluacionUnidad> getEvaluacionUnidad() {
        return evaluacionUnidad;
    }

    public void setEvaluacionUnidad(List<EvaluacionUnidad> evaluacionUnidad) {
        this.evaluacionUnidad = evaluacionUnidad;
    }

    public Long getIdAsignacionAsignatura() {
        return idAsignacionAsignatura;
    }

    public void setIdAsignacionAsignatura(Long idAsignacionAsignatura) {
        this.idAsignacionAsignatura = idAsignacionAsignatura;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public PeriodoCuatrimestral getPeriodoCuatrimestrales() {
        return periodoCuatrimestrales;
    }

    public void setPeriodoCuatrimestrales(PeriodoCuatrimestral periodoCuatrimestrales) {
        this.periodoCuatrimestrales = periodoCuatrimestrales;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public Asignaturas getAsignaturas() {
        return asignaturas;
    }

    public void setAsignaturas(Asignaturas asignaturas) {
        this.asignaturas = asignaturas;
    }

    public Grupo getGrupo() {
        return grupo;
    }

    public void setGrupo(Grupo grupo) {
        this.grupo = grupo;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public List<Planeaciones> getPlaneaciones() {
        return planeaciones;
    }

    public void setPlaneaciones(List<Planeaciones> planeaciones) {
        this.planeaciones = planeaciones;
    }

    public List<ObjetivosAsignatura> getObjetivosAsignaturas() {
        return objetivosAsignaturas;
    }

    public void setObjetivosAsignaturas(List<ObjetivosAsignatura> objetivosAsignaturas) {
        this.objetivosAsignaturas = objetivosAsignaturas;
    }

}
