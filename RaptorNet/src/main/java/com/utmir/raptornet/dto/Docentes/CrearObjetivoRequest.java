package com.utmir.raptornet.dto.Docentes;

public class CrearObjetivoRequest {

    private Long idAsignatura;
    private Long idGrupo;
    private String objetivo;
    
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
    public String getObjetivo() {
        return objetivo;
    }
    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

}
