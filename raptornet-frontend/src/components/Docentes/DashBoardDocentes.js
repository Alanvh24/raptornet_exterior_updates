import React from 'react'
import { Link, Navigate } from 'react-router-dom';
import "../../styles/Sidebar.css"
const DashboardDocentes = () => {



    const user = JSON.parse(localStorage.getItem('user'));

    if (user && user.roles.includes("ROLE_DOCENTES")) {
    } else {
        return <Navigate to="/" />;
    }

    return (


        <div className='container-fluid'>
            <div className="row">
                <div className="row">
                    <div className='mt-3'>
                        <h3><i className="fa-solid fa-inbox"></i> Bienvenido, {user.nombre}</h3>
                    </div>
                    <div className="row">
                        <div className="col-xl-4 col-sm-6 col-12">

                            <div className="card card-c1 card-altura">
                                <div className="d-flex align-items-center">
                                    <i className="fa-solid fa-shapes"></i>
                                    <h5 className="mb-0 ms-3">Docentes</h5>
                                </div>
                                <hr />
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex justify-content-between align-items-center">
                                            <div className="media-body">
                                                <h3 className="danger">Mis asignaturas</h3>
                                                <p>Modifica la planeación didáctica, fechas de evaluación de las unidades, asistencias y calificaciones de tus asignaturas.</p>
                                            </div>
                                            <div className="align-self-center">
                                                <i className="fa-solid fa-shapes icono-grande"></i>
                                            </div>
                                        </div>
                                        <div className="mt-3">
                                            <Link to={"asignaturas"} className="icono-enlace">
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
                                    <i className="fa-solid fa-shapes"></i>
                                    <h5 className="mb-0 ms-3">Docentes</h5>
                                </div>
                                <hr />
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex justify-content-between align-items-center">
                                            <div className="media-body">
                                                <h3 className="danger">Remediales</h3>
                                                <p>Califica y firma los exámenes remediales. La lista solo estará disponible si se firmó la calificación final con anterioridad.</p>
                                            </div>
                                            <div className="align-self-center">
                                                <i className="fa-solid fa-horse icono-grande"></i>
                                            </div>
                                        </div>
                                        <div className="mt-3">
                                            <Link to={"remediales"} className="icono-enlace">
                                                <i className="fa-solid fa-arrow-right"></i>
                                            </Link>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    {/* --------------------------------------------------------- */}

                    <div className="row">
                        <div className="col-xl-4 col-sm-6 col-12">

                            <div className="card card-c1 card-altura">
                                <div className="d-flex align-items-center">
                                    <i className="fa-solid fa-wrench"></i>
                                    <h5 className="mb-0 ms-3">Herramientas</h5>
                                </div>
                                <hr />
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex justify-content-between align-items-center">
                                            <div className="media-body">
                                                <h3 className="danger">Simulador de Asistencias</h3>
                                                <p>Simula la fecha de inicio y fecha final de una unidad para calcular correctamente las clases activas para el porcentaje de asistencias.</p>
                                            </div>
                                            <div className="align-self-center">
                                                <i className="fa-solid fa-people-pulling icono-grande"></i>
                                            </div>
                                        </div>
                                        <div className="mt-3">
                                            <Link to={"simulador"} className="icono-enlace">
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

}

export default DashboardDocentes;