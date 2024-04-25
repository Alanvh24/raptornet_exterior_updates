import React, { Component } from "react";
import "../Perfil.css";
import userService from "../services/user.service";
import authService from "../services/auth.service";
import { Document, PDFDownloadLink, Page, StyleSheet, Text, View } from "@react-pdf/renderer";
import { withRouter } from '../common/with-router';
import { Navigate } from "react-router-dom";
import Swal from "sweetalert2";

// Estilos para el PDF
const styles = StyleSheet.create({
  page: {
    flexDirection: 'row',
    backgroundColor: '#E4E4E4',
    padding: 10,
  },
  section: {
    margin: 10,
    padding: 10,
    flexGrow: 1,
  },
});

// Componente del documento PDF
const MyDocument = ({ matricula, nombre }) => {
  const fechaLimite = new Date();
  fechaLimite.setDate(fechaLimite.getDate() + 30); // Añade 30 días a la fecha actual

  return (
    <Document>
      <Page size="A4" style={styles.page}>
        <View style={styles.section}>
          <Text>Matrícula: {matricula}</Text>
          <Text>Nombre: {nombre}</Text>
          <Text>Fecha Límite de Pago: {fechaLimite.toLocaleDateString()}</Text>
        </View>
      </Page>
    </Document>
  );
};


class CompletarPerfil extends Component {

  // handleChange = (event) => {
  //   const { name, value } = event.target;
  //   this.validateField(name, value);
  //   this.setState({
  //     [name]: value
  //   });
  // };  

  // Función para calcular la edad a partir de la fecha de nacimiento
  calculateAge = (dob) => {
    const birthday = new Date(dob);
    const today = new Date();
    let age = today.getFullYear() - birthday.getFullYear();
    const m = today.getMonth() - birthday.getMonth();

    if (m < 0 || (m === 0 && today.getDate() < birthday.getDate())) {
      age--;
    }

    return age;
  };

  handleChange = (event) => {
    const { name, value } = event.target;

    if (name === 'curp' && value.length > 18) {
      return;
    }


    if (name === 'numero_telefonico' && value.length > 10) {
      return;
    }

    if (name === 'telefono_contacto_e' && value.length > 10) {
      return;
    }

    // Actualiza el estado según el nombre del campo
    this.setState(
      { [name]: value },
      () => {
        // Filtra las opciones para la segunda carrera basándote en la selección de la primera
        const opcionesCarrera2 = this.state.opcionesCarrera.filter(opcion => opcion.id !== parseInt(this.state.id_carrera_1, 10));

        if (name === 'fecha_nacimiento') {
          const calculatedAge = this.calculateAge(value);
          this.setState({ edad: calculatedAge });
        }

        this.setState({ opcionesCarrera2 });
      }
    );

    // Resto de la lógica de validación si es necesario
    this.validateField(name, value);
  };



  componentDidMount() {

    const user = authService.getCurrentUser();
    const etapasCompletadas = ['1', '2', '3', '4', '5'];
    let redirectPath = '/completo';
    userService.perfilUsuario().then(response => {

      if (user && etapasCompletadas.includes(user.asp_etapa)) {
        this.props.router.navigate(redirectPath);
      }

      this.setState({
        matricula: response.data.matricula,
        nombre: response.data.nombre,
        ap_paterno: response.data.ap_paterno,
        ap_materno: response.data.ap_materno,
        curp: response.data.curp,
        fecha_nacimiento: response.data.fecha_nacimiento,
        edad: response.data.edad,
        id_genero: response.data.id_genero,
        email: response.data.email,
        numero_telefonico: response.data.numero_telefonico,
        id_nacionalidad: response.data.id_nacionalidad,
        id_estado_mexico: response.data.id_estado_mexico,
        municipio_nacimiento: response.data.municipio_nacimiento,
        localidad_nacimiento: response.data.localidad_nacimiento,
        habla_indigena: response.data.habla_indigena,
        lengua_indigena: response.data.lengua_indigena,
        tiene_discapacidad: response.data.tiene_discapacidad,
        discapacidad: response.data.discapacidad,
        id_tipo_sangre: response.data.id_tipo_sangre,
        tiene_alergias: response.data.tiene_alergias,
        alergias: response.data.alergias,
        nombre_contacto_e: response.data.nombre_contacto_e,
        telefono_contacto_e: response.data.telefono_contacto_e,
        email_contacto_e: response.data.email_contacto_e,
        parentesco_contacto_e: response.data.parentesco_contacto_e,
        nombre_bachillerato: response.data.nombre_bachillerato,
        periodo_bachillerato: response.data.periodo_bachillerato,
        promedio_bachillerato: response.data.promedio_bachillerato,
        id_carrera_1: response.data.id_carrera_1,
        id_carrera_2: response.data.id_carrera_2,
        asp_etapa: response.data.asp_etapa,
        id_cuota: response.data.id_cuota,
        fecha_registro: response.data.fecha_registro

      });

    }).catch(error => {
      // Manejo de errores, por ejemplo, si el usuario no está autenticado o no se encontraron los datos
      console.error("Hubo un error al obtener el perfil del usuario: ", error);
    });
  }

