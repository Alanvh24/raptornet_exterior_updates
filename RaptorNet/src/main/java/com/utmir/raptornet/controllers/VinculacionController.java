package com.utmir.raptornet.controllers;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.utmir.raptornet.dto.AspiranteCalificacionDTO;
import com.utmir.raptornet.dto.Vinculacion.PagoFichaRequest;
import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AntecedentesAcademicos;
import com.utmir.raptornet.models.AspiranteCalificaciones;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.ContactoEmergencia;
import com.utmir.raptornet.models.Cuotas;
import com.utmir.raptornet.models.DatosGenerales;
import com.utmir.raptornet.models.ERole;
import com.utmir.raptornet.models.EstadisticaRegistroDiario;
import com.utmir.raptornet.models.EstadosMexico;
import com.utmir.raptornet.models.Genero;
import com.utmir.raptornet.models.InformacionMedica;
import com.utmir.raptornet.models.Nacionalidad;
import com.utmir.raptornet.models.Pagos;
import com.utmir.raptornet.models.Role;
import com.utmir.raptornet.models.TipoSangre;
import com.utmir.raptornet.payload.request.AspirantePerfilRequest;
import com.utmir.raptornet.payload.request.AspirantePerfilResponse;
import com.utmir.raptornet.payload.request.AspirantesEtapa1;
import com.utmir.raptornet.payload.response.MessageResponse;
import com.utmir.raptornet.payload.response.ResourceNotFoundException;
import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.repository.AntecedentesAcademicosRepository;
import com.utmir.raptornet.repository.AspiranteCalificacionesRepository;
import com.utmir.raptornet.repository.CarrerasRepository;
import com.utmir.raptornet.repository.ContactoEmergenciaRepository;
import com.utmir.raptornet.repository.CuotasRepository;
import com.utmir.raptornet.repository.DatosGeneralesRepository;
import com.utmir.raptornet.repository.EstadosMexicoRepository;
import com.utmir.raptornet.repository.GeneroRepository;
import com.utmir.raptornet.repository.InformacionMedicaRepository;
import com.utmir.raptornet.repository.NacionalidadRepository;
import com.utmir.raptornet.repository.PagosRepository;
import com.utmir.raptornet.repository.RoleRepository;
import com.utmir.raptornet.repository.TipoSangreRepository;
import com.utmir.raptornet.security.services.EstadisticaAspirantesCarreraService;
import com.utmir.raptornet.security.services.EstadisticaAspirantesService;
import com.utmir.raptornet.security.services.EstadisticaRegistroDiarioService;
import com.utmir.raptornet.security.services.LogService;

import jakarta.transaction.Transactional;
import jakarta.validation.constraints.Pattern;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/vinculacion")
public class VinculacionController {

        @Autowired
        AlumnoRepository alumnoRepository;
        @Autowired
        DatosGeneralesRepository datosGeneralesRepository;
        @Autowired
        InformacionMedicaRepository informacionMedicaRepository;
        @Autowired
        ContactoEmergenciaRepository contactoEmergenciaRepository;
        @Autowired
        AntecedentesAcademicosRepository antecedentesAcademicosRepository;
        @Autowired
        GeneroRepository generoRepository;
        @Autowired
        EstadosMexicoRepository estadosMexicoRepository;
        @Autowired
        NacionalidadRepository nacionalidadRepository;
        @Autowired
        TipoSangreRepository tipoSangreRepository;
        @Autowired
        CarrerasRepository carrerasRepository;
        @Autowired
        RoleRepository roleRepository;
        @Autowired
        AspiranteCalificacionesRepository aspiranteCalificacionesRepository;
        @Autowired
        EstadisticaAspirantesService estadisticaAspirantesService;
        @Autowired
        EstadisticaAspirantesCarreraService estadisticaAspirantesCarreraService;
        @Autowired
        PagosRepository pagosRepository;
        @Autowired
        CuotasRepository cuotasRepository;
        @Autowired
        LogService logService;
        @Autowired
        EstadisticaRegistroDiarioService estadisticaRegistroDiarioService;

