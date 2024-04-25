// package com.utmir.raptornet.security.services;

// import java.util.ArrayList;
// import java.util.List;
// import java.util.Optional;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
// import org.springframework.stereotype.Service;

// import com.utmir.raptornet.dto.Docentes.CalificacionDTO;
// import com.utmir.raptornet.dto.Docentes.CalificacionFinalResponseDTO;
// import com.utmir.raptornet.dto.Docentes.CalificacionResponseDTO;
// import com.utmir.raptornet.models.Alumno;
// import com.utmir.raptornet.models.AsignacionAsignatura;
// import com.utmir.raptornet.models.Calificaciones;
// import com.utmir.raptornet.models.CalificacionesUnidad;
// import com.utmir.raptornet.models.InformacionAcademica;
// import com.utmir.raptornet.models.UnidadesPorAsignatura;
// import com.utmir.raptornet.payload.response.ResourceNotFoundException;
// import com.utmir.raptornet.repository.AlumnoRepository;
// import com.utmir.raptornet.repository.AsignacionAsignaturaRepository;
// import com.utmir.raptornet.repository.CalificacionesRepository;
// import com.utmir.raptornet.repository.CalificacionesUnidadRepository;
// import com.utmir.raptornet.repository.InformacionAcademicaRepository;
// import com.utmir.raptornet.repository.UnidadesAsignaturaRepository;

// @Service
// public class CalificacionService {

//         @Autowired
//         private CalificacionesUnidadRepository calificacionesUnidadRepository;

//         @Autowired
//         private UnidadesAsignaturaRepository unidadesAsignaturaRepository;

//         @Autowired
//         private AlumnoRepository alumnoRepository; // Asegúrate de tener este repositorio

//         @Autowired
//         private AsignacionAsignaturaRepository asignacionAsignaturaRepository; // Y este también

//         @Autowired
//         private InformacionAcademicaRepository informacionAcademicaRepository;

//         @Autowired
//         private CalificacionesRepository calificacionesRepository;
//         @Autowired
//         private AsistenciaService asistenciaService;

//         private CalificacionResponseDTO convertirAResponseDTO(CalificacionesUnidad calificacion) {
//                 CalificacionResponseDTO responseDTO = new CalificacionResponseDTO();

//                 responseDTO.setMatriculaAlumno(calificacion.getAlumno().getMatricula());
//                 responseDTO.setIdAsignacionAsignatura(
//                                 calificacion.getAsignacionAsignatura().getIdAsignacionAsignatura());
//                 responseDTO.setIdUnidadesAsignatura(calificacion.getUnidadesAsignatura().getIdUnidadesAsignatura());
//                 responseDTO.setReqAsistencias(calificacion.isReqAsistencias());
//                 responseDTO.setCalificacionOrdinaria(calificacion.getCalificacionOrdinaria());
//                 responseDTO.setRecuperacion(calificacion.isRecuperacion());
//                 responseDTO.setCalificacionRecuperacion(calificacion.getCalificacionRecuperacion());

//                 return responseDTO;
//         }

//         public ResponseEntity<?> registrarCalificacion(CalificacionDTO calificacionDTO) {

//                 try {
//                         // Recupera las entidades relacionadas usando los repositorios
//                         Alumno alumno = alumnoRepository.findById(calificacionDTO.getMatriculaAlumno()).orElseThrow(
//                                         () -> new ResourceNotFoundException("Alumno no encontrado con matrícula: "
//                                                         + calificacionDTO.getMatriculaAlumno()));
//                         AsignacionAsignatura asignacionAsignatura = asignacionAsignaturaRepository
//                                         .findById(calificacionDTO.getIdAsignacionAsignatura())
//                                         .orElseThrow(() -> new ResourceNotFoundException(
//                                                         "AsignacionAsignatura no encontrada con id: "
//                                                                         + calificacionDTO.getIdAsignacionAsignatura()));

