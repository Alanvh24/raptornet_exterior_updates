import React from 'react'
import { Link, Navigate } from 'react-router-dom';
import "../../styles/Sidebar.css"
const DashboardVinculacion = () => {

  const user = JSON.parse(localStorage.getItem('user'));

  if (user && user.roles.includes("ROLE_VINCULACION")) {
    return (


      <div className='container-fluid'>
        <div className="row">
          <div className="row">
            <div className='mt-3'>
              <h3><i className="fa-solid fa-inbox"></i> Dashboard</h3>
            </div>

            <div className="row">

              <div className="col-xl-4 col-sm-6 col-12">

                <div className="card card-c1 card-altura">
                  <div className="d-flex align-items-center">
                    <i className="fa-solid fa-user-slash"></i>
                    <h5 className="mb-0 ms-3">Aspirantes</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h3 className="danger">Lista de aspirantes</h3>
                          <p>Vista de aspirantes que han completado su registro en RaptorNet. Edita su información si es necesario.</p>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-user-slash icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"aspirantes"} className="icono-enlace">
                          <i className="fa-solid fa-arrow-right"></i>
                        </Link>
                      </div>
                    </div>
                  </div>
                </div>

              </div>

              <div className="col-xl-4 col-sm-6 col-12">
                <div className="card card-c1 card-altura">
                  <div className="d-flex align-items-center">
                    <i className="fa-solid fa-user-slash"></i>
                    <h5 className="mb-0 ms-3">Aspirantes</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h3 className="danger">Verificar Pago</h3>
                          <span>Verificar pago de ficha de exámen de admisión</span>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-magnifying-glass-dollar icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"verificar-pagos"} className="icono-enlace">
                          <i className="fa-solid fa-arrow-right"></i>
                        </Link>
                      </div>
                    </div>
                  </div>
                </div>

              </div>

              <div className="col-xl-4 col-sm-6 col-12">

                <div className="card card-c1 card-altura">
                  <div className="d-flex align-items-center">
                    <i className="fa-solid fa-user-slash"></i>
                    <h5 className="mb-0 ms-3">Aspirantes</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h3 className="danger">Estadisticas</h3>
                          <span>Consultas los charts y estadísticas de los aspirantes</span>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-chart-simple icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"estadisticas"} className="icono-enlace">
                          <i className="fa-solid fa-arrow-right"></i>
                        </Link>
                      </div>
                    </div>
                  </div>
                </div>

              </div>

              <div className="col-xl-4 col-sm-6 col-12">

                <div className="card card-c1 card-altura">
                  <div className="d-flex align-items-center">
                    <i className="fa-solid fa-user-slash"></i>
                    <h5 className="mb-0 ms-3">Aspirantes</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h3 className="danger">Calificaciones</h3>
                          <span>Califica los exámenes de admisión de los aspirantes. </span>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-brain icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"aspirantes/calificaciones"} className="icono-enlace">
                          <i className="fa-solid fa-arrow-right"></i>
                        </Link>
                      </div>
                    </div>
                  </div>
                </div>

              </div>

              <div className="col-xl-4 col-sm-6 col-12">

                <div className="card card-c1 card-altura">
                  <div className="d-flex align-items-center">
                    <i className="fa-solid fa-user-slash"></i>
                    <h5 className="mb-0 ms-3">Aspirantes</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h3 className="danger">Aspirantes Aceptados</h3>
                          <span>Lista de aspirantes que pasaron el exámen de admisión.</span>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-user-check icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"aspirantes/aceptados"} className="icono-enlace">
                          <i className="fa-solid fa-arrow-right"></i>
                        </Link>
                      </div>
                    </div>
                  </div>
                </div>

              </div>

              <div className="col-xl-4 col-sm-6 col-12">

                <div className="card card-c1 card-altura">
                  <div className="d-flex align-items-center">
                    <i className="fa-solid fa-user-slash"></i>
                    <h5 className="mb-0 ms-3">Registros</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h3 className="danger">Lista de registros</h3>
                          <p>Lista de registros en RaptorNet que aún no han completado su perfil en la plataforma. Restablece su contraseña.</p>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-gear icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"registros"} className="icono-enlace">
                          <i className="fa-solid fa-arrow-right"></i>
                        </Link>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>

    );
  } else {
    return <Navigate to="/" />;
  }
}

export default DashboardVinculacion;