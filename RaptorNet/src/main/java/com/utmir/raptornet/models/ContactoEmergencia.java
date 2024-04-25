package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_contacto_emergencia")
public class ContactoEmergencia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_contacto_emergencia;

    private String nombre_contacto_e;
    private String telefono_contacto_e;
    private String email_contacto_e;
    private String parentesco_contacto_e;
    @OneToOne
    @JoinColumn(name = "matricula", referencedColumnName = "matricula")
    private Alumno alumno;

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
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

}
