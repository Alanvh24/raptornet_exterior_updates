import React from 'react'
import { Link, Navigate } from 'react-router-dom';
import "../../App.css"

const TablasComponent = () => {

  const user = JSON.parse(localStorage.getItem('user'));

  if (user && user.roles.includes('ROLE_FINANZAS')) {
    return (

      <div className='container-fluid'>
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
                        <h3 className="danger">Verificar Datos</h3>
                        <span>Verifica los datos del prospecto para generar su ficha de pago.</span>
                      </div>
                      <div className="align-self-center">
                        <i className="fa-solid fa-magnifying-glass icono-grande"></i>
                      </div>
                    </div>
                    <div className="mt-3">
                      <Link to={"datos"} className="icono-enlace">
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
                        <h3 className="danger">Generar .txt</h3>
                        <span>Generación de .txt para CIE de BBVA</span>
                      </div>
                      <div className="align-self-center">
                        <i className="fa-regular fa-file-lines icono-grande"></i>
                      </div>
                    </div>
                    <div className="mt-3">
                      <Link to={"concatenado"} className="icono-enlace">
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
                        <h3 className="danger">Cargar referencias</h3>
                        <span>Cargar el .txt con referencia bancaria generada por CIE de BBVA</span>
                      </div>
                      <div className="align-self-center">
                        <i className="fa-solid fa-money-check-dollar icono-grande"></i>
                      </div>
                    </div>
                    <div className="mt-3">
                      <Link to={"cargar-referencias"} className="icono-enlace">
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
                        <h3 className="danger">Validar Pagos</h3>
                        <span>Valida si el aspirante realizó los pagos correspondientes</span>
                      </div>
                      <div className="align-self-center">
                        <i className="fa-solid fa-money-bill-trend-up icono-grande"></i>
                      </div>
                    </div>
                    <div className="mt-3">
                      <Link to={"validar-pagos"} className="icono-enlace">
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
                    <i className="fa-solid fa-coins"></i>
                    <h5 className="mb-0 ms-3">Finanzas</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h3 className="danger">Actualizar Cuotas</h3>
                          <span>Actualiza el costo de las cuotas actuales</span>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-money-bill-1 icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"actualizar-cuotas"} className="icono-enlace">
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
                    <i className="fa-solid fa-coins"></i>
                    <h5 className="mb-0 ms-3">Finanzas</h5>
                  </div>
                  <hr />
                  <div className="card-content">
                    <div className="card-body">
                      <div className="media d-flex justify-content-between align-items-center">
                        <div className="media-body">
                          <h3 className="danger">Historial de Pagos</h3>
                          <span>Historial de los pagos realizados dia tras dia</span>
                        </div>
                        <div className="align-self-center">
                          <i className="fa-solid fa-money-bill-1 icono-grande"></i>
                        </div>
                      </div>
                      <div className="mt-3">
                        <Link to={"pagos/historial"} className="icono-enlace">
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
      </div >

    );
  } else {
    return <Navigate to="/login" />;
  }
}

export default TablasComponent;