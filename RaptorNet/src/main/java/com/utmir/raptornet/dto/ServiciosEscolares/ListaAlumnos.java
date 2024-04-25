package com.utmir.raptornet.dto.ServiciosEscolares;

import java.time.LocalDate;
import java.util.List;

public class ListaAlumnos {
    private String matricula;
    private String nombre;
    private String ap_paterno;
    private String ap_materno;
    private String curp;
    private String rfc;
    private String nss;
    private String email;
    private String numero_telefonico;
    private String fecha_nacimiento;
    private String edad;
    private Long id_genero;
    private String genero;
    private Long id_nacionalidad;
    private String nacionalidad;
    private Long id_estado_mexico;
    private String estado;
    private String municipio_nacimiento;
    private String localidad_nacimiento;
    private LocalDate fecha_registro;
    private List<String> roles;
    private String programa_educativo;
    private String asp_etapa;

    // Datos Generales
    private String habla_indigena;
    private String lengua_indigena;
    private String tiene_discapacidad;
    private String discapacidad;

    // Informacion Medica

    private Long id_tipo_sangre;
    private String tipo_sangre;
    private String tiene_alergias;
    private String alergias;

    // Contacto de Emergencia
    private String nombre_contacto_e;
    private String telefono_contacto_e;
    private String email_contacto_e;
    private String parentesco_contacto_e;

    // Antecedentes academicos
    private String nombre_bachillerato;
    private String periodo_bachillerato;
    private String promedio_bachillerato;
    private String id_carrera_1;
    private String id_carrera_2;

    // Informacion Académica
    private String cuatrimestre;
    private String grupo;
    private Long idStatus;

    public Long getIdStatus() {
        return idStatus;
    }
    public void setIdStatus(Long idStatus) {
        this.idStatus = idStatus;
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
    public String getCurp() {
        return curp;
    }
    public void setCurp(String curp) {
        this.curp = curp;
    }
    public String getRfc() {
        return rfc;
    }
    public void setRfc(String rfc) {
        this.rfc = rfc;
    }
    public String getNss() {
        return nss;
    }
    public void setNss(String nss) {
        this.nss = nss;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getNumero_telefonico() {
        return numero_telefonico;
    }
    public void setNumero_telefonico(String numero_telefonico) {
        this.numero_telefonico = numero_telefonico;
    }
    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }
    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }
    public String getEdad() {
        return edad;
    }
    public void setEdad(String edad) {
        this.edad = edad;
    }
    public Long getId_genero() {
        return id_genero;
    }
    public void setId_genero(Long id_genero) {
        this.id_genero = id_genero;
    }
    public String getGenero() {
        return genero;
    }
    public void setGenero(String genero) {
        this.genero = genero;
    }
    public Long getId_nacionalidad() {
        return id_nacionalidad;
    }
    public void setId_nacionalidad(Long id_nacionalidad) {
        this.id_nacionalidad = id_nacionalidad;
    }
    public String getNacionalidad() {
        return nacionalidad;
    }
    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }
    public Long getId_estado_mexico() {
        return id_estado_mexico;
    }
    public void setId_estado_mexico(Long id_estado_mexico) {
        this.id_estado_mexico = id_estado_mexico;
    }
    public String getEstado() {
        return estado;
    }
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public String getMunicipio_nacimiento() {
        return municipio_nacimiento;
    }
    public void setMunicipio_nacimiento(String municipio_nacimiento) {
        this.municipio_nacimiento = municipio_nacimiento;
    }
    public String getLocalidad_nacimiento() {
        return localidad_nacimiento;
    }
    public void setLocalidad_nacimiento(String localidad_nacimiento) {
        this.localidad_nacimiento = localidad_nacimiento;
    }
    public LocalDate getFecha_registro() {
        return fecha_registro;
    }
    public void setFecha_registro(LocalDate fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
    public List<String> getRoles() {
        return roles;
    }
    public void setRoles(List<String> roles) {
        this.roles = roles;
    }
    public String getPrograma_educativo() {
        return programa_educativo;
    }
    public void setPrograma_educativo(String programa_educativo) {
        this.programa_educativo = programa_educativo;
    }
    public String getAsp_etapa() {
        return asp_etapa;
    }
    public void setAsp_etapa(String asp_etapa) {
        this.asp_etapa = asp_etapa;
    }
    public String getHabla_indigena() {
        return habla_indigena;
    }
    public void setHabla_indigena(String habla_indigena) {
        this.habla_indigena = habla_indigena;
    }
    public String getLengua_indigena() {
        return lengua_indigena;
    }
    public void setLengua_indigena(String lengua_indigena) {
        this.lengua_indigena = lengua_indigena;
    }
    public String getTiene_discapacidad() {
        return tiene_discapacidad;
    }
    public void setTiene_discapacidad(String tiene_discapacidad) {
        this.tiene_discapacidad = tiene_discapacidad;
    }
    public String getDiscapacidad() {
        return discapacidad;
    }
    public void setDiscapacidad(String discapacidad) {
        this.discapacidad = discapacidad;
    }
    public Long getId_tipo_sangre() {
        return id_tipo_sangre;
    }
    public void setId_tipo_sangre(Long id_tipo_sangre) {
        this.id_tipo_sangre = id_tipo_sangre;
    }
    public String getTipo_sangre() {
        return tipo_sangre;
    }
    public void setTipo_sangre(String tipo_sangre) {
        this.tipo_sangre = tipo_sangre;
    }
    public String getTiene_alergias() {
        return tiene_alergias;
    }
    public void setTiene_alergias(String tiene_alergias) {
        this.tiene_alergias = tiene_alergias;
    }
    public String getAlergias() {
        return alergias;
    }
    public void setAlergias(String alergias) {
        this.alergias = alergias;
    }
    public String getNombre_contacto_e() {
        return nombre_contacto_e;
    }
    public void setNombre_contacto_e(String nombre_contacto_e) {
        this.nombre_contacto_e = nombre_contacto_e;
    }
    public String getTelefono_contacto_e() {
        return telefono_contacto_e;
    }
    public void setTelefono_contacto_e(String telefono_contacto_e) {
        this.telefono_contacto_e = telefono_contacto_e;
    }
    public String getEmail_contacto_e() {
        return email_contacto_e;
    }
    public void setEmail_contacto_e(String email_contacto_e) {
        this.email_contacto_e = email_contacto_e;
    }
    public String getParentesco_contacto_e() {
        return parentesco_contacto_e;
    }
    public void setParentesco_contacto_e(String parentesco_contacto_e) {
        this.parentesco_contacto_e = parentesco_contacto_e;
    }
    public String getNombre_bachillerato() {
        return nombre_bachillerato;
    }
    public void setNombre_bachillerato(String nombre_bachillerato) {
        this.nombre_bachillerato = nombre_bachillerato;
    }
    public String getPeriodo_bachillerato() {
        return periodo_bachillerato;
    }
    public void setPeriodo_bachillerato(String periodo_bachillerato) {
        this.periodo_bachillerato = periodo_bachillerato;
    }
    public String getPromedio_bachillerato() {
        return promedio_bachillerato;
    }
    public void setPromedio_bachillerato(String promedio_bachillerato) {
        this.promedio_bachillerato = promedio_bachillerato;
    }
    public String getId_carrera_1() {
        return id_carrera_1;
    }
    public void setId_carrera_1(String id_carrera_1) {
        this.id_carrera_1 = id_carrera_1;
    }
    public String getId_carrera_2() {
        return id_carrera_2;
    }
    public void setId_carrera_2(String id_carrera_2) {
        this.id_carrera_2 = id_carrera_2;
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

}
