package com.utmir.raptornet.models;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "utmir_info_personal", uniqueConstraints = {
    @UniqueConstraint(columnNames = "matricula"),
    @UniqueConstraint(columnNames = "email"),
    @UniqueConstraint(columnNames = "curp")
})
public class Alumno {
  @Id
  @Size(max = 20)
  private String matricula;

  @Size(max = 100)
  private String nombre;

  @Size(max = 100)
  private String ap_paterno;

  @Size(max = 100)
  private String ap_materno;

  private String fecha_nacimiento;

  @Size(max = 3)
  private String edad;

  @Size(max = 20)
  private String curp;

  @Size(max = 20)
  private String rfc;

  @Size(max = 30)
  private String nss;

  @ManyToOne
  @JoinColumn(name = "id_nacionalidad")
  private Nacionalidad id_nacionalidad;

  @ManyToOne
  @JoinColumn(name = "id_estados_mexico")
  private EstadosMexico id_estado_mexico;

  @Size(max = 100)
  private String municipio_nacimiento;

  @Size(max = 100)
  private String localidad_nacimiento;

  @ManyToOne
  @JoinColumn(name = "id_genero")
  private Genero id_genero;

  @Size(max = 15)
  private String numero_telefonico;

  @Size(max = 50)
  @Email
  private String email;

  @Size(max = 120)
  private String password;

  @ManyToOne
  @JoinColumn(name = "id_status")
  private Status id_status;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(name = "matricula_roles", joinColumns = @JoinColumn(name = "matricula_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
  private Set<Role> roles = new HashSet<>();

  @OneToMany(mappedBy = "alumno", cascade = CascadeType.ALL)
  private Set<AntecedentesAcademicos> antecedentesAcademicos = new HashSet<>();

  @OneToMany(mappedBy = "alumno", cascade = CascadeType.ALL)
  private Set<Pagos> pagos = new HashSet<>();

  private String asp_etapa;

  private LocalDate fecha_registro;

  @OneToMany(mappedBy = "alumno", cascade = CascadeType.ALL)
  private List<CalificacionesUnidad> calificacionesUnidad;

  // Constructores
  public Alumno() {
  }

  public Alumno(String curp, String email, String password) {
    this.curp = curp;
    this.email = email;
    this.password = password;
    this.fecha_registro = LocalDate.now();
  }

  public Alumno(String email, String password) {
    this.email = email;
    this.password = password;

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

  public Nacionalidad getId_nacionalidad() {
    return id_nacionalidad;
  }

  public void setId_nacionalidad(Nacionalidad id_nacionalidad) {
    this.id_nacionalidad = id_nacionalidad;
  }

  public EstadosMexico getId_estado_mexico() {
    return id_estado_mexico;
  }

  public void setId_estado_mexico(EstadosMexico id_estado_mexico) {
    this.id_estado_mexico = id_estado_mexico;
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

  public Genero getId_genero() {
    return id_genero;
  }

  public void setId_genero(Genero id_genero) {
    this.id_genero = id_genero;
  }

  public String getNumero_telefonico() {
    return numero_telefonico;
  }

  public void setNumero_telefonico(String numero_telefonico) {
    this.numero_telefonico = numero_telefonico;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Status getId_status() {
    return id_status;
  }

  public void setId_status(Status id_status) {
    this.id_status = id_status;
  }

  public Set<Role> getRoles() {
    return roles;
  }

  public void setRoles(Set<Role> roles) {
    this.roles = roles;
  }

  public Set<AntecedentesAcademicos> getAntecedentesAcademicos() {
    return antecedentesAcademicos;
  }

  public void setAntecedentesAcademicos(Set<AntecedentesAcademicos> antecedentesAcademicos) {
    this.antecedentesAcademicos = antecedentesAcademicos;
  }

  public Set<Pagos> getPagos() {
    return pagos;
  }

  public void setPagos(Set<Pagos> pagos) {
    this.pagos = pagos;
  }

  public String getAsp_etapa() {
    return asp_etapa;
  }

  public void setAsp_etapa(String asp_etapa) {
    this.asp_etapa = asp_etapa;
  }

  public LocalDate getFecha_registro() {
    return fecha_registro;
  }

  public void setFecha_registro(LocalDate fecha_registro) {
    this.fecha_registro = fecha_registro;
  }

  // Getters & Setters

}