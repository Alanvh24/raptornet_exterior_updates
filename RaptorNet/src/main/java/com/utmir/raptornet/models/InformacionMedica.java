package com.utmir.raptornet.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "utmir_informacion_medica")
public class InformacionMedica {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_info_medica;

    @ManyToOne
    @JoinColumn(name = "id_tipo_sangre")
    private TipoSangre id_tipo_sangre;

    private String tiene_alergias;

    private String alergias;

    @OneToOne
    @JoinColumn(name = "matricula", referencedColumnName = "matricula")
    private Alumno alumno;

    public TipoSangre getId_tipo_sangre() {
        return id_tipo_sangre;
    }

    public void setId_tipo_sangre(TipoSangre id_tipo_sangre) {
        this.id_tipo_sangre = id_tipo_sangre;
    }

    public Long getId_info_medica() {
        return id_info_medica;
    }

    public void setId_info_medica(Long id_info_medica) {
        this.id_info_medica = id_info_medica;
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

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

}
