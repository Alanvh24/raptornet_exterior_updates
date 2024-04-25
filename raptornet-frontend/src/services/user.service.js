import axios from 'axios';
import authHeader from './auth-header';

const API_URL = 'http://localhost:8080/api/test/';
const API_CATA = 'http://localhost:8080/api/catalogos/';
const API_URL_AUTH = 'http://localhost:8080/api/auth/';
const API_URL_VINC = 'http://localhost:8080/api/vinculacion/';
const API_URL_FIN = 'http://localhost:8080/api/finanzas/';
const API_URL_SERVE = 'http://localhost:8080/api/servicios_escolares/';

const API_DIR_ACAD = 'http://localhost:8080/api/academia/';

class UserService {

  getProgramasEducativos() {

    return axios.get(API_CATA + 'carreras/activas')

  }

  getDocentes() {
    return axios.get(API_CATA + 'docentes');
  }

  getAsignaturas() {
    return axios.get(API_CATA + 'asignaturas');
  }
  getPublicContent() {
    return axios.get(API_URL + 'all');
  }

  getUserBoard() {
    return axios.get(API_URL + 'user', { headers: authHeader() });
  }

  getModeratorBoard() {
    return axios.get(API_URL + 'mod', { headers: authHeader() });
  }

  getAdminBoard() {
    return axios.get(API_URL + 'admin', { headers: authHeader() });
  }

  getDigBitacora() {
    return axios.get(API_URL + 'dig_bitacora', { headers: authHeader() });
  }

  getConsultaPorFecha(fechaInicio, fechaFin) {
    return axios.get(API_URL + `consultaporfechadig?fechaInicio=${fechaInicio}&fechaFin=${fechaFin}`, {
      headers: authHeader(),
    });
  }

  perfilUsuario() {
    return axios.get(API_URL_AUTH + 'perfil', { headers: authHeader() });
  }


  listarUsuarios() {
    return axios.get(API_URL_VINC + 'aspirantes')
  }

  listarRegistros() {
    return axios.get(API_URL_VINC + 'registros')
  }

  obtenerEstadisticasPorFecha(fecha) {
    return axios.get(`${API_URL_VINC}estadisticas/registros/${fecha}`);
  }

  obtenerTodasLasEstadisticas() {
    return axios.get(API_URL_VINC + 'estadisticas/registros');
  }


  // Finanzas

  listarFinanzas() {
    return axios.get(API_URL_FIN + 'aspirantes', { headers: authHeader() })
  }

  listarFinanzasEtapa1() {
    return axios.get(API_URL_FIN + 'aspirantes/validacion', { headers: authHeader() })
  }

  historialPagos() {
    return axios.get(API_URL_FIN + 'pagos/historial', { headers: authHeader() })
  }

  cargarReferencias(file) {
    let formData = new FormData();
    formData.append("archivo", file);
    return axios.post(API_URL_FIN + 'cargarReferencias', formData, {
      headers: {
        ...authHeader(),
        'Content-Type': 'multipart/form-data'
      }
    });
  }

  cargarPagosExp(file) {
    let formData = new FormData();
    formData.append("archivo", file);
    return axios.post(API_URL_FIN + 'cargarPagosExp/fichas', formData, {
      headers: {
        ...authHeader(),
        'Content-Type': 'multipart/form-data'
      }
    });
  }

  cargarPagosExpInscripcion(file) {
    let formData = new FormData();
    formData.append("archivo", file);
    return axios.post(API_URL_FIN + 'cargarPagosExp/inscripcion', formData, {
      headers: {
        ...authHeader(),
        'Content-Type': 'multipart/form-data'
      }
    });
  }

  cargarPagosCursos(file) {
    let formData = new FormData();
    formData.append("archivo", file);
    return axios.post(API_URL_FIN + 'cargarPagosCursosPropedeuticos', formData, {
      headers: {
        ...authHeader(),
        'Content-Type': 'multipart/form-data'
      }
    });
  }

  listarAspirantesPago40() {
    return axios.get(API_URL_FIN + 'aspirantes/inscripcion', { headers: authHeader() })
  }

  listaPagosCursosPropedeutico() {
    return axios.get(API_URL_FIN + 'aspirantes/cursos', { headers: authHeader() })
  }

  verReferencia() {
    return axios.get(API_URL_FIN + 'aspirante/referencia', { headers: authHeader() });
  }

  verReferenciaCurso() {
    return axios.get(API_URL_FIN + 'aspirante/referencia/curso', { headers: authHeader() });
  }

