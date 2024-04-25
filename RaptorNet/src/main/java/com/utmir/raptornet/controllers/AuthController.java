package com.utmir.raptornet.controllers;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.utmir.raptornet.models.ERole;
import com.utmir.raptornet.models.EstadosMexico;
import com.utmir.raptornet.models.Genero;
import com.utmir.raptornet.models.InformacionMedica;
import com.utmir.raptornet.models.Nacionalidad;
import com.utmir.raptornet.models.Pagos;
import com.utmir.raptornet.models.Role;
import com.utmir.raptornet.models.TipoSangre;
import com.utmir.raptornet.models.Alumno;
import com.utmir.raptornet.models.AntecedentesAcademicos;
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.ContactoEmergencia;
import com.utmir.raptornet.models.Cuotas;
import com.utmir.raptornet.models.DatosGenerales;
import com.utmir.raptornet.payload.request.AspirantePerfilRequest;
import com.utmir.raptornet.payload.request.AspirantePerfilResponse;
import com.utmir.raptornet.payload.request.LoginRequest;
import com.utmir.raptornet.payload.request.SignupAspirantesRequest;
import com.utmir.raptornet.payload.request.SignupPersonal;
import com.utmir.raptornet.payload.response.JwtResponse;
import com.utmir.raptornet.payload.response.MessageResponse;
import com.utmir.raptornet.payload.response.ResourceNotFoundException;
import com.utmir.raptornet.repository.AlumnoRepository;
import com.utmir.raptornet.repository.AntecedentesAcademicosRepository;
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
import com.utmir.raptornet.security.jwt.JwtUtils;
import com.utmir.raptornet.security.services.EmailService;
import com.utmir.raptornet.security.services.EstadisticaAspirantesCarreraService;
import com.utmir.raptornet.security.services.EstadisticaAspirantesService;
import com.utmir.raptornet.security.services.EstadisticaRegistroDiarioService;
import com.utmir.raptornet.security.services.LogService;
import com.utmir.raptornet.security.services.MatriculaService;
import com.utmir.raptornet.security.services.StringUtils;
import com.utmir.raptornet.security.services.UserDetailsImpl;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthController {
  @Autowired
  AuthenticationManager authenticationManager;

  @Autowired
  RoleRepository roleRepository;

  @Autowired
  PasswordEncoder encoder;

  @Autowired
  AlumnoRepository alumnoRepository;

  @Autowired
  JwtUtils jwtUtils;

  @Autowired
  MatriculaService matriculaService;

  @Autowired
  GeneroRepository generoRepository;

  @Autowired
  NacionalidadRepository nacionalidadRepository;

  @Autowired
  EstadosMexicoRepository estadosMexicoRepository;

  @Autowired
  DatosGeneralesRepository datosGeneralesRepository;

  @Autowired
  InformacionMedicaRepository informacionMedicaRepository;

  @Autowired
  TipoSangreRepository tipoSangreRepository;

  @Autowired
  ContactoEmergenciaRepository contactoEmergenciaRepository;

  @Autowired
  AntecedentesAcademicosRepository antecedentesAcademicosRepository;

  @Autowired
  CarrerasRepository carrerasRepository;

  @Autowired
  PagosRepository pagosRepository;

  @Autowired
  CuotasRepository cuotasRepository;

  @Autowired
  EstadisticaAspirantesService estadisticaAspirantesService;

  @Autowired
  EstadisticaAspirantesCarreraService estadisticaAspirantesCarreraService;

  @Autowired
  LogService logService;

  @Autowired
  EmailService emailService;

  @Autowired
  EstadisticaRegistroDiarioService estadisticaRegistroDiarioService;

  @PostMapping("/signin")
  public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {
    try {
      Authentication authentication = authenticationManager.authenticate(
          new UsernamePasswordAuthenticationToken(loginRequest.getMatricula(), loginRequest.getPassword()));

      SecurityContextHolder.getContext().setAuthentication(authentication);
      String jwt = jwtUtils.generateJwtToken(authentication);

      UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
      List<String> roles = userDetails.getAuthorities().stream()
          .map(item -> item.getAuthority())
          .collect(Collectors.toList());

      return ResponseEntity.ok(new JwtResponse(jwt,
          userDetails.getMatricula(),
          userDetails.getNombre(),
          userDetails.getEmail(),
          userDetails.getAsp_etapa(),
          roles));

    } catch (BadCredentialsException e) {
      return ResponseEntity
          .status(HttpStatus.UNAUTHORIZED)
          .body("Error: Usuario o contraseña incorrectos.");
    } catch (Exception e) {
      // Log the stack trace or send it back as part of the response for debugging
      // purposes
      e.printStackTrace(); // Consider removing or modifying this for production environments
      return ResponseEntity
          .status(HttpStatus.INTERNAL_SERVER_ERROR)
          .body("Error interno del servidor: " + e.getMessage());
    }
  }

  @PostMapping("/signup")
  public ResponseEntity<?> registerUser(@Valid @RequestBody SignupAspirantesRequest signUpRequest) {

    String curpMayusculas = signUpRequest.getCurp().toUpperCase();

    if (alumnoRepository.existsByCurp(curpMayusculas)) {
      return ResponseEntity
          .badRequest()
          .body(new MessageResponse("Error: CURP existente!"));
    }

    if (alumnoRepository.existsByEmail(signUpRequest.getEmail())) {
      return ResponseEntity
          .badRequest()
          .body(new MessageResponse("Error: EMAIL existente!"));
    }
    // Crear nueva cuenta de aspirante
    Alumno alumno = new Alumno(
        curpMayusculas,
        signUpRequest.getEmail(),
        encoder.encode(signUpRequest.getPassword()));

    Set<String> strRoles = signUpRequest.getRole();
    Set<Role> roles = new HashSet<>();

    if (strRoles == null) {
      Role userRole = roleRepository.findByName(ERole.ROLE_ASPIRANTE)
          .orElseThrow(() -> new RuntimeException("Error: Role no encontrado."));
      roles.add(userRole);
    } else {
      strRoles.forEach(role -> {
        switch (role) {
          case "admin":
            Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
                .orElseThrow(() -> new RuntimeException("Error: Role no encontrado."));
            roles.add(adminRole);

            break;
          default:
            Role userRole = roleRepository.findByName(ERole.ROLE_ASPIRANTE)
                .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
            roles.add(userRole);
        }
      });
    }

    alumno.setRoles(roles);
    String matricula = matriculaService.generateNextMatricula();
    alumno.setMatricula(matricula);
    alumnoRepository.save(alumno);
    estadisticaRegistroDiarioService.actualizarEstadisticaRegistro(LocalDate.now());

    // Construir el contenido HTML para el correo
    String content = "<html>"
        + "<body>"
        + "<h2>¡Hola, y bienvenida/o a RaptorNet!</h2>"
        + "<p>Gracias por unirte a la comunidad <strong style='color: #016530;'>#RAPTOR</strong>."
        + "<p>Hemos recibido tu \"Registro para iniciar el proceso de trámite de Ficha de ingreso a la UTMiR en septiembre 2024\"</p>"
        + "<p>Tu número de Matrícula asignado es: <strong style='color: #f05b24;'>" + alumno.getMatricula()
        + "</strong>.</p>"
        + "<p> Es importarte que conserves este número, ya que lo utilizaras durante toda tu estancia universitaria.</p>"
        + "<p><img src='cid:WeAreRaptors.png' style='width: 500px;'/></p>"
        + "</body>"
        + "</html>";

    // Llamar al servicio de email para enviar el correo con imagen
    emailService.sendEmailWithImage(
        signUpRequest.getEmail(),
        "Registro Exitoso",
        content,
        "static/images/WeAreRaptors.png");

    logService.registrarEvento(matricula, "Se registró en RaptorNet");

    estadisticaAspirantesService.actualizarEstadisticaRegistro();
    return ResponseEntity.ok(new MessageResponse("Usuario registrado exitosamente! Tu matricula es: " + matricula
        + ". Se te envió un correo con la matricula registrada."));

  }

  @PostMapping("/signupAuthority")
  public ResponseEntity<?> registerAuthority(@Valid @RequestBody SignupPersonal signUpRequest) {
    if (alumnoRepository.existsByMatricula(signUpRequest.getMatricula())) {
      return ResponseEntity
          .badRequest()
          .body(new MessageResponse("Error: Matrícula existente!"));
    }

    if (alumnoRepository.existsByEmail(signUpRequest.getEmail())) {
      return ResponseEntity
          .badRequest()
          .body(new MessageResponse("Error: EMAIL existente!"));
    }

    // Crear nueva cuenta de autoridad
    Alumno autoridad = new Alumno(
        signUpRequest.getEmail(),
        encoder.encode(signUpRequest.getPassword()));
    autoridad.setMatricula(signUpRequest.getMatricula());
    autoridad.setNombre(signUpRequest.getNombre());
    autoridad.setAp_paterno(signUpRequest.getApPaterno());
    autoridad.setAp_materno(signUpRequest.getApMaterno());
    autoridad.setFecha_registro(LocalDate.now());

    Set<String> strRoles = signUpRequest.getRole();
    Set<Role> roles = new HashSet<>();

    strRoles.forEach(role -> {
      switch (role) {
        case "admin":
          Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
              .orElseThrow(() -> new RuntimeException("Error: Role no encontrado."));
          roles.add(adminRole);
          break;
        case "finanzas":
          Role finanzasRole = roleRepository.findByName(ERole.ROLE_FINANZAS)
              .orElseThrow(() -> new RuntimeException("Error: Role no encontrado."));
          roles.add(finanzasRole);
          break;
        case "vinculacion":
          Role vinculacionRole = roleRepository.findByName(ERole.ROLE_VINCULACION)
              .orElseThrow(() -> new RuntimeException("Error: Role no encontrado."));
          roles.add(vinculacionRole);
          break;
        case "serviciosescolares":
          Role serviciosEscolaresRole = roleRepository.findByName(ERole.ROLE_SERVICIOSESCOLARES)
              .orElseThrow(() -> new RuntimeException("Error: Role no encontrado."));
          roles.add(serviciosEscolaresRole);
          break;

        case "docente":
          Role docentesRole = roleRepository.findByName(ERole.ROLE_DOCENTES)
              .orElseThrow(() -> new RuntimeException("Error: Role no encontrado."));
          roles.add(docentesRole);
          break;

        case "direccion_academica":
          Role direccionAcademicaRole = roleRepository.findByName(ERole.ROLE_DIRECCION_ACADEMICA)
              .orElseThrow(() -> new RuntimeException("Error: Role no encontrado."));
          roles.add(direccionAcademicaRole);
          break;
        default:
          throw new RuntimeException("Error: Role no válido.");
      }
    });

    autoridad.setRoles(roles);
    alumnoRepository.save(autoridad);
    logService.registrarEvento(signUpRequest.getMatricula(), "Se registró en RaptorNet");

    return ResponseEntity.ok(new MessageResponse("Autoridad registrada exitosamente!"));
  }

  @GetMapping("/perfil")
  public ResponseEntity<AspirantePerfilResponse> obtenerPerfilDeUsuarioAutenticado() {
    // Obtener la autenticación del usuario actual
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String matricula = authentication.getName(); // Asumiendo que el nombre de usuario es la matrícula

    // Buscar el alumno por matrícula
    Alumno alumno = alumnoRepository.findByMatricula(matricula)
        .orElseThrow(() -> new ResourceNotFoundException("Usuario no encontrado con matrícula: " + matricula));

    // Ahora construimos el DTO solo para este alumno
    AspirantePerfilResponse perfilResponse = new AspirantePerfilResponse();
    Set<Role> rolesDelAlumno = alumno.getRoles();
    List<String> nombresRoles = rolesDelAlumno.stream()
        .map(role -> role.getName().toString())
        .collect(Collectors.toList());
    perfilResponse.setRoles(nombresRoles);

    if (alumno != null) {
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
      Nacionalidad nacionalidad = alumno.getId_nacionalidad();
      perfilResponse.setNacionalidad(nacionalidad != null ? nacionalidad.getNacionalidad() : null);
      EstadosMexico estadosMexico = alumno.getId_estado_mexico();
      perfilResponse.setEstado(estadosMexico != null ? estadosMexico.getEstado() : null);
    }
    return ResponseEntity.ok(perfilResponse);
  }

  @PutMapping("/perfil")
  @PreAuthorize("hasRole('ASPIRANTE')")
  public ResponseEntity<?> actualizarPerfil(@Valid @RequestBody AspirantePerfilRequest perfilRequest) {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String matricula = authentication.getName(); // Obtenemos la matrícula del usuario autenticado

    Alumno alumno = alumnoRepository.findByMatricula(matricula)
        .orElseThrow(() -> new RuntimeException("Error: Usuario no encontrado."));

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

    if (perfilRequest.getId_tipo_sangre() != null) {

      TipoSangre tipoSangre = tipoSangreRepository.findById(perfilRequest.getId_tipo_sangre())
          .orElseThrow(() -> new RuntimeException("Error: Tipo de sangre no encontrado."));

      informacionMedica.setId_tipo_sangre(tipoSangre);

    }

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

    Pagos pagos = pagosRepository.findByAlumno(alumno)
        .orElseGet(() -> {
          Pagos nuevoPago = new Pagos();
          nuevoPago.setAlumno(alumno);
          return nuevoPago;
        });

    if (perfilRequest.getId_cuota() != null) {
      Cuotas cuotas = cuotasRepository.findById(perfilRequest.getId_cuota())
          .orElseThrow(() -> new RuntimeException("Error cuota no encontrada"));

      pagos.setId_cuota(cuotas);

      // Lógica para generar la cadena de concatenación
      String ultimosCuatroDigitosMatricula = "";
      if (alumno.getMatricula() != null && alumno.getMatricula().length() >= 4) {
        ultimosCuatroDigitosMatricula = alumno.getMatricula().substring(alumno.getMatricula().length() - 4);
      }

      String formatoNumericoCarrera = "";
      AntecedentesAcademicos antecedentesAcademicosF = antecedentesAcademicosRepository.findByAlumno(alumno)
          .orElse(null);
      if (antecedentesAcademicosF != null && antecedentesAcademicosF.getId_carrera_1() != null) {
        formatoNumericoCarrera = antecedentesAcademicosF.getId_carrera_1().getFormato_numerico();
      }

      String concatenado = ultimosCuatroDigitosMatricula + formatoNumericoCarrera + cuotas.getFormato_numerico_cuota()
          + 3;
      pagos.setConcatenado(concatenado);
    }

    // Actualizar los campos del alumno
    alumno.setNombre(perfilRequest.getNombre() != null ? StringUtils.normalizeString(perfilRequest.getNombre()) : null);
    alumno.setAp_paterno(
        perfilRequest.getAp_paterno() != null ? StringUtils.normalizeString(perfilRequest.getAp_paterno()) : null);
    alumno.setAp_materno(
        perfilRequest.getAp_materno() != null ? StringUtils.normalizeString(perfilRequest.getAp_materno()) : null);
    alumno.setCurp(perfilRequest.getCurp() != null ? StringUtils.normalizeString(perfilRequest.getCurp()) : null);
    alumno.setFecha_nacimiento(perfilRequest.getFecha_nacimiento());
    alumno.setEdad(perfilRequest.getEdad());
    alumno.setEmail(perfilRequest.getEmail());
    alumno.setNumero_telefonico(perfilRequest.getNumero_telefonico());
    alumno.setFecha_registro(perfilRequest.getFecha_registro());

    alumno.setId_genero(genero);
    alumno.setId_nacionalidad(nacionalidad);
    alumno.setId_estado_mexico(estadosMexico);
    alumno.setMunicipio_nacimiento(perfilRequest.getMunicipio_nacimiento() != null
        ? StringUtils.normalizeString(perfilRequest.getMunicipio_nacimiento())
        : null);
    alumno.setLocalidad_nacimiento(perfilRequest.getLocalidad_nacimiento() != null
        ? StringUtils.normalizeString(perfilRequest.getLocalidad_nacimiento())
        : null);
    alumno.setAsp_etapa(perfilRequest.getAsp_etapa());

    datosGenerales.setHabla_indigena(perfilRequest.getHabla_indigena());
    datosGenerales.setLengua_indigena(
        perfilRequest.getLengua_indigena() != null ? StringUtils.normalizeString(perfilRequest.getLengua_indigena())
            : null);
    datosGenerales.setTiene_discapacidad(perfilRequest.getTiene_discapacidad());
    datosGenerales.setDiscapacidad(
        perfilRequest.getDiscapacidad() != null ? StringUtils.normalizeString(perfilRequest.getDiscapacidad()) : null);

    // informacionMedica.setId_tipo_sangre(tipoSangre);

    informacionMedica.setTiene_alergias(perfilRequest.getTiene_alergias());
    informacionMedica.setAlergias(
        perfilRequest.getAlergias() != null ? StringUtils.normalizeString(perfilRequest.getAlergias()) : null);

    // Contacto Emergencia
    contactoEmergencia.setNombre_contacto_e(
        perfilRequest.getNombre_contacto_e() != null ? StringUtils.normalizeString(perfilRequest.getNombre_contacto_e())
            : null);
    contactoEmergencia.setTelefono_contacto_e(perfilRequest.getTelefono_contacto_e());
    contactoEmergencia.setEmail_contacto_e(perfilRequest.getEmail_contacto_e());
    contactoEmergencia.setParentesco_contacto_e(perfilRequest.getParentesco_contacto_e() != null
        ? StringUtils.normalizeString(perfilRequest.getParentesco_contacto_e())
        : null);

    // Antecedentes Academicos

    antecedentesAcademicos.setNombre_bachillerato(perfilRequest.getNombre_bachillerato() != null
        ? StringUtils.normalizeString(perfilRequest.getNombre_bachillerato())
        : null);
    antecedentesAcademicos.setPeriodo_bachillerato(perfilRequest.getPeriodo_bachillerato());
    antecedentesAcademicos.setPromedio_bachillerato(perfilRequest.getPromedio_bachillerato());

    // Guardar los cambios en el repositorio
    alumnoRepository.save(alumno);
    datosGeneralesRepository.save(datosGenerales);
    informacionMedicaRepository.save(informacionMedica);
    contactoEmergenciaRepository.save(contactoEmergencia);
    antecedentesAcademicosRepository.save(antecedentesAcademicos);
    pagosRepository.save(pagos);
    // En el método actualizarPerfil
    if (perfilRequest.getId_carrera_1() != null) {
      estadisticaAspirantesCarreraService.registrarAspiranteCarrera(perfilRequest.getId_carrera_1());
      logService.registrarEvento(matricula, "Completó su Perfil en RaptorNet");
    }

    // Retornar una respuesta exitosa
    return ResponseEntity.ok(new MessageResponse("Perfil actualizado exitosamente!"));

  }

  @PostMapping("/resetPassword")
  public ResponseEntity<?> resetPassword(@RequestParam String matricula, @RequestParam String newPassword) {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String logeado = authentication.getName(); // Obtenemos la matrícula del usuario autenticado

    // Buscar al alumno por matrícula
    Alumno alumno = alumnoRepository.findByMatricula(matricula)
        .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND,
            "Alumno no encontrado con la matrícula: " + matricula));

    // Codificar la nueva contraseña
    String encodedPassword = encoder.encode(newPassword);

    // Establecer la nueva contraseña codificada
    alumno.setPassword(encodedPassword);

    // Guardar el alumno con la contraseña actualizada
    alumnoRepository.save(alumno);

    logService.registrarEvento(logeado, "Restableció la contraseña de" + matricula);

    // Retornar respuesta exitosa
    return ResponseEntity
        .ok(new MessageResponse("Contraseña reestablecida exitosamente para la matrícula: " + matricula));

  }

}
