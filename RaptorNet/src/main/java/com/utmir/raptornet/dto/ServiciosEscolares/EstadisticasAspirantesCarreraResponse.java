package com.utmir.raptornet.dto.ServiciosEscolares;

public class EstadisticasAspirantesCarreraResponse {

    private Long id;
    private String carrera;
    private int cantidadAspirantesNoCompletados;
    private int cantidadAspirantesCompletos;
    private int cantidadAspirantes;
    private int anio;
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getCarrera() {
        return carrera;
    }
    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }
    public int getCantidadAspirantesNoCompletados() {
        return cantidadAspirantesNoCompletados;
    }
    public void setCantidadAspirantesNoCompletados(int cantidadAspirantesNoCompletados) {
        this.cantidadAspirantesNoCompletados = cantidadAspirantesNoCompletados;
    }
    public int getCantidadAspirantesCompletos() {
        return cantidadAspirantesCompletos;
    }
    public void setCantidadAspirantesCompletos(int cantidadAspirantesCompletos) {
        this.cantidadAspirantesCompletos = cantidadAspirantesCompletos;
    }
    public int getCantidadAspirantes() {
        return cantidadAspirantes;
    }
    public void setCantidadAspirantes(int cantidadAspirantes) {
        this.cantidadAspirantes = cantidadAspirantes;
    }
    public int getAnio() {
        return anio;
    }
    public void setAnio(int anio) {
        this.anio = anio;
    }


}
