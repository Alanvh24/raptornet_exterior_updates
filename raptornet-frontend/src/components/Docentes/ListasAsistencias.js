import React, { useEffect, useState } from 'react';
import { Navigate } from 'react-router-dom';
import docentesService from '../../services/docentes.service';

const ListasAsistencias = () => {
    const [asignaturas, setAsignaturas] = useState([]);
    const [activeAsignaturaIndex, setActiveAsignaturaIndex] = useState(0);
    const [asistencias, setAsistencias] = useState([]);
    const [selectedAsignaturaId, setSelectedAsignaturaId] = useState(null);
    const [transformadas, setTransformadas] = useState({});
    const [fechasUnicas, setFechasUnicas] = useState([]);

    const user = JSON.parse(localStorage.getItem('user'));

    const formatDate = (dateString) => {
        const [, month, day] = dateString.split('-');
        return `${day}-${month}`;
    };

    useEffect(() => {
        if (user && user.roles.includes("ROLE_DOCENTES") && asignaturas.length === 0) {
            docentesService.obtenerCarrerasAsignadas().then(response => {
                setAsignaturas(response.data);
            }).catch(error => {
                console.log(error);
            });
        }
    }, [user, asignaturas.length]);


    useEffect(() => {
        const asignatura = asignaturas.find(a => a.idAsignatura === selectedAsignaturaId);
        if (asignatura && asignatura.idGrupo && asignatura.idAsignacionAsignatura) {
            // La llamada a la API solo se realiza si la asignatura seleccionada tiene todos los datos necesarios
            docentesService.listaAsistenciasGeneral(asignatura.idAsignatura, asignatura.idGrupo, asignatura.idAsignacionAsignatura)
                .then(response => {
                    setAsistencias(response.data);
                    console.log(response.data);
                })
                .catch(error => {
                    console.error("Error al obtener asistencias", error);
                    setAsistencias([]); // Manejo de errores
                });
        }
    }, [selectedAsignaturaId, asignaturas]);

    useEffect(() => {
        const transformadas = transformarAsistencias(asistencias);
        setTransformadas(transformadas);

        const fechas = [...new Set(asistencias.map(a => a.fechaAsistencia))].sort();
        setFechasUnicas(fechas);
    }, [asistencias]);

    const handleAsignaturaChange = (index, event) => {
        event.preventDefault();
        setActiveAsignaturaIndex(index);
        const asignaturaId = asignaturas[index]?.idAsignatura;
        setSelectedAsignaturaId(asignaturaId);
    };


    const transformarAsistencias = (asistencias) => {
        const asistenciasPorAlumno = {};

        // Agrupar asistencias por alumno y luego por fecha
        asistencias.forEach(asistencia => {
            const { matriculaAlumno, fechaAsistencia, tipoAsistencia } = asistencia;

            if (!asistenciasPorAlumno[matriculaAlumno]) {
                asistenciasPorAlumno[matriculaAlumno] = {
                    fechas: {}
                };
            }

            // Guardar el tipo de asistencia para cada fecha
            asistenciasPorAlumno[matriculaAlumno].fechas[fechaAsistencia] = tipoAsistencia;
        });

        return asistenciasPorAlumno;
    };

    const IconoAsistencia = ({ estado }) => {
        switch (estado) {
            case 1:
                return <i className="fas fa-check-circle" style={{ color: 'green' }}></i>; // Presente
            case 2:
                return <i className="fas fa-times-circle" style={{ color: 'red' }}></i>; // Ausente
            case 3:
                return <i className="fas fa-user-doctor" style={{ color: 'orange' }}></i>; // Justificado
            case 4:
                return <i className="fas fa-hourglass-half" style={{ color: '#517b99' }}></i>; // Retardo
            case 5:
                return <i className="fas fa-thumbtack" style={{ color: '#e7017f' }}></i>; // Asueto
            default:
                return <i className="fas fa-minus" style={{ color: 'black' }}></i>; //null
        }
    };


    if (!user || !user.roles.includes("ROLE_DOCENTES")) {
        return <Navigate to="/" />;
    }

    return (
        <div className='container-fluid'>
            <div className="d-flex align-items-start">
                <div className="sidebar-docentes nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <header className='text-center'>
                        <h5>Mis asignaturas</h5>
                    </header>
                    <hr />
                    {asignaturas.map((asignatura, index) => (
                        <button key={index} className={`nav-link ${index === activeAsignaturaIndex ? 'active' : ''}`} type="button" onClick={(e) => handleAsignaturaChange(index, e)}>
                            {asignatura.programa_educativo} - {asignatura.asignaturas}
                        </button>
                    ))}
                </div>

                <div className="flex-grow-1">
                    {/* Simbología */}
                    <div className="simbologia-container">
                        <p className='mt-3'>Simbología:</p>

                    </div>

                    {/* Tabla de asistencias */}
                    <div className="table-responsive-neu">
                        <table className="table table-neu">
                            <thead>
                                <tr>
                                    <th>Matrícula</th>
                                    {fechasUnicas.map(fecha => <th key={fecha}>{formatDate(fecha)}</th>)}
                                </tr>
                            </thead>
                            <tbody>
                                {Object.entries(transformadas).map(([matricula, info]) => (
                                    <tr key={matricula}>
                                        <td>{matricula}</td>
                                        {fechasUnicas.map(fecha => (
                                            <td key={fecha}>
                                                <IconoAsistencia estado={info.fechas[fecha] || 0} />
                                            </td>
                                        ))}
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default ListasAsistencias;
