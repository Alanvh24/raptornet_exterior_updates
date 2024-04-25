import React, { Component } from "react";
import Form from "react-validation/build/form";
import Input from "react-validation/build/input";
import CheckButton from "react-validation/build/button";
import "../Login.css";
import AuthService from "../services/auth.service";

import { withRouter } from '../common/with-router';
import Swal from 'sweetalert2';

const required_matricula = value => {
  if (!value) {
    return (
      <div className="alert alert-danger mt-2" role="alert">
        El campo Matricula es requerido!
      </div>
    );
  }
};

const required = value => {
  if (!value) {
    return (
      <div className="alert alert-danger mt-2" role="alert">
        El campo Contraseña es requerido!
      </div>
    );
  }
};
class Login2 extends Component {
  constructor(props) {
    super(props);
    this.handleLogin = this.handleLogin.bind(this);
    this.onChangeMatricula = this.onChangeMatricula.bind(this);
    this.onChangePassword = this.onChangePassword.bind(this);

    this.state = {
      matricula: "",
      password: "",
      loading: false,
      message: "",
      showPassword: false
    };
  }

  toggleShowPassword = () => {
    this.setState(state => ({ showPassword: !state.showPassword }));
  };


  onChangeMatricula(e) {
    this.setState({
      matricula: e.target.value
    });
  }

  onChangePassword(e) {
    this.setState({
      password: e.target.value
    });
  }

  handleLogin(e) {
    e.preventDefault();

    this.setState({
      message: "",
      loading: true
    });

    this.form.validateAll();

    if (this.checkBtn.context._errors.length === 0) {
      // Mostrar la alerta de carga con el ícono de carga
      const loadingAlert = Swal.fire({
        title: 'Iniciando sesión',
        allowEscapeKey: false,
        allowOutsideClick: false,
        showConfirmButton: false, // Oculta el botón "ok"
        didOpen: () => {
          Swal.showLoading();
        }
      });

      // Intenta realizar la autenticación
      AuthService.login(this.state.matricula, this.state.password)
        .then(() => {
          // Autenticación exitosa, mostrar la alerta de éxito
          Swal.fire({
            title: 'Sesión Iniciada Correctamente!',
            icon: 'success',
            timer: 1000,
            showConfirmButton: false
          }).then(() => {
            const user = AuthService.getCurrentUser();
            let redirectPath = '/profile';

            if (user && user.roles) {
              if (user.roles.includes('ROLE_ASPIRANTE')) {
                if (user.asp_etapa === '2') {
                  redirectPath = '/referencia';
                } else if (user.asp_etapa === '3') {
                  redirectPath = '/guia_examen';
                }
                else if (user.asp_etapa === '101') {
                  redirectPath = '/noCompleto';
                } else if (user.asp_etapa === '4') {
                  redirectPath = '/aspirante/congratulations';
                } else if (user.asp_etapa === '5') {
                  redirectPath = '/referencia/curso';
                }
                else {
                  const etapasCompletadas = ['1', '6'];
                  redirectPath = etapasCompletadas.includes(user.asp_etapa) ? '/completo' : '/completar_registro';
                }
              } else if (user.roles.includes('ROLE_FINANZAS')) {
                redirectPath = '/finanzas';

              } else if (user.roles.includes('ROLE_VINCULACION')) {
                redirectPath = '/vinculacion';

              } else if (user.roles.includes('ROLE_SERVICIOSESCOLARES')) {
                redirectPath = '/servicios-escolares';

              } else if (user.roles.includes('ROLE_DIRECCION_ACADEMICA')) {
                redirectPath = '/direccion-academica';

              } else if (user.roles.includes('ROLE_DOCENTES')) {
                redirectPath = '/docentes';
              }


            }

            this.props.router.navigate(redirectPath);
            window.location.reload();
          });
          loadingAlert.close(); // Cierra la alerta de carga
        })
        .catch((error) => {
          const resMessage =
            (error.response &&
              error.response.data &&
              error.response.status === 401) ?
              error.response.data : // Este es el mensaje personalizado del backend
              "Error desconocido al intentar iniciar sesión.";

          this.setState({
            loading: false,
            message: resMessage
          });
          loadingAlert.close(); // Cierra la alerta de carga

          // Mostrar el botón "x" para cerrar la alerta en caso de error y deshabilitar el cierre con ESC y clic exterior
          Swal.fire({
            title: 'Error!',
            text: resMessage,
            icon: 'error',
            showCloseButton: true,
            allowEscapeKey: false,
            allowOutsideClick: false
          });
        });
    } else {
      this.setState({
        loading: false
      });
    }
  }


  componentDidMount() {
    const user = AuthService.getCurrentUser();

    if (user) {
      if (user.roles && user.roles.includes('ROLE_ASPIRANTE')) {
        const etapasCompletadas = ['1', '2', '3', '4', '5'];
        if (etapasCompletadas.includes(user.asp_etapa)) {
          const currentPath = this.props.router.location.pathname;
          if (currentPath === '/completar_registro') {
            this.props.router.navigate('/completo');
            return;
          }
        }
      }

      // Mantener la lógica existente
      this.setState({ redirect: "/" });
    }

    // Configuración del estado restante
    this.setState({
      currentUser: { matricula: "" },
      userReady: true
    })
  }



  render() {

    if (this.state.redirect) {

      this.props.router.navigate("/");

    }

    return (


      <div className="container">


        <div className="modal-dialog text-center">

          <div className="col-sm-8 main-section">

            <div className="modal-content">

              <div className="col-12 user-img">

                <img src="../icono_raptor.png" alt="en construccion" />

              </div>

              <Form
                className="col-12"
                onSubmit={this.handleLogin}
                ref={c => {
                  this.form = c;
                }}
              >

                <div className="form-group" id="user-group">

                  <label className="control-label" htmlFor="matricula">
                    <i className="fa-solid fa-user"></i>
                    <Input
                      type="matricula"
                      className="form-control"
                      name="matricula"
                      value={this.state.matricula}
                      onChange={this.onChangeMatricula}
                      placeholder="Matricula"
                      validations={[required_matricula]}
                    />
                  </label>
                </div>
                <div className="form-group" id="contrasena-group">
                  <label className="control-label">
                    <i
                      className={`fas ${this.state.showPassword ? 'fa-eye-slash' : 'fa-eye'} show-password-login`}
                      onClick={this.toggleShowPassword}
                      style={{ cursor: 'pointer' }}
                    />
                    <Input
                      type={this.state.showPassword ? "label" : "password"}
                      className="form-control"
                      name="password"
                      value={this.state.password}
                      onChange={this.onChangePassword}
                      placeholder="Contraseña"
                      validations={[required]}
                    />
                  </label>
                </div>

                <div className="form-group mt-3">
                  <button
                    className="btn btn-custom-green_utmir btn-block text-light"
                    disabled={this.state.loading}
                  >
                    {this.state.loading && (
                      <span className="spinner-border spinner-border-sm"></span>
                    )}
                    <span>Iniciar Sesión	</span>
                  </button>
                </div>
                <CheckButton
                  style={{ display: "none" }}
                  ref={c => {
                    this.checkBtn = c;
                  }}
                />

                <span className="text-light">¿No estás registrado? <a href="registro" className="registernow" >Registrate ahora </a> </span>

              </Form>
            </div>
          </div>
        </div>


      </div >


    );
  }
}

export default withRouter(Login2);