  updateProfile = (callback) => {
    // Obtener los valores actuales del estado
    const { nombre, ap_paterno, ap_materno, curp,
      fecha_nacimiento, edad,
      id_genero, email, numero_telefonico,
      id_nacionalidad, id_estado_mexico,
      municipio_nacimiento, localidad_nacimiento,
      habla_indigena, lengua_indigena, tiene_discapacidad, discapacidad,
      id_tipo_sangre,
      tiene_alergias, alergias, nombre_contacto_e,
      telefono_contacto_e,
      email_contacto_e,
      parentesco_contacto_e,
      nombre_bachillerato,
      periodo_bachillerato,
      promedio_bachillerato,
      id_carrera_1,
      id_carrera_2,
      asp_etapa,
      id_cuota,
      fecha_registro } = this.state;

    authService.perfil(ap_paterno, ap_materno, nombre, curp,
      fecha_nacimiento,
      edad, id_genero, email,
      numero_telefonico, id_nacionalidad,
      id_estado_mexico, municipio_nacimiento,
      localidad_nacimiento, habla_indigena, lengua_indigena,
      tiene_discapacidad, discapacidad, id_tipo_sangre, tiene_alergias, alergias,
      nombre_contacto_e, telefono_contacto_e, email_contacto_e, parentesco_contacto_e,
      nombre_bachillerato, periodo_bachillerato, promedio_bachillerato, id_carrera_1, id_carrera_2,
      asp_etapa, id_cuota, fecha_registro)
      .then(response => {

        Swal.fire({
          title: '¡Éxito!',
          text: response.data.message,
          icon: 'success',
          toast: true,
          position: 'bottom-right',
          showConfirmButton: false,
          timer: 3000, // El mensaje desaparecerá después de 3 segundos
          timerProgressBar: true,
        });

        if (callback) callback();

      })
      .catch(error => {
        // Muestra un mensaje de error
        let errorMessage = "Hubo un error al actualizar el perfil.";
        if (error.response && error.response.data) {
          // Aquí puedes personalizar tu mensaje de error en base a la respuesta del backend
          errorMessage = error.response.data.message || errorMessage;
        }
        Swal.fire({
          title: 'Error',
          text: errorMessage,
          icon: 'error',
          toast: true,
          position: 'bottom-right',
          showConfirmButton: false,
          timer: 3000,
          timerProgressBar: true,
        });
      });
  };



  // Inicializa el estado
  state = {

    currentStep: 0,
    nombre: '',
    ap_paterno: '',
    ap_materno: '',
    curp: '',
    fecha_nacimiento: '',
    edad: '',
    id_genero: '',
    email: '',
    numero_telefonico: '',
    id_nacionalidad: '',
    id_estado_mexico: '',
    municipio_nacimiento: '',
    localidad_nacimiento: '',
    habla_indigena: '',
    lengua_indigena: '',
    tiene_discapacidad: '',
    discapacidad: '',
    id_tipo_sangre: '',
    tiene_alergias: '',
    alergias: '',
    nombre_contacto_e: '',
    telefono_contacto_e: '',
    email_contacto_e: '',
    parentesco_contacto_e: '',
    nombre_bachillerato: '',
    periodo_bachillerato: '',
    promedio_bachillerato: '',
    id_carrera_1: '',
    id_carrera_2: '',
    asp_etapa: '',
    id_cuota: '',
    opcionesCarrera: [
      { id: 1, nombre: 'T.S.U. en Agrobiotecnología' },
      { id: 3, nombre: 'T.S.U. en Turismo' },
      { id: 4, nombre: 'T.S.U. en Gastronomía' },
      { id: 5, nombre: 'T.S.U. en Administración, Área Capital Humano' },
      { id: 9, nombre: 'T.S.U. en Construcción' },
      { id: 12, nombre: 'T.S.U. Tecnologías de la Información y Comunicación Área Entornos Virtuales y Negocios Digitales' },
    ],
    opcionesCarrera2: [],
    errors: {
      nombre: '',
      ap_paterno: '',
      ap_materno: '',
      curp: '',
      fecha_nacimiento: '',
      edad: '',
      id_genero: '',
      email: '',
      numero_telefonico: '',
      id_nacionalidad: '',
      id_estado_mexico: '',
      municipio_nacimiento: '',
      localidad_nacimiento: '',
      habla_indigena: '',
      lengua_indigena: '',
      tiene_discapacidad: '',
      discapacidad: '',
      id_tipo_sangre: '',
      tiene_alergias: '',
      alergias: '',
      nombre_contacto_e: '',
      telefono_contacto_e: '',
      email_contacto_e: '',
      parentesco_contacto_e: '',
      nombre_bachillerato: '',
      periodo_bachillerato: '',
      promedio_bachillerato: '',
      id_carrera_1: '',
      id_carrera_2: '',
    },
  };

