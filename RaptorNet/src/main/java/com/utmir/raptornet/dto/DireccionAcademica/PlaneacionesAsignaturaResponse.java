package com.utmir.raptornet.dto.DireccionAcademica;

import java.util.List;

public class PlaneacionesAsignaturaResponse {

    private String matriculaDocente;
    private Long idAsignatura;
    private String nombreAsignatura;
    private Long idGrupo;
    private String grupo;
    private List<PlaneacionesResponse> planeaciones;

    public List<PlaneacionesResponse> getPlaneaciones() {
        return planeaciones;
    }

    public void setPlaneaciones(List<PlaneacionesResponse> planeaciones) {
        this.planeaciones = planeaciones;
    }

    public String getMatriculaDocente() {
        return matriculaDocente;
    }

    public void setMatriculaDocente(String matriculaDocente) {
        this.matriculaDocente = matriculaDocente;
    }

    public Long getIdAsignatura() {
        return idAsignatura;
    }

    public void setIdAsignatura(Long idAsignatura) {
        this.idAsignatura = idAsignatura;
    }

    public String getNombreAsignatura() {
        return nombreAsignatura;
    }

    public void setNombreAsignatura(String nombreAsignatura) {
        this.nombreAsignatura = nombreAsignatura;
    }

    public Long getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(Long idGrupo) {
        this.idGrupo = idGrupo;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

}
