import React, { useEffect, useState } from 'react';
import { Navigate } from 'react-router-dom';
import docentesService from '../../services/docentes.service';
import Swal from "sweetalert2";

const ListaExamenesRemedial = () => {
    const [activeAsignaturaIndex, setActiveAsignaturaIndex] = useState(0);
    const [asignaturas, setAsignaturas] = useState([]);
    const [alumnosRemedial, setAlumnosRemedial] = useState([]); // Nuevo estado para alumnos en remedial
    const user = JSON.parse(localStorage.getItem('user'));
    const [cargaInicialCompleta, setCargaInicialCompleta] = useState(false);
    const [calificacionEditada, setCalificacionEditada] = useState({});



    useEffect(() => {
        if (user && user.roles.includes("ROLE_DOCENTES") && !cargaInicialCompleta) {
            docentesService.obtenerCarrerasAsignadas()
                .then(response => {
                    setAsignaturas(response.data);
                    if (response.data.length > 0) {
                        setActiveAsignaturaIndex(0);
                        cargarAlumnosRemedial(response.data[0].idAsignacionAsignatura); // Asume que tu respuesta incluye este id
                        setCargaInicialCompleta(true);
                    }
                })
                .catch(error => {
                    console.error("Error al obtener carreras asignadas:", error);
                });
        }
    }, [user, cargaInicialCompleta]);

    const cargarAlumnosRemedial = (idAsignacionAsignatura) => {
        docentesService.listaAlumnosRemedial(idAsignacionAsignatura)
            .then(response => {
                if (Array.isArray(response.data)) {
                    setAlumnosRemedial(response.data);
                    console.log(response.data);
                } else {
                    Swal.fire("Atención", "No se encontraron datos de alumnos en situación de examen remedial para esta materia.", "info");
                    setAlumnosRemedial([]);
                }
            })
            .catch(error => {
                console.error("Error al obtener alumnos remedial:", error);
                Swal.fire("Error", "Ocurrió un error al obtener los datos de alumnos en situación de examen remedial.", "error");
                setAlumnosRemedial([]);
            });
    };

    const handleAsignaturaChange = (index) => {
        setActiveAsignaturaIndex(index);
        const asignaturaSeleccionada = asignaturas[index];
        cargarAlumnosRemedial(asignaturaSeleccionada.idAsignacionAsignatura);
    };

    const actualizarEstadoFirma = (idCalificacion, estadoFirma) => {
        setAlumnosRemedial(alumnosRemedial.map(calificacion => {
            if (calificacion.idCalificaciones === idCalificacion) {
                return { ...calificacion, firmaRemedial: estadoFirma };
            }
            return calificacion;
        }));
    };

    const firmarCalificacionRemedialHandler = (idCalificacion, nombreAlumno) => {
        Swal.fire({
            title: '¿Estás seguro?',
            text: `Estás a punto de firmar la calificación de "${nombreAlumno}". Confirmar para firmar la calificación final.`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, firmar!'
        }).then((result) => {
            if (result.isConfirmed) {
                docentesService.firmarCalificacionRemedial(idCalificacion)
                    .then(response => {
                        Swal.fire(
                            'Firmada!',
                            'La calificación ha sido firmada exitosamente.',
                            'success'
                        );

                        actualizarEstadoFirma(idCalificacion, response.data.firmaRemedial);

                        console.log(response.data);
                    })
                    .catch(error => {
                        Swal.fire(
                            'Error!',
                            'Hubo un error al intentar firmar la calificación final.',
                            'error'
                        );
                        console.error("Error al firmar la calificación final", error);
                    });
            }
        });
    };

    const handleCalificacionChange = (event, idCalificaciones) => {
        setCalificacionEditada({
            ...calificacionEditada,
            [idCalificaciones]: event.target.value
        });
    };

    const actualizarCalificacionRemedialHandler = (idCalificaciones) => {
        const calificacion = calificacionEditada[idCalificaciones];
        const alumnoSeleccionado = alumnosRemedial.find(alumno => alumno.idCalificaciones === idCalificaciones);
        if (calificacion !== undefined && alumnoSeleccionado) {
            docentesService.actualizarCalificacionRemedial(alumnoSeleccionado.matricula, alumnoSeleccionado.idAsignacionAsignatura, calificacion)
                .then(response => {
                    Swal.fire(
                        'Calificacion Cargada!',
                        'La calificación ha sido cargada exitosamente.',
                        'success'
                    );
                    console.log("Calificacion Cargada exitosamente")
                })
                .catch(error => {
                    // Manejar errores aquí
                });
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
                        <button key={index} className={`nav-link ${index === activeAsignaturaIndex ? 'active' : ''}`} id={`v-pills-${index}-tab`} type="button" role="tab" onClick={(e) => handleAsignaturaChange(index, e)}>
                            {asignatura.programa_educativo} - {asignatura.asignaturas}
                        </button>
                    ))}

                </div>

                {alumnosRemedial.length > 0 ? (
                    <div className='container mt-4'>
                        <div className="table-responsive-neu">
                            <h4>Alumnos en Examen Remedial</h4>
                            <table className='table table-neu'>
                                <thead>
                                    <tr>
                                        <th>Matrícula</th>
                                        <th>Nombre</th>
                                        <th>Calificación Ordinaria</th>
                                        <th>Calificación Remedial</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {alumnosRemedial.map((alumno, index) => (
                                        <tr key={index}>
                                            <td>{alumno.matricula}</td>
                                            <td>{`${alumno.nombre} ${alumno.ap_paterno} ${alumno.ap_materno}`}</td>
                                            <td>{alumno.calificacionOrdinaria}</td>
                                            <td>
                                                {alumno.firmaRemedial ? (
                                                    <span>{alumno.calificacionRemedial}</span>
                                                ) : (
                                                    <>
                                                        <input
                                                            type="number"
                                                            value={calificacionEditada[alumno.idCalificaciones] ?? alumno.calificacionRemedial ?? ''}
                                                            onChange={e => handleCalificacionChange(e, alumno.idCalificaciones)}
                                                            className="form-control mb-2"
                                                        />

                                                        <button
                                                            className='btn btn-primary'
                                                            onClick={() => actualizarCalificacionRemedialHandler(alumno.idCalificaciones)}
                                                        >
                                                            Guardar Calificación
                                                        </button>
                                                    </>
                                                )}
                                            </td>
                                            <td>
                                                {alumno.firmaRemedial ? (
                                                    <span>Calificación Firmada</span>
                                                ) : (
                                                    <button className='btn btn-warning' onClick={() => firmarCalificacionRemedialHandler(alumno.idCalificaciones, `${alumno.nombre} ${alumno.ap_paterno} ${alumno.ap_materno}`)}>Firmar Calificación</button>
                                                )}
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>

                            </table>
                        </div>
                    </div>
                ) : (
                    <div className='mt-4'>
                        <h4>Alumnos en Examen Remedial</h4>
                        <p>No se encontraron alumnos en situación de examen remedial.</p>
                    </div>
                )}
            </div>
        </div>
    );
}

export default ListaExamenesRemedial;