package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;

public class ObjetivoAsignaturaResponse {

    private Long idObjetivoAsignatura;
    private String objetivo;
    private LocalDate fechaEntregaPlaneacion;
    
    public Long getIdObjetivoAsignatura() {
        return idObjetivoAsignatura;
    }

    public void setIdObjetivoAsignatura(Long idObjetivoAsignatura) {
        this.idObjetivoAsignatura = idObjetivoAsignatura;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public LocalDate getFechaEntregaPlaneacion() {
        return fechaEntregaPlaneacion;
    }

    public void setFechaEntregaPlaneacion(LocalDate fechaEntregaPlaneacion) {
        this.fechaEntregaPlaneacion = fechaEntregaPlaneacion;
    }

    public ObjetivoAsignaturaResponse(Long idObjetivoAsignatura, String objetivo, LocalDate fechaEntregaPlaneacion) {
        this.idObjetivoAsignatura = idObjetivoAsignatura;
        this.objetivo = objetivo;
        this.fechaEntregaPlaneacion = fechaEntregaPlaneacion;
    }

}
