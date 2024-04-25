package com.utmir.raptornet.dto.DireccionAcademica;

import java.util.List;

public class AsignarMateriasRequest {

    private String matricula;
    private List<Long> id_asignatura;
    private Long id_grupo;
    private Long idPeriodoCuatrimestre; 

    public Long getIdPeriodoCuatrimestre() {
        return idPeriodoCuatrimestre;
    }

    public void setIdPeriodoCuatrimestre(Long idPeriodoCuatrimestre) {
        this.idPeriodoCuatrimestre = idPeriodoCuatrimestre;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public List<Long> getId_asignatura() {
        return id_asignatura;
    }

    public void setId_asignatura(List<Long> id_asignatura) {
        this.id_asignatura = id_asignatura;
    }

    public Long getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(Long id_grupo) {
        this.id_grupo = id_grupo;
    }

}
