package com.utmir.raptornet.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AsignacionAsignatura;
import com.utmir.raptornet.models.CalificacionesUnidad;
import com.utmir.raptornet.models.InformacionAcademica;
import com.utmir.raptornet.models.UnidadesPorAsignatura;

@Repository
public interface CalificacionesUnidadRepository extends JpaRepository<CalificacionesUnidad, Long> {

        List<CalificacionesUnidad> findByAsignacionAsignaturaIdAsignacionAsignatura(Long idAsignacionAsignatura);

        List<CalificacionesUnidad> findByAsignacionAsignatura_Asignaturas_IdAsignaturasAndAsignacionAsignatura_Grupo_Id(
                        Long idAsignatura, Long idGrupo);

        List<CalificacionesUnidad> findByAsignacionAsignatura(AsignacionAsignatura asignacion);

        List<CalificacionesUnidad> findByAlumnoMatricula(String matricula);

        @Query("SELECT cu FROM CalificacionesUnidad cu WHERE cu.asignacionAsignatura.asignaturas.id = :idAsignatura AND cu.asignacionAsignatura.grupo.id = :idGrupo")
        List<CalificacionesUnidad> findByAsignaturaAndGrupo(@Param("idAsignatura") Long idAsignatura,
                        @Param("idGrupo") Long idGrupo);

        List<CalificacionesUnidad> findByAlumnoAndInformacionAcademica(Alumno alumno,
                        InformacionAcademica informacionAcademica);

        Optional<CalificacionesUnidad> findByAlumnoAndUnidadesAsignaturaAndAsignacionAsignatura(Alumno alumno,
                        UnidadesPorAsignatura unidadesPorAsignatura, AsignacionAsignatura asignacionAsignatura);

        List<CalificacionesUnidad> findByAlumno_MatriculaAndAsignacionAsignatura_IdAsignacionAsignatura(
                        String matricula, Long idAsignacionAsignatura);

        @Query("SELECT COUNT(cu) FROM CalificacionesUnidad cu WHERE cu.alumno = :alumno AND cu.asignacionAsignatura = :asignacionAsignatura AND cu.recuperacion = TRUE")
        long countByAlumnoAndAsignacionAsignaturaAndRecuperacionIsTrue(@Param("alumno") Alumno alumno,
                        @Param("asignacionAsignatura") AsignacionAsignatura asignacionAsignatura);

}
