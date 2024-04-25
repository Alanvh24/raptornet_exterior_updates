import React, { Component, } from "react";
import Form from "react-validation/build/form";
import Input from "react-validation/build/input";
import CheckButton from "react-validation/build/button";
import { isEmail } from "validator";
import AuthService from "../services/auth.service";
import { Navigate } from "react-router-dom";
import Swal from "sweetalert2";

const required = value => {
  if (!value) {
    return (
      <div className="alert alert-danger" role="alert">
        El campo es requerido!
      </div>
    );
  }
};

const email = value => {
  if (!isEmail(value)) {
    return (
      <div className="alert alert-danger" role="alert">
        No es un correo válido o ya existe.
      </div>
    );
  }
};

const vpassword = value => {
  if (value.length < 6 || value.length > 40) {
    return (
      <div className="alert alert-danger" role="alert">
        La contraseña debe tener entre 6 y 40 caracteres.
      </div>
    );
  }
};

export default class Register extends Component {
  constructor(props) {
    super(props);
    this.handleRegister = this.handleRegister.bind(this);
    this.onChangeEmail = this.onChangeEmail.bind(this);
    this.onChangeCurp = this.onChangeCurp.bind(this);
    this.onChangePassword = this.onChangePassword.bind(this);
    this.onChangeConfirmPassword = this.onChangeConfirmPassword.bind(this);
    this.navigate = Navigate;
    this.handleTermsChange = this.handleTermsChange.bind(this);

    this.state = {
      email: "",
      curp: "",
      password: "",
      confirmPassword: '',
      successful: false,
      message: "",
      showMessage: false,
      redirectToLogin: false,
      termsChecked: false, // Estado para el checkbox
      showPassword: false,
      showConfirmPassword: false,

    };
  }

  toggleShowPassword = () => {
    this.setState(state => ({ showPassword: !state.showPassword }));
  };

  toggleShowConfirmPassword = () => {
    this.setState(state => ({ showConfirmPassword: !state.showConfirmPassword }));
  };


  handleTermsChange(e) {
    const isChecked = e.target.checked;
    this.setState({ termsChecked: isChecked });

    if (isChecked) {
      Swal.fire({
        title: 'Importante',
        html: 'Al marcar esta casilla, confirmo que:<ul><li>Acepto haber leído el <b>aviso de privacidad</b> y estoy de acuerdo con el mismo.</li><li>Entiendo y acepto que en caso de liquidar alguna cantidad por algún concepto de inscripción, <b>la misma no será reembolsada</b>.</li><li>Concedo mi consentimiento para el <b>uso de mi imagen</b> en fotografías, videos u otros medios digitales e impresos utilizados por la institución para fines académicos, promocionales o informativos.</li></ul> Recuerda guardar muy bien tu matrícula.',
        icon: 'info',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#3085d6',
        focusConfirm: false,
        preConfirm: () => {
          return true; // Puedes hacer algo aquí antes de cerrar el alert, como guardar la aceptación en la base de datos o estado.
        }
      });
    }
  }


  onChangeEmail(e) {
    this.setState({
      email: e.target.value
    });
  }


  onChangeCurp(e) {
    const curpValue = e.target.value;
    if (curpValue.length <= 18) {
      this.setState({
        curp: curpValue,
        curpValid: curpValue.length === 18
      });
    }
  }


  onChangePassword(e) {
    this.setState({
      password: e.target.value
    });
  }

  onChangeConfirmPassword(e) {
    this.setState({
      confirmPassword: e.target.value
    });
  }


  handleRegister(e) {
    e.preventDefault();

    if (!this.state.termsChecked) {
      Swal.fire({
        title: 'Error',
        text: 'Debes aceptar los términos y condiciones para registrarte',
        icon: 'error',
        confirmButtonText: 'Ok'
      });
      return;
    }

    this.setState({
      message: "",
      successful: false,
      showMessage: true // Establecer showMessage en true antes de mostrar el mensaje
    });

    if (this.state.password !== this.state.confirmPassword) {
      this.setState({
        successful: false,
        message: "Las contraseñas no coinciden."
      });
      return;
    }


    //longitud del CURP
    if (!this.state.curpValid) {
      Swal.fire({
        title: 'Error',
        text: 'El CURP debe tener 18 caracteres.',
        icon: 'error',
        confirmButtonText: 'Ok'
      });
      return;
    }

    this.form.validateAll();

    if (this.checkBtn.context._errors.length === 0) {
      Swal.fire({
        title: '¡Casi listo!',
        text: 'Antes de completar tu registro, recuerda que deberás guardar tu matrícula generada o podrías perder el acceso. ¿Deseas continuar?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Continuar',
        cancelButtonText: 'Cancelar'
      }).then((result) => {

        Swal.fire({
          title: 'Por favor espera...',
          html: 'Registrando tu cuenta...',
          allowOutsideClick: false,
          allowEscapeKey: false,
          didOpen: () => {
            Swal.showLoading();
          }
        });


        if (result.value) {
          AuthService.register(
            this.state.email,
            this.state.curp,
            this.state.password
          ).then(
            response => {
              Swal.fire({
                title: 'Registro Exitoso!',
                text: response.data.message,
                icon: 'success',
                confirmButtonText: 'Iniciar Sesión',
                allowOutsideClick: false,
                allowEscapeKey: false,
              }).then(() => {
                this.setState({ redirectToLogin: true });
              });
            },
            error => {
              const resMessage =
                (error.response &&
                  error.response.data &&
                  error.response.data.message) ||
                error.message ||
                error.toString();

              Swal.fire({
                title: 'Error!',
                text: resMessage,
                icon: 'error',
                confirmButtonText: 'Ok',
                allowOutsideClick: false,
                allowEscapeKey: false,
              }).then(() => {
                this.setState({
                  successful: false,
                  showMessage: false // Actualizar showMessage cuando se cierre el mensaje
                });
              });
            }
          );
        }
      });
    }
  }