//                         UnidadesPorAsignatura unidadesPorAsignatura = unidadesAsignaturaRepository
//                                         .findById(calificacionDTO.getIdUnidadesAsignatura())
//                                         .orElseThrow(() -> new ResourceNotFoundException(
//                                                         "UnidadesPorAsignatura no encontrada con id: "
//                                                                         + calificacionDTO.getIdUnidadesAsignatura()));

//                         InformacionAcademica informacionAcademica = informacionAcademicaRepository
//                                         .findByAlumnoAndProgramaEducativoAndCuatrimestreAndGrupo(alumno,
//                                                         asignacionAsignatura.getAsignaturas().getCarreras(),
//                                                         asignacionAsignatura.getAsignaturas().getCuatrimestre(),
//                                                         asignacionAsignatura.getGrupo())
//                                         .orElseThrow(() -> new ResourceNotFoundException(
//                                                         "InformacionAcademica no encontrada para el alumno con matrícula: "
//                                                                         + calificacionDTO.getMatriculaAlumno()));

//                         // Busca si ya existe una calificación para esta combinación
//                         Optional<CalificacionesUnidad> existente = calificacionesUnidadRepository
//                                         .findByAlumnoAndUnidadesAsignaturaAndAsignacionAsignatura(alumno,
//                                                         unidadesPorAsignatura,
//                                                         asignacionAsignatura);

//                         double porcentajeAsistencias = asistenciaService.calcularPorcentajeAsistenciasPorAlumno(
//                                         calificacionDTO.getIdUnidadesAsignatura(),
//                                         calificacionDTO.getMatriculaAlumno(),
//                                         calificacionDTO.getIdAsignacionAsignatura());

                                        

//                         // Condicion de porcentajes
//                         if (porcentajeAsistencias < 80 && porcentajeAsistencias >= 70) {
//                                 CalificacionesUnidad calificacion = existente.orElse(new CalificacionesUnidad());
//                                 // Configuración de la calificación para casos de asistencia insuficiente
//                                 calificacion.setAlumno(alumno);
//                                 calificacion.setAsignacionAsignatura(asignacionAsignatura);
//                                 calificacion.setUnidadesAsignatura(unidadesPorAsignatura);
//                                 calificacion.setInformacionAcademica(informacionAcademica);
//                                 calificacion.setReqAsistencias(calificacionDTO.isReqAsistencias());
//                                 calificacion.setCalificacionOrdinaria(0.0); // Registrar 0 en calificación ordinaria
//                                 calificacion.setRecuperacion(true); // Activar recuperación
//                                 calificacionesUnidadRepository.save(calificacion);

//                                 // Retornar mensaje de error sin necesidad de crear el responseDTO
//                                 return ResponseEntity.badRequest().body("El alumno con matrícula "
//                                                 + calificacionDTO.getMatriculaAlumno()
//                                                 + " no tiene derecho a calificación ordinaria por tener solo "
//                                                 + porcentajeAsistencias + "% de asistencias.");

//                         } else if (porcentajeAsistencias < 70) {
//                                 CalificacionesUnidad calificacion = existente.orElse(new CalificacionesUnidad());
//                                 calificacion.setAlumno(alumno);
//                                 calificacion.setAsignacionAsignatura(asignacionAsignatura);
//                                 calificacion.setUnidadesAsignatura(unidadesPorAsignatura);
//                                 calificacion.setInformacionAcademica(informacionAcademica);
//                                 calificacion.setReqAsistencias(false);
//                                 calificacion.setCalificacionOrdinaria(0.0);
//                                 calificacion.setCalificacionRecuperacion(0.0);
//                                 calificacion.setRecuperacion(false);
//                                 calificacionesUnidadRepository.save(calificacion);

//                                 calcularYRegistrarCalificacionFinal(calificacionDTO.getMatriculaAlumno(),
//                                                 calificacionDTO.getIdAsignacionAsignatura());

