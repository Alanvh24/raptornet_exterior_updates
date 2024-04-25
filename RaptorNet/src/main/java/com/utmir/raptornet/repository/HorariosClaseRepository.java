package com.utmir.raptornet.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.utmir.raptornet.models.HorariosClase;

public interface HorariosClaseRepository extends JpaRepository<HorariosClase, Long> {

    List<HorariosClase> findByAsignacionAsignatura_IdAsignacionAsignatura(Long idAsignacionAsignatura);

    // En HorariosClaseRepository
    @Query("SELECT h FROM HorariosClase h WHERE h.asignacionAsignatura.asignaturas.id = :idAsignatura")
    List<HorariosClase> findHorariosByAsignaturaId(Long idAsignatura);

    List<HorariosClase> findHorariosByAsignacionAsignatura_IdAsignacionAsignatura(Long idAsignacionAsignatura);

    Optional<HorariosClase> findByDiaClaseAndAsignacionAsignaturaIdAsignacionAsignatura(String diaClase, Long asignacionAsignaturaId);

}
