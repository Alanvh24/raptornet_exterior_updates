import axios from 'axios';
import authHeader from './auth-header';

const API_SERVES = 'http://localhost:8080/api/servicios_escolares/';

class ServiciosEscolaresService {

    obtenerAlummnos() {
        return axios.get(API_SERVES + 'alumnos', { headers: authHeader() });
    }

    obtenerTiraMateriasYCalificaciones(matricula) {
        return axios.get(API_SERVES + `asignaturas/alumno/${matricula}`, { headers: authHeader() });
    }

    avanzarCuatrimestre = () => {
        return axios.post(API_SERVES + 'avanzar-cuatrimestre');
    };

}

export default new ServiciosEscolaresService();