import React from 'react'
import { Link } from 'react-router-dom';

export const Home = () => {

    const user = JSON.parse(localStorage.getItem('user'));

    if (!user) {
        return (

            <div>
                <div className='container d-flex justify-content-center align-items-center' style={{ height: '90vh' }}>
                    <div className="row">
                        <div className="col-12">
                            <div className="card card-home">

                                <div className='card-title card-soporte mt-3'>
                                    <Link to={"soporte"}>Soporte</Link>
                                </div>
                                <div className="card-body text-center">
                                    <h1 className="card-title card-title-index">
                                        ¡Bienvenida/o a RaptorNet!
                                    </h1>
                                    <p className="card-text card-text-index-1">
                                        Este sitio es una plataforma web que centraliza
                                        la gestión académica y administrativa, facilitando el acceso a datos de estudiantes, horarios,
                                        registros académicos y finanzas de la UTMiR.
                                    </p>
                                    <h5 className="card-text font-weight-bold card-text-index">
                                        Proyecta, innova, alcanza
                                    </h5>
                                </div>
                                <div className="row mb-3">
                                    <div className="col-12">
                                        <div className="button-container">
                                            <Link to={'/login'} className='btn btn-success custom-btn'>Ingresa ahora</Link>
                                            <Link to={'/registro'} className='btn btn-success custom-btn'>Regístrate</Link>
                                        </div>
                                    </div>
                                </div>
                                <img src="../icono_raptor.png" alt="Raptor" className="card-image" />
                            </div>
                        </div>
                    </div>

                </div>
                <footer className="bg-dark text-white mt-4">
                    <div className="container-fluid py-3">
                        <div className="row">
                            <div className="col-md-4 text-center text-md-left">
                                <p>&copy; {new Date().getFullYear()} RaptorNet - Todos los derechos reservados</p>
                            </div>
                            <div className="col-md-4 text-center text-md-right">
                                <p>Versión RaptorNet: 0.1.4</p>
                            </div>

                            <div className="col-md-4 text-center text-md-right">
                                <p>Universidad Tecnológica de Mineral de la Reforma</p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>

        );
    } else {
        return (
            <div>
                <div className='container d-flex justify-content-center align-items-center' style={{ height: '90vh' }}>
                    <div className="row">
                        <div className="col-12">
                            <div className="card card-home">

                                <div className='card-title card-soporte mt-3'>
                                    <Link to={"soporte"}>Soporte</Link>
                                </div>
                                <div className="card-body text-center">
                                    <h1 className="card-title card-title-index">
                                        ¡Bienvenida/o a RaptorNet!
                                    </h1>
                                    <p className="card-text card-text-index-1">
                                        Este sitio es una plataforma web que centraliza
                                        la gestión académica y administrativa, facilitando el acceso a datos de estudiantes, horarios,
                                        registros académicos y finanzas de la UTMiR.
                                    </p>
                                    <h5 className="card-text font-weight-bold card-text-index">
                                        Proyecta, innova, alcanza
                                    </h5>
                                </div>
                                <img src="../icono_raptor.png" alt="Raptor" className="card-image" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        );
    }
}

export default Home();
