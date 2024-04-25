import axios from "axios";

const API_ADMIN = 'http://localhost:8080/api/admin/';

class AdminService {

    listarRegistros() {
        return axios.get(API_ADMIN + 'registros')
    }

}

export default new AdminService();