//                                 // Retornar mensaje de error sin necesidad de crear el responseDTO
//                                 return ResponseEntity.badRequest().body("El alumno con matrícula "
//                                                 + calificacionDTO.getMatriculaAlumno()
//                                                 + " no tiene derecho a de calificacion ordinaria o de recuperación por incumplimiento en el porcentaje de asistencias. "
//                                                 + porcentajeAsistencias + "% de asistencias.");

//                         }


//                         // Implementa la lógica de conteo de unidades permitidas a reprobar aquí
//                         List<UnidadesPorAsignatura> todasLasUnidades = unidadesAsignaturaRepository
//                                         .findByAsignaturas_IdAsignaturas(
//                                                         asignacionAsignatura.getAsignaturas().getIdAsignaturas());
//                         int totalUnidades = todasLasUnidades.size();
//                         int unidadesPermitidasParaRecuperacion = totalUnidades / 2;
//                         long unidadesEnRecuperacion = calificacionesUnidadRepository
//                                         .countByAlumnoAndAsignacionAsignaturaAndRecuperacionIsTrue(alumno,
//                                                         asignacionAsignatura);

//                         if (unidadesEnRecuperacion >= unidadesPermitidasParaRecuperacion
//                                         && calificacionDTO.getCalificacionOrdinaria() < 8) {

//                                 CalificacionesUnidad calificacion = existente.orElse(new CalificacionesUnidad());
//                                 // Configuración de la calificación para casos de asistencia insuficiente
//                                 calificacion.setAlumno(alumno);
//                                 calificacion.setAsignacionAsignatura(asignacionAsignatura);
//                                 calificacion.setUnidadesAsignatura(unidadesPorAsignatura);
//                                 calificacion.setInformacionAcademica(informacionAcademica);
//                                 calificacion.setReqAsistencias(calificacionDTO.isReqAsistencias());
//                                 calificacion.setCalificacionOrdinaria(calificacionDTO.getCalificacionOrdinaria());
//                                 calificacion.setRecuperacion(false);

//                                 calificacionesUnidadRepository.save(calificacion);

//                                 calcularYRegistrarCalificacionFinal(calificacionDTO.getMatriculaAlumno(),
//                                                 calificacionDTO.getIdAsignacionAsignatura());
//                                 return ResponseEntity.badRequest()
//                                                 .body("Límite de recuperaciones excedido: El alumno con matrícula "
//                                                                 + calificacionDTO.getMatriculaAlumno()
//                                                                 + " ha excedido el número de unidades permitidas para recuperación.");
//                         }

//                         CalificacionesUnidad calificacion = existente.orElse(new CalificacionesUnidad());

//                         // Establece o actualiza los valores
//                         calificacion.setAlumno(alumno);
//                         calificacion.setAsignacionAsignatura(asignacionAsignatura);
//                         calificacion.setUnidadesAsignatura(unidadesPorAsignatura);
//                         calificacion.setInformacionAcademica(informacionAcademica);
//                         calificacion.setReqAsistencias(true);
//                         calificacion.setCalificacionOrdinaria(calificacionDTO.getCalificacionOrdinaria());
//                         calificacion.setRecuperacion(false);

//                         if (calificacion.isRecuperacion()) {

//                                 return ResponseEntity.badRequest().body("El alumno con matrícula "
//                                                 + calificacionDTO.getMatriculaAlumno()
//                                                 + " ya está en proceso de recuperación y no se puede actualizar la calificación ordinaria.");
//                         }

//                         if (calificacionDTO.getCalificacionOrdinaria() < 8) {
//                                 calificacion.setCalificacionOrdinaria(0.0);
//                                 calificacion.setRecuperacion(true);

