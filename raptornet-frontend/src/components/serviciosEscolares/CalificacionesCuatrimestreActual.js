import React, { useState } from "react";
import serviciosEscolaresService from "../../services/serviciosEscolares.service";

const CalificacionesCuatrimestreActual = () => {
    const [matricula, setMatricula] = useState('');
    const [calificaciones, setCalificaciones] = useState([]);
    const [cuatrimestre, setCuatrimestre] = useState('');
    const [nombreCompleto, setNombreCompleto] = useState('');
    const [grupo, setGrupo] = useState('');
    const [error, setError] = useState('');

    const buscarCalificaciones = async (e) => {
        e.preventDefault();
        setError('');
        setNombreCompleto('');
        setCalificaciones([]);
        setCuatrimestre('');
        setGrupo('');
        try {
            const response = await serviciosEscolaresService.obtenerTiraMateriasYCalificaciones(matricula);
            setNombreCompleto(response.data.nombreCompleto);
            setCalificaciones(response.data.asignaturas);
            setCuatrimestre(response.data.cuatrimestre);
            setGrupo(response.data.grupo);
            console.log(response.data);
        } catch (error) {
            console.error('Error al obtener las calificaciones:', error);
            setError('No se pudieron obtener las calificaciones. Asegúrate de que la matrícula sea correcta.');
        }
    };

    return (
        <div className="container mt-3">
            <h2>Calificaciones Cuatrimestre Actual</h2>
            <form onSubmit={buscarCalificaciones}>
                <div className="mb-3">
                    <label htmlFor="matriculaInput" className="form-label">Matrícula</label>
                    <input
                        type="text"
                        className="form-control"
                        id="matriculaInput"
                        value={matricula}
                        onChange={(e) => setMatricula(e.target.value)}
                        placeholder="Ingresa la matrícula"
                    />
                </div>
                <button type="submit" className="btn btn-primary">Buscar</button>
            </form>
            {error && <div className="alert alert-danger" role="alert">{error}</div>}
            {calificaciones.length > 0 && (
                <>
                    <p>Nombre del Alumno: {nombreCompleto}</p>
                    <p>Cuatrimestre actual: {cuatrimestre} - Grupo: {grupo}</p>
                    <table className="table table-striped table-hover align-middle">
                        <thead className="text-center">
                            <tr>
                                <th>Materias</th>
                                <th>Unidades y Calificación</th>
                                <th>Calificación Final</th>
                                <th>Calificación Remedial</th>
                            </tr>
                        </thead>
                        <tbody>
                            {calificaciones.map((calificacion, index) => (
                                <tr key={index}>
                                    <td>{calificacion.nombreAsignatura}</td>
                                    <td>
                                        <table className="table table-sm">
                                            <tbody>
                                                {calificacion.unidades.map((unidad, idx) => (
                                                    <tr key={idx}>
                                                        <td><strong>{unidad.unidad}</strong></td>
                                                        <td className={unidad.recuperacion ? "text-warning" : ""}>
                                                            {unidad.recuperacion ? `${unidad.calificacionRecuperacion}` :
                                                                (unidad.calificacion !== 'N/A' ? unidad.calificacion : 'Sin calificar')
                                                            }
                                                        </td>
                                                        {unidad.sinDerecho && (
                                                            <td className="text-danger">Sin derecho</td>
                                                        )}
                                                    </tr>
                                                ))}
                                            </tbody>
                                        </table>
                                    </td>
                                    <td className="text-center">{calificacion.calificacionOrdinaria !== 'N/A' ? calificacion.calificacionOrdinaria : 'Sin calificar'}</td>
                                    <td className="text-center">{calificacion.remedial ? calificacion.calificacionRemedial : 'N/A'}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>

                </>
            )}
            {!error && calificaciones.length === 0 && <p>No hay calificaciones disponibles.</p>}
        </div>
    );
};

export default CalificacionesCuatrimestreActual;
