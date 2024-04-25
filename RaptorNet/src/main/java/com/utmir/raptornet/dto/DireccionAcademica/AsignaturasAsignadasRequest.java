package com.utmir.raptornet.dto.DireccionAcademica;

import java.util.List;

import com.utmir.raptornet.dto.Docentes.HorariosAsignaturaResponse;
import com.utmir.raptornet.dto.Docentes.ObjetivoAsignaturaResponse;
import com.utmir.raptornet.dto.Docentes.PlaneacionResponse;
import com.utmir.raptornet.dto.Docentes.ProyectoAsignaturaResponse;
import com.utmir.raptornet.dto.Docentes.UnidadAsignaturaDetalle;

public class AsignaturasAsignadasRequest {

    private String matricula_docente;
    private String asignaturas;
    private String programa_educativo;
    private String grupo;
    private String cuatrimestre;
    private List<UnidadAsignaturaDetalle> unidades;
    private Long idAsignatura;
    private Long idGrupo;
    private Long idCarrera;
    private Long idCuatrimestre;
    private Long idPeriodoCuatrimestre;
    private List<PlaneacionResponse> planeaciones;
    private List<ObjetivoAsignaturaResponse> objetivos;
    private List<HorariosAsignaturaResponse> horarios;
    private List<ProyectoAsignaturaResponse> proyecto;
    private Long idAsignacionAsignatura;

    public String getMatricula_docente() {
        return matricula_docente;
    }

    public void setMatricula_docente(String matricula_docente) {
        this.matricula_docente = matricula_docente;
    }

    public String getAsignaturas() {
        return asignaturas;
    }

    public void setAsignaturas(String asignaturas) {
        this.asignaturas = asignaturas;
    }

    public String getPrograma_educativo() {
        return programa_educativo;
    }

    public void setPrograma_educativo(String programa_educativo) {
        this.programa_educativo = programa_educativo;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getCuatrimestre() {
        return cuatrimestre;
    }

    public void setCuatrimestre(String cuatrimestre) {
        this.cuatrimestre = cuatrimestre;
    }

    public Long getIdPeriodoCuatrimestre() {
        return idPeriodoCuatrimestre;
    }

    public void setIdPeriodoCuatrimestre(Long idPeriodoCuatrimestre) {
        this.idPeriodoCuatrimestre = idPeriodoCuatrimestre;
    }

    public List<UnidadAsignaturaDetalle> getUnidades() {
        return unidades;
    }

    public void setUnidades(List<UnidadAsignaturaDetalle> unidades) {
        this.unidades = unidades;
    }

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

    public Long getIdCarrera() {
        return idCarrera;
    }

    public void setIdCarrera(Long idCarrera) {
        this.idCarrera = idCarrera;
    }

    public Long getIdCuatrimestre() {
        return idCuatrimestre;
    }

    public void setIdCuatrimestre(Long idCuatrimestre) {
        this.idCuatrimestre = idCuatrimestre;
    }

    public List<PlaneacionResponse> getPlaneaciones() {
        return planeaciones;
    }

    public void setPlaneaciones(List<PlaneacionResponse> planeaciones) {
        this.planeaciones = planeaciones;
    }

    public List<ObjetivoAsignaturaResponse> getObjetivos() {
        return objetivos;
    }

    public void setObjetivos(List<ObjetivoAsignaturaResponse> objetivos) {
        this.objetivos = objetivos;
    }

    public List<HorariosAsignaturaResponse> getHorarios() {
        return horarios;
    }

    public void setHorarios(List<HorariosAsignaturaResponse> horarios) {
        this.horarios = horarios;
    }

    public List<ProyectoAsignaturaResponse> getProyecto() {
        return proyecto;
    }

    public void setProyecto(List<ProyectoAsignaturaResponse> proyecto) {
        this.proyecto = proyecto;
    }

    public Long getIdAsignacionAsignatura() {
        return idAsignacionAsignatura;
    }

    public void setIdAsignacionAsignatura(Long idAsignacionAsignatura) {
        this.idAsignacionAsignatura = idAsignacionAsignatura;
    }

}
