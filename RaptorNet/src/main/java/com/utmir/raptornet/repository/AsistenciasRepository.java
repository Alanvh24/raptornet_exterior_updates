package com.utmir.raptornet.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.utmir.raptornet.models.Asistencias;

public interface AsistenciasRepository extends JpaRepository<Asistencias, Long> {
        long countByAlumnoMatriculaAndUnidadesPorAsignaturaIdUnidadesAsignaturaAndTipoAsistencia(String matricula,
                        Long idUnidadesAsignatura, Integer tipoAsistencia);

        List<Asistencias> findByAlumnoMatriculaAndUnidadesPorAsignaturaIdUnidadesAsignatura(String matricula,
                        Long idUnidadesAsignatura);

        List<Asistencias> findByUnidadesPorAsignaturaIdUnidadesAsignatura(Long idUnidadesAsignatura);

        boolean existsByAlumnoMatriculaAndFechaAsistenciaAndUnidadesPorAsignaturaIdUnidadesAsignatura(String matricula,
                        LocalDate fechaAsistencia, Long idUnidadesAsignatura);

        Optional<Asistencias> findByAlumnoMatriculaAndFechaAsistenciaAndUnidadesPorAsignaturaIdUnidadesAsignatura(
                        String matricula, LocalDate fechaAsistencia, Long idUnidadesAsignatura);

        List<Asistencias> findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndFechaAsistenciaBetween(
                        Long idUnidadesAsignatura, LocalDate fechaInicio, LocalDate fechaFin);

        List<Asistencias> findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndGrupoId(Long idUnidadesAsignatura,
                        Long idGrupo);

        List<Asistencias> findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndAsignacionAsignaturaIdAsignacionAsignatura(
                        Long idUnidadesAsignatura, Long idAsignacionAsignatura);

        List<Asistencias> findByAlumnoMatriculaAndUnidadesPorAsignaturaIdUnidadesAsignaturaAndAsignacionAsignaturaIdAsignacionAsignatura(
                        String matricula, Long idUnidadesAsignatura, Long idAsignacionAsignatura);

        List<Asistencias> findByAsignacionAsignaturaAsignaturasIdAsignaturasAndAsignacionAsignaturaGrupoIdAndAsignacionAsignaturaIdAsignacionAsignatura(
                        Long idAsignatura, Long idGrupo, Long idAsignacionAsignatura);

}
