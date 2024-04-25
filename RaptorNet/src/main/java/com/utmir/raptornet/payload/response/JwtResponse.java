package com.utmir.raptornet.payload.response;

import java.util.List;

public class JwtResponse {

  private String matricula;
  private String nombre;
  private String token;
  private String type = "Bearer";
  private String email;
  private String asp_etapa;

  private List<String> roles;

  public JwtResponse(String accessToken, String matricula, String nombre, String email, String asp_etapa,
      List<String> roles) {
    this.token = accessToken;
    this.matricula = matricula;
    this.nombre = nombre;
    this.email = email;
    this.asp_etapa = asp_etapa;
    this.roles = roles;
  }

  public String getAccessToken() {
    return token;
  }

  public void setAccessToken(String accessToken) {
    this.token = accessToken;
  }

  public String getTokenType() {
    return type;
  }

  public void setTokenType(String tokenType) {
    this.type = tokenType;
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

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getAsp_etapa() {
    return asp_etapa;
  }

  public void setAsp_etapa(String asp_etapa) {
    this.asp_etapa = asp_etapa;
  }

  public List<String> getRoles() {
    return roles;
  }
}
