package com.utmir.raptornet.dto.Docentes;

import java.time.LocalDate;
import java.util.List;

public class FechasPorUnidad {

    private LocalDate fechaInicio;
    private LocalDate fechaCierre;
    private Integer clasesActivas;
    private List<LocalDate> fechasClase; // Actualizado para usar una lista de fechas

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

    public Integer getClasesActivas() {
        return clasesActivas;
    }

    public void setClasesActivas(Integer clasesActivas) {
        this.clasesActivas = clasesActivas;
    }

    public List<LocalDate> getFechasClase() {
        return fechasClase;
    }

    public void setFechasClase(List<LocalDate> fechasClase) {
        this.fechasClase = fechasClase;
    }

}
