package com.utmir.raptornet.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.utmir.raptornet.dto.ServiciosEscolares.AlumnosAsignar;
import com.utmir.raptornet.dto.ServiciosEscolares.AsignacionGrupoDTO;
import com.utmir.raptornet.dto.ServiciosEscolares.EstadisticasAspirantesCarreraResponse;
import com.utmir.raptornet.dto.ServiciosEscolares.HistorialAcademico;
import com.utmir.raptornet.dto.ServiciosEscolares.ListaAlumnos;
import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AntecedentesAcademicos;
import com.utmir.raptornet.models.Asignaturas;
import com.utmir.raptornet.models.AspiranteCalificaciones;
import com.utmir.raptornet.models.Calificaciones;
import com.utmir.raptornet.models.CalificacionesUnidad;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.ContactoEmergencia;
import com.utmir.raptornet.models.Cuatrimestre;
import com.utmir.raptornet.models.DatosGenerales;
import com.utmir.raptornet.models.ERole;
import com.utmir.raptornet.models.EstadisticaAspirantes;
import com.utmir.raptornet.models.EstadisticaAspirantesCarrera;
import com.utmir.raptornet.models.EstadosMexico;
import com.utmir.raptornet.models.Genero;
import com.utmir.raptornet.models.Grupo;
import com.utmir.raptornet.models.InformacionAcademica;
import com.utmir.raptornet.models.InformacionMedica;
import com.utmir.raptornet.models.Nacionalidad;
import com.utmir.raptornet.models.Role;
import com.utmir.raptornet.models.TipoSangre;
import com.utmir.raptornet.models.UnidadesPorAsignatura;
import com.utmir.raptornet.payload.response.MessageResponse;
import com.utmir.raptornet.payload.response.ResourceNotFoundException;
import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.repository.AntecedentesAcademicosRepository;
import com.utmir.raptornet.repository.AsignaturasRepository;
import com.utmir.raptornet.repository.AspiranteCalificacionesRepository;
import com.utmir.raptornet.repository.CalificacionesRepository;
import com.utmir.raptornet.repository.CalificacionesUnidadRepository;
import com.utmir.raptornet.repository.ContactoEmergenciaRepository;
import com.utmir.raptornet.repository.DatosGeneralesRepository;
import com.utmir.raptornet.repository.EstadisticaAspirantesRepository;
import com.utmir.raptornet.repository.EstadisticasAspirantesCarreraRepository;
import com.utmir.raptornet.repository.GrupoRepository;
import com.utmir.raptornet.repository.InformacionAcademicaRepository;
import com.utmir.raptornet.repository.InformacionMedicaRepository;
import com.utmir.raptornet.repository.UnidadesAsignaturaRepository;
import com.utmir.raptornet.security.services.AvanzarCuatrimestreService;
import com.utmir.raptornet.security.services.CargarAlumnosService;
import com.utmir.raptornet.security.services.HistorialAcademicoService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/servicios_escolares")
public class ServiciosEscolares {

    @Autowired
    private EstadisticaAspirantesRepository estadisticaAspirantesRepository;
    @Autowired
    private EstadisticasAspirantesCarreraRepository estadisticasAspirantesCarreraRepository;
    @Autowired
    private AspiranteCalificacionesRepository aspiranteCalificacionesRepository;
    @Autowired
    private InformacionAcademicaRepository informacionAcademicaRepository;
    @Autowired
    private InformacionMedicaRepository informacionMedicaRepository;
    @Autowired
    private DatosGeneralesRepository datosGeneralesRepository;
    @Autowired
    private ContactoEmergenciaRepository contactoEmergenciaRepository;
    @Autowired
    private AntecedentesAcademicosRepository antecedentesAcademicosRepository;
    @Autowired
    private AlumnoRepository alumnoRepository;
    @Autowired
    private GrupoRepository grupoRepository;
    @Autowired
    private CargarAlumnosService cargarAlumnosService;
    @Autowired
    private HistorialAcademicoService historialAcademicoService;
    @Autowired
    private AsignaturasRepository asignaturasRepository;
    @Autowired
    private CalificacionesRepository calificacionesRepository;
    @Autowired
    private AvanzarCuatrimestreService avanzarCuatrimestreService;
    @Autowired
    private CalificacionesUnidadRepository calificacionesUnidadRepository;
    @Autowired
    private UnidadesAsignaturaRepository unidadesAsignaturaRepository;

    @GetMapping("/estadisticas/aspirantes")
    public ResponseEntity<List<EstadisticaAspirantes>> obtenerTodasLasEstadisticasAspirantes() {
        List<EstadisticaAspirantes> estadisticas = estadisticaAspirantesRepository.findAll();
        return ResponseEntity.ok().body(estadisticas);
    }