  verReferenciaInscripcion() {
    return axios.get(API_URL_FIN + 'aspirante/referencia/inscripcion', { headers: authHeader() });
  }

  actualizarVerificarPago(matricula, nuevoEstado) {
    return axios.put(API_URL_FIN + `pagos/verificar/${matricula}`, nuevoEstado, {
      headers: {
        ...authHeader(),
        'Content-Type': 'text/plain'
      }
    });
  }

  verificarPagoCursoPropedeutico(matricula) {
    return axios.put(API_URL_FIN + `pagos/cursosPropedeutico/verificar/${matricula}`, {}, {
      headers: authHeader()
    });
  }


  verificarInscripcionYActualizarRol(matricula) {
    return axios.put(API_URL_FIN + `pagos/inscripcion/verificar/${matricula}`, {}, {
      headers: authHeader(),
    });
  }

  obtenerInfoAspirante(matricula) {
    return axios.get(API_URL_VINC + `aspirante/${matricula}`, { headers: authHeader() });
  }

  actualizarDatosAspirante(matricula, datosAspirante) {
    return axios.put(API_URL_VINC + `aspirante/${matricula}`, datosAspirante, { headers: authHeader() });
  }

  getGeneros() {
    return axios.get(API_CATA + 'generos', { headers: authHeader() });
  }

  getNacionalidades() {
    return axios.get(API_CATA + 'nacionalidades', { headers: authHeader() });
  }

  getEstados() {
    return axios.get(API_CATA + 'estados', { headers: authHeader() });
  }

  getSangre() {
    return axios.get(API_CATA + 'tiposangre', { headers: authHeader() });
  }

  getCarrera() {
    return axios.get(API_CATA + 'carreras', { headers: authHeader() });
  }

  getCarrerasActivas() {
    return axios.get(API_CATA + 'carreras/activas', { headers: authHeader() });
  }

  getCuotas() {
    return axios.get(API_CATA + 'cuotas', { headers: authHeader() });
  }

  getGrupos() {
    return axios.get(API_CATA + 'grupos', { headers: authHeader() });
  }

  getCuatrimestres() {

    return axios.get(API_CATA + 'cuatrimestres', { headers: authHeader() });
  }

  actualizarCuota(id_cuota, detallesCuota) {
    return axios.put(API_CATA + `actualizar/${id_cuota}`, detallesCuota, { headers: authHeader() });
  }

  listarCalificaciones() {
    return axios.get(API_URL_VINC + 'aspirantes/calificaciones')
  }

  actualizarCalificacion = (matricula, calificacionAspirante) => {
    return axios.put(API_URL_VINC + `aspirantes/calificaciones/${matricula}`, calificacionAspirante, { headers: authHeader() });
  };


  listarEstadisticasCalificados() {
    return axios.get(API_URL_SERVE + 'estadisticas/aspirantes/carrera')
  }

  listarEstadisticasMatriculasGeneradas() {
    return axios.get(API_URL_SERVE + 'estadisticas/aspirantes')
  }

  listarParaAsignacion() {
    return axios.get(API_URL_SERVE + 'asignacion/alumnos')
  }

  asignarGrupo(matricula, grupo) {
    return axios.put(API_URL_SERVE + `asignacion/grupo/${matricula}`, grupo, { headers: authHeader() });
  }

  actualizarEtapa4(matricula) {
    return axios.put(API_URL_VINC + `aspirante/aceptar/${matricula}`, {}, { headers: authHeader() });
  }

  listarAceptados() {
    return axios.get(API_URL_VINC + 'aspirantes/aceptados')
  }

  rechazarAspirante(matricula) {
    return axios.put(API_URL_VINC + `aspirante/rechazar/${matricula}`, {}, { headers: authHeader() });
  }

  listarEtapa1() {
    return axios.get(API_URL_VINC + 'aspirantes/pago_ficha')
  }

  verificarPagodeFicha(matricula, folio) {
    const body = {
      folio: folio
    };
    return axios.put(API_URL_VINC + `aspirante/pago_ficha/${matricula}`, body, { headers: authHeader() });
  }

  getAsignaturasPorCarreraYCuatrimestre(idCarrera, idCuatrimestre) {
    return axios.get(API_CATA + `asignaturas/filtrada?idCarrera=${idCarrera}&idCuatrimestre=${idCuatrimestre}`);
  }


  asignarMateria(request) {
    const url = `${API_DIR_ACAD}docente/asignar-materia`;
    return axios.post(url, request, { headers: authHeader() });
  }


}

export default new UserService();
