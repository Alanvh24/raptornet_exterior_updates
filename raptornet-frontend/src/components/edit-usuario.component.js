import React, { Component } from "react";
import Form from "react-validation/build/form";
import Input from "react-validation/build/input";
import CheckButton from "react-validation/build/button";
import AuthService from "../services/auth.service";
import userService from "../services/user.service";


const required = value => {
  if (!value) {
    return (
      <div className="alert alert-danger" role="alert">
        El campo es requerido!
      </div>
    );
  }
};
export default class Register extends Component {
  constructor(props) {
    super(props);
    this.handleRegister = this.handleRegister.bind(this);
    this.onChageAp_Paterno = this.onChangeAp_Paterno.bind(this);
    this.onChangeAp_Materno = this.onChangeAp_Materno.bind(this);
    this.onChangeNombre = this.onChangeNombre.bind(this);
    this.onChangeCurp = this.onChangeCurp.bind(this);

    this.state = {
      ap_paterno: "",
      ap_materno: "",
      nombre: "",
      curp: "",
      successful: false,
      message: ""
    };
  }

  onChangeAp_Paterno(e) {
    this.setState({
      ap_paterno: e.target.value
    });
  }

  onChangeAp_Materno(e) {
    this.setState({
      ap_materno: e.target.value
    });
  }

  onChangeNombre(e) {
    this.setState({
      nombre: e.target.value
    });
  }

  onChangeCurp(e) {
    this.setState({
      curp: e.target.value
    });
  }


  handleRegister(e) {
    e.preventDefault();

    this.setState({
      message: "",
      successful: false
    });

    this.form.validateAll();

    if (this.checkBtn.context._errors.length === 0) {
      AuthService.perfil(
        this.state.ap_paterno,
        this.state.ap_materno,
        this.state.nombre,
        this.state.curp
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

  componentDidMount() {
    userService.perfilUsuario().then(
      response => {
        this.setState({
          ap_paterno: response.data.ap_paterno,
          ap_materno: response.data.ap_materno,
          nombre: response.data.nombre,
          curp: response.data.curp
        });
      },
      error => {
        // Manejar los errores aquí
        console.log("Error al obtener el perfil del usuario", error);
      }
    );
  }

  render() {
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
                  <label htmlFor="ap_paterno">Apellido Paterno</label>
                  <Input
                    type="text"
                    className="form-control"
                    name="ap_paterno"
                    value={this.state.ap_paterno}
                    onChange={this.onChageAp_Paterno}
                    validations={[required]}
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="ap_materno">Apellido Materno</label>
                  <Input
                    type="text"
                    className="form-control"
                    name="ap_materno"
                    value={this.state.ap_materno}
                    onChange={this.onChangeAp_Materno}
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
                  <label htmlFor="curp">CURP</label>
                  <Input
                    type="text"
                    className="form-control"
                    name="curp"
                    value={this.state.curp}
                    onChange={this.onChangeCurp}
                    validations={[required]}
                  />
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