  validateField = (name, value) => {
    let errors = this.state.errors;
    switch (name) {

      case 'nombre':
        errors.nombre =
          value.length === 0
            ? 'El campo nombre es requerido!'
            : '';
        break;

      case 'ap_paterno':
        errors.ap_paterno =
          value.length === 0
            ? 'El campo apellido paterno es requerido!'
            : '';
        break;
      case 'ap_materno':
        errors.ap_materno =
          value.length === 0
            ? 'El campo apellido materno es requerido!'
            : '';
        break;
      case 'curp':
        errors.curp =
          value.length === 0
            ? 'El campo CURP es requerido!'
            : '';
        break;

      case 'fecha_nacimiento':
        errors.fecha_nacimiento =
          value.length === 0
            ? 'El campo Fecha Nacimiento es requerida!'
            : '';
        break;

      case 'edad':
        errors.edad =
          value.length === 0
            ? 'El campo Edad es requerido!'
            : '';
        break;

      case 'id_genero':
        errors.id_genero =
          value === '' || value === 'Selecciona un género'
            ? 'El campo Género es requerido!'
            : '';
        break;


      case 'email':
        errors.email =
          value.match(/^([\w.%+-]+)@([\w-]+\.)+([\w]{2,})$/i)
            ? ''
            : 'El correo electrónico no es válido';
        break;

      case 'numero_telefonico':
        errors.numero_telefonico =
          value.length === 0
            ? 'El campo Numero telefonico es requerido!'
            : '';
        break;

      case 'id_nacionalidad':
        errors.id_nacionalidad =
          value.length === 0
            ? 'El campo es requerido!'
            : '';
        break;

      case 'id_estado_mexico':
        errors.id_estado_mexico =
          value.length === 0
            ? 'El campo Estado de Nacimiento es requerido!'
            : '';
        break;

      case 'municipio_nacimiento':
        errors.municipio_nacimiento =
          value.length === 0
            ? 'El campo Municipio de Nacimiento es requerido!'
            : '';
        break;
      case 'localidad_nacimiento':
        errors.localidad_nacimiento =
          value.length === 0
            ? 'El campo Localidad de Nacimiento es requerido!'
            : '';
        break;

      case 'habla_indigena':
        errors.habla_indigena =
          value.length === 0
            ? 'El campo es requerido!'
            : '';
        break;


      case 'tiene_discapacidad':
        errors.tiene_discapacidad =
          value.length === 0
            ? 'El campo es requerido!'
            : '';
        break;

      case 'id_tipo_sangre':
        errors.id_tipo_sangre =
          value.length === 0
            ? 'El campo es requerido!'
            : '';
        break;

      case 'nombre_contacto_e':
        errors.nombre_contacto_e =
          value.length === 0
            ? 'El campo es requerido!'
            : '';
        break;

      case 'telefono_contacto_e':
        errors.telefono_contacto_e =
          value.length === 0
            ? 'El campo es requerido!'
            : '';
        break;


      case 'email_contacto_e':
        errors.email_contacto_e =
          value.length === 0
            ? 'El campo es requerido! o escriba N/A'
            : '';
        break;

      case 'parentesco_contacto_e':
        errors.parentesco_contacto_e =
          value.length === 0
            ? 'El campo es requerido!'
            : '';
        break;

      case 'nombre_bachillerato':
        errors.nombre_bachillerato =
          value.length === 0
            ? 'El campo es requerido!'
            : '';
        break;


      case 'periodo_bachillerato':
        errors.periodo_bachillerato =
          value.length === 0
            ? 'El campo es requerido!'
            : '';
        break;


      case 'promedio_bachillerato':
        errors.promedio_bachillerato =
          value.match(/^\d+(\.\d{1,2})?$/)
            ? ''
            : 'El promedio debe ser un número (puede tener hasta dos decimales)';
        break;


      case 'id_carrera_1':
        errors.id_carrera_1 =
          value.length === 0
            ? 'El campo es requerido!'
            : '';
        break;


      case 'id_carrera_2':
        errors.id_carrera_2 =
          value.length === 0
            ? 'El campo es requerido!'
            : '';
        break;


      default:
        break;
    }

    this.setState({ errors, [name]: value });
  };