        // Lista de aspirantes total
        @GetMapping("/aspirantes")
        public ResponseEntity<List<AspirantePerfilResponse>> obtenerTodosLosPerfiles() {
                List<Alumno> todosLosAlumnos = alumnoRepository.findAll();
                List<AspirantePerfilResponse> perfiles = new ArrayList<>();

                for (Alumno alumno : todosLosAlumnos) {
                        Set<Role> rolesDelAlumno = alumno.getRoles();
                        // Comprobar si el alumno tiene el rol ROLE_ASPIRANTE
                        // Comprobar si el alumno tiene el rol ROLE_ASPIRANTE y asp_etapa mayor a 1
                        boolean esAspiranteYEtapaMayorAUno = rolesDelAlumno.stream()
                                        .anyMatch(role -> role.getName().equals(ERole.ROLE_ASPIRANTE)) &&
                                        (alumno.getAsp_etapa() != null && Integer.parseInt(alumno.getAsp_etapa()) >= 1);

                        if (esAspiranteYEtapaMayorAUno) {
                                AspirantePerfilResponse perfilResponse = new AspirantePerfilResponse();

                                List<String> nombresRoles = rolesDelAlumno.stream()
                                                .map(role -> role.getName().toString())
                                                .collect(Collectors.toList());
                                perfilResponse.setRoles(nombresRoles);

                                if (alumno != null && alumno.getAsp_etapa() != "1") {
                                        Genero genero = alumno.getId_genero();
                                        perfilResponse.setGenero(genero != null ? genero.getGenero() : null);
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
                                        perfilResponse.setLocalidad_nacimiento(alumno.getLocalidad_nacimiento());
                                        perfilResponse.setMunicipio_nacimiento(alumno.getMunicipio_nacimiento());
                                        perfilResponse.setFecha_registro(alumno.getFecha_registro());
                                        Nacionalidad nacionalidad = alumno.getId_nacionalidad();
                                        perfilResponse.setNacionalidad(
                                                        nacionalidad != null ? nacionalidad.getNacionalidad() : null);
                                        EstadosMexico estadosMexico = alumno.getId_estado_mexico();
                                        perfilResponse.setEstado(
                                                        estadosMexico != null ? estadosMexico.getEstado() : null);
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
                                        perfilResponse.setTipo_sangre(
                                                        tipoSangre != null ? tipoSangre.getTipo_sangre() : null);
                                        perfilResponse.setTiene_alergias(informacionMedica.getTiene_alergias());
                                        perfilResponse.setAlergias(informacionMedica.getAlergias());
                                }

                                ContactoEmergencia contactoEmergencia = contactoEmergenciaRepository
                                                .findByAlumno(alumno)
                                                .orElse(null);
                                if (contactoEmergencia != null) {
                                        perfilResponse.setNombre_contacto_e(contactoEmergencia.getNombre_contacto_e());
                                        perfilResponse.setTelefono_contacto_e(
                                                        contactoEmergencia.getTelefono_contacto_e());
                                        perfilResponse.setParentesco_contacto_e(
                                                        contactoEmergencia.getParentesco_contacto_e());
                                        perfilResponse.setEmail_contacto_e(contactoEmergencia.getEmail_contacto_e());

                                }

                                AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository
                                                .findByAlumno(alumno)
                                                .orElse(null);
                                if (antecedentesAcademicos != null) {
                                        perfilResponse.setNombre_bachillerato(
                                                        antecedentesAcademicos.getNombre_bachillerato());
                                        perfilResponse.setPeriodo_bachillerato(
                                                        antecedentesAcademicos.getPeriodo_bachillerato());
                                        perfilResponse.setPromedio_bachillerato(
                                                        antecedentesAcademicos.getPromedio_bachillerato());
                                        Carreras carreras = antecedentesAcademicos.getId_carrera_1();
                                        perfilResponse.setId_carrera_1(carreras != null ? carreras.getCarrera() : null);
                                        Carreras carreras2 = antecedentesAcademicos.getId_carrera_2();
                                        perfilResponse.setId_carrera_2(
                                                        carreras != null ? carreras2.getCarrera() : null);

                                }

                                perfiles.add(perfilResponse);
                        }
                }

                return ResponseEntity.ok(perfiles);
        }

