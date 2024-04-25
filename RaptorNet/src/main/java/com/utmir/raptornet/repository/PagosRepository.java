package com.utmir.raptornet.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.Pagos;

public interface PagosRepository extends JpaRepository<Pagos, Long> {

    Optional<Pagos> findByAlumno(Alumno alumno);

    List<Pagos> findByAlumnoMatricula(String matricula);

    List<Pagos> findByConcatenado(String concatenado);

    @Query("SELECT p FROM Pagos p")
    List<Pagos> findAllPagos();

    List<Pagos> findByReferencia(String referencia);

}