  // Avanza al siguiente paso
  nextStep = () => {
    const { currentStep, errors } = this.state;
    const stepsFields = {
      0: ['nombre', 'ap_paterno', 'ap_materno', 'curp', 'fecha_nacimiento', 'edad',
        'id_genero', 'email', 'numero_telefonico', 'id_estado_mexico', 'municipio_nacimiento',
        'localidad_nacimiento'],
      1: ['habla_indigena', 'tiene_discapacidad'],
      2: ['id_tipo_sangre', 'tiene_alergias'],
      3: ['nombre_contacto_e', 'telefono_contacto_e', 'parentesco_contacto_e'],
      4: ['nombre_bachillerato', 'periodo_bachillerato', 'promedio_bachillerato', 'id_carrera_1', 'id_carrera_2']

    };
    const fieldsToCheck = stepsFields[currentStep] || [];
    let hasError = false;
    let newErrors = { ...errors };

    fieldsToCheck.forEach(field => {
      const fieldValue = this.state[field];
      if (fieldValue === null || fieldValue === undefined || (typeof fieldValue === 'string' && fieldValue.trim() === '')) {
        newErrors[field] = 'El campo es requerido!';
        hasError = true;
      } else {
        newErrors[field] = '';
      }
    });

    if (hasError) {
      this.setState({ errors: newErrors });
    } else {
      // Si no hay errores, intenta actualizar el perfil
      this.updateProfile(() => {
        // Si la actualización es exitosa, avanza al siguiente paso
        this.setState(prevState => ({
          currentStep: prevState.currentStep + 1,
          errors: newErrors
        }));
      });
    }
  };



  // Regresa al paso anterior
  prevStep = () => {
    this.setState((prevState) => ({
      currentStep: prevState.currentStep - 1,
      id_carrera_1: '',
      id_carrera_2: ''
    }));
  };

  saveProfile = () => {
    // Establece los valores de 'asp_etapa' y 'nombre'
    const fechaActual = new Date().toISOString().split('T')[0];
    this.setState(
      { asp_etapa: '1', id_cuota: '5', fecha_registro: fechaActual },
      () => {
        // Una vez actualizado el estado, llama a updateProfile
        this.updateProfile(() => {
          // Muestra un mensaje de éxito con SweetAlert2
          Swal.fire({
            title: '¡Datos Guardados!',
            text: 'Datos guardados correctamente',
            icon: 'success',
            confirmButtonText: 'Aceptar'
          }).then(() => {
            let redirectPath = "/completo";
            this.props.router.navigate(redirectPath);
          });
        });
      }
    );
  };