//                                 calificacionesUnidadRepository.save(calificacion);
//                                 return ResponseEntity.badRequest().body("El alumno con matrícula "
//                                                 + calificacionDTO.getMatriculaAlumno()
//                                                 + " no cumplió con la calificación mínima y deberá hacer recuperación");
//                         } else if (porcentajeAsistencias >= 80) {
//                                 calificacion.setAlumno(alumno);
//                                 calificacion.setAsignacionAsignatura(asignacionAsignatura);
//                                 calificacion.setUnidadesAsignatura(unidadesPorAsignatura);
//                                 calificacion.setInformacionAcademica(informacionAcademica);
//                                 calificacion.setReqAsistencias(true);
//                                 calificacion.setCalificacionOrdinaria(calificacionDTO.getCalificacionOrdinaria());
//                                 calificacion.setCalificacionRecuperacion(null);
//                                 calificacion.setRecuperacion(false);
//                                 calificacionesUnidadRepository.save(calificacion);

//                                 // Aquí invocas el cálculo y registro de la calificación final

//                                 CalificacionesUnidad calificacionGuardada = calificacionesUnidadRepository
//                                                 .save(calificacion);

//                                 // Aquí invocas el cálculo y registro de la calificación final

//                                 calcularYRegistrarCalificacionFinal(calificacionDTO.getMatriculaAlumno(),
//                                                 calificacionDTO.getIdAsignacionAsignatura());

//                                 // Convierte la entidad guardada a CalificacionResponseDTO
//                                 // Convierte la entidad guardada a CalificacionResponseDTO
//                                 CalificacionResponseDTO responseDTO = convertirAResponseDTO(calificacionGuardada);

//                                 return ResponseEntity.ok(responseDTO);

//                         }

//                         CalificacionesUnidad calificacionGuardada = calificacionesUnidadRepository.save(calificacion);

//                         // Aquí invocas el cálculo y registro de la calificación final

//                         calcularYRegistrarCalificacionFinal(calificacionDTO.getMatriculaAlumno(),
//                                         calificacionDTO.getIdAsignacionAsignatura());

//                         // Convierte la entidad guardada a CalificacionResponseDTO
//                         CalificacionResponseDTO responseDTO = convertirAResponseDTO(calificacionGuardada);

//                         return ResponseEntity.ok(responseDTO);
//                 } catch (Exception e) {
//                         // Manejo de otras excepciones no relacionadas con el porcentaje de asistencias
//                         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
//                                         .body("Error interno del servidor: " + e.getMessage());
//                 }
//         }

//         // public ResponseEntity<?> registrarCalificacion(CalificacionDTO
//         // calificacionDTO) {
//         // try {
//         // // Recupera las entidades relacionadas usando los repositorios
//         // Alumno alumno =
//         // alumnoRepository.findById(calificacionDTO.getMatriculaAlumno())
//         // .orElseThrow(() -> new ResourceNotFoundException(
//         // "Alumno no encontrado con matrícula: "
//         // + calificacionDTO.getMatriculaAlumno()));

//         // AsignacionAsignatura asignacionAsignatura = asignacionAsignaturaRepository
//         // .findById(calificacionDTO.getIdAsignacionAsignatura())
//         // .orElseThrow(() -> new ResourceNotFoundException(
//         // "AsignacionAsignatura no encontrada con id: "
//         // + calificacionDTO.getIdAsignacionAsignatura()));

//         // UnidadesPorAsignatura unidadesPorAsignatura = unidadesAsignaturaRepository
//         // .findById(calificacionDTO.getIdUnidadesAsignatura())
//         // .orElseThrow(() -> new ResourceNotFoundException(
//         // "UnidadesPorAsignatura no encontrada con id: "
//         // + calificacionDTO.getIdUnidadesAsignatura()));

//         // InformacionAcademica informacionAcademica = informacionAcademicaRepository
//         // .findByAlumnoAndProgramaEducativoAndCuatrimestreAndGrupo(alumno,
//         // asignacionAsignatura.getAsignaturas().getCarreras(),
//         // asignacionAsignatura.getAsignaturas().getCuatrimestre(),
//         // asignacionAsignatura.getGrupo())
//         // .orElseThrow(() -> new ResourceNotFoundException(
//         // "InformacionAcademica no encontrada para el alumno con matrícula: "
//         // + calificacionDTO.getMatriculaAlumno()));

