import React, { useEffect, useState } from 'react';
import { Navigate } from 'react-router-dom';
import userService from '../../services/user.service';
import direccionAcademicaService from '../../services/direccionAcademica.service';
import docentesService from '../../services/docentes.service';
const PlaneacionesDocentes = () => {

    const user = JSON.parse(localStorage.getItem('user'));
    const [activeTab, setActiveTab] = useState('tab1');
    const [docentes, setDocentes] = useState([]);
    const [selectedDocente, setSelectedDocente] = useState('');
    const [activeAsignaturaIndex, setActiveAsignaturaIndex] = useState(0);
    const [asignaturas, setAsignaturas] = useState([]);
    const [alumnos, setAlumnos] = useState([]);
    const [unidadSeleccionada, setUnidadSeleccionada] = useState(null);
    const [porcentajesAsistencia, setPorcentajesAsistencia] = useState([]);
    const [fechasClase, setFechasClase] = useState([]);
    const [estadoInicialAsistencia, setEstadoInicialAsistencia] = useState({});
    const [calificaciones, setCalificaciones] = useState([]);
    const [calificacionesFinales, setCalificacionesFinales] = useState([]);
    const [errorCargandoAsignaturas, setErrorCargandoAsignaturas] = useState(false);


    useEffect(() => {

        userService.getDocentes().then(response => {
            setDocentes(response.data);
        });
    }, []);

    useEffect(() => {
        if (selectedDocente) {
            setErrorCargandoAsignaturas(false);
            direccionAcademicaService.obtenerMateriasAsignadasDocente(selectedDocente)
                .then(response => {
                    console.log(response.data); // Agrega esto para ver la estructura de la respuesta
                    setAsignaturas(response.data);
                })
                .catch(error => {
                    console.error("Error al cargar las asignaturas", error);
                    setErrorCargandoAsignaturas(true);
                    setAsignaturas([]);
                });
        } else {
            setErrorCargandoAsignaturas(false);
            setAsignaturas([]);

        }
    }, [selectedDocente]);



    const handleTabChange = (tabId, event) => {
        event.preventDefault();
        setActiveTab(tabId);
    };

    const formatearFecha = (fechaIso) => {
        if (!fechaIso) return "No hay fecha establecida, dirígete al apartado Unidades";
        const fecha = new Date(fechaIso);

        const opciones = { year: 'numeric', month: 'long', day: 'numeric' };

        return fecha.toLocaleDateString('es-ES', opciones);
    };

    useEffect(() => {
        if (asignaturas.length > 0 && activeTab === 'tab3') {
            const asignaturaSeleccionada = asignaturas[activeAsignaturaIndex];
            const { idCarrera, idCuatrimestre, idGrupo } = asignaturaSeleccionada; // Asegúrate de que estos datos están disponibles

            docentesService.obtenerAlumnosPorCarreraCuatrimestreYGrupo(idCarrera, idCuatrimestre, idGrupo)
                .then(response => {
                    setAlumnos(response.data);
                    console.log(response.data);
                })
                .catch(error => {
                    console.error("Error al obtener alumnos", error);
                });
        }
    }, [activeAsignaturaIndex, activeTab, asignaturas]);

    const formatDate = (dateString) => {
        const [, month, day] = dateString.split('-');
        return `${day}-${month}`;
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
            default:
                return <i className="fas  fa-minus" style={{ color: 'black' }}></i>; //null
        }
    };


    // Asumiendo que docentesService ya está actualizado para llamar al endpoint correcto
    const obtenerPorcentajesAsistencia = async (idUnidadesAsignatura, idGrupo, idAsignacionAsignatura) => {
        try {
            const response = await docentesService.obtenerPorcentajeAsistencia(idUnidadesAsignatura, idGrupo, idAsignacionAsignatura);
            setPorcentajesAsistencia(response.data); // Asume que la respuesta es una lista
        } catch (error) {
            console.error('Error al obtener porcentajes de asistencia', error);
            setPorcentajesAsistencia([]); // Resetear a lista vacía en caso de error
        }
    };

    useEffect(() => {
        if (unidadSeleccionada && asignaturas.length > 0 && activeAsignaturaIndex != null) {
            const asignaturaSeleccionada = asignaturas[activeAsignaturaIndex];
            const idAsignacionAsignatura = asignaturaSeleccionada.idAsignacionAsignatura;

            obtenerPorcentajesAsistencia(unidadSeleccionada, asignaturaSeleccionada.idGrupo, idAsignacionAsignatura);
        }
    }, [unidadSeleccionada, asignaturas, activeAsignaturaIndex]);

    useEffect(() => {
        if (unidadSeleccionada && asignaturas.length > 0) {
            const asignaturaSeleccionada = asignaturas[activeAsignaturaIndex];
            const idGrupo = asignaturaSeleccionada.idGrupo;
            const idAsignacionAsignatura = asignaturaSeleccionada.idAsignacionAsignatura;

            docentesService.obtenerFechasUnidad(unidadSeleccionada, idGrupo, idAsignacionAsignatura)
                .then(response => {
                    setFechasClase(response.data.fechasClase);
                })
                .catch(error => {
                    console.error("Error al obtener fechas de clase", error);
                    setFechasClase([]);
                });
        }
    }, [unidadSeleccionada, asignaturas, activeAsignaturaIndex]);

    useEffect(() => {
        if (unidadSeleccionada) {
            docentesService.obtenerAsistenciasPorUnidadAsignatura(unidadSeleccionada)
                .then(response => {
                    const asistenciasMapeadas = mapearAsistencias(response.data);
                    setEstadoInicialAsistencia(asistenciasMapeadas);
                })
                .catch(error => {
                    console.error("Error al cargar asistencias", error);
                });
        }
    }, [unidadSeleccionada]);

    const mapearAsistencias = (asistencias) => {
        const mapeo = {};
        asistencias.forEach(asistencia => {
            const clave = `${asistencia.matriculaAlumno}-${asistencia.fechaAsistencia}`;
            mapeo[clave] = asistencia.tipoAsistencia;
        });
        return mapeo;
    };

    useEffect(() => {
        if (activeTab === 'tab4' && asignaturas.length > 0) {
            const asignaturaSeleccionada = asignaturas[activeAsignaturaIndex];
            // Asegúrate de que asignaturaSeleccionada contiene los IDs correctos para carrera, cuatrimestre y grupo
            const idCarrera = asignaturaSeleccionada.idCarrera;
            const idCuatrimestre = asignaturaSeleccionada.idCuatrimestre;
            const idGrupo = asignaturaSeleccionada.idGrupo;

            docentesService.obtenerAlumnosConCalificaciones(idCarrera, idCuatrimestre, idGrupo)
                .then(response => {
                    const calificacionesConDetalles = response.data.map(alumno => ({
                        ...alumno,
                        calificaciones: alumno.calificaciones.map(detalle => ({
                            ...detalle,
                            nombreUnidad: asignaturas[activeAsignaturaIndex].unidades?.find(u => u.idUnidadesAsignatura === detalle.idUnidadAsignatura)?.nombreUnidad || 'Unidad no encontrada'
                        }))
                    }));
                    setCalificaciones(calificacionesConDetalles);
                })
                .catch(error => {
                    console.error("Error al obtener las calificaciones", error);
                    setCalificaciones([]); // En caso de error, limpia el estado
                });
        }
    }, [activeTab, activeAsignaturaIndex, asignaturas]);

    useEffect(() => {
        if (activeTab === 'tab4' && asignaturas.length > 0) {
            const asignaturaSeleccionada = asignaturas[activeAsignaturaIndex];
            const idAsignacionAsignatura = asignaturaSeleccionada.idAsignacionAsignatura;

            docentesService.obtenerCalificacionesPorAsignacionAsignatura(idAsignacionAsignatura)
                .then(response => {
                    setCalificacionesFinales(response.data);
                    console.log(response.data);
                })
                .catch(error => {
                    console.error("Error al obtener las calificaciones por asignación de asignatura", error);
                });
        }
    }, [activeTab, asignaturas, activeAsignaturaIndex]);

    if (!user || !user.roles.includes("ROLE_DIRECCION_ACADEMICA")) {
        return <Navigate to="/" />;
    }

    return (
        <div className='container-fluid'>

            <div className="container mt-3 mb-3">
                <div className="row align-items-center">
                    <div className="col-md-6 text-md-right">
                        <strong>Selecciona al docente:</strong>
                    </div>
                    <div className="col-md-6">
                        <select
                            className="form-control"
                            value={selectedDocente}
                            onChange={e => setSelectedDocente(e.target.value)}
                        >
                            <option value="">Selecciona al docente</option>
                            {docentes.map((docente, index) => (
                                <option key={index} value={docente.matricula}>
                                    {docente.matricula} - {docente.nombreCompleto}
                                </option>
                            ))}
                        </select>
                    </div>
                </div>
            </div>



            {selectedDocente && !errorCargandoAsignaturas ? (
                <div className="d-flex align-items-start">
                    <div className="sidebar-docentes nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <header className='text-center'>
                            <h5>Asignaturas del Docente</h5>
                        </header>
                        <hr />
                        {asignaturas.map((asignatura, index) => (
                            <button
                                key={index}
                                className={`nav-link ${index === activeAsignaturaIndex ? 'active' : ''}`}
                                id={`v-pills-${index}-tab`}
                                type="button"
                                role="tab"
                                onClick={() => setActiveAsignaturaIndex(index)}>
                                {asignatura.asignaturas} - Grupo: {asignatura.grupo}
                            </button>
                        ))}
                    </div>

                    <div className="flex-grow-1">
                        <ul className="nav nav-tabs nav-justified mb-3 custom-tabs" id="ex1" role="tablist">
                            <li className="nav-item" role="presentation">
                                <a className={`nav-link ${activeTab === 'tab1' ? 'active' : ''}`} href="#ex3-tabs-1" onClick={(e) => handleTabChange('tab1', e)}>
                                    Planeación Didáctica
                                </a>
                            </li>
                            <li className="nav-item" role="presentation">
                                <a className={`nav-link ${activeTab === 'tab2' ? 'active' : ''}`} href="#ex3-tabs-2" onClick={(e) => handleTabChange('tab2', e)}>
                                    Unidades
                                </a>
                            </li>
                            <li className="nav-item" role="presentation">
                                <a className={`nav-link ${activeTab === 'tab3' ? 'active' : ''}`} href="#ex3-tabs-3" onClick={(e) => handleTabChange('tab3', e)}>
                                    Asistencias
                                </a>
                            </li>
                            <li className="nav-item" role="presentation">
                                <a className={`nav-link ${activeTab === 'tab4' ? 'active' : ''}`} href="#ex4-tabs-4" onClick={(e) => handleTabChange('tab4', e)}>
                                    Calificaciones
                                </a>
                            </li>
                            <li className="nav-item" role="presentation">
                                <a className={`nav-link ${activeTab === 'tab5' ? 'active' : ''}`} href="#ex5-tabs-5" onClick={(e) => handleTabChange('tab5', e)}>
                                    Anexos
                                </a>
                            </li>
                        </ul>

                        <div className="tab-content" id="ex2-content">
                            <div className="tab-content" id="ex2-content">
                                {activeTab === 'tab1' && asignaturas.length > 0 && (
                                    <div className={`tab-pane fade show active`} id="ex3-tabs-1">
                                        <>
                                            <div className="neu-card container-fluid mb-4">

                                                <h2 className="text-center mb-4 mt-3">{asignaturas[activeAsignaturaIndex].asignaturas}</h2>
                                                <hr />
                                                <div className="row">
                                                    <div className="col-md-6 mb-3">
                                                        <div className="neu-card p-3">
                                                            <h4>Detalles</h4>
                                                            <p><strong>Periodo:</strong> Enero - Abril 2024</p>
                                                            <p><strong>Programa Educativo: {asignaturas[activeAsignaturaIndex].programa_educativo}</strong> </p>
                                                            <p><strong>Asignatura:{asignaturas[activeAsignaturaIndex].asignaturas}</strong> </p>
                                                            <p><strong>Grupo:</strong> {asignaturas[activeAsignaturaIndex].grupo}</p>
                                                            <p><strong>Cuatrimestre:</strong> {asignaturas[activeAsignaturaIndex].cuatrimestre}</p>
                                                        </div>
                                                    </div>
                                                    <div className="col-md-6 mb-3">
                                                        <div className="neu-card-highlight p-3">
                                                            <h4>Objetivo de la materia</h4>
                                                            {asignaturas[activeAsignaturaIndex]?.objetivos && asignaturas[activeAsignaturaIndex].objetivos.length > 0 ? (
                                                                <p>{asignaturas[activeAsignaturaIndex].objetivos[0].objetivo}</p>
                                                            ) : (
                                                                <>

                                                                    <p>No hay objetivo</p>
                                                                </>
                                                            )}
                                                        </div>
                                                    </div>
                                                </div>

                                                <div className='row'>
                                                    <div className="col-12 mb-3">
                                                        <div className="neu-card-highlight p-4">
                                                            <h4>Horarios de clase</h4>
                                                            {asignaturas[activeAsignaturaIndex]?.objetivos && asignaturas[activeAsignaturaIndex].objetivos.length > 0 ? (
                                                                <div className="mb-2">
                                                                    <span className="neu-label">Horario establecido:</span>
                                                                    <span>- De {asignaturas[activeAsignaturaIndex].horarios[0].horaInicio} hrs, a {asignaturas[activeAsignaturaIndex].horarios[0].horaFinal} hrs.</span>
                                                                </div>
                                                            ) : (
                                                                <>

                                                                    <p>No hay horarios establecidos por el docente en esta planeación.</p>
                                                                </>
                                                            )}

                                                        </div>
                                                    </div>
                                                </div>

                                                <div className="col-12 mb-3">
                                                    <div className="neu-card p-4">
                                                        <h3>Fechas de Evaluación de Unidades</h3>
                                                        {asignaturas[activeAsignaturaIndex].unidades && asignaturas[activeAsignaturaIndex].unidades.length > 0 ? (
                                                            asignaturas[activeAsignaturaIndex].unidades.map((unidad, index) => (
                                                                <div key={index} className="mb-2">
                                                                    <span className="neu-label">
                                                                        Unidad {unidad.nombreUnidad || index + 1}:{'\u00A0'}
                                                                    </span>
                                                                    <span>
                                                                        {formatearFecha(unidad.fechaEvaluacion)}
                                                                    </span>
                                                                </div>
                                                            ))
                                                        ) : (
                                                            <p>No hay unidades o fechas de evaluación establecidas por el docente.</p>
                                                        )
                                                        }
                                                    </div>
                                                </div>
                                            </div>
                                        </>
                                        {asignaturas[activeAsignaturaIndex].planeaciones && (

                                            <div className="container-fluid planning-card mb-3">
                                                <h2 className='text-center mb-3'>Planeación Didáctica</h2>
                                                <div className="mb-3">
                                                    {asignaturas[activeAsignaturaIndex].planeaciones && asignaturas[activeAsignaturaIndex].planeaciones.length > 0 ? (
                                                        asignaturas[activeAsignaturaIndex].planeaciones.map((planeacion, index) => (
                                                            <div className="input-group" key={index}>
                                                                <span className="input-group-text">Semana {planeacion.noSemana}</span>
                                                                <span className="input-group-text">Fecha Inicio</span>
                                                                <span className='input-group-text'>{planeacion.fechaInicio}</span>

                                                                <span className="input-group-text">Fecha Fin</span>
                                                                <span className='input-group-text'>{planeacion.fechaFin}</span>

                                                                <span
                                                                    className="form-control form-control-custom"
                                                                    placeholder="Descripción del entregable y medio de entrega"
                                                                >
                                                                    {planeacion.descripcion}
                                                                </span>
                                                            </div>
                                                        ))) : (
                                                        <p>No hay fechas establecidas en la planeación de esta asignatura.</p>
                                                    )
                                                    }
                                                </div>

                                            </div>

                                        )}
                                        {asignaturas[activeAsignaturaIndex].proyecto && (
                                            <div className='row'>
                                                <div className="container-fluid mb-3">
                                                    <div className="neu-card p-4">
                                                        <h2 className="text-center mb-4">Proyecto de la Asignatura</h2>
                                                        {asignaturas[activeAsignaturaIndex].proyecto && asignaturas[activeAsignaturaIndex].proyecto.length > 0 ? (
                                                            asignaturas[activeAsignaturaIndex].proyecto.map((proyecto, index) => (
                                                                <div className="neu-card-highlight p-3 mb-3" key={index}>
                                                                    <h5>Título del Proyecto: {proyecto.titulo}<span className="project-title"></span></h5>
                                                                    <p>Objetivo del Proyecto: {proyecto.objetivo}</p>
                                                                    <p>Fecha del Proyecto: {proyecto.fecha}</p>
                                                                </div>
                                                            ))) : (
                                                            <p>No hay un proyecto establecido para esta asignatura.</p>
                                                        )

                                                        }
                                                    </div>
                                                </div>
                                            </div>
                                        )}
                                    </div>
                                )}
                            </div>

                            {activeTab === 'tab2' && (
                                <div className={`tab-pane fade show active`} id="ex3-tabs-2">
                                    <div className="neu-card p-4">
                                        <h2 className="text-center mb-4">Detalles de la Unidad</h2>
                                        <div className="mb-3">
                                            <p><strong>Periodo:</strong> Enero - Abril 2024</p>
                                            <p><strong>Programa Educativo: {asignaturas[activeAsignaturaIndex].programa_educativo}</strong> </p>
                                            <p><strong>Asignatura:{asignaturas[activeAsignaturaIndex].asignaturas}</strong> </p>
                                            <p><strong>Grupo:</strong> {asignaturas[activeAsignaturaIndex].grupo}</p>
                                            <p><strong>Cuatrimestre:</strong> {asignaturas[activeAsignaturaIndex].cuatrimestre}</p>
                                        </div>
                                        <div className="neu-card-highlight p-3 mb-3">
                                            {asignaturas[activeAsignaturaIndex].unidades.map((unidad, index) => (
                                                <div key={index} className="mb-3">
                                                    <p><strong>Unidad:</strong> {unidad.nombreUnidad}</p>
                                                    <p><strong>Fecha de Inicio:</strong> {unidad.fechaInicio || "El docente no ha establecido una fecha de Inicio de esta Unidad."}</p>
                                                    <p><strong>Fecha de Cierre:</strong> {unidad.fechaCierre || "El docente no ha establecido una fecha de Cierre de esta Unidad."}</p>
                                                    <p><strong>Valor de la unidad:</strong> {unidad.porcentaje || "N/A"}%</p>
                                                    <p><strong>Total de Horas de la Unidad:</strong> {unidad.totalHorasUnidad || "N/A"}</p>
                                                    <p><strong>Total de clases activas establecidas por el docente:</strong> {unidad.clasesActivas || "El docente no ha establecido la cantidad de clases activas en la Unidad."}</p>
                                                    {
                                                        unidad.fechaEvaluacion
                                                            ? <p><strong>Fecha de Evaluación de la unidad:</strong> {unidad.fechaEvaluacion}</p>
                                                            : <p>No hay una fecha de evaluación establecida para esta asignatura.</p>
                                                    }

                                                    <hr />
                                                </div>
                                            ))}
                                        </div>
                                    </div>
                                </div>
                            )}

                            <div className={`tab-pane fade ${activeTab === 'tab3' ? 'show active' : ''}`} id="ex3-tabs-3">

                                <select
                                    value={unidadSeleccionada ? unidadSeleccionada.idUnidadesAsignatura : ''}
                                    onChange={(e) => setUnidadSeleccionada(e.target.value)}
                                >
                                    <option value="">Selecciona una Unidad</option>
                                    {asignaturas[activeAsignaturaIndex]?.unidades?.map(unidad => (
                                        <option key={unidad.idUnidadesAsignatura} value={unidad.idUnidadesAsignatura}>
                                            {unidad.nombreUnidad}
                                        </option>
                                    ))}
                                </select>


                                {unidadSeleccionada ? (
                                    alumnos && alumnos.length > 0 ? (
                                        <div className="table-responsive-neu">
                                            <table className="table table-neu">
                                                <thead>
                                                    <tr>
                                                        <th>Matrícula</th>
                                                        <th>Nombre</th>
                                                        {fechasClase.map((fecha, index) => (
                                                            <th key={index}>{formatDate(fecha)}</th>
                                                        ))}
                                                        <th>% Asistencias</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {alumnos.map((alumno, indexAlumno) => (
                                                        <tr key={indexAlumno}>
                                                            <td>{alumno.matricula}</td>
                                                            <td>{`${alumno.nombre} ${alumno.ap_paterno} ${alumno.ap_materno}`}</td>
                                                            {fechasClase.map((fecha, indexFecha) => {
                                                                const claveAsistencia = `${alumno.matricula}-${fecha}`;
                                                                const tipoAsistencia = estadoInicialAsistencia[claveAsistencia] || 0;
                                                                return (
                                                                    <td key={indexFecha}>
                                                                        <IconoAsistencia estado={tipoAsistencia} />
                                                                    </td>
                                                                );
                                                            })}

                                                            <td>{(porcentajesAsistencia.find(p => p.matriculaAlumno === alumno.matricula)?.porcentajeAsistencia ?? 0).toFixed(2)}%</td>

                                                        </tr>
                                                    ))}
                                                </tbody>
                                            </table>
                                        </div>
                                    ) : (
                                        <p>No hay alumnos disponibles.</p>
                                    )
                                ) : (
                                    <p>Selecciona una unidad primero para poder ver la lista de asistencia.</p>
                                )}
                            </div>
                            <div className={`tab-pane fade ${activeTab === 'tab4' ? 'show active' : ''}`} id="ex4-tabs-4">
                                <p>Periodo: Enero - Abril 2024</p>

                                {calificaciones.length > 0 ? (
                                    <div className="table-responsive-neu">
                                        <table className="table table-neu">
                                            <thead>
                                                <tr>
                                                    <th>Matrícula</th>
                                                    <th>Nombre</th>
                                                    {asignaturas[activeAsignaturaIndex]?.unidades?.map((unidad, indexUnidad) => (
                                                        <th key={indexUnidad}>{unidad.nombreUnidad}</th>
                                                    ))}
                                                    <th>Calificación Final</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {calificaciones.map((alumno, indexAlumno) => (
                                                    <tr key={indexAlumno}>
                                                        <td>{alumno.matricula}</td>
                                                        <td>{`${alumno.nombre} ${alumno.apPaterno} ${alumno.apMaterno}`}</td>
                                                        {asignaturas[activeAsignaturaIndex]?.unidades?.map((unidad, indexUnidad) => {
                                                            const calificacion = alumno.calificaciones.find(cal => cal.idUnidadAsignatura === unidad.idUnidadesAsignatura);

                                                            // Decide si mostrar calificación de recuperación o ordinaria basado en el valor de calificacionRecuperacion
                                                            let contenidoCalificacion;
                                                            if (calificacion && calificacion.calificacionRecuperacion > 0) {
                                                                contenidoCalificacion = (
                                                                    <p style={{ color: 'red' }}>
                                                                        {calificacion.calificacionRecuperacion}
                                                                    </p>
                                                                );
                                                            } else {
                                                                contenidoCalificacion = (
                                                                    <p>
                                                                        {calificacion ? calificacion.calificacionOrdinaria : ''}
                                                                    </p>
                                                                );
                                                            }

                                                            return (
                                                                <td key={`cal-${indexUnidad}`}>
                                                                    {contenidoCalificacion}
                                                                </td>
                                                            );
                                                        })}

                                                        <td>
                                                            {calificacionesFinales.find(final => final.matriculaAlumno === alumno.matricula)?.calificacionOrdinaria || 'N/A'}
                                                        </td>
                                                    </tr>
                                                ))}




                                            </tbody>
                                        </table>
                                    </div>
                                ) : (
                                    <p>No hay calificaciones disponibles.</p>
                                )}
                            </div>

                            <div className={`tab-pane fade ${activeTab === 'tab5' ? 'show active' : ''}`} id="ex5-tabs-5">
                                <p>Periodo: Enero - Abril 2024</p>
                                aqui vacio por el momento
                            </div>
                        </div>
                    </div>
                </div>
            ) : <div className="alert alert-warning" role="alert">
                El docente no tiene materias asignadas
            </div>}
        </div>
    );
}

export default PlaneacionesDocentes;