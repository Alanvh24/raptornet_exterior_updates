// ResetPassword.js
import React, { useState } from 'react';
import { useParams } from 'react-router-dom';
import AuthService from '../../services/auth.service';

const ResetPassword = () => {
    const { matricula } = useParams();
    const [newPassword, setNewPassword] = useState('');

    const handleSubmit = (e) => {
        e.preventDefault();
        AuthService.resetPassword(matricula, newPassword)
            .then(() => {
                alert('Contraseña restablecida exitosamente.');
                // Aquí puedes redirigir al usuario o realizar alguna otra acción
            })
            .catch(error => {
                console.error('Error al restablecer la contraseña:', error);
                alert('Error al restablecer la contraseña. Por favor, intente de nuevo.');
            });
    };

    return (
        <div className='container'>
            <div className="card">
                <div className="card-header">
                    Restablecer Contraseña para: {matricula}
                </div>
                <div className="card-body">
                    <form onSubmit={handleSubmit}>
                        <div className="mb-3">
                            <label htmlFor="newPassword" className="form-label">Nueva Contraseña:</label>
                            <input
                                type="password"
                                className="form-control"
                                id="newPassword"
                                value={newPassword}
                                onChange={(e) => setNewPassword(e.target.value)}
                                required
                            />
                        </div>
                        <button type="submit" className="btn btn-primary">Restablecer Contraseña</button>
                    </form>
                </div>
            </div>
        </div>


    );
};

export default ResetPassword;
