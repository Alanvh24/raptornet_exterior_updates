import React from 'react'
import { Link, Navigate } from 'react-router-dom';

const AspiranteFelicitaciones = () => {

    const user = JSON.parse(localStorage.getItem('user'));

    if (user && user.roles.includes('ROLE_ASPIRANTE') && user.asp_etapa === '4') {
        return (

            <div className='container text-center'>

                <div className='container d-flex justify-content-center align-items-center' style={{ height: '90vh' }}>
                    <div className="row">
                        <div className="col-12">
                            <div className="card card-home">

                                <div className='card-title card-soporte mt-3'>
                                    <Link to={"soporte"}>Soporte</Link>
                                </div>
                                <div className="card-body text-center">
                                    <h3 className="card-title-2 card-title-index-2">
                                        ¡Muchas Felicidades, {user.matricula}!
                                    </h3>
                                    <h2 className="card-text card-text-index-2">
                                        Fuiste seleccionado para estudiar en la Universidad Tecnológica de Mineral de la Reforma.
                                        ¡Espera tu pago de inscripción en los próximas 24 horas!
                                    </h2>
                                    <h5 className="card-text font-weight-bold card-text-index">
                                        Proyecta, innova, alcanza
                                    </h5>
                                </div>
                                <img src="../icono_raptor_2.png" alt="Raptor" className="card-image-2" />
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

export default AspiranteFelicitaciones;