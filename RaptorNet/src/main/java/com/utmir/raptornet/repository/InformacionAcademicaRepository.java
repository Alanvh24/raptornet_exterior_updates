package com.utmir.raptornet.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.Cuatrimestre;
import com.utmir.raptornet.models.Grupo;
import com.utmir.raptornet.models.InformacionAcademica;

import jakarta.transaction.Transactional;

public interface InformacionAcademicaRepository extends JpaRepository<InformacionAcademica, Long> {

        Optional<InformacionAcademica> findByAlumno(Alumno alumno);

        int countByGrupoAndCuatrimestre(Grupo grupo, Cuatrimestre cuatrimestre);

        List<InformacionAcademica> findByProgramaEducativoAndCuatrimestreAndGrupo(Carreras carrera,
                        Cuatrimestre cuatrimestre, Grupo grupo);

        Optional<InformacionAcademica> findByAlumnoAndProgramaEducativoAndCuatrimestreAndGrupo(Alumno alumno,
                        Carreras carreras,
                        Cuatrimestre cuatrimestre, Grupo grupo);

        Optional<InformacionAcademica> findByAlumno_Matricula(String matricula);

        @Transactional
        @Modifying
        @Query("UPDATE InformacionAcademica ia SET ia.cuatrimestre.id = :nuevoCuatrimestreId WHERE ia.alumno.matricula = :matricula AND ia.status.id = :statusActivoId")
        void avanzarAlumnoCuatrimestre(String matricula, Long nuevoCuatrimestreId, Long statusActivoId);

        @Transactional
        @Modifying
        @Query("UPDATE InformacionAcademica ia SET ia.status.id = :statusInactivoId WHERE ia.alumno.matricula = :matricula AND ia.cuatrimestre.id = :cuatrimestreId")
        void finalizarEstudios(String matricula, Long cuatrimestreId, Long statusInactivoId);

        List<InformacionAcademica> findByStatus_IdStatus(Long idStatus);

}
