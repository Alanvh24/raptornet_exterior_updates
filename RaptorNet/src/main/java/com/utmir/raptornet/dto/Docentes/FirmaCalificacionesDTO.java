package com.utmir.raptornet.dto.Docentes;

public class FirmaCalificacionesDTO {

    private Long id;
    private Integer calificacionOrdinaria;
    private boolean remedial;
    private boolean firmaDocente;

    public FirmaCalificacionesDTO(Long id, Integer calificacionOrdinaria, boolean remedial, boolean firmaDocente) {
        this.id = id;
        this.calificacionOrdinaria = calificacionOrdinaria;
        this.remedial = remedial;
        this.firmaDocente = firmaDocente;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getCalificacionOrdinaria() {
        return calificacionOrdinaria;
    }

    public void setCalificacionOrdinaria(Integer calificacionOrdinaria) {
        this.calificacionOrdinaria = calificacionOrdinaria;
    }

    public boolean isRemedial() {
        return remedial;
    }

    public void setRemedial(boolean remedial) {
        this.remedial = remedial;
    }

    public boolean isFirmaDocente() {
        return firmaDocente;
    }

    public void setFirmaDocente(boolean firmaDocente) {
        this.firmaDocente = firmaDocente;
    }

}