import React from 'react'
import { Link, Navigate } from 'react-router-dom';
import "../../styles/Sidebar.css"
const DashboardAcademia = () => {

    const user = JSON.parse(localStorage.getItem('user'));

    if (user && user.roles.includes("ROLE_DIRECCION_ACADEMICA")) {
        return (


            <div className='container-fluid'>
                <div className="row">
                    <div className="row">
                        <div className='mt-3'>
                            <h3><i className="fa-solid fa-inbox"></i> Dashboard </h3>
                        </div>

                        <div className="row">
                            <div className="col-xl-4 col-sm-6 col-12">

                                <div className="card card-c1 card-altura">
                                    <div className="d-flex align-items-center">
                                        <i className="fa-solid fa-person-chalkboard"></i>
                                        <h5 className="mb-0 ms-3">Docentes</h5>
                                    </div>
                                    <hr />
                                    <div className="card-content">
                                        <div className="card-body">
                                            <div className="media d-flex justify-content-between align-items-center">
                                                <div className="media-body">
                                                    <h3 className="danger">Asignar materias y grupos</h3>
                                                    <p>Asigna el grupo y asignaturas correspondientes a los docentes matriculados.</p>
                                                </div>
                                                <div className="align-self-center">
                                                    <i className="fa-solid fa-person-chalkboard icono-grande"></i>
                                                </div>
                                            </div>
                                            <div className="mt-3">
                                                <Link to={"asignar-docentes"} className="icono-enlace">
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
                                        <i className="fa-solid fa-person-chalkboard"></i>
                                        <h5 className="mb-0 ms-3">Docentes</h5>
                                    </div>
                                    <hr />
                                    <div className="card-content">
                                        <div className="card-body">
                                            <div className="media d-flex justify-content-between align-items-center">
                                                <div className="media-body">
                                                    <h3 className="danger">Docentes</h3>
                                                    <p>Visualiza las planeaciones, asistencias y calificaciones asignadas por el docente.</p>
                                                </div>
                                                <div className="align-self-center">
                                                    <i className="fa-solid fa-book icono-grande"></i>
                                                </div>
                                            </div>
                                            <div className="mt-3">
                                                <Link to={"planeaciones"} className="icono-enlace">
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

export default DashboardAcademia;