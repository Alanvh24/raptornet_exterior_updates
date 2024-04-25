import React, { useEffect, useState } from 'react'
import { Navigate } from 'react-router-dom';
import "../../App.css"
import userService from '../../services/user.service';
import Swal from 'sweetalert2';

const ActualizarCuotas = () => {
    const [cuotas, setCuotas] = useState([]);
    const [selectedCuota, setSelectedCuota] = useState('');
    const [updateCosto, setUpdateCosto] = useState('');

    useEffect(() => {
        listarCuotas();
    }, []);

    const listarCuotas = () => {
        userService.getCuotas().then((response) => {
            setCuotas(response.data);
            if (response.data.length > 0) {
                setSelectedCuota(response.data[0].id_cuota);
                setUpdateCosto(response.data[0].costo);
            }
        }).catch((error) => {
            console.log(error);
        });
    };

    const handleUpdate = (event) => {
        event.preventDefault();
        userService.actualizarCuota(selectedCuota, { costo: updateCosto }).then(() => {
            listarCuotas(); // Actualizar la lista tras el cambio
            Swal.fire({
                'title': 'Actualizado!',
                'text': `Costo de "${cuotas.find(cuota => cuota.id_cuota === selectedCuota).cuota}" actualizado a ${updateCosto}`,
                'icon': 'success',
            });

        }).catch((error) => {
            console.log(error);
            Swal.fire({
                'title': 'Error',
                'text': 'No se pudo actualizar el costo',
                'icon': 'error',
            });
        });
    };


    const handleChangeCuota = (event) => {
        const selected = cuotas.find(cuota => cuota.id_cuota.toString() === event.target.value);
        setSelectedCuota(selected.id_cuota);
        setUpdateCosto(selected.costo);
    };

    const user = JSON.parse(localStorage.getItem('user'));

    if (user && user.roles.includes('ROLE_FINANZAS')) {
        return (
            <div className='container'>
                <div className="row">
                    {/* Formulario de Actualización */}
                    <div>
                        <div className="text-center mt-3">
                            <h2>ACTUALIZAR CUOTAS </h2>
                        </div>
                        <form onSubmit={handleUpdate} className="text-center">
                            <label className="form-label">
                                Seleccionar Cuota:
                                <select className="form-select" value={selectedCuota} onChange={handleChangeCuota}>
                                    {cuotas.map(cuota => (
                                        <option key={cuota.id_cuota} value={cuota.id_cuota}>
                                            {cuota.cuota}
                                        </option>
                                    ))}
                                </select>
                            </label>
                            <label className="form-label">
                                Nuevo Costo:
                                <input type="text" className="form-control" value={updateCosto} onChange={(e) => setUpdateCosto(e.target.value)} />
                            </label>
                            <button type="submit" className="btn btn-success mt-3">Actualizar Costo</button>
                        </form>
                    </div>
                    <div className="mt-3">
                        <h4>Lista de Cuotas</h4>
                        <table className="table table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Cuota</th>
                                    <th>Costo</th>
                                </tr>
                            </thead>
                            <tbody>
                                {cuotas.map((cuota, index) => (
                                    <tr key={cuota.id_cuota}>
                                        <td> {index + 1} </td>
                                        <td>{cuota.cuota}</td>
                                        <td>{cuota.costo}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        );
    } else {
        return <Navigate to="/login" />;
    }
}

export default ActualizarCuotas;