//         // // Calcula el total de unidades y el número de recuperaciones permitidas
//         // List<UnidadesPorAsignatura> todasLasUnidades = unidadesAsignaturaRepository
//         // .findByAsignaturas_IdAsignaturas(
//         // asignacionAsignatura.getAsignaturas().getIdAsignaturas());
//         // int totalUnidades = todasLasUnidades.size();
//         // int unidadesPermitidasParaRecuperacion = totalUnidades / 2;

//         // // Cuenta el número actual de unidades en recuperación para el alumno
//         // long unidadesEnRecuperacion = calificacionesUnidadRepository
//         // .countByAlumnoAndAsignacionAsignaturaAndRecuperacionIsTrue(alumno,
//         // asignacionAsignatura);

//         // Optional<CalificacionesUnidad> existente = calificacionesUnidadRepository
//         // .findByAlumnoAndUnidadesAsignaturaAndAsignacionAsignatura(alumno,
//         // unidadesPorAsignatura, asignacionAsignatura);

//         // double porcentajeAsistencias =
//         // asistenciaService.calcularPorcentajeAsistenciasPorAlumno(
//         // calificacionDTO.getIdUnidadesAsignatura(),
//         // calificacionDTO.getMatriculaAlumno(),
//         // calificacionDTO.getIdAsignacionAsignatura());

//         // CalificacionesUnidad calificacion = existente.orElse(new
//         // CalificacionesUnidad());
//         // calificacion.setAlumno(alumno);
//         // calificacion.setAsignacionAsignatura(asignacionAsignatura);
//         // calificacion.setUnidadesAsignatura(unidadesPorAsignatura);
//         // calificacion.setInformacionAcademica(informacionAcademica);
//         // calificacion.setReqAsistencias(true);

//         // if (porcentajeAsistencias < 80 && porcentajeAsistencias >= 70) {
//         // calificacion.setCalificacionOrdinaria(0.0);
//         // calificacion.setRecuperacion(true);
//         // calificacion.setReqAsistencias(false);
//         // calificacionesUnidadRepository.save(calificacion);
//         // return ResponseEntity.badRequest()
//         // .body("El alumno con matrícula " + calificacionDTO.getMatriculaAlumno()
//         // + " no tiene suficientes asistencias.");

//         // } else if (calificacionDTO.getCalificacionOrdinaria() < 8) {
//         // if (unidadesEnRecuperacion < unidadesPermitidasParaRecuperacion) {
//         // calificacion.setCalificacionOrdinaria(0.0);
//         // calificacion.setRecuperacion(false);
//         // calificacion.setReqAsistencias(true);
//         // calificacionesUnidadRepository.save(calificacion);
//         // calcularYRegistrarCalificacionFinal(calificacionDTO.getMatriculaAlumno(),
//         // calificacionDTO.getIdAsignacionAsignatura());

//         // return ResponseEntity.badRequest()
//         // .body("El alumno con matrícula "
//         // + calificacionDTO.getMatriculaAlumno()
//         // + " no cumple con la calificación mínima aprobatoria, por lo que será enviado
//         // a recuperación.");
//         // } else if (calificacionDTO.getCalificacionOrdinaria() >= 8) {
//         // calificacion.setCalificacionOrdinaria(
//         // calificacionDTO.getCalificacionOrdinaria());
//         // calificacion.setRecuperacion(false);
//         // calificacion.setReqAsistencias(true);
//         // calificacionesUnidadRepository.save(calificacion);
//         // calcularYRegistrarCalificacionFinal(calificacionDTO.getMatriculaAlumno(),
//         // calificacionDTO.getIdAsignacionAsignatura());
//         // return ResponseEntity.badRequest().body("El alumno con matrícula "
//         // + calificacionDTO.getMatriculaAlumno()
//         // + " ha excedido el límite de unidades en recuperación permitidas.");
//         // }
//         // } else {
//         // calificacion.setCalificacionOrdinaria(calificacionDTO.getCalificacionOrdinaria());
//         // calificacion.setRecuperacion(false);
//         // }

