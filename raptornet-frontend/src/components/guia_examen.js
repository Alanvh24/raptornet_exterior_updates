import React from 'react'
import { Navigate } from 'react-router-dom';

export const Guia = () => {

    const user = JSON.parse(localStorage.getItem('user'));

    if (user && user.roles.includes('ROLE_ASPIRANTE') && user.asp_etapa === '3') {
        return (
            <div className='container'>
                <div className='row text-center mt-3'>
                    <h1>
                        Descarga tu guía de exámen
                    </h1>
                </div>

            </div>
        )
    } else {
        return <Navigate to="/" />;
    };
}

export default Guia();
