import React, { Component } from "react";
import Form from "react-validation/build/form";
import Input from "react-validation/build/input";
import CheckButton from "react-validation/build/button";
import { isEmail } from "validator";

import AuthService from "../services/auth.service";
import { Navigate } from "react-router-dom";

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

export default class RegisterAuth extends Component {
  constructor(props) {
    super(props);
    this.handleRegister = this.handleRegister.bind(this);
    this.onChangeEmail = this.onChangeEmail.bind(this);
    this.onChangePassword = this.onChangePassword.bind(this);
    this.onChangeConfirmPassword = this.onChangeConfirmPassword.bind(this);
    this.onChangeMatricula = this.onChangeMatricula.bind(this);
    this.onChangeNombre = this.onChangeNombre.bind(this);
    this.onChangeApPaterno = this.onChangeApPaterno.bind(this);
    this.onChangeApMaterno = this.onChangeApMaterno.bind(this);
    this.onChangeRoles = this.onChangeRoles.bind(this);

    this.state = {
      matricula: "",
      roles: "",
      email: "",
      password: "",
      confirmPassword: '',
      nombre: "",
      apPaterno: "",
      apMaterno: "",
      successful: false,
      message: "",
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

  onChangeEmail(e) {
    this.setState({
      email: e.target.value
    });
  }


  onChangeCurp(e) {
    this.setState({
      curp: e.target.value
    });
  }

  onChangePassword(e) {
    this.setState({
      password: e.target.value
    });
  }

  onChangeMatricula(e) {
    this.setState({
      matricula: e.target.value,
    });
  }

  onChangeRoles(e) {
    this.setState({
      roles: e.target.value,
    });
  }

  onChangeConfirmPassword(e) {
    this.setState({
      confirmPassword: e.target.value
    });
  }

  onChangeNombre(e) {
    this.setState({
      nombre: e.target.value,
    });
  }

  onChangeApPaterno(e) {
    this.setState({
      apPaterno: e.target.value
    });
  }

  onChangeApMaterno(e) {
    this.setState({
      apMaterno: e.target.value
    });
  }



  handleRegister(e) {
    e.preventDefault();

    this.setState({
      message: "",
      successful: false
    });

    if (this.state.password !== this.state.confirmPassword) {
      this.setState({
        successful: false,
        message: "Las contraseñas no coinciden."
      });
      return;
    }

    this.form.validateAll();

    if (this.checkBtn.context._errors.length === 0) {
      AuthService.registerauth(
        this.state.matricula,
        this.state.email,
        this.state.password,
        this.state.nombre,
        this.state.apPaterno,
        this.state.apMaterno,
        [this.state.roles]
      ).then(
        response => {
          this.setState({
            message: response.data.message,
            successful: true
          });
        },
        error => {
          const resMessage =
            (error.response &&
              error.response.data &&
              error.response.data.message) ||
            error.message ||
            error.toString();

          this.setState({
            successful: false,
            message: resMessage
          });
        }
      );
    }
  }

  render() {

    const user = JSON.parse(localStorage.getItem('user'));

    if (!user || !user.roles.includes('ROLE_ADMIN')) {
      return <Navigate to="/" />;
    }

    return (

      <div className="col-md-12">
        <div className="card card-container">
          <img
            src="//ssl.gstatic.com/accounts/ui/avatar_2x.png"
            alt="profile-img"
            className="profile-img-card"
          />

          <Form
            onSubmit={this.handleRegister}
            ref={c => {
              this.form = c;
            }}
          >
            {!this.state.successful && (
              <div>

                <div className="form-group">
                  <label htmlFor="matricula">Matrícula</label>
                  <Input
                    type="text"
                    className="form-control"
                    name="matricula"
                    value={this.state.matricula}
                    onChange={this.onChangeMatricula}
                    validations={[required]}
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="nombre">Nombre</label>
                  <Input
                    type="text"
                    className="form-control"
                    name="nombre"
                    value={this.state.nombre}
                    onChange={this.onChangeNombre}
                    validations={[required]}
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="apPaterno">Apellido Paterno</label>
                  <Input
                    type="text"
                    className="form-control"
                    name="apPaterno"
                    value={this.state.apPaterno}
                    onChange={this.onChangeApPaterno}
                    validations={[required]}
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="apMaterno">Apellido Materno</label>
                  <Input
                    type="text"
                    className="form-control"
                    name="apMaterno"
                    value={this.state.apMaterno}
                    onChange={this.onChangeApMaterno}
                    validations={[required]}
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="roles">Rol</label>
                  <select className="form-control" name="roles" value={this.state.roles} onChange={this.onChangeRoles}>
                    <option value="">Selecciona un Rol</option>
                    <option value="admin">Admin</option>
                    <option value="finanzas">Finanzas</option>
                    <option value="vinculacion">Vinculación</option>
                    <option value="serviciosescolares">Servicios Escolares</option>
                    <option value="docente">Docente</option>
                    <option value="direccion_academica">Direccion Academica</option>
                  </select>
                </div>


                <div className="form-group">
                  <label htmlFor="email">Email</label>
                  <Input
                    type="text"
                    className="form-control"
                    name="email"
                    value={this.state.email}
                    onChange={this.onChangeEmail}
                    validations={[required, email]}
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="password">Contraseña</label>
                  <Input
                    type={this.state.showPassword ? "label" : "password"}
                    className="form-control"
                    name="password"
                    value={this.state.password}
                    onChange={this.onChangePassword}
                    validations={[required, vpassword]}
                  />
                  <i
                    className={`fas ${this.state.showPassword ? 'fa-eye-slash' : 'fa-eye'}`}
                    onClick={this.toggleShowPassword}
                    style={{ cursor: 'pointer' }}
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="password">Confirmar Contraseña</label>
                  <Input

                    type={this.state.showConfirmPassword ? "text" : "password"}
                    className="form-control"
                    name="confirmPassword"
                    value={this.state.confirmPassword}
                    onChange={this.onChangeConfirmPassword}
                    validations={[required]}
                  />

                  <i
                    className={`fas ${this.state.showConfirmPassword ? 'fa-eye-slash' : 'fa-eye'}`}
                    onClick={this.toggleShowConfirmPassword}
                    style={{ cursor: 'pointer' }}
                  />
                </div>


                <div className="form-group">
                  <button className="btn btn-custom-green_utmir btn-block text-light mt-3">Registrarse</button>
                </div>
              </div>
            )}

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
            <CheckButton
              style={{ display: "none" }}
              ref={c => {
                this.checkBtn = c;
              }}
            />
          </Form>
        </div>
      </div>
    );
  }
}
