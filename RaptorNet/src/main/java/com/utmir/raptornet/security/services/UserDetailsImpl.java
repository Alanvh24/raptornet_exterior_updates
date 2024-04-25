package com.utmir.raptornet.security.services;

import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.utmir.raptornet.models.Alumno;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class UserDetailsImpl implements UserDetails {

  private String matricula;

  private String nombre;

  private String email;

  @JsonIgnore
  private String password;

  private String asp_etapa;

  private Collection<? extends GrantedAuthority> authorities;

  public UserDetailsImpl(String matricula, String nombre, String email, String password,
      String asp_etapa,
      Collection<? extends GrantedAuthority> authorities) {
    this.matricula = matricula;
    this.nombre = nombre;
    this.email = email;
    this.password = password;
    this.asp_etapa = asp_etapa;
    this.authorities = authorities;
  }

  public static UserDetailsImpl build(Alumno user) {
    List<GrantedAuthority> authorities = user.getRoles().stream()
        .map(role -> new SimpleGrantedAuthority(role.getName().name()))
        .collect(Collectors.toList());

    return new UserDetailsImpl(
        user.getMatricula(),
        user.getNombre(),
        user.getEmail(),
        user.getPassword(),
        user.getAsp_etapa(),
        authorities);
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return authorities;
  }

  public String getMatricula() {
    return matricula;
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

  public String getAsp_etapa() {
    return asp_etapa;
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o)
      return true;
    if (o == null || getClass() != o.getClass())
      return false;
    UserDetailsImpl user = (UserDetailsImpl) o;
    return Objects.equals(matricula, user.matricula);
  }

  @Override
  public String getPassword() {
    return password;
  }

  @Override
  public String getUsername() {
    return matricula;
  }
}
