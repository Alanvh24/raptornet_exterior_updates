package com.utmir.raptornet.dto.Docentes;

public class FirmaCalificacionesRemedialDTO {

    private Long id;
    private Integer calificacionRemedial;
    private boolean remedial;
    private boolean firmaRemedial;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getCalificacionRemedial() {
        return calificacionRemedial;
    }

    public void setCalificacionRemedial(Integer calificacionRemedial) {
        this.calificacionRemedial = calificacionRemedial;
    }

    public boolean isRemedial() {
        return remedial;
    }

    public void setRemedial(boolean remedial) {
        this.remedial = remedial;
    }

    public boolean isFirmaRemedial() {
        return firmaRemedial;
    }

    public void setFirmaRemedial(boolean firmaRemedial) {
        this.firmaRemedial = firmaRemedial;
    }

    public FirmaCalificacionesRemedialDTO(
            Long id,
            Integer calificacionRemedial,
            boolean remedial,
            boolean firmaRemedial) {

        this.id = id;
        this.calificacionRemedial = calificacionRemedial;
        this.remedial = remedial;
        this.firmaRemedial = firmaRemedial;
    }

}
