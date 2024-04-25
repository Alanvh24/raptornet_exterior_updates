package com.utmir.raptornet.dto.Docentes;

public class AlumnoRemedialResponse {

    private String matricula;
    private String nombre;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private Long idCalificaciones;
    private Integer calificacionOrdinaria;
    private Integer calificacionRemedial;
    private boolean firmaRemedial;
    private Long idAsignacionAsignatura;

    public AlumnoRemedialResponse(
            String matricula,
            String nombre,
            String ap_paterno,
            String ap_materno,
            Long idCalificaciones,
            Integer calificacionOrdinaria,
            Long idAsignacionAsignatura,
            boolean firmaRemedial,
            Integer calificacionRemedial) {

        this.matricula = matricula;
        this.nombre = nombre;
        this.apellidoPaterno = ap_paterno;
        this.apellidoMaterno = ap_materno;
        this.idCalificaciones = idCalificaciones;
        this.calificacionOrdinaria = calificacionOrdinaria;
        this.calificacionRemedial = calificacionRemedial;
        this.firmaRemedial = firmaRemedial;
        this.idAsignacionAsignatura = idAsignacionAsignatura;

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

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    public Long getIdCalificaciones() {
        return idCalificaciones;
    }

    public void setIdCalificaciones(Long idCalificaciones) {
        this.idCalificaciones = idCalificaciones;
    }

    public Integer getCalificacionOrdinaria() {
        return calificacionOrdinaria;
    }

    public void setCalificacionOrdinaria(Integer calificacionOrdinaria) {
        this.calificacionOrdinaria = calificacionOrdinaria;
    }

    public Integer getCalificacionRemedial() {
        return calificacionRemedial;
    }

    public void setCalificacionRemedial(Integer calificacionRemedial) {
        this.calificacionRemedial = calificacionRemedial;
    }

    public boolean isFirmaRemedial() {
        return firmaRemedial;
    }

    public void setFirmaRemedial(boolean firmaRemedial) {
        this.firmaRemedial = firmaRemedial;
    }

    public Long getIdAsignacionAsignatura() {
        return idAsignacionAsignatura;
    }

    public void setIdAsignacionAsignatura(Long idAsignacionAsignatura) {
        this.idAsignacionAsignatura = idAsignacionAsignatura;
    }

}