//         // CalificacionesUnidad calificacionGuardada =
//         // calificacionesUnidadRepository.save(calificacion);

//         // calcularYRegistrarCalificacionFinal(calificacionDTO.getMatriculaAlumno(),
//         // calificacionDTO.getIdAsignacionAsignatura());
//         // CalificacionResponseDTO responseDTO =
//         // convertirAResponseDTO(calificacionGuardada);

//         // return ResponseEntity.ok(responseDTO);
//         // } catch (ResourceNotFoundException e) {
//         // return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
//         // } catch (Exception e) {
//         // return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
//         // .body("Error interno del servidor: " + e.getMessage());
//         // }
//         // }

//         public ResponseEntity<?> registrarCalificacionRecuperacion(CalificacionDTO calificacionDTO) {
//                 try {
//                         // Recupera las entidades relacionadas usando los repositorios
//                         Alumno alumno = alumnoRepository.findById(calificacionDTO.getMatriculaAlumno())
//                                         .orElseThrow(() -> new ResourceNotFoundException(
//                                                         "Alumno no encontrado con matrícula: "
//                                                                         + calificacionDTO.getMatriculaAlumno()));

//                         AsignacionAsignatura asignacionAsignatura = asignacionAsignaturaRepository
//                                         .findById(calificacionDTO.getIdAsignacionAsignatura())
//                                         .orElseThrow(() -> new ResourceNotFoundException(
//                                                         "AsignacionAsignatura no encontrada con id: "
//                                                                         + calificacionDTO.getIdAsignacionAsignatura()));

//                         UnidadesPorAsignatura unidadesPorAsignatura = unidadesAsignaturaRepository
//                                         .findById(calificacionDTO.getIdUnidadesAsignatura())
//                                         .orElseThrow(() -> new ResourceNotFoundException(
//                                                         "UnidadesPorAsignatura no encontrada con id: "
//                                                                         + calificacionDTO.getIdUnidadesAsignatura()));

//                         // Busca si ya existe una calificación para esta combinación
//                         Optional<CalificacionesUnidad> existente = calificacionesUnidadRepository
//                                         .findByAlumnoAndUnidadesAsignaturaAndAsignacionAsignatura(alumno,
//                                                         unidadesPorAsignatura, asignacionAsignatura);

//                         CalificacionesUnidad calificacion = existente
//                                         .orElseThrow(() -> new IllegalStateException(
//                                                         "Calificación no encontrada para actualizar recuperación"));

//                         // Solo actualiza la calificación de recuperación si el estatus de recuperación
//                         // es true
//                         if (calificacion.isRecuperacion()) {
//                                 calificacion.setCalificacionRecuperacion(calificacionDTO.getCalificacionRecuperacion());
//                                 CalificacionesUnidad calificacionGuardada = calificacionesUnidadRepository
//                                                 .save(calificacion);

//                                 // Ahora, invocar el método para calcular y registrar la calificación final
//                                 calcularYRegistrarCalificacionFinal(calificacionDTO.getMatriculaAlumno(),
//                                                 calificacionDTO.getIdAsignacionAsignatura());
//                                 CalificacionResponseDTO responseDTO = convertirAResponseDTO(calificacionGuardada);
//                                 return ResponseEntity.ok(responseDTO);

//                         } else {
//                                 return ResponseEntity.badRequest().body("El alumno con matrícula "
//                                                 + calificacionDTO.getMatriculaAlumno()
//                                                 + " es un alumno regular.");
//                         }
//                 } catch (Exception e) {
//                         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
//                                         .body("Error interno del servidor: " + e.getMessage());
//                 }
//         }

//         public void calcularYRegistrarCalificacionFinal(String matriculaAlumno, Long idAsignacionAsignatura) {
//                 Alumno alumno = alumnoRepository.findById(matriculaAlumno).orElseThrow(
//                                 () -> new ResourceNotFoundException(
//                                                 "Alumno no encontrado con matrícula: " + matriculaAlumno));

