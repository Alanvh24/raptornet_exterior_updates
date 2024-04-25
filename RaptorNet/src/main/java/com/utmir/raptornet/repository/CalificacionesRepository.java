package com.utmir.raptornet.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AsignacionAsignatura;
import com.utmir.raptornet.models.Calificaciones;

public interface CalificacionesRepository extends JpaRepository<Calificaciones, Long> {

        Optional<Calificaciones> findByAlumnoAndAsignacionAsignatura(Alumno alumno,
                        AsignacionAsignatura asignacionAsignatura);

        Optional<Calificaciones> findByAlumno_MatriculaAndAsignacionAsignatura_IdAsignacionAsignatura(String matricula,
                        Long idAsignacionAsignatura);

        List<Calificaciones> findByAsignacionAsignatura_IdAsignacionAsignatura(Long idAsignacionAsignatura);

        List<Calificaciones> findByAlumno_Matricula(String matricula);

        List<Calificaciones> findByRemedialTrueAndFirmaDocenteTrue();

        List<Calificaciones> findByAsignacionAsignatura_IdAsignacionAsignaturaAndRemedialTrueAndFirmaDocenteTrue(
                        Long idAsignacionAsignatura);

        @Query("SELECT c FROM Calificaciones c WHERE c.asignacionAsignatura.status = true AND (c.firmaDocente = false OR (c.remedial = true AND c.firmaRemedial = false))")
        List<Calificaciones> findCalificacionesPendientes();

}
