import React from 'react'
import { Link, Navigate } from 'react-router-dom';

const DashboardServiciosEscolares = () => {

  const user = JSON.parse(localStorage.getItem('user'));



  if (user && user.roles.includes('ROLE_SERVICIOSESCOLARES')) {
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
                          <h4 className="danger">Lista de aspirantes</h4>
                          <p>Aspirantes que han completado su registro en RaptorNet. Edita su información.</p>
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

              <div className='row'>

                <div className="col-xl-4 col-sm-6 col-12">

                  <div className="card card-c1 card-altura">
                    <div className="d-flex align-items-center">
                      <i className="fa-solid fa-user"></i>
                      <h5 className="mb-0 ms-3">Alumnos</h5>
                    </div>
                    <hr />
                    <div className="card-content">
                      <div className="card-body">
                        <div className="media d-flex justify-content-between align-items-center">
                          <div className="media-body">
                            <h4 className="danger">Asignar Grupos a Alumnos</h4>
                            <p>Asigna su grupo a alumnos de nuevo ingreso.</p>
                          </div>
                          <div className="align-self-center">
                            <i className="fa-solid fa-user-tag icono-grande"></i>
                          </div>
                        </div>
                        <div className="mt-3">
                          <Link to={"alumnos/asignar-grupos"} className="icono-enlace">
                            <i className="fa-solid fa-arrow-right"></i>
                          </Link>
                        </div>
                      </div>
                    </div>
                  </div>


                </div>

              </div>

              <div className="col-xl-4 col-sm-6 col-12">

                <div className="card card-c1 card-altura">
                  <div className="d-flex align-items-center">
                    <i className="fa-solid fa-user"></i>
                    <h5 className="mb-0 ms-3">Alumnos</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h4 className="danger">Lista de Alumnos Activos</h4>
                          <p>Visualiza la lista de alumnos activos en el periodo escolar actual.</p>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-list icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"alumnos/lista-alumnos"} className="icono-enlace">
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
                    <i className="fa-solid fa-user"></i>
                    <h5 className="mb-0 ms-3">Alumnos</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h4 className="danger">Información General</h4>
                          <p>Ver información general de los alumnos. Especifíca la matricula a buscar.</p>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-magnifying-glass icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"alumnos"} className="icono-enlace">
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
                    <i className="fa-solid fa-user"></i>
                    <h5 className="mb-0 ms-3">Alumnos</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h4 className="danger">Tira de Materias del Alumno</h4>
                          <p>Ver la tira de materias con calificaciones del cuatrimestre en curso del alumno específicado.</p>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-magnifying-glass icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"alumnos/calificaciones-cuatrimestre-actual"} className="icono-enlace">
                          <i className="fa-solid fa-arrow-right"></i>
                        </Link>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

            </div>

            <div className="row">
              <div className="col-xl-4 col-sm-6 col-12">

                <div className="card card-c1 card-altura">
                  <div className="d-flex align-items-center">
                    <i className="fa-solid fa-user"></i>
                    <h5 className="mb-0 ms-3">Herramientas</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h4 className="danger">Cambio de cuatrimestre</h4>
                          <p>Avanza de cuatrimestre. Verifica que las calificaciones cuatrimestrales estén firmadas, y desactiva la tira de materias a los docentes. </p>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-circle-exclamation icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"cambio-cuatrimestre"} className="icono-enlace">
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
    return <Navigate to="/login" />;
  }
}

export default DashboardServiciosEscolares;