    @GetMapping("/estadisticas/aspirantes/carrera")
    public ResponseEntity<List<EstadisticasAspirantesCarreraResponse>> obtenerEstadisticasAspirantesCarrera() {
        List<EstadisticaAspirantesCarrera> estadisticas = estadisticasAspirantesCarreraRepository.findAll();
        List<EstadisticasAspirantesCarreraResponse> responses = estadisticas.stream()
                .map(estadistica -> convertirAEstadisticasAspirantesCarreraResponse(estadistica))
                .collect(Collectors.toList());

        return ResponseEntity.ok().body(responses);
    }

    EstadisticasAspirantesCarreraResponse convertirAEstadisticasAspirantesCarreraResponse(
            EstadisticaAspirantesCarrera estadistica) {
        EstadisticasAspirantesCarreraResponse response = new EstadisticasAspirantesCarreraResponse();
        response.setId(estadistica.getId());
        response.setCarrera(estadistica.getCarrera().getCarrera());
        response.setCantidadAspirantesNoCompletados(estadistica.getCantidadAspirantesNoCompletados());
        response.setCantidadAspirantesCompletos(estadistica.getCantidadAspirantesCompletos());
        response.setCantidadAspirantes(estadistica.getCantidadAspirantes());
        response.setAnio(estadistica.getAnio());

        return response;
    }

    // Lista de aspirantes total
    @GetMapping("/asignacion/alumnos")
    public ResponseEntity<List<AlumnosAsignar>> obtenerAlumnosConCalificaciones() {
        List<AspiranteCalificaciones> todosLosAlumnos = aspiranteCalificacionesRepository.findAll();
        List<AlumnosAsignar> perfiles = new ArrayList<>();

        for (AspiranteCalificaciones calificaciones : todosLosAlumnos) {
            Alumno alumno = calificaciones.getAlumno();
            Set<Role> rolesDelAlumno = alumno.getRoles();

            // Verifica si el alumno tiene el rol ROLE_ALUMNO o ROLE_ASPIRANTE y está en la
            // etapa 5
            boolean cumpleCondiciones = rolesDelAlumno.stream()
                    .anyMatch(role -> role.getName().equals(ERole.ROLE_ALUMNO)
                            || role.getName().equals(ERole.ROLE_ASPIRANTE))
                    && ("5".equals(alumno.getAsp_etapa()) || "6".equals(alumno.getAsp_etapa()));

            InformacionAcademica informacionAcademica = informacionAcademicaRepository
                    .findByAlumno(alumno)
                    .orElse(null);

            if (cumpleCondiciones) {
                AlumnosAsignar perfilResponse = new AlumnosAsignar();

                List<String> nombresRoles = rolesDelAlumno.stream()
                        .map(role -> role.getName().toString())
                        .collect(Collectors.toList());
                perfilResponse.setRoles(nombresRoles);

                Genero genero = alumno.getId_genero();
                perfilResponse.setGenero(genero != null ? genero.getGenero() : null);
                perfilResponse.setMatricula(alumno.getMatricula());
                perfilResponse.setNombre(alumno.getNombre());
                perfilResponse.setAp_paterno(alumno.getAp_paterno());
                perfilResponse.setAp_materno(alumno.getAp_materno());
                perfilResponse.setAsp_etapa(alumno.getAsp_etapa());

                AspiranteCalificaciones aspiranteCalificaciones = aspiranteCalificacionesRepository
                        .findByAlumno(alumno)
                        .orElse(null);
                if (aspiranteCalificaciones != null) {
                    perfilResponse.setCalificacion(aspiranteCalificaciones.getCalificacion());
                }

                if (informacionAcademica != null) {
                    Carreras carreras = informacionAcademica.getProgramaEducativo();
                    perfilResponse.setPrograma_educativo(carreras != null ? carreras.getCarrera() : null);
                    Cuatrimestre cuatrimestre = informacionAcademica.getCuatrimestre();
                    perfilResponse.setCuatrimestre(cuatrimestre != null ? cuatrimestre.getCuatrimestre() : null);
                    Grupo grupo = informacionAcademica.getGrupo();
                    perfilResponse.setGrupo(grupo != null ? grupo.getGrupo() : null);
                }

                perfiles.add(perfilResponse);
            }
        }

        return ResponseEntity.ok(perfiles);
    }