        // Lista de aspirantes total
        @GetMapping("/registros")
        public ResponseEntity<List<AspirantePerfilResponse>> obtenerTodosLosRegistros() {
                List<Alumno> todosLosAlumnos = alumnoRepository.findAll();
                List<AspirantePerfilResponse> perfiles = new ArrayList<>();

                for (Alumno alumno : todosLosAlumnos) {
                        Set<Role> rolesDelAlumno = alumno.getRoles();

                        boolean esAspiranteConEtapaNull = rolesDelAlumno.stream()
                                        .anyMatch(role -> role.getName().equals(ERole.ROLE_ASPIRANTE))
                                        && alumno.getAsp_etapa() == null;

                        if (esAspiranteConEtapaNull) {
                                AspirantePerfilResponse perfilResponse = new AspirantePerfilResponse();

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
                                perfilResponse.setCurp(alumno.getCurp());
                                perfilResponse.setRfc(alumno.getRfc());
                                perfilResponse.setNss(alumno.getNss());
                                perfilResponse.setEdad(alumno.getEdad());
                                perfilResponse.setFecha_nacimiento(alumno.getFecha_nacimiento());
                                perfilResponse.setEmail(alumno.getEmail());
                                perfilResponse.setNumero_telefonico(alumno.getNumero_telefonico());
                                perfilResponse.setLocalidad_nacimiento(alumno.getLocalidad_nacimiento());
                                perfilResponse.setMunicipio_nacimiento(alumno.getMunicipio_nacimiento());
                                perfilResponse.setFecha_registro(alumno.getFecha_registro());
                                Nacionalidad nacionalidad = alumno.getId_nacionalidad();
                                perfilResponse.setNacionalidad(
                                                nacionalidad != null ? nacionalidad.getNacionalidad() : null);
                                EstadosMexico estadosMexico = alumno.getId_estado_mexico();
                                perfilResponse.setEstado(
                                                estadosMexico != null ? estadosMexico.getEstado() : null);

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
                                        perfilResponse.setTipo_sangre(
                                                        tipoSangre != null ? tipoSangre.getTipo_sangre() : null);
                                        perfilResponse.setTiene_alergias(informacionMedica.getTiene_alergias());
                                        perfilResponse.setAlergias(informacionMedica.getAlergias());
                                }

                                ContactoEmergencia contactoEmergencia = contactoEmergenciaRepository
                                                .findByAlumno(alumno)
                                                .orElse(null);
                                if (contactoEmergencia != null) {
                                        perfilResponse.setNombre_contacto_e(contactoEmergencia.getNombre_contacto_e());
                                        perfilResponse.setTelefono_contacto_e(
                                                        contactoEmergencia.getTelefono_contacto_e());
                                        perfilResponse.setParentesco_contacto_e(
                                                        contactoEmergencia.getParentesco_contacto_e());
                                        perfilResponse.setEmail_contacto_e(contactoEmergencia.getEmail_contacto_e());

                                }

                                AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository
                                                .findByAlumno(alumno)
                                                .orElse(null);
                                if (antecedentesAcademicos != null) {
                                        perfilResponse.setNombre_bachillerato(
                                                        antecedentesAcademicos.getNombre_bachillerato());
                                        perfilResponse.setPeriodo_bachillerato(
                                                        antecedentesAcademicos.getPeriodo_bachillerato());
                                        perfilResponse.setPromedio_bachillerato(
                                                        antecedentesAcademicos.getPromedio_bachillerato());
                                        Carreras carreras = antecedentesAcademicos.getId_carrera_1();
                                        perfilResponse.setId_carrera_1(carreras != null ? carreras.getCarrera() : null);
                                        Carreras carreras2 = antecedentesAcademicos.getId_carrera_2();
                                        perfilResponse.setId_carrera_2(
                                                        carreras != null ? carreras2.getCarrera() : null);

                                }

                                perfiles.add(perfilResponse);
                        }
                }

