package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;

public class EvaluacionUnidadRequest {

    private Long idAsignatura;
    private Long idGrupo;
    private Long idUnidadesAsignatura;
    private LocalDate fechaEvaluacion;

    public Long getIdAsignatura() {
        return idAsignatura;
    }

    public void setIdAsignatura(Long idAsignatura) {
        this.idAsignatura = idAsignatura;
    }

    public Long getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(Long idGrupo) {
        this.idGrupo = idGrupo;
    }

    public Long getIdUnidadesAsignatura() {
        return idUnidadesAsignatura;
    }

    public void setIdUnidadesAsignatura(Long idUnidadesAsignatura) {
        this.idUnidadesAsignatura = idUnidadesAsignatura;
    }

    public LocalDate getFechaEvaluacion() {
        return fechaEvaluacion;
    }

    public void setFechaEvaluacion(LocalDate fechaEvaluacion) {
        this.fechaEvaluacion = fechaEvaluacion;
    }

}
