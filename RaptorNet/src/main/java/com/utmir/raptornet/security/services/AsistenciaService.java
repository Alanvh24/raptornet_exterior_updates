package com.utmir.raptornet.security.services;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utmir.raptornet.dto.Docentes.AsistenciasResponse;
import com.utmir.raptornet.models.Asistencias;
import com.utmir.raptornet.models.FechasUnidades;
import com.utmir.raptornet.repository.AsistenciasRepository;
import com.utmir.raptornet.repository.FechasUnidadesRepository;

@Service
public class AsistenciaService {

        @Autowired
        private AsistenciasRepository asistenciasRepository;

        @Autowired
        private FechasUnidadesRepository fechasUnidadesRepository;

        public List<AsistenciasResponse> calcularPorcentajesAsistencias(Long idUnidadesAsignatura, Long idGrupo,
                        Long idAsignacionAsignatura) {
                // Obtener todas las asistencias para la unidad específica y asignación de
                // asignatura
                List<Asistencias> asistencias = asistenciasRepository
                                .findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndAsignacionAsignaturaIdAsignacionAsignatura(
                                                idUnidadesAsignatura, idAsignacionAsignatura);

                // Agrupar asistencias por alumno
                Map<String, List<Asistencias>> asistenciasPorAlumno = asistencias.stream()
                                .collect(Collectors.groupingBy(asistencia -> asistencia.getAlumno().getMatricula()));

                // Obtener el total de clases activas para la unidad y asignación de asignatura
                int clasesActivas = fechasUnidadesRepository
                                .findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndAsignacionAsignaturaIdAsignacionAsignaturaAndStatusIsTrue(
                                                idUnidadesAsignatura, idAsignacionAsignatura)
                                .map(FechasUnidades::getClasesActivas)
                                .orElse(0);

                // Calcular el porcentaje de asistencia para cada alumno
                return asistenciasPorAlumno.entrySet().stream().map(entry -> {
                        String matricula = entry.getKey();
                        List<Asistencias> asistenciasAlumno = entry.getValue();

                        int totalClasesConAsistencia = 0;
                        int tipo4Acumulado = 0;

                        for (Asistencias asistencia : asistenciasAlumno) {
                                int tipoAsistencia = asistencia.getTipoAsistencia();
                                if (tipoAsistencia == 1 || tipoAsistencia == 3 || tipoAsistencia == 4) {
                                        totalClasesConAsistencia++;
                                        if (tipoAsistencia == 4) {
                                                tipo4Acumulado++;
                                        }
                                }
                        }

                        // Restar clases acumuladas de tipo 4 que superen 3
                        totalClasesConAsistencia -= tipo4Acumulado / 3;

                        double porcentaje = clasesActivas > 0 ? (double) totalClasesConAsistencia / clasesActivas * 100
                                        : 0;

                        AsistenciasResponse response = new AsistenciasResponse();
                        response.setMatriculaAlumno(matricula);
                        response.setPorcentajeAsistencia(porcentaje);

                        return response;
                }).collect(Collectors.toList());

        }

        public double calcularPorcentajeAsistenciasPorAlumno(Long idUnidadesAsignatura, String matriculaAlumno,
                        Long idAsignacionAsignatura) {

                List<Asistencias> asistenciasAlumno = asistenciasRepository
                                .findByAlumnoMatriculaAndUnidadesPorAsignaturaIdUnidadesAsignaturaAndAsignacionAsignaturaIdAsignacionAsignatura(
                                                matriculaAlumno, idUnidadesAsignatura, idAsignacionAsignatura);

                long totalAsistenciasValidas = asistenciasAlumno.stream()
                                .filter(asistencia -> asistencia.getTipoAsistencia() == 1
                                                || asistencia.getTipoAsistencia() == 3
                                                || (asistencia.getTipoAsistencia() == 4))
                                .count();

                long totalRetardos = asistenciasAlumno.stream()
                                .filter(asistencia -> asistencia.getTipoAsistencia() == 4)
                                .count();

                // Convertir cada 3 retardos a una ausencia
                totalAsistenciasValidas -= totalRetardos / 3;

                int totalClasesActivas = fechasUnidadesRepository
                                .findByUnidadesPorAsignaturaIdUnidadesAsignaturaAndAsignacionAsignaturaIdAsignacionAsignaturaAndStatusIsTrue(
                                                idUnidadesAsignatura, idAsignacionAsignatura)
                                .orElseThrow(() -> new IllegalArgumentException("No se encontraron fechas activas"))
                                .getClasesActivas();

                if (totalClasesActivas == 0)
                        return 0; // Evitar división por cero

                return (double) totalAsistenciasValidas / totalClasesActivas * 100;
        }

}
