package com.utmir.raptornet.payload.request;

import java.time.LocalDate;
import java.util.Set;

import jakarta.validation.constraints.*;

public class SignupPersonal {

  @NotBlank
  private String matricula;

  @NotBlank
  @Size(max = 50)
  @Email
  private String email;

  private Set<String> role;

  @NotBlank
  @Size(min = 6, max = 40)
  private String password;

  private LocalDate fechaRegistro;

  private String nombre;
  
  private String apPaterno;

  private String apMaterno;

  public String getMatricula() {
    return matricula;
  }

  public void setMatricula(String matricula) {
    this.matricula = matricula;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public Set<String> getRole() {
    return role;
  }

  public void setRole(Set<String> role) {
    this.role = role;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public LocalDate getFechaRegistro() {
    return fechaRegistro;
  }

  public void setFechaRegistro(LocalDate fechaRegistro) {
    this.fechaRegistro = fechaRegistro;
  }

  public String getNombre() {
    return nombre;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }

  public String getApPaterno() {
    return apPaterno;
  }

  public void setApPaterno(String apPaterno) {
    this.apPaterno = apPaterno;
  }

  public String getApMaterno() {
    return apMaterno;
  }

  public void setApMaterno(String apMaterno) {
    this.apMaterno = apMaterno;
  }


}
