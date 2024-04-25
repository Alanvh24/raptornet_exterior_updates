import React, { Component } from "react";
import { Navigate } from "react-router-dom";
import AuthService from "../services/auth.service";

export default class Profile extends Component {
  constructor(props) {
    super(props);

    this.state = {
      redirect: null,
      userReady: false,
      currentUser: { username: "" }
    };
  }

  componentDidMount() {
    const currentUser = AuthService.getCurrentUser();

    if (!currentUser) this.setState({ redirect: "/" });
    this.setState({ currentUser: currentUser, userReady: true })
  }

  render() {
    if (this.state.redirect) {
      return <Navigate to={this.state.redirect} />
    }

    const { currentUser } = this.state;

    return (
      <div className="container bg-light">
        <section className="bg-dark mb-3">
          <div className="container py-5 h-100">
            <div className="row d-flex justify-content-center align-items-center h-100">
              <div className="col col-lg-6 mb-4 mb-lg-0">
                <div className="card mb-3" style={{ borderRadius: ".5rem" }}>
                  <div className="row g-0">
                    <div className="col-md-4 gradient-custom text-center text-white" style={{ borderTopLeftRadius: ".5rem", borderBottomLeftRadius: ".5rem" }}>
                      <img src="https://cdn-icons-png.flaticon.com/512/3135/3135707.png" alt="Avatar" className="img-fluid my-5" style={{ width: "80px" }} />
                      <h5>{currentUser.matricula} {currentUser.apellidos}</h5>
                      <label>{currentUser.roles && currentUser.roles.map((role, index) => <p key={index}>{role}<br></br></p>)}</label>
                      <a href="/edit-user"> <i className="far fa-edit mb-5"></i></a>
                    </div>
                    <div className="col-md-8">
                      <div className="card-body p-4">
                        <h6>Información</h6>
                        <hr className="mt-0 mb-4" />
                        <div className="row pt-1">
                          <div className="col-12 mb-3">
                            <h6>Email</h6>
                            <p className="text-muted">{currentUser.email}</p>
                          </div>
                          <div className="col-12 mb-3">
                            <h6>Fecha de Registro</h6>
                            <p className="text-muted">{currentUser.fecha}</p>
                          </div>
                        </div>
                        <hr className="mt-0 mb-4" />
                        <div className="row pt-1">
                          <div className="col-12 mb-3">
                            <h6>Universidad Tecnológica de Mineral de la Reforma</h6>
                            <p className="text-muted">Registro de aspirantes</p>
                          </div>
                          <div className="col-12 mb-3">
                            <h6>RAPTORNET - Prueba 1</h6>
                          </div>
                        </div>
                      </div>
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