//                 AsignacionAsignatura asignacionAsignatura = asignacionAsignaturaRepository
//                                 .findById(idAsignacionAsignatura)
//                                 .orElseThrow(() -> new ResourceNotFoundException(
//                                                 "AsignacionAsignatura no encontrada con id: "
//                                                                 + idAsignacionAsignatura));

//                 List<CalificacionesUnidad> calificacionesUnidades = calificacionesUnidadRepository
//                                 .findByAlumno_MatriculaAndAsignacionAsignatura_IdAsignacionAsignatura(matriculaAlumno,
//                                                 idAsignacionAsignatura);

//                 double sumaPonderada = 0.0;
//                 for (CalificacionesUnidad calificacionUnidad : calificacionesUnidades) {
//                         double calificacionParaCalculo = calificacionUnidad.getCalificacionOrdinaria();

//                         if (calificacionUnidad.isRecuperacion()
//                                         && calificacionUnidad.getCalificacionRecuperacion() != null) {
//                                 calificacionParaCalculo = calificacionUnidad.getCalificacionRecuperacion();
//                         }

//                         sumaPonderada += calificacionParaCalculo
//                                         * calificacionUnidad.getUnidadesAsignatura().getPorcentaje() / 100;
//                 }

//                 double calificacionAjustada = ajustarCalificacion(sumaPonderada);

//                 Optional<Calificaciones> calificacionExistente = calificacionesRepository
//                                 .findByAlumnoAndAsignacionAsignatura(alumno, asignacionAsignatura);

//                 Calificaciones calificacionFinal = calificacionExistente
//                                 .orElse(new Calificaciones());

//                 // Configura calificacionFinal con los datos necesarios
//                 calificacionFinal.setAlumno(alumno);
//                 calificacionFinal.setAsignacionAsignatura(asignacionAsignatura);
//                 // calificacionFinal.setInformacionAcademica(informacionAcademica);

//                 calificacionFinal.setCalificacionOrdinaria((int) Math.round(calificacionAjustada));
//                 // Ajusta para calificaciones de recuperación si es necesario

//                 calificacionesRepository.save(calificacionFinal);
//         }

//         private double ajustarCalificacion(double sumaPonderada) {

//                 if (sumaPonderada >= 7.9 && sumaPonderada <= 8.4)
//                         return 8;
//                 if (sumaPonderada > 8.5 && sumaPonderada <= 9.4)
//                         return 9;
//                 if (sumaPonderada >= 9.5)
//                         return 10;

//                 return sumaPonderada;
//         }

//         public List<CalificacionFinalResponseDTO> obtenerCalificacionesPorAsignacionAsignatura(
//                         Long idAsignacionAsignatura) {
//                 List<Calificaciones> calificaciones = calificacionesRepository
//                                 .findByAsignacionAsignatura_IdAsignacionAsignatura(idAsignacionAsignatura);

//                 List<CalificacionFinalResponseDTO> dtos = new ArrayList<>();
//                 for (Calificaciones calificacion : calificaciones) {
//                         CalificacionFinalResponseDTO dto = convertirACalificacionFinalResponseDTO(calificacion);
//                         dtos.add(dto);
//                 }
//                 return dtos;
//         }

//         private CalificacionFinalResponseDTO convertirACalificacionFinalResponseDTO(Calificaciones calificacion) {
//                 CalificacionFinalResponseDTO dto = new CalificacionFinalResponseDTO();
//                 dto.setMatriculaAlumno(calificacion.getAlumno().getMatricula());
//                 dto.setIdAsignacionAsignatura(calificacion.getAsignacionAsignatura().getIdAsignacionAsignatura());
//                 dto.setCalificacionOrdinaria(calificacion.getCalificacionOrdinaria());
//                 dto.setRecuperacion(calificacion.isRemedial());
//                 dto.setCalificacionRecuperacion(calificacion.getCalificacionRemedial());
//                 return dto;
//         }

// }
