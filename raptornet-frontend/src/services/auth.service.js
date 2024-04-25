import axios from "axios";
import authHeader from "./auth-header";

const API_URL = "http://localhost:8080/api/auth/";

class AuthService {
  login(matricula, password) {
    return axios
      .post(API_URL + "signin", {
        matricula,
        password
      })
      .then(response => {
        if (response.data.accessToken) {
          localStorage.setItem("user", JSON.stringify(response.data));
        }

        return response.data;
      });
  }

  logout() {
    localStorage.removeItem("user");
  }

  register(email, curp, password) {
    return axios.post(API_URL + "signup", {
      email,
      curp,
      password
    }, {
      headers: authHeader()
    });
  }

  registerauth(matricula, email, password, nombre, apPaterno, apMaterno, roles) {
    return axios.post(API_URL + "signupAuthority", {
      matricula,
      email,
      password,
      nombre,
      apPaterno,
      apMaterno,
      role: roles
    }, {
      headers: authHeader()
    });
  }

  perfil(ap_paterno, ap_materno, nombre, curp, fecha_nacimiento, edad, id_genero, email, numero_telefonico,
    id_nacionalidad, id_estado_mexico, municipio_nacimiento, localidad_nacimiento, habla_indigena, lengua_indigena,
    tiene_discapacidad, discapacidad, id_tipo_sangre, tiene_alergias, alergias,
    nombre_contacto_e, telefono_contacto_e, email_contacto_e, parentesco_contacto_e,
    nombre_bachillerato, promedio_bachillerato, periodo_bachillerato, id_carrera_1, id_carrera_2, asp_etapa,
    id_cuota, fecha_registro) {
    return axios.put(API_URL + "perfil", {
      ap_paterno,
      ap_materno,
      nombre,
      curp,
      fecha_nacimiento,
      edad,
      id_genero,
      email,
      numero_telefonico,
      id_nacionalidad,
      id_estado_mexico,
      municipio_nacimiento,
      localidad_nacimiento,
      habla_indigena,
      lengua_indigena,
      tiene_discapacidad,
      discapacidad,
      id_tipo_sangre,
      tiene_alergias,
      alergias,
      nombre_contacto_e,
      telefono_contacto_e,
      email_contacto_e,
      parentesco_contacto_e,
      nombre_bachillerato,
      promedio_bachillerato,
      periodo_bachillerato,
      id_carrera_1,
      id_carrera_2,
      asp_etapa,
      id_cuota,
      fecha_registro
    }, {
      headers: authHeader()
    });
  }

  getCurrentUser() {
    return JSON.parse(localStorage.getItem('user'));;
  }


  resetPassword(matricula, newPassword) {
    const url = `${API_URL}resetPassword?matricula=${encodeURIComponent(matricula)}&newPassword=${encodeURIComponent(newPassword)}`;
    return axios.post(url, {}, {
      headers: authHeader()
    });
  }


}

export default new AuthService();