    @PutMapping("/asignacion/grupo/{matricula}")
    public ResponseEntity<?> asignarGrupo(@PathVariable String matricula,
            @RequestBody AsignacionGrupoDTO asignacionDTO) {
        Alumno alumno = alumnoRepository.findByMatricula(matricula)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Alumno no encontrado con matrícula: " + matricula));

        InformacionAcademica infoAcademica = informacionAcademicaRepository.findByAlumno(alumno)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Información académica no encontrada para el alumno: " + matricula));

        Grupo grupoDeseado = grupoRepository.findByGrupo(asignacionDTO.getGrupo())
                .orElseThrow(() -> new ResourceNotFoundException("Grupo no encontrado: " + asignacionDTO.getGrupo()));

        int count = informacionAcademicaRepository.countByGrupoAndCuatrimestre(grupoDeseado,
                infoAcademica.getCuatrimestre());

        if (count >= 40) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                    .body(new MessageResponse("Grupo lleno. Considerar otros grupos disponibles."));
        }

        infoAcademica.setGrupo(grupoDeseado);
        informacionAcademicaRepository.save(infoAcademica);

        return ResponseEntity.ok(new MessageResponse("Grupo asignado correctamente."));
    }

    // cargar datos de alumnos
    @PostMapping("/cargar-desde-excel")
    public ResponseEntity<?> cargarDesdeExcel(@RequestParam("file") MultipartFile file) {
        try {
            cargarAlumnosService.cargarDatosDesdeExcel(file);
            return ResponseEntity.ok().body("Datos de alumnos cargados exitosamente desde el archivo Excel.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Ocurrió un error al cargar los datos desde el archivo Excel: " + e.getMessage());
        }
    }

    @PostMapping("/cargar-2023")
    public ResponseEntity<?> cargarDatos2023(@RequestParam("file") MultipartFile file) {
        try {
            cargarAlumnosService.cargarDatos2023(file);
            return ResponseEntity.ok().body("Datos de alumnos cargados exitosamente desde el archivo Excel.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Ocurrió un error al cargar los datos desde el archivo Excel: " + e.getMessage());
        }
    }

    // Lista de Alumnos

    @GetMapping("/alumnos")
    public ResponseEntity<List<ListaAlumnos>> obtenerAlumnosGeneral() {
        // Suponiendo que tienes un método `findByRole` en tu repositorio
        List<Alumno> alumnosConRolAlumno = alumnoRepository.findByRole(ERole.ROLE_ALUMNO);
        List<ListaAlumnos> perfiles = new ArrayList<>();

        for (Alumno alumno : alumnosConRolAlumno) {

            InformacionAcademica informacionAcademica = informacionAcademicaRepository.findByAlumno(alumno)
                    .orElse(null);

            if (informacionAcademica != null && !informacionAcademica.getStatus().getIdStatus().equals(0L)) {
                ListaAlumnos perfilResponse = new ListaAlumnos();
                perfilResponse.setMatricula(alumno.getMatricula());
                perfilResponse.setNombre(alumno.getNombre());
                perfilResponse.setAp_paterno(alumno.getAp_paterno());
                perfilResponse.setAp_materno(alumno.getAp_materno());
                perfilResponse.setCurp(alumno.getCurp());
                perfilResponse.setRfc(alumno.getRfc());
                perfilResponse.setNss(alumno.getNss());
                perfilResponse.setEdad(alumno.getEdad());
                perfilResponse.setFecha_nacimiento(alumno.getFecha_nacimiento());
                perfilResponse.setEmail(alumno.getEmail());
                perfilResponse.setNumero_telefonico(alumno.getNumero_telefonico());
                Genero genero = alumno.getId_genero();
                perfilResponse.setGenero(genero != null ? genero.getGenero() : null);
                perfilResponse.setId_genero(genero != null ? genero.getId_genero() : null);
                perfilResponse.setLocalidad_nacimiento(alumno.getLocalidad_nacimiento());
                perfilResponse.setMunicipio_nacimiento(alumno.getMunicipio_nacimiento());
                Nacionalidad nacionalidad = alumno.getId_nacionalidad();
                perfilResponse.setId_nacionalidad(nacionalidad != null ? nacionalidad.getId_nacionalidad() : null);
                perfilResponse.setNacionalidad(nacionalidad != null ? nacionalidad.getNacionalidad() : null);
                EstadosMexico estadosMexico = alumno.getId_estado_mexico();
                perfilResponse.setId_estado_mexico(estadosMexico != null ? estadosMexico.getId_estado_mexico() : null);
                perfilResponse.setEstado(estadosMexico != null ? estadosMexico.getEstado() : null);
                perfilResponse.setFecha_registro(alumno.getFecha_registro());

                if (informacionAcademica != null) {
                    perfilResponse.setPrograma_educativo(informacionAcademica.getProgramaEducativo() != null
                            ? informacionAcademica.getProgramaEducativo().getCarrera()
                            : null);
                    perfilResponse.setCuatrimestre(informacionAcademica.getCuatrimestre() != null
                            ? informacionAcademica.getCuatrimestre().getCuatrimestre()
                            : null);
                    perfilResponse.setGrupo(informacionAcademica.getGrupo() != null
                            ? informacionAcademica.getGrupo().getGrupo()
                            : null);
                    perfilResponse.setIdStatus(informacionAcademica.getStatus() != null
                            ? informacionAcademica.getStatus().getIdStatus()
                            : null);
                }

                DatosGenerales datosGenerales = datosGeneralesRepository.findByAlumno(alumno)
                        .orElse(null);
                if (datosGenerales != null) {
                    perfilResponse.setHabla_indigena(datosGenerales.getHabla_indigena());
                    perfilResponse.setLengua_indigena(datosGenerales.getLengua_indigena());
                    perfilResponse.setTiene_discapacidad(datosGenerales.getTiene_discapacidad());
                    perfilResponse.setDiscapacidad(datosGenerales.getDiscapacidad());
                }

                InformacionMedica informacionMedica = informacionMedicaRepository.findByAlumno(alumno)
                        .orElse(null);
                if (informacionMedica != null) {
                    TipoSangre tipoSangre = informacionMedica.getId_tipo_sangre();
                    perfilResponse.setId_tipo_sangre(tipoSangre != null ? tipoSangre.getId_tipo_sangre() : null);
                    perfilResponse.setTipo_sangre(tipoSangre != null ? tipoSangre.getTipo_sangre() : null);
                    perfilResponse.setTiene_alergias(informacionMedica.getTiene_alergias());
                    perfilResponse.setAlergias(informacionMedica.getAlergias());
                }

                ContactoEmergencia contactoEmergencia = contactoEmergenciaRepository.findByAlumno(alumno)
                        .orElse(null);
                if (contactoEmergencia != null) {
                    perfilResponse.setNombre_contacto_e(contactoEmergencia.getNombre_contacto_e());
                    perfilResponse.setTelefono_contacto_e(contactoEmergencia.getTelefono_contacto_e());
                    perfilResponse.setParentesco_contacto_e(contactoEmergencia.getParentesco_contacto_e());
                    perfilResponse.setEmail_contacto_e(contactoEmergencia.getEmail_contacto_e());

                }

                AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository.findByAlumno(alumno)
                        .orElse(null);
                if (antecedentesAcademicos != null) {
                    perfilResponse.setNombre_bachillerato(antecedentesAcademicos.getNombre_bachillerato());
                    perfilResponse.setPeriodo_bachillerato(antecedentesAcademicos.getPeriodo_bachillerato());
                    perfilResponse.setPromedio_bachillerato(antecedentesAcademicos.getPromedio_bachillerato());
                    Carreras carreras = antecedentesAcademicos.getId_carrera_1();
                    perfilResponse.setId_carrera_1(carreras != null ? carreras.getCarrera() : null);
                    Carreras carreras2 = antecedentesAcademicos.getId_carrera_2();
                    perfilResponse.setId_carrera_2(carreras != null ? carreras2.getCarrera() : null);
                }

                perfiles.add(perfilResponse);
            }
        }

        return ResponseEntity.ok(perfiles);
    }

    @GetMapping("/historial-academico/{matricula}")
    public ResponseEntity<?> obtenerHistorialAcademico(@PathVariable String matricula) {
        try {
            List<HistorialAcademico> historialAcademico = historialAcademicoService
                    .obtenerHistorialAcademicoPorMatricula(matricula);
            if (historialAcademico.isEmpty()) {
                return ResponseEntity.notFound().build();
            }
            return ResponseEntity.ok(historialAcademico);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al obtener el historial académico: " + e.getMessage());
        }
    }

    // Asignaturas y calificaciones del cuatrimestre actual
    @GetMapping("/asignaturas/alumno/{matricula}")
    public ResponseEntity<?> obtenerTiraMateriasAlumno(@PathVariable String matricula) {
        InformacionAcademica infoAcademica = informacionAcademicaRepository.findByAlumno_Matricula(matricula)
                .orElse(null);

        if (infoAcademica == null) {
            return ResponseEntity.notFound().build();
        }

        Alumno alumno = infoAcademica.getAlumno();

        Carreras carrera = infoAcademica.getProgramaEducativo();
        Cuatrimestre cuatrimestreActual = infoAcademica.getCuatrimestre();
        Grupo grupoActual = infoAcademica.getGrupo();
        List<Asignaturas> asignaturasDelCuatrimestre = asignaturasRepository.findByCarrerasAndCuatrimestre(carrera,
                cuatrimestreActual);
        List<Calificaciones> calificacionesDelAlumno = calificacionesRepository.findByAlumno_Matricula(matricula);
        Map<Long, Calificaciones> mapCalificaciones = calificacionesDelAlumno.stream()
                .collect(Collectors.toMap(cal -> cal.getAsignacionAsignatura().getAsignaturas().getIdAsignaturas(),
                        Function.identity()));

        Map<Long, List<CalificacionesUnidad>> calificacionesUnidadPorAsignatura = calificacionesUnidadRepository
                .findByAlumnoMatricula(matricula)
                .stream()
                .collect(Collectors.groupingBy(cu -> cu.getAsignacionAsignatura().getAsignaturas().getIdAsignaturas()));

        List<Map<String, Object>> respuesta = new ArrayList<>();

        for (Asignaturas asignatura : asignaturasDelCuatrimestre) {
            Map<String, Object> asignaturaConCalificaciones = new HashMap<>();
            asignaturaConCalificaciones.put("nombreAsignatura", asignatura.getNombre_asignatura());

            Calificaciones calificacion = mapCalificaciones.get(asignatura.getIdAsignaturas());
            if (calificacion != null) {
                asignaturaConCalificaciones.put("calificacionOrdinaria", calificacion.getCalificacionOrdinaria());
                asignaturaConCalificaciones.put("remedial", calificacion.isRemedial());
                asignaturaConCalificaciones.put("calificacionRemedial", calificacion.getCalificacionRemedial());
            } else {
                asignaturaConCalificaciones.put("calificacionOrdinaria", "N/A");
                asignaturaConCalificaciones.put("remedial", "N/A");
                asignaturaConCalificaciones.put("calificacionRemedial", "N/A");
            }

            List<UnidadesPorAsignatura> unidades = unidadesAsignaturaRepository
                    .findByAsignaturas_IdAsignaturas(asignatura.getIdAsignaturas());
            List<Map<String, Object>> unidadesDetalle = unidades.stream().map(unidad -> {
                Map<String, Object> unidadInfo = new HashMap<>();
                unidadInfo.put("unidad", unidad.getNombre_unidad());

                CalificacionesUnidad calUnidad = calificacionesUnidadPorAsignatura
                        .getOrDefault(asignatura.getIdAsignaturas(), new ArrayList<>())
                        .stream()
                        .filter(cu -> cu.getUnidadesAsignatura().getIdUnidadesAsignatura()
                                .equals(unidad.getIdUnidadesAsignatura()))
                        .findFirst()
                        .orElse(null);

                unidadInfo.put("calificacion",
                        calUnidad != null && calUnidad.getCalificacionOrdinaria() != null
                                ? calUnidad.getCalificacionOrdinaria()
                                : "N/A");
                unidadInfo.put("recuperacion", calUnidad != null && calUnidad.isRecuperacion());
                unidadInfo.put("calificacionRecuperacion",
                        calUnidad != null && calUnidad.getCalificacionRecuperacion() != null
                                ? calUnidad.getCalificacionRecuperacion()
                                : "N/A");
                unidadInfo.put("sinDerecho", calUnidad != null && calUnidad.isSinDerecho());
                return unidadInfo;
            }).collect(Collectors.toList());

            asignaturaConCalificaciones.put("unidades", unidadesDetalle);
            respuesta.add(asignaturaConCalificaciones);
        }

        Map<String, Object> respuestaFinal = new HashMap<>();
        respuestaFinal.put("matricula", alumno.getMatricula());
        respuestaFinal.put("nombreCompleto",
                alumno.getNombre() + " " + alumno.getAp_paterno() + " " + alumno.getAp_materno());
        respuestaFinal.put("cuatrimestre", cuatrimestreActual.getCuatrimestre());
        respuestaFinal.put("grupo", grupoActual.getGrupo());
        respuestaFinal.put("asignaturas", respuesta);

        return ResponseEntity.ok(respuestaFinal);
    }

    // cambio de cuatrimestre
    @PostMapping("/avanzar-cuatrimestre")
    public ResponseEntity<?> avanzarCuatrimestre() {
        try {
            avanzarCuatrimestreService.avanzarCuatrimestre();
            return ResponseEntity.ok().body("Proceso de avanzar cuatrimestre completado exitosamente.");
        } catch (IllegalStateException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al avanzar de cuatrimestre: " + e.getMessage());
        }
    }

}
