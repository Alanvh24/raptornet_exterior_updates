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
@Table(name = "utmir_informacion_academica")
public class InformacionAcademica {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "matricula")
    private Alumno alumno;

    @ManyToOne
    @JoinColumn(name = "programa_educativo")
    private Carreras programaEducativo;

    @ManyToOne
    @JoinColumn(name = "id_cuatrimestre")
    private Cuatrimestre cuatrimestre;

    @ManyToOne
    @JoinColumn(name = "id_grupo")
    private Grupo grupo;

    @ManyToOne
    @JoinColumn(name = "id_periodo")
    private Periodos periodo;

    @Column(name = "correo_institucional")
    private String correo_institucional;

    @Column(name = "turno")
    private String turno;

    @ManyToOne
    @JoinColumn(name = "id_status")
    private Status status;

    @OneToMany(mappedBy = "informacionAcademica", cascade = CascadeType.ALL)
    private List<CalificacionesUnidad> calificacionesUnidad;

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public Carreras getProgramaEducativo() {
        return programaEducativo;
    }

    public void setProgramaEducativo(Carreras programaEducativo) {
        this.programaEducativo = programaEducativo;
    }

    public Cuatrimestre getCuatrimestre() {
        return cuatrimestre;
    }

    public void setCuatrimestre(Cuatrimestre cuatrimestre) {
        this.cuatrimestre = cuatrimestre;
    }

    public Grupo getGrupo() {
        return grupo;
    }

    public void setGrupo(Grupo grupo) {
        this.grupo = grupo;
    }

    public Periodos getPeriodo() {
        return periodo;
    }

    public void setPeriodo(Periodos periodo) {
        this.periodo = periodo;
    }

    public String getCorreo_institucional() {
        return correo_institucional;
    }

    public void setCorreo_institucional(String correo_institucional) {
        this.correo_institucional = correo_institucional;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }
}
