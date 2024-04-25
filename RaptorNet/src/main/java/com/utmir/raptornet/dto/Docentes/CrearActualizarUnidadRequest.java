package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;

public class CrearActualizarUnidadRequest {

    private Long idUnidadesAsignatura;
    private String matriculaDocente;
    private LocalDate fechaInicio;
    private LocalDate fechaCierre;
    private LocalDate fechaRemedial;
    private Boolean status;
    private Integer clasesActivas;
    private String porcentaje;
    private String grupo;

    public Long getIdUnidadesAsignatura() {
        return idUnidadesAsignatura;
    }

    public void setIdUnidadesAsignatura(Long idUnidadesAsignatura) {
        this.idUnidadesAsignatura = idUnidadesAsignatura;
    }

    public String getMatriculaDocente() {
        return matriculaDocente;
    }

    public void setMatriculaDocente(String matriculaDocente) {
        this.matriculaDocente = matriculaDocente;
    }

    public LocalDate getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public LocalDate getFechaCierre() {
        return fechaCierre;
    }

    public void setFechaCierre(LocalDate fechaCierre) {
        this.fechaCierre = fechaCierre;
    }

    public LocalDate getFechaRemedial() {
        return fechaRemedial;
    }

    public void setFechaRemedial(LocalDate fechaRemedial) {
        this.fechaRemedial = fechaRemedial;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getClasesActivas() {
        return clasesActivas;
    }

    public void setClasesActivas(Integer clasesActivas) {
        this.clasesActivas = clasesActivas;
    }

    public String getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(String porcentaje) {
        this.porcentaje = porcentaje;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }
}