  confirmSave = () => {
    const { id_carrera_1, id_carrera_2 } = this.state;

    // Verifica si se han seleccionado ambas opciones de carrera
    if (!id_carrera_1 || !id_carrera_2) {
      Swal.fire({
        title: 'Atención',
        text: "Por favor, selecciona la primera y la segunda opción de carrera antes de guardar.",
        icon: 'warning',
        confirmButtonText: 'Aceptar'
      });
      return;
    }

    // Pedir confirmación antes de guardar
    Swal.fire({
      title: '¿Estás seguro?',
      text: "¿Quieres guardar tus datos? Tu sesión expirará y no podrás modificar los datos nuevamente.",
      icon: 'question',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí, guardar',
      cancelButtonText: 'No, cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        // Muestra el SweetAlert2 de carga
        Swal.fire({
          title: 'Guardando...',
          text: 'Por favor, espera un momento.',
          allowEscapeKey: false,
          allowOutsideClick: false,
          didOpen: () => {
            Swal.showLoading();
          }
        });

        // Espera 2 segundos antes de ejecutar saveProfile
        setTimeout(() => {
          this.saveProfile();
          Swal.close(); // Cierra el SweetAlert2 de carga
        }, 2000);
      }
    });
  }




  logout = () => {
    let redirectPath = "/login"
    localStorage.removeItem("user");
    this.props.router.navigate(redirectPath);
  };


  // Renderiza el contenido del paso actual
  renderStepContent = () => {
    switch (this.state.currentStep) {
      case 0:
        return <div className="main active">
          <small>
            <i className="fa fa-home text-dark" />
          </small>
          <p>Bienvenido/a, {this.state.matricula}</p>
          <div className="text">
            <p className="anuncio_obligatorio">
              Todos los campos son obligatorios, en caso de faltar información no sera válido el registro de aspirante y no se generará tu matricula.
            </p>
            <h2>Información Personal</h2>
            <p>Ingresa tu información personal</p>
          </div>
          <div className="input-text">
            <div className="input-div">
              <input
                type="text"
                className={`form-control ${this.state.errors.nombre ? 'error-border' : ''} mayus-text`}
                name="nombre"
                value={this.state.nombre || ''}
                onChange={this.handleChange}

              />
              <span>Nombre</span>
              {this.state.errors.nombre && (
                <div className="error-message">
                  {this.state.errors.nombre}
                </div>
              )}
            </div>

            <div className="input-div">
              <input
                type="text"
                className={`form-control ${this.state.errors.ap_paterno ? 'error-border' : ''} mayus-text`}
                name="ap_paterno"
                value={this.state.ap_paterno || ''}
                onChange={this.handleChange}

              />
              <span>Apellido Paterno</span>
              {this.state.errors.ap_paterno && (
                <div className="error-message">
                  {this.state.errors.ap_paterno}
                </div>
              )}

            </div>

            <div className="input-div">
              <input
                type="text"
                className={`form-control ${this.state.errors.ap_materno ? 'error-border' : ''} mayus-text`}
                name="ap_materno"
                value={this.state.ap_materno || ''}
                onChange={this.handleChange}
              />
              <span>Apellido Materno</span>
              {this.state.errors.ap_materno && (
                <div className="error-message">
                  {this.state.errors.ap_materno}
                </div>
              )}
            </div>

          </div>

          <div className="input-text">
            <div className="input-div">
              <input
                type="text"
                className={`form-control ${this.state.errors.curp ? 'error-border' : ''} mayus-text`}
                name="curp"
                value={this.state.curp || ''}
                onChange={this.handleChange}

              />
              <span>CURP (Modifica SOLO SI ES NECESARIO)</span>
              {this.state.errors.curp && (
                <div className="error-message">
                  {this.state.errors.curp}
                </div>
              )}
            </div>
          </div>

          <div className="input-text">
            <div className="input-div">
              <input
                type="date"
                className={`form-control ${this.state.errors.fecha_nacimiento ? 'error-border' : ''} mayus-text`}
                name="fecha_nacimiento"
                value={this.state.fecha_nacimiento || ''}
                onChange={this.handleChange}

              />
              <span>Fecha de Nacimiento</span>
              {this.state.errors.fecha_nacimiento && (
                <div className="error-message">
                  {this.state.errors.fecha_nacimiento}
                </div>
              )}
            </div>

            <div className="input-div">
              <input
                type="number"
                className={`form-control ${this.state.errors.edad ? 'error-border' : ''} mayus-text`}
                name="edad"
                value={this.state.edad || ''}
                onChange={this.handleChange}

              />
              <span>Edad</span>
              {this.state.errors.edad && (
                <div className="error-message">
                  {this.state.errors.edad}
                </div>
              )}

            </div>

            <div className="input-div">

              <select
                type="text"
                className={`form-control ${this.state.errors.id_genero ? 'error-border' : ''} mayus-text`}
                name="id_genero"
                value={this.state.id_genero || ''}
                onChange={this.handleChange}
              >
                <option value="">Género</option>
                <option value="1">Masculino</option>
                <option value="2">Femenino</option>
              </select>

              {this.state.errors.id_genero && (
                <div className="error-message">
                  {this.state.errors.id_genero}
                </div>
              )}
              {/* <span>Género</span> */}
            </div>

          </div>

          <div className="input-text">
            <div className="input-div">
              <input
                type="text"
                className={`form-control ${this.state.errors.email ? 'error-border' : ''}`}
                name="email"
                value={this.state.email || ''}
                onChange={this.handleChange}

              />
              <span>Email</span>
              {this.state.errors.email && (
                <div className="error-message">
                  {this.state.errors.email}
                </div>
              )}
            </div>

            <div className="input-div">
              <input
                type="number"
                className={`form-control ${this.state.errors.numero_telefonico ? 'error-border' : ''} mayus-text`}
                name="numero_telefonico"
                value={this.state.numero_telefonico || ''}
                onChange={this.handleChange}

              />
              <span>Número Telefónico</span>
              {this.state.errors.numero_telefonico && (
                <div className="error-message">
                  {this.state.errors.numero_telefonico}
                </div>
              )}

            </div>

            <div className="input-div">

              <select
                type="text"
                className={`form-control ${this.state.errors.id_nacionalidad ? 'error-border' : ''} mayus-text`}
                name="id_nacionalidad"
                value={this.state.id_nacionalidad || ''}
                onChange={this.handleChange}

              >
                <option value="">Nacionalidad</option>
                <option value="1">Mexicano/a</option>
                <option value="2">Extranjero/a</option>
              </select>

              {this.state.errors.id_nacionalidad && (
                <div className="error-message">
                  {this.state.errors.id_nacionalidad}
                </div>
              )}
            </div>

          </div>

          <div className="input-text">
            <div className="input-div">
              <select
                type="text"
                className={`form-control ${this.state.errors.id_estado_mexico ? 'error-border' : ''} mayus-text`}
                name="id_estado_mexico"
                value={this.state.id_estado_mexico || ''}
                onChange={this.handleChange}

              >
                <option value="">Estado de Nacimiento</option>
                <option value="1">Aguascalientes</option>
                <option value="2">Baja California</option>
                <option value="3">Baja California Sur</option>
                <option value="4">Campeche</option>
                <option value="5">Coahuila de Zaragoza</option>
                <option value="6">Colima</option>
                <option value="7">Chiapas</option>
                <option value="8">Chihuahua</option>
                <option value="9">Distrito Federal</option>
                <option value="10">Durango</option>
                <option value="11">Guanajuato</option>
                <option value="12">Guerrero</option>
                <option value="13">Hidalgo</option>
                <option value="14">Jalisco</option>
                <option value="15">México</option>
                <option value="16">Michoacán de Ocampo</option>
                <option value="17">Morelos</option>
                <option value="18">Nayarit</option>
                <option value="19">Nuevo León</option>
                <option value="20">Oaxaca de Juárez</option>
                <option value="21">Puebla</option>
                <option value="22">Querétaro</option>
                <option value="23">Quintana Roo</option>
                <option value="24">San Luis Potosí</option>
                <option value="25">Sinaloa</option>
                <option value="26">Sonora</option>
                <option value="27">Tabasco</option>
                <option value="28">Tamaulipas</option>
                <option value="29">Tlaxcala</option>
                <option value="30">Veracruz</option>
                <option value="31">Yucatán</option>
                <option value="32">Zacatecas</option>
                <option value="33">Otro</option>

              </select>

              {this.state.errors.id_estado_mexico && (
                <div className="error-message">
                  {this.state.errors.id_estado_mexico}
                </div>
              )}
            </div>

            <div className="input-div">
              <input
                type="text"
                className={`form-control ${this.state.errors.municipio_nacimiento ? 'error-border' : ''} mayus-text`}
                name="municipio_nacimiento"
                value={this.state.municipio_nacimiento || ''}
                onChange={this.handleChange}

              />
              <span>Municipio de Nacimiento</span>
              {this.state.errors.municipio_nacimiento && (
                <div className="error-message">
                  {this.state.errors.municipio_nacimiento}
                </div>
              )}

            </div>

            <div className="input-div">
              <input
                type="text"
                className={`form-control ${this.state.errors.localidad_nacimiento ? 'error-border' : ''} mayus-text`}
                name="localidad_nacimiento"
                value={this.state.localidad_nacimiento || ''}
                onChange={this.handleChange}

              />
              <span>Localidad de Nacimiento</span>
              {this.state.errors.localidad_nacimiento && (
                <div className="error-message">
                  {this.state.errors.localidad_nacimiento}
                </div>
              )}
            </div>

          </div>

          <div className="buttons">
            <button className="next_button btn custom-btn-perfil" onClick={this.nextStep}>Siguiente</button>
          </div>
        </div>;
      case 1:
        return <div className="main active">
          <small>
            <i className="fa fa-clipboard text-dark" />
          </small>
          <p>Bienvenido/a, {this.state.matricula}</p>
          <div className="text">

            <h2>Datos Generales</h2>
            <p>Ingresa tus datos generales</p>
          </div>

          <div className="input-text">

            <div className="input-div">
              <p className="span_custom">¿Hablas alguna lengua indígena?</p>
              <label className="radio-btn">
                <input
                  type="radio"
                  name="habla_indigena"
                  value="si"
                  checked={this.state.habla_indigena === 'si'}
                  onChange={this.handleChange}
                />
                Sí
              </label>

              <label className="radio-btn">
                <input
                  type="radio"
                  name="habla_indigena"
                  value="no"
                  checked={this.state.habla_indigena === 'no'}
                  onChange={this.handleChange}
                />
                No
              </label>
            </div>

            {this.state.habla_indigena === 'si' && (
              <div className="input-div">
                <input
                  type="text"
                  className={`form-control ${this.state.errors.lengua_indigena ? 'error-border' : ''} mayus-text`}
                  name="lengua_indigena"
                  value={this.state.lengua_indigena || ''}
                  onChange={this.handleChange}
                />
                <span>Especifíca cuál</span>
              </div>
            )}
          </div>

          <div className="input-text">

            <div className="input-div">
              <p className="span_custom">¿Tienes alguna discapacidad?</p>
              <label className="radio-btn">
                <input
                  type="radio"
                  name="tiene_discapacidad"
                  value="si"
                  checked={this.state.tiene_discapacidad === 'si'}
                  onChange={this.handleChange}
                />
                Sí
              </label>

              <label className="radio-btn">
                <input
                  type="radio"
                  name="tiene_discapacidad"
                  value="no"
                  checked={this.state.tiene_discapacidad === 'no'}
                  onChange={this.handleChange}
                />
                No
              </label>
            </div>

            {this.state.tiene_discapacidad === 'si' && (
              <div className="input-div">
                <input
                  type="text"
                  className={`form-control ${this.state.errors.discapacidad ? 'error-border' : ''} mayus-text`}
                  name="discapacidad"
                  value={this.state.discapacidad || ''}
                  onChange={this.handleChange}
                />
                <span>Especifíca cuál</span>
              </div>
            )}
          </div>

          <div className="buttons">
            <button className="back_button custom-btn-perfil-back" onClick={this.prevStep}>Regresar</button>
            <button className="next_button custom-btn-perfil" onClick={this.nextStep}>Siguiente</button>
          </div>
        </div>;

      case 2:
        return <div className="main active">
          <small>
            <i className="fa fa-house-medical text-dark" />
          </small>
          <p>Bienvenido/a, {this.state.matricula}</p>
          <div className="text">
            <h2>Información Médica</h2>
            <p>Ingresa tu información médica</p>
          </div>

          <div className="input-text">
            <select
              type="text"
              className={`form-control ${this.state.errors.id_tipo_sangre ? 'error-border' : ''} mayus-text`}
              name="id_tipo_sangre"
              value={this.state.id_tipo_sangre || ''}
              onChange={this.handleChange}

            >
              <option value="">Selecciona un Tipo de Sangre</option>
              <option value="1">A+</option>
              <option value="2">A-</option>
              <option value="3">B+</option>
              <option value="4">B-</option>
              <option value="5">AB+</option>
              <option value="6">AB-</option>
              <option value="7">O+</option>
              <option value="8">O-</option>
            </select>

            {this.state.errors.id_tipo_sangre && (
              <div className="error-message">
                {this.state.errors.id_tipo_sangre}
              </div>
            )}

          </div>

          <div className="input-text">

            <div className="input-div">
              <p className="span_custom">¿Alergias?</p>
              <label className="radio-btn">
                <input
                  type="radio"
                  name="tiene_alergias"
                  value="si"
                  checked={this.state.tiene_alergias === 'si'}
                  onChange={this.handleChange}
                />
                Sí
              </label>

              <label className="radio-btn">
                <input
                  type="radio"
                  name="tiene_alergias"
                  value="no"
                  checked={this.state.tiene_alergias === 'no'}
                  onChange={this.handleChange}
                />
                No
              </label>
            </div>

            {this.state.tiene_alergias === 'si' && (
              <div className="input-div">
                <input
                  type="text"
                  className={`form-control ${this.state.errors.alergias ? 'error-border' : ''} mayus-text`}
                  name="alergias"
                  value={this.state.alergias || ''}
                  onChange={this.handleChange}
                />
                <span>Especifíca cuál</span>
              </div>
            )}
          </div>
          <div className="buttons">
            <button className="back_button btn custom-btn-perfil-back" onClick={this.prevStep}>Regresar</button>
            <button className="next_button btn custom-btn-perfil" onClick={this.nextStep}>Siguiente</button>
          </div>
        </div>;

      case 3:
        return <div className="main active">
          <small>
            <i className="fa fa-phone text-dark" />
          </small>
          <p>Bienvenido/a, {this.state.matricula}</p>
          <div className="text">
            <h2>Contacto de Emergencia</h2>
            <p>Ingresa la información de un contacto en caso de Emergencia</p>
          </div>
          <div className="input-text">
            <div className="input-div">
              <input
                type="text"
                className="form-control mayus-text"
                name="nombre_contacto_e"
                value={this.state.nombre_contacto_e || ''}
                onChange={this.handleChange}
              />
              <span>Nombre completo de contacto de Emergencia (Ej. Juan López Pérez)</span>

              {this.state.errors.nombre_contacto_e && (
                <div className="error-message">
                  {this.state.errors.nombre_contacto_e}
                </div>
              )}
            </div>

            <div className="input-div">
              <input
                type="number"
                className="form-control mayus-text"
                name="telefono_contacto_e"
                value={this.state.telefono_contacto_e || ''}
                onChange={this.handleChange}
              />
              <span>Teléfono de contacto de Emergencia</span>

              {this.state.errors.telefono_contacto_e && (
                <div className="error-message">
                  {this.state.errors.telefono_contacto_e}
                </div>
              )}
            </div>
          </div>

          <div className="input-text">
            <div className="input-div">
              <input
                type="text"
                className="form-control"
                name="email_contacto_e"
                value={this.state.email_contacto_e || ''}
                onChange={this.handleChange}
              />
              <span>Correo electrónico de contacto de Emergencia (En caso de no tener, escriba N/A)</span>

              {this.state.errors.email_contacto_e && (
                <div className="error-message">
                  {this.state.errors.email_contacto_e}
                </div>
              )}
            </div>

            <div className="input-div">
              <input
                type="text"
                className="form-control mayus-text"
                name="parentesco_contacto_e"
                value={this.state.parentesco_contacto_e || ''}
                onChange={this.handleChange}
              />
              <span>Parentesco de contacto de Emergencia (ej. PADRE, MADRE, etc...)</span>

              {this.state.errors.parentesco_contacto_e && (
                <div className="error-message">
                  {this.state.errors.parentesco_contacto_e}
                </div>
              )}
            </div>
          </div>
          <div className="buttons">
            <button className="back_button btn custom-btn-perfil-back" onClick={this.prevStep}>Regresar</button>
            <button className="update_button btn custom-btn-perfil" onClick={this.nextStep}>Siguiente</button>

          </div>
        </div>;

      case 4:
        return <div className="main active">
          <small>
            <i className="fa fa-scroll text-dark" />
          </small>
          <p>Bienvenido/a, {this.state.matricula} </p>
          <div className="text">
            <h2>Antecedentes Académicos</h2>
            <p>Ingresa la información de tus Antecedentes Académicos</p>
          </div>
          <div className="input-text">
            <div className="input-div">
              <input
                type="text"
                className="form-control mayus-text"
                name="nombre_bachillerato"
                value={this.state.nombre_bachillerato || ''}
                onChange={this.handleChange}
              />
              <span className="b_eg">Nombre de tu Bachillerato de Egreso con plantel (ABREVIADO. ej. CECYTEH Plantel Mineral de la Reforma, CONALEP Plantel, etc...)</span>

              {this.state.errors.nombre_bachillerato && (
                <div className="error-message">
                  {this.state.errors.nombre_bachillerato}
                </div>
              )}
            </div>

            <div className="input-div">
              <input
                type="text"
                className="form-control mayus-text"
                name="periodo_bachillerato"
                value={this.state.periodo_bachillerato || ''}
                onChange={this.handleChange}
              />
              <span>Periodo de ingreso/egreso (ej. 2016-2019) </span>

              {this.state.errors.periodo_bachillerato && (
                <div className="error-message">
                  {this.state.errors.periodo_bachillerato}
                </div>
              )}
            </div>
            <div className="input-div">
              <input
                type="text"
                className="form-control mayus-text"
                name="promedio_bachillerato"
                value={this.state.promedio_bachillerato || ''}
                onChange={this.handleChange}
              />
              <span>Promedio de Bachillerato (ej. 9.2)</span>

              {this.state.errors.promedio_bachillerato && (
                <div className="error-message">
                  {this.state.errors.promedio_bachillerato}
                </div>
              )}
            </div>
          </div>

          <div className="input-text">
            <span>
              Elige tu primera opción para estudiar en la UTMiR
              <select
                type="text"
                className={`form-control ${this.state.errors.id_carrera_1 ? 'error-border' : ''} mayus-text`}
                name="id_carrera_1"
                value={this.state.id_carrera_1 || ''}
                onChange={this.handleChange}
              >
                <option value="">Selecciona Primera Opción de carrera</option>
                {this.state.opcionesCarrera.map(opcion => (
                  <option key={opcion.id} value={opcion.id}>{opcion.nombre}</option>
                ))}
              </select>
              {this.state.errors.id_carrera_1 && (
                <div className="error-message">
                  {this.state.errors.id_carrera_1}
                </div>
              )}
            </span>

            <span>
              Elige tu segunda opción para estudiar en la UTMiR
              <select
                type="text"
                className={`form-control ${this.state.errors.id_carrera_2 ? 'error-border' : ''} mayus-text`}
                name="id_carrera_2"
                value={this.state.id_carrera_2 || ''}
                onChange={this.handleChange}
              >
                <option value="">Selecciona Segunda Opción de carrera</option>
                {this.state.opcionesCarrera2.map(opcion => (
                  <option key={opcion.id} value={opcion.id}>{opcion.nombre}</option>
                ))}
              </select>
              {this.state.errors.id_carrera_2 && (
                <div className="error-message">
                  {this.state.errors.id_carrera_2}
                </div>
              )}
            </span>
          </div>


          <div className="buttons mt-3">
            <button className="back_button custom-btn-perfil-back" onClick={this.prevStep}>Regresar</button>
            <button className="save_button custom-btn-perfil" onClick={this.confirmSave}>Guardar</button>

          </div>
        </div>;

      case 5:
        return (
          <div className="main active">
            <div className="container">
              <h3>Datos guardados correctamente.</h3>
              <PDFDownloadLink
                document={<MyDocument matricula={this.state.matricula} nombre={this.state.nombre} ap_paterno={this.state.ap_paterno}
                  ap_materno={this.state.ap_materno} />}
                fileName="referencia_bancaria.pdf"
              >
                {({ blob, url, loading, error }) =>
                  loading ? 'Cargando documento...' : 'Descargar Referencia Bancaria'
                }
              </PDFDownloadLink>
            </div>
          </div>
        );

      default:
        return <div>Contenido desconocido</div>;
    }
  };



  render() {

    const user = authService.getCurrentUser();

    // Redireccionar si no hay usuario autenticado
    if (!user) {
      return <Navigate to="/login" />;
    }

    const { currentStep } = this.state;
    const stepsTitles = [
      "Información Personal",
      "Datos Generales",
      "Información Médica",
      "Contacto de Emergencia",
      "Antecedentes Académicos"
    ];

    return (
      <div className=" container_registro " >
        <div className="card_perfil">
          <div className="form">
            <div className="left-side">
              <div className="left-heading">
                <h5>Registro de Aspirantes</h5>
              </div>
              <div className="steps-content content-justify">
                <h3>
                  Paso <span className="step-number">{currentStep + 1}</span>
                </h3>
                <p className="step-number-content active">
                  Todos los campos son obligatorios, en caso de faltar información no sera válido el registro de aspirante y no se generará tu matricula.
                </p>
              </div>
              <ul className="progress-bar">
                {stepsTitles.map((title, index) => (
                  <li key={title} className={index === currentStep ? "active" : ""}>
                    {title}
                  </li>
                ))}
              </ul>
            </div>

            {!this.state.successful && (
              <div className="container right-side">

                {this.renderStepContent()}

              </div>
            )}

          </div>

        </div>
      </div>

    );
  }
}
export default withRouter(CompletarPerfil);