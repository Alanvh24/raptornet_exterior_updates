package com.utmir.raptornet.dto.Docentes;

public class ListaAlumnosResponse {

    private String matricula;
    private String nombre;
    private String ap_paterno;
    private String ap_materno;
    private String carrera;
    private String cuatrimestre;
    private String grupo;
    private Long idGrupo;

    public ListaAlumnosResponse(String matricula, String nombre, String ap_paterno, String ap_materno, String carrera,
            String cuatrimestre, String grupo, Long idGrupo) {
        this.matricula = matricula;
        this.nombre = nombre;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.carrera = carrera;
        this.cuatrimestre = cuatrimestre; // Asigna el cuatrimestre recibido
        this.grupo = grupo;
        this.idGrupo = idGrupo;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAp_paterno() {
        return ap_paterno;
    }

    public void setAp_paterno(String ap_paterno) {
        this.ap_paterno = ap_paterno;
    }

    public String getAp_materno() {
        return ap_materno;
    }

    public void setAp_materno(String ap_materno) {
        this.ap_materno = ap_materno;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getCuatrimestre() {
        return cuatrimestre;
    }

    public void setCuatrimestre(String cuatrimestre) {
        this.cuatrimestre = cuatrimestre;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public Long getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(Long idGrupo) {
        this.idGrupo = idGrupo;
    }

}