                return ResponseEntity.ok(perfiles);
        }

        // Información individual de cada matricula
        @GetMapping("/aspirante/{matricula}")
        public ResponseEntity<AspirantePerfilResponse> obtenerPerfilPorMatricula(@PathVariable String matricula) {
                Alumno alumno = alumnoRepository.findByMatricula(matricula)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Usuario no encontrado con matrícula: " + matricula));

                AspirantePerfilResponse perfilResponse = new AspirantePerfilResponse();
                Set<Role> rolesDelAlumno = alumno.getRoles();
                List<String> nombresRoles = rolesDelAlumno.stream()
                                .map(role -> role.getName().toString())
                                .collect(Collectors.toList());
                perfilResponse.setRoles(nombresRoles);
                perfilResponse.setMatricula(matricula);
                perfilResponse.setNombre(alumno.getNombre());
                perfilResponse.setAp_paterno(alumno.getAp_paterno());
                perfilResponse.setAp_materno(alumno.getAp_materno());
                perfilResponse.setCurp(alumno.getCurp());
                perfilResponse.setRfc(alumno.getRfc());
                perfilResponse.setNss(alumno.getNss());
                perfilResponse.setEmail(alumno.getEmail());
                perfilResponse.setNumero_telefonico(alumno.getNumero_telefonico());
                perfilResponse.setFecha_nacimiento(alumno.getFecha_nacimiento());
                perfilResponse.setEdad(alumno.getEdad());
                Genero genero = alumno.getId_genero();
                perfilResponse.setGenero(genero != null ? genero.getGenero() : null);
                Nacionalidad nacionalidad = alumno.getId_nacionalidad();
                perfilResponse.setNacionalidad(nacionalidad.getNacionalidad());
                EstadosMexico estadosMexico = alumno.getId_estado_mexico();
                perfilResponse.setEstado(estadosMexico.getEstado());
                perfilResponse.setMunicipio_nacimiento(alumno.getMunicipio_nacimiento());
                perfilResponse.setLocalidad_nacimiento(alumno.getLocalidad_nacimiento());
                perfilResponse.setFecha_registro(alumno.getFecha_registro());

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

                return ResponseEntity.ok(perfilResponse);
        }

        // Actualizar info de cada matricula
        @Transactional
        @PutMapping("/aspirante/{matricula}")
        public ResponseEntity<AspirantePerfilResponse> actualizarPerfilAspirante(@PathVariable String matricula,
                        @RequestBody AspirantePerfilRequest perfilRequest) {

                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String logeado = authentication.getName();
                Alumno alumno = alumnoRepository.findByMatricula(matricula)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Usuario no encontrado con matrícula: " + matricula));

                // Buscar la entidad Genero por el id proporcionado
                Genero genero = generoRepository.findById(perfilRequest.getId_genero())
                                .orElseThrow(() -> new RuntimeException("Error: Género no encontrado."));

                Nacionalidad nacionalidad = nacionalidadRepository.findById(perfilRequest.getId_nacionalidad())
                                .orElseThrow(() -> new RuntimeException("Error: Nacionalidad no encontrada"));

                EstadosMexico estadosMexico = estadosMexicoRepository.findById(perfilRequest.getId_estado_mexico())
                                .orElseThrow(() -> new RuntimeException("Error: Estado no existente"));

                // Buscar DatosGenerales asociados a este alumno
                DatosGenerales datosGenerales = datosGeneralesRepository.findByAlumno(alumno)
                                .orElseGet(() -> {
                                        DatosGenerales nuevosDatos = new DatosGenerales();
                                        nuevosDatos.setAlumno(alumno);
                                        return nuevosDatos;
                                });

                InformacionMedica informacionMedica = informacionMedicaRepository.findByAlumno(alumno)
                                .orElseGet(() -> {
                                        InformacionMedica nuevosDatosMedicos = new InformacionMedica();
                                        nuevosDatosMedicos.setAlumno(alumno);
                                        return nuevosDatosMedicos;
                                });

                TipoSangre tipoSangre = tipoSangreRepository.findById(perfilRequest.getId_tipo_sangre())
                                .orElseThrow(() -> new RuntimeException("Error: Tipo de sangre no encontrado."));

                informacionMedica.setId_tipo_sangre(tipoSangre);

                ContactoEmergencia contactoEmergencia = contactoEmergenciaRepository.findByAlumno(alumno)
                                .orElseGet(() -> {
                                        ContactoEmergencia nuevosDatosContactoEmergencia = new ContactoEmergencia();
                                        nuevosDatosContactoEmergencia.setAlumno(alumno);
                                        return nuevosDatosContactoEmergencia;
                                });

                AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository.findByAlumno(alumno)
                                .orElseGet(() -> {
                                        AntecedentesAcademicos nuevosDatosAntecedentesAcademicos = new AntecedentesAcademicos();
                                        nuevosDatosAntecedentesAcademicos.setAlumno(alumno);
                                        return nuevosDatosAntecedentesAcademicos;
                                });

                if (perfilRequest.getId_carrera_1() != null) {

                        Carreras carreras = carrerasRepository.findById(perfilRequest.getId_carrera_1())
                                        .orElseThrow(() -> new RuntimeException("Error: Carrera no encontrada."));

                        antecedentesAcademicos.setId_carrera_1(carreras);

                }

                if (perfilRequest.getId_carrera_2() != null) {

                        Carreras carreras = carrerasRepository.findById(perfilRequest.getId_carrera_2())
                                        .orElseThrow(() -> new RuntimeException("Error: Carrera no encontrada."));

                        antecedentesAcademicos.setId_carrera_2(carreras);

                }

                // Actualizar los campos del alumno
                alumno.setNombre(perfilRequest.getNombre() != null ? perfilRequest.getNombre().toUpperCase() : null);
                alumno.setAp_paterno(
                                perfilRequest.getAp_paterno() != null ? perfilRequest.getAp_paterno().toUpperCase()
                                                : null);
                alumno.setAp_materno(
                                perfilRequest.getAp_materno() != null ? perfilRequest.getAp_materno().toUpperCase()
                                                : null);
                alumno.setCurp(perfilRequest.getCurp() != null ? perfilRequest.getCurp().toUpperCase() : null);
                alumno.setFecha_nacimiento(perfilRequest.getFecha_nacimiento());
                alumno.setEdad(perfilRequest.getEdad());
                alumno.setEmail(perfilRequest.getEmail());
                alumno.setNumero_telefonico(perfilRequest.getNumero_telefonico());
                alumno.setFecha_registro(perfilRequest.getFecha_registro());
                alumno.setRfc(perfilRequest.getRfc());
                alumno.setNss(perfilRequest.getNss());

                alumno.setId_genero(genero);
                alumno.setId_nacionalidad(nacionalidad);
                alumno.setId_estado_mexico(estadosMexico);
                alumno.setMunicipio_nacimiento(perfilRequest.getMunicipio_nacimiento().toUpperCase());
                alumno.setLocalidad_nacimiento(perfilRequest.getLocalidad_nacimiento().toUpperCase());

                datosGenerales.setHabla_indigena(perfilRequest.getHabla_indigena());
                datosGenerales.setLengua_indigena(
                                perfilRequest.getLengua_indigena() != null
                                                ? perfilRequest.getLengua_indigena().toUpperCase()
                                                : null);
                datosGenerales.setTiene_discapacidad(perfilRequest.getTiene_discapacidad());
                datosGenerales.setDiscapacidad(
                                perfilRequest.getDiscapacidad() != null ? perfilRequest.getDiscapacidad().toUpperCase()
                                                : null);

                // informacionMedica.setId_tipo_sangre(tipoSangre);

                informacionMedica.setTiene_alergias(perfilRequest.getTiene_alergias());
                informacionMedica
                                .setAlergias(perfilRequest.getAlergias() != null
                                                ? perfilRequest.getAlergias().toUpperCase()
                                                : null);

                // Contacto Emergencia
                contactoEmergencia.setNombre_contacto_e(
                                perfilRequest.getNombre_contacto_e() != null
                                                ? perfilRequest.getNombre_contacto_e().toUpperCase()
                                                : null);
                contactoEmergencia.setTelefono_contacto_e(perfilRequest.getTelefono_contacto_e());
                contactoEmergencia.setEmail_contacto_e(perfilRequest.getEmail_contacto_e());
                contactoEmergencia.setParentesco_contacto_e(perfilRequest.getParentesco_contacto_e() != null
                                ? perfilRequest.getParentesco_contacto_e().toUpperCase()
                                : null);

                // Antecedentes Academicos

                antecedentesAcademicos.setNombre_bachillerato(
                                perfilRequest.getNombre_bachillerato() != null
                                                ? perfilRequest.getNombre_bachillerato().toUpperCase()
                                                : null);
                antecedentesAcademicos.setPeriodo_bachillerato(perfilRequest.getPeriodo_bachillerato());
                antecedentesAcademicos.setPromedio_bachillerato(perfilRequest.getPromedio_bachillerato());
                datosGeneralesRepository.save(datosGenerales);
                informacionMedicaRepository.save(informacionMedica);
                contactoEmergenciaRepository.save(contactoEmergencia);
                antecedentesAcademicosRepository.save(antecedentesAcademicos);

                alumnoRepository.save(alumno);
                AspirantePerfilResponse perfilResponse = new AspirantePerfilResponse();
                logService.registrarEvento(logeado, "Actualizó la información de " + alumno.getMatricula());
                return ResponseEntity.ok(perfilResponse);
        }

        // Para examen

        // Lista de aspirantes total
        @GetMapping("/aspirantes/calificaciones")
        public ResponseEntity<List<AspiranteCalificacionDTO>> obtenerPerfiExamen() {
                List<Alumno> todosLosAlumnos = alumnoRepository.findAll();
                List<AspiranteCalificacionDTO> perfiles = new ArrayList<>();

                for (Alumno alumno : todosLosAlumnos) {
                        Set<Role> rolesDelAlumno = alumno.getRoles();
                        // Comprobar si el alumno tiene el rol ROLE_ASPIRANTE
                        // Comprobar si el alumno tiene el rol ROLE_ASPIRANTE y asp_etapa mayor a 3
                        boolean esAspiranteYEtapaMayorATres = rolesDelAlumno.stream()
                                        .anyMatch(role -> role.getName().equals(ERole.ROLE_ASPIRANTE)) &&
                                        (alumno.getAsp_etapa() != null &&
                                                        (Integer.parseInt(alumno.getAsp_etapa()) == 3 || Integer
                                                                        .parseInt(alumno.getAsp_etapa()) == 101));

                        if (esAspiranteYEtapaMayorATres) {
                                AspiranteCalificacionDTO perfilResponse = new AspiranteCalificacionDTO();

                                List<String> nombresRoles = rolesDelAlumno.stream()
                                                .map(role -> role.getName().toString())
                                                .collect(Collectors.toList());
                                perfilResponse.setRoles(nombresRoles);

                                if (alumno != null && alumno.getAsp_etapa() != "3") {
                                        Genero genero = alumno.getId_genero();
                                        perfilResponse.setGenero(genero != null ? genero.getGenero() : null);
                                        perfilResponse.setMatricula(alumno.getMatricula());
                                        perfilResponse.setNombre(alumno.getNombre());
                                        perfilResponse.setAp_paterno(alumno.getAp_paterno());
                                        perfilResponse.setAp_materno(alumno.getAp_materno());
                                        perfilResponse.setEmail(alumno.getEmail());
                                        perfilResponse.setNumero_telefonico(alumno.getNumero_telefonico());
                                        perfilResponse.setFecha_registro(alumno.getFecha_registro());
                                        perfilResponse.setAsp_etapa(alumno.getAsp_etapa());
                                }

                                ContactoEmergencia contactoEmergencia = contactoEmergenciaRepository
                                                .findByAlumno(alumno)
                                                .orElse(null);
                                if (contactoEmergencia != null) {
                                        perfilResponse.setNombre_contacto_e(contactoEmergencia.getNombre_contacto_e());
                                        perfilResponse.setTelefono_contacto_e(
                                                        contactoEmergencia.getTelefono_contacto_e());
                                        perfilResponse.setParentesco_contacto_e(
                                                        contactoEmergencia.getParentesco_contacto_e());
                                        perfilResponse.setEmail_contacto_e(contactoEmergencia.getEmail_contacto_e());

                                }

                                AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository
                                                .findByAlumno(alumno)
                                                .orElse(null);
                                if (antecedentesAcademicos != null) {
                                        Carreras carreras = antecedentesAcademicos.getId_carrera_1();
                                        perfilResponse.setId_carrera_1(carreras != null ? carreras.getCarrera() : null);
                                }

                                AspiranteCalificaciones aspiranteCalificaciones = aspiranteCalificacionesRepository
                                                .findByAlumno(alumno)
                                                .orElse(null);
                                if (aspiranteCalificaciones != null) {
                                        perfilResponse.setAciertos(aspiranteCalificaciones.getAciertos());
                                        perfilResponse.setTotal_aciertos(aspiranteCalificaciones.getTotal_aciertos());
                                        perfilResponse.setCalificacion(aspiranteCalificaciones.getCalificacion());
                                }

                                perfiles.add(perfilResponse);
                        }
                }

                return ResponseEntity.ok(perfiles);
        }

        @PutMapping("/aspirantes/calificaciones/{matricula}")
        @PreAuthorize("hasRole('VINCULACION')")
        public ResponseEntity<?> actualizarCalificacion(@PathVariable String matricula,
                        @RequestBody AspiranteCalificacionDTO calificacionesDTO) {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String logeado = authentication.getName();
                Alumno alumno = alumnoRepository.findByMatricula(matricula)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Alumno no encontrado con matrícula: " + matricula));

                // Comprobar si ya existe una calificación para el alumno
                Optional<AspiranteCalificaciones> existenteCalificaciones = aspiranteCalificacionesRepository
                                .findByAlumno(alumno);
                boolean esNuevaCalificacion = existenteCalificaciones.isEmpty()
                                || existenteCalificaciones.get().getCalificacion() == null;

                AspiranteCalificaciones aspiranteCalificaciones = existenteCalificaciones
                                .orElseGet(() -> new AspiranteCalificaciones(alumno));

                final int totalAciertos = 120;
                Integer aciertos = calificacionesDTO.getAciertos();
                double calificacionNumerica = aciertos != null ? (double) aciertos / totalAciertos * 10 : 0;
                String calificacion = String.format("%.2f", calificacionNumerica);

                aspiranteCalificaciones.setAciertos(aciertos);
                aspiranteCalificaciones.setTotal_aciertos(totalAciertos);
                aspiranteCalificaciones.setCalificacion(calificacion);

                aspiranteCalificacionesRepository.save(aspiranteCalificaciones);

                // Actualizar las estadísticas solo si es una nueva calificación
                if (esNuevaCalificacion) {
                        estadisticaAspirantesService.actualizarPorAspiranteCompleto(alumno.getMatricula());
                        AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository
                                        .findByAlumno(alumno)
                                        .orElse(null);

                        if (antecedentesAcademicos != null && antecedentesAcademicos.getId_carrera_1() != null) {
                                Long idCarrera = antecedentesAcademicos.getId_carrera_1().getId_carrera();
                                estadisticaAspirantesCarreraService.actualizarEstadisticasAspiranteCompleto(idCarrera);
                        }

                }
                logService.registrarEvento(logeado, "Calificó el exámen de admisión de " + alumno.getMatricula());
                return ResponseEntity.ok(new MessageResponse(
                                "Calificación actualizada correctamente para la matrícula: " + matricula));
        }

        // Aceptar aspirante
        @Transactional
        @PutMapping("/aspirante/aceptar/{matricula}")
        public ResponseEntity<AspirantePerfilResponse> aceptarAspirante(@PathVariable String matricula,
                        @RequestBody AspirantePerfilRequest perfilRequest) {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String logeado = authentication.getName();
                Alumno alumno = alumnoRepository.findByMatricula(matricula)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Usuario no encontrado con matrícula: " + matricula));

                Pagos pagos = new Pagos();
                pagos.setAlumno(alumno);

                // Convertir el ID de cuota a Long
                Long idCuota = Long.parseLong("17");
                // Establecer el id_cuota a "17" siempre
                Cuotas cuotas = cuotasRepository.findById(idCuota)
                                .orElseThrow(() -> new RuntimeException("Error cuota no encontrada"));
                pagos.setId_cuota(cuotas);

                // Lógica para generar la cadena de concatenación
                String ultimosCuatroDigitosMatricula = "";
                if (alumno.getMatricula() != null && alumno.getMatricula().length() >= 4) {
                        ultimosCuatroDigitosMatricula = alumno.getMatricula()
                                        .substring(alumno.getMatricula().length() - 4);
                }

                String formatoNumericoCarrera = "";
                AntecedentesAcademicos antecedentesAcademicosF = antecedentesAcademicosRepository
                                .findByAlumno(alumno)
                                .orElse(null);
                if (antecedentesAcademicosF != null && antecedentesAcademicosF.getId_carrera_1() != null) {
                        formatoNumericoCarrera = antecedentesAcademicosF.getId_carrera_1()
                                        .getFormato_numerico();
                }

                String concatenado = ultimosCuatroDigitosMatricula + formatoNumericoCarrera
                                + cuotas.getFormato_numerico_cuota()
                                + 3;
                pagos.setConcatenado(concatenado);

                LocalDate fechaGeneracion = LocalDate.now();
                LocalDate fechaLimite = LocalDate.of(2024, 8, 9);

                pagos.setFecha_generacion(fechaGeneracion);
                pagos.setFecha_limite(fechaLimite);

                pagosRepository.save(pagos);

                alumno.setAsp_etapa("4");
                alumnoRepository.save(alumno);
                AspirantePerfilResponse perfilResponse = new AspirantePerfilResponse();

                logService.registrarEvento(logeado, "Añadió a la lista de aceptados a " + alumno.getMatricula()
                                + "y se generó su concatenado de Curso Propedeutico");
                return ResponseEntity.ok(perfilResponse);
        }

        // Lista de aspirantes total
        @GetMapping("/aspirantes/aceptados")
        public ResponseEntity<List<AspiranteCalificacionDTO>> obtenerAceptados() {
                List<Alumno> todosLosAlumnos = alumnoRepository.findAll();
                List<AspiranteCalificacionDTO> perfiles = new ArrayList<>();

                for (Alumno alumno : todosLosAlumnos) {
                        Set<Role> rolesDelAlumno = alumno.getRoles();
                        // Comprobar si el alumno tiene el rol ROLE_ASPIRANTE
                        // Comprobar si el alumno tiene el rol ROLE_ASPIRANTE y asp_etapa mayor a 3
                        boolean esAspiranteYEtapaMayorATres = rolesDelAlumno.stream()
                                        .anyMatch(role -> role.getName().equals(ERole.ROLE_ASPIRANTE)) &&
                                        (alumno.getAsp_etapa() != null && Integer.parseInt(alumno.getAsp_etapa()) == 4);

                        if (esAspiranteYEtapaMayorATres) {
                                AspiranteCalificacionDTO perfilResponse = new AspiranteCalificacionDTO();

                                List<String> nombresRoles = rolesDelAlumno.stream()
                                                .map(role -> role.getName().toString())
                                                .collect(Collectors.toList());
                                perfilResponse.setRoles(nombresRoles);

                                if (alumno != null && alumno.getAsp_etapa() != "4") {
                                        Genero genero = alumno.getId_genero();
                                        perfilResponse.setGenero(genero != null ? genero.getGenero() : null);
                                        perfilResponse.setMatricula(alumno.getMatricula());
                                        perfilResponse.setNombre(alumno.getNombre());
                                        perfilResponse.setAp_paterno(alumno.getAp_paterno());
                                        perfilResponse.setAp_materno(alumno.getAp_materno());
                                        perfilResponse.setEmail(alumno.getEmail());
                                        perfilResponse.setNumero_telefonico(alumno.getNumero_telefonico());
                                        perfilResponse.setFecha_registro(alumno.getFecha_registro());
                                }

                                ContactoEmergencia contactoEmergencia = contactoEmergenciaRepository
                                                .findByAlumno(alumno)
                                                .orElse(null);
                                if (contactoEmergencia != null) {
                                        perfilResponse.setNombre_contacto_e(contactoEmergencia.getNombre_contacto_e());
                                        perfilResponse.setTelefono_contacto_e(
                                                        contactoEmergencia.getTelefono_contacto_e());
                                        perfilResponse.setParentesco_contacto_e(
                                                        contactoEmergencia.getParentesco_contacto_e());
                                        perfilResponse.setEmail_contacto_e(contactoEmergencia.getEmail_contacto_e());

                                }

                                AntecedentesAcademicos antecedentesAcademicos = antecedentesAcademicosRepository
                                                .findByAlumno(alumno)
                                                .orElse(null);
                                if (antecedentesAcademicos != null) {
                                        Carreras carreras = antecedentesAcademicos.getId_carrera_1();
                                        perfilResponse.setId_carrera_1(carreras != null ? carreras.getCarrera() : null);
                                }

                                AspiranteCalificaciones aspiranteCalificaciones = aspiranteCalificacionesRepository
                                                .findByAlumno(alumno)
                                                .orElse(null);
                                if (aspiranteCalificaciones != null) {
                                        perfilResponse.setAciertos(aspiranteCalificaciones.getAciertos());
                                        perfilResponse.setTotal_aciertos(aspiranteCalificaciones.getTotal_aciertos());
                                        perfilResponse.setCalificacion(aspiranteCalificaciones.getCalificacion());
                                }

                                perfiles.add(perfilResponse);
                        }
                }

                return ResponseEntity.ok(perfiles);
        }

        // Aceptar aspirante
        @Transactional
        @PutMapping("/aspirante/rechazar/{matricula}")
        public ResponseEntity<AspirantePerfilResponse> rechazarAspirante(@PathVariable String matricula,
                        @RequestBody AspirantePerfilRequest perfilRequest) {
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String logeado = authentication.getName();
                Alumno alumno = alumnoRepository.findByMatricula(matricula)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Usuario no encontrado con matrícula: " + matricula));
                alumno.setAsp_etapa("101");
                alumnoRepository.save(alumno);
                AspirantePerfilResponse perfilResponse = new AspirantePerfilResponse();

                logService.registrarEvento(logeado,
                                "Regresó a la lista de aspirantes a " + alumno.getMatricula() + " por falta de pago");
                return ResponseEntity.ok(perfilResponse);
        }

        // Aceptar el pago de aspirante
        @PutMapping("/aspirante/pago_ficha/{matricula}")
        public ResponseEntity<?> actualizarEtapaAspirante(@PathVariable String matricula,
                        @RequestBody PagoFichaRequest pagoFichaRequest) {

                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String logeado = authentication.getName();
                Alumno alumno = alumnoRepository.findByMatricula(matricula)
                                .orElseThrow(() -> new ResourceNotFoundException(
                                                "Usuario no encontrado con matrícula: " + matricula));

                // Encuentra los pagos asociados al alumno
                List<Pagos> pagosList = pagosRepository.findByAlumnoMatricula(matricula);
                boolean pagoEncontrado = false;

                for (Pagos pago : pagosList) {
                        if (pago.getId_cuota() != null && pago.getId_cuota().getId_cuota().equals(5L)) {
                                pago.setFolio(pago.getFolio());
                                pago.setFolio(pagoFichaRequest.getFolio());
                                pago.setVerificar_pago("SI"); // Actualizar verificar_pago a "si"
                                pago.setFecha_generacion(LocalDate.now());
                                pagosRepository.save(pago);
                                pagoEncontrado = true;
                        }
                }

                if (!pagoEncontrado) {
                        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                        .body("No se encontró un pago aplicable para la actualización.");
                }

                if ("1".equals(alumno.getAsp_etapa())) {
                        alumno.setAsp_etapa("3"); // Actualizar asp_etapa a "3"

                        AspiranteCalificaciones aspiranteCalificaciones = aspiranteCalificacionesRepository
                                        .findByAlumno(alumno)
                                        .orElseGet(() -> {
                                                AspiranteCalificaciones nuevosDatos = new AspiranteCalificaciones();
                                                nuevosDatos.setAlumno(alumno);
                                                return nuevosDatos;
                                        });

                        aspiranteCalificacionesRepository.save(aspiranteCalificaciones);

                        alumnoRepository.save(alumno);
                        logService.registrarEvento(logeado,
                                        "Verificó el pago de " + alumno.getMatricula()
                                                        + " y actualizó su etapa a 3");
                        return ResponseEntity.ok(new MessageResponse(
                                        "Asp_etapa y verificar_pago actualizados correctamente para la matrícula: "
                                                        + matricula));
                } else {
                        return ResponseEntity
                                        .status(HttpStatus.BAD_REQUEST)
                                        .body(new MessageResponse(
                                                        "La actualización de asp_etapa no es aplicable para la matrícula: "
                                                                        + matricula));
                }
        }

        @GetMapping("/aspirantes/pago_ficha")
        public ResponseEntity<List<AspirantesEtapa1>> obtenerAspirantesEtapa1() {
                List<Alumno> todosLosAlumnos = alumnoRepository.findAll();
                List<AspirantesEtapa1> perfiles = new ArrayList<>();

                for (Alumno alumno : todosLosAlumnos) {
                        if ("1".equals(alumno.getAsp_etapa())) {
                                AspirantesEtapa1 perfilResponse = new AspirantesEtapa1();

                                perfilResponse.setMatricula(alumno.getMatricula());
                                perfilResponse.setNombre(alumno.getNombre());
                                perfilResponse.setAp_paterno(alumno.getAp_paterno());
                                perfilResponse.setAp_materno(alumno.getAp_materno());
                                perfilResponse.setAsp_etapa(alumno.getAsp_etapa());

                                Pagos pagos2 = pagosRepository.findByAlumno(alumno).orElse(null);
                                if (pagos2 != null) {
                                        Optional<Pagos> pagoOptional = Optional.ofNullable(pagos2);
                                        perfilResponse.setFolio(pagoOptional.map(Pagos::getFolio).orElse(null));
                                }

                                perfiles.add(perfilResponse);
                        }
                }

                return ResponseEntity.ok(perfiles);
        }

        @GetMapping("/estadisticas/registros/{fecha}")
        public ResponseEntity<?> obtenerEstadisticaPorFecha(
                        @PathVariable @Pattern(regexp = "\\d{4}-\\d{2}-\\d{2}") String fecha) {
                try {
                        LocalDate fechaParsed = LocalDate.parse(fecha);
                        Optional<EstadisticaRegistroDiario> estadistica = estadisticaRegistroDiarioService
                                        .obtenerEstadisticaPorFecha(fechaParsed);

                        if (estadistica.isPresent()) {
                                return ResponseEntity.ok(estadistica.get());
                        } else {
                                return ResponseEntity.notFound().build();
                        }
                } catch (DateTimeParseException e) {
                        return ResponseEntity.badRequest()
                                        .body("Formato de fecha inválido. Use el formato yyyy-MM-dd.");
                }
        }

        @GetMapping("/estadisticas/registros")
        public ResponseEntity<List<EstadisticaRegistroDiario>> obtenerTodasLasEstadisticas() {
                List<EstadisticaRegistroDiario> estadisticas = estadisticaRegistroDiarioService
                                .obtenerTodasLasEstadisticas();
                if (estadisticas.isEmpty()) {
                        return ResponseEntity.noContent().build();
                } else {
                        return ResponseEntity.ok(estadisticas);
                }
        }

}
