import axios from 'axios';
import authHeader from './auth-header';

const API_DOCENTES = 'http://localhost:8080/api/academia/';

class DireccionAcademicaService {

    obtenerMateriasAsignadasDocente(matriculaDocente) {
        return axios.get(API_DOCENTES + `materias-asignadas/${matriculaDocente}`,
            { headers: authHeader() });
    }

}

export default new DireccionAcademicaService();