  render() {

    const user = JSON.parse(localStorage.getItem('user'));

    if (user) {
      return <Navigate to="/" />;
    }

    if (this.state.redirectToLogin) {
      return <Navigate to="/login" />;
    }

    return (
      <div>
        <section className="vh-100">
          <div className="container h-100">
            <div className="row d-flex justify-content-center align-items-center h-100">
              <div className="col-lg-12 col-xl-11">
                <div className="card text-black" style={{ borderRadius: 25 }}>
                  <div className="card-body p-md-5">
                    {this.state.message && (
                      <div className="form-group">
                        <div
                          className={
                            this.state.successful
                              ? "alert alert-success"
                              : "alert alert-danger"
                          }
                          role="alert"
                        >
                          {this.state.message}
                        </div>
                      </div>
                    )}
                    <div className="row justify-content-center">
                      {(!this.state.successful) && (
                        <div className="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                          <p className="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">
                            ¡Registrate!
                          </p>

                          <Form className="mx-1 mx-md-4"
                            onSubmit={this.handleRegister}
                            ref={c => {
                              this.form = c;
                            }}
                          >


                            <div className="d-flex flex-row align-items-center mb-4">
                              <i className="fas fa-user fa-lg me-3 fa-fw" />
                              <div className="form-outline flex-fill mb-0">
                                <Input
                                  type="text"
                                  id="form3Example1c"
                                  className="form-control"
                                  name="curp"
                                  value={this.state.curp}
                                  onChange={this.onChangeCurp}
                                  validations={[required]}
                                  maxLength="18"
                                />

                                <label className="form-label" htmlFor="form3Example1c">
                                  CURP
                                </label>
                              </div>
                            </div>

                            <div className="d-flex flex-row align-items-center mb-4">
                              <i className="fas fa-envelope fa-lg me-3 fa-fw" />
                              <div className="form-outline flex-fill mb-0">
                                <Input
                                  type="email"
                                  id="form3Example3c"
                                  className="form-control"
                                  name="email"
                                  value={this.state.email}
                                  onChange={this.onChangeEmail}
                                  validations={[required, email]}
                                />
                                <label className="form-label" htmlFor="form3Example3c">
                                  Correo electrónico
                                </label>
                              </div>
                            </div>
                            <div className="d-flex flex-row align-items-center mb-4 position-relative">
                              <i className="fas fa-lock fa-lg me-3 fa-fw"></i>
                              <div className="position-relative" style={{ width: '100%' }}>
                                <Input
                                  type={this.state.showPassword ? "text" : "password"}
                                  id="form3Example4c"
                                  className="form-control"
                                  name="password"
                                  value={this.state.password}
                                  onChange={this.onChangePassword}
                                  validations={[required, vpassword]}
                                />
                                <i
                                  className={`fas ${this.state.showPassword ? 'fa-eye-slash' : 'fa-eye'} position-absolute`}
                                  onClick={this.toggleShowPassword}
                                  style={{ cursor: 'pointer', right: '10px', top: '25%', transform: 'translateY(-50%)' }}
                                ></i>
                                <label className="form-label" htmlFor="form3Example4c">
                                  Contraseña
                                </label>
                              </div>
                            </div>
                            <div className="d-flex flex-row align-items-center mb-4 position-relative">
                              <i className="fas fa-key fa-lg me-3 fa-fw"></i>
                              <div className="position-relative" style={{ width: '100%' }}>
                                <Input
                                  type={this.state.showConfirmPassword ? "text" : "password"}
                                  id="form3Example4cd"
                                  className="form-control"
                                  name="confirmPassword"
                                  value={this.state.confirmPassword}
                                  onChange={this.onChangeConfirmPassword}
                                  validations={[required]}
                                />
                                <i
                                  className={`fas ${this.state.showConfirmPassword ? 'fa-eye-slash' : 'fa-eye'} position-absolute`}
                                  onClick={this.toggleShowConfirmPassword}
                                  style={{ cursor: 'pointer', right: '10px', top: '25%', transform: 'translateY(-50%)' }}
                                ></i>
                                <label className="form-label" htmlFor="form3Example4cd">
                                  Confirma tu contraseña
                                </label>
                              </div>
                            </div>
                            <div className="form-check d-flex justify-content-center mb-5">
                              <input
                                className="form-check-input me-2"
                                type="checkbox"
                                checked={this.state.termsChecked}
                                onChange={this.handleTermsChange}
                                id="termsCheckbox"
                              />
                              <label className="form-check-label" htmlFor="termsCheckbox">
                                Acepto que leí el <a href="/AVISO_PRIVACIDAD.pdf" target="_blank" rel="noopener noreferrer">
                                  Aviso de Privacidad
                                </a>
                              </label>
                            </div>
                            <div className="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                              <button type="submit" className="btn btn-success btn-lg" disabled={!this.state.termsChecked}>
                                Registrarse
                              </button>
                            </div>

                            <CheckButton
                              style={{ display: "none" }}
                              ref={c => {
                                this.checkBtn = c;
                              }}
                            />
                          </Form>
                        </div>
                      )}

                      {(!this.state.successful || this.state.showMessage) && (
                        <div className="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                          <img
                            src="icono_raptor.png"
                            className="img-fluid"
                            alt="Sample "
                          />
                        </div>
                      )}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

      </div>
    );
  }
}
