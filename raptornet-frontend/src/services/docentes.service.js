import axios from 'axios';
import authHeader from './auth-header';

const API_DOCENTES = 'http://localhost:8080/api/docentes/';

class DocentesService {

    obtenerCarrerasAsignadas() {
        return axios.get(API_DOCENTES + 'materias-asignadas', { headers: authHeader() });
    }

    crearActualizarUnidad(datosUnidad) {
        return axios.post(API_DOCENTES + 'crear-actualizar-unidad', datosUnidad, { headers: authHeader() });
    }

    crearActualizarPlaneacion(datosPlaneacion) {
        return axios.post(API_DOCENTES + "crear-planeacion", datosPlaneacion, { headers: authHeader() });
    }

    crearObjetivoAsignatura(datosObjetivo) {
        return axios.post(API_DOCENTES + "crear-objetivo", datosObjetivo, { headers: authHeader() });
    }

    crearHorarioClase(datosHorario) {
        return axios.post(API_DOCENTES + 'crear-horarios-clase', datosHorario, { headers: authHeader() });
    }

    crearFechaEvaluacion(datosFechaEvaluacion) {
        return axios.post(API_DOCENTES + 'crear-evaluacion-unidad', datosFechaEvaluacion, { headers: authHeader() });
    }

    crearProyecto(datosProyecto) {
        return axios.post(API_DOCENTES + 'crear-proyecto-asignatura', datosProyecto, { headers: authHeader() });
    }

    obtenerAlumnosPorCarreraCuatrimestreYGrupo(idCarrera, idCuatrimestre, idGrupo) {
        return axios.get(API_DOCENTES + 'lista-alumnos', {
            params: {
                idCarrera,
                idCuatrimestre,
                idGrupo
            },
            headers: authHeader()
        });
    }

    obtenerPorcentajeAsistencia(idUnidadesAsignatura, idGrupo, idAsignacionAsignatura) {
        return axios.get(API_DOCENTES + 'porcentaje-asistencia', {
            params: { idUnidadesAsignatura, idGrupo, idAsignacionAsignatura },
            headers: authHeader()
        });
    }

    obtenerFechasUnidad(idUnidadAsignatura, idGrupo, idAsignacionAsignatura) {
        return axios.get(API_DOCENTES + 'detalle-unidad', {
            params: { idUnidadAsignatura, idGrupo, idAsignacionAsignatura },
            headers: authHeader()
        });
    }


    registrarActualizarAsistencia(data) {
        return axios.post(API_DOCENTES + "registrar-asistencia", data, { headers: authHeader() });
    }

    obtenerAsistenciasPorUnidadAsignatura(idUnidadesAsignatura) {
        return axios.get(API_DOCENTES + 'obtener-asistencias', {
            params: { idUnidadesAsignatura },
            headers: authHeader()
        });
    }

    obtenerAlumnosConCalificaciones(idCarrera, idCuatrimestre, idGrupo) {
        return axios.get(API_DOCENTES + 'lista-alumnos-con-calificaciones', {
            params: {
                idCarrera,
                idCuatrimestre,
                idGrupo
            },
            headers: authHeader()
        });
    }

    registrarActualizarCalificacion = (calificacionData) => {
        return axios.post(API_DOCENTES + 'registrar-calificacion', calificacionData);
    };

    registrarCalificacionRecuperacion = (calificacionData) => {
        return axios.post(API_DOCENTES + 'registrar-calificacion-recuperacion', calificacionData);
    };

    obtenerCalificacionesFinales(matriculaAlumno, idAsignacionAsignatura) {
        return axios.get(API_DOCENTES + 'obtener-calificaciones-finales', {
            headers: authHeader(),
            params: {
                matriculaAlumno,
                idAsignacionAsignatura
            }

        });
    }

    obtenerCalificacionesPorAsignacionAsignatura(idAsignacionAsignatura) {
        return axios.get(API_DOCENTES + 'por-asignacion', {
            headers: authHeader(),
            params: { idAsignacionAsignatura }
        });
    }



    listaAsistenciasGeneral(idAsignatura, idGrupo, idAsignacionAsignatura) {
        return axios.get(API_DOCENTES + 'lista-asistencias-general', {
            params: {
                idAsignatura,
                idGrupo,
                idAsignacionAsignatura
            },
            headers: authHeader()
        });
    }

    firmarAsistenciasCursos(matricula) {
        return axios.put(API_DOCENTES + `cursos/firmarCalificacion/${matricula}`, {}, { headers: authHeader() });
    }

    firmarCalificacionFinal(idCalificacion) {
        return axios.put(API_DOCENTES + `firmar/calificacion-final/${idCalificacion}`, {}, { headers: authHeader() });
    }

    listaAlumnosRemedial(idAsignacionAsignatura) {
        return axios.get(API_DOCENTES + 'alumnos-remedial', {
            params: { idAsignacionAsignatura },
            headers: authHeader()
        });
    }

    firmarCalificacionRemedial(idCalificacion) {
        return axios.put(API_DOCENTES + `firmar/calificacion-remedial/${idCalificacion}`, { headers: authHeader() })
    }

    actualizarCalificacionRemedial(matriculaAlumno, idAsignacionAsignatura, calificacionRemedial) {
        return axios.put(API_DOCENTES + 'calificaciones/remedial', { matriculaAlumno, idAsignacionAsignatura, calificacionRemedial }, { headers: authHeader() });
    }

}

export default new DocentesService();