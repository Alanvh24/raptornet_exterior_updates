import React, { useEffect, useRef, useState } from 'react';
import { Navigate } from 'react-router-dom';
import docentesService from '../../services/docentes.service';
import Swal from 'sweetalert2';
import * as XLSX from 'xlsx';

const AsignaturasGeneral = () => {
    const [activeAsignaturaIndex, setActiveAsignaturaIndex] = useState(0);
    const [activeTab, setActiveTab] = useState('tab1');
    const [asignaturas, setAsignaturas] = useState([]);
    const [selectedUnidad, setSelectedUnidad] = useState(null);
    const [inputs, setInputs] = useState([{ noSemana: 1, fechaInicio: '', fechaFin: '', descripcion: '', editable: true }]);
    const user = JSON.parse(localStorage.getItem('user'));
    const [cargaInicialCompleta, setCargaInicialCompleta] = useState(false);
    const [objetivoAsignatura, setObjetivoAsignatura] = useState('');
    const [diaClase, setDiaClase] = useState('');
    const [horaInicio, setHoraInicio] = useState('');
    const [horaFinal, setHoraFinal] = useState('');
    const [mostrarFormularioHorario, setMostrarFormularioHorario] = useState(false);
    const [fechaEvaluacion, setFechaEvaluacion] = useState('');
    const [proyectoTitulo, setProyectoTitulo] = useState('');
    const [proyectoObjetivo, setProyectoObjetivo] = useState('');
    const [proyectoFecha, setProyectoFecha] = useState('');
    const [alumnos, setAlumnos] = useState([]);
    const [unidadSeleccionada, setUnidadSeleccionada] = useState(null);
    const [porcentajesAsistencia, setPorcentajesAsistencia] = useState([]);
    const [fechasClase, setFechasClase] = useState([]);
    const [estadoInicialAsistencia, setEstadoInicialAsistencia] = useState({});
    const [calificaciones, setCalificaciones] = useState([]);
    const [calificacionesFinales, setCalificacionesFinales] = useState([]);
    const [tieneError, setTieneError] = useState(false);
    const [mensajeError, setMensajeError] = useState('');


    const formatDate = (dateString) => {
        const [, month, day] = dateString.split('-');
        return `${day}-${month}`;
    };

    const fechaFormato = (dateString) => {
        if (!dateString) return 'Fecha no definida, dirígete al apartado de Unidades.';

        const meses = [
            'enero', 'febrero', 'marzo', 'abril',
            'mayo', 'junio', 'julio', 'agosto',
            'septiembre', 'octubre', 'noviembre', 'diciembre'
        ];

        const [year, month, day] = dateString.split('-');
        const nombreMes = meses[parseInt(month, 10) - 1]; // -1 porque el arreglo comienza en 0

        return `${day} de ${nombreMes} del ${year}`;
    };

    const obtenerAlumnosActualizados = () => {
        const { idCarrera, idCuatrimestre, idGrupo } = asignaturas[activeAsignaturaIndex];
        docentesService.obtenerAlumnosPorCarreraCuatrimestreYGrupo(idCarrera, idCuatrimestre, idGrupo)
            .then(response => {
                setAlumnos(response.data);
            })
            .catch(error => {
                console.error("Error al obtener alumnos actualizados", error);
            });
    };

    const firmarCalificacion = (matricula) => {
        Swal.fire({
            title: '¿Estás seguro?',
            text: "Estás a punto de firmar la calificación.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, firmar!'
        }).then((result) => {
            if (result.isConfirmed) {
                docentesService.firmarAsistenciasCursos(matricula)
                    .then(response => {
                        Swal.fire(
                            'Firmado!',
                            'La calificación ha sido firmada con éxito.',
                            'success'
                        );
                        obtenerAlumnosActualizados()
                    })
                    .catch(error => {
                        Swal.fire(
                            'Error!',
                            'Ocurrió un error al firmar la calificación.',
                            'error'
                        );
                        // Manejo de errores
                        console.error("Error al firmar la calificación", error);
                    });
            }
        });
    };

    useEffect(() => {
        if (user && user.roles.includes("ROLE_DOCENTES") && !cargaInicialCompleta) {
            docentesService.obtenerCarrerasAsignadas()
                .then(response => {
                    setAsignaturas(response.data);
                    if (response.data.length > 0) {
                        const primeraAsignatura = response.data[0];
                        setObjetivoAsignatura(primeraAsignatura.objetivos.length > 0 ? primeraAsignatura.objetivos[0].objetivo : '');
                        const planeacionesDeAsignatura = primeraAsignatura.planeaciones || [];
                        setActiveAsignaturaIndex(0);
                        setInputs(planeacionesDeAsignatura.map(planeacion => ({
                            noSemana: planeacion.noSemana,
                            fechaInicio: planeacion.fechaInicio,
                            fechaFin: planeacion.fechaFin,
                            descripcion: planeacion.descripcion,
                            editable: false
                        })));
                        setCargaInicialCompleta(true);
                    }
                    console.log(response.data);
                    setTieneError(false); // Resetea el estado de error en caso de éxito
                })
                .catch(error => {
                    console.log(error);
                    setTieneError(true); // Indica que hay un error
                    const hoy = new Date().toLocaleDateString('es-ES', { year: 'numeric', month: 'long', day: 'numeric' });
                    setMensajeError(`No tienes materias asignadas al día de hoy: ${hoy}`);
                });
        }
    }, [user, cargaInicialCompleta]);

    useEffect(() => {
        if (asignaturas.length > 0 && activeTab === 'tab3') {
            const asignaturaSeleccionada = asignaturas[activeAsignaturaIndex];
            const { idCarrera, idCuatrimestre, idGrupo } = asignaturaSeleccionada; // Asegúrate de que estos datos están disponibles

            docentesService.obtenerAlumnosPorCarreraCuatrimestreYGrupo(idCarrera, idCuatrimestre, idGrupo)
                .then(response => {
                    setAlumnos(response.data);
                })
                .catch(error => {
                    console.error("Error al obtener alumnos", error);
                });
        }
    }, [activeAsignaturaIndex, activeTab, asignaturas]);


    const handleInputChange = (index, event, field) => {
        const values = [...inputs];
        const newValue = event.target.value;

        values[index][field] = newValue;
        setInputs(values);
    };


    const handleAddClick = () => {
        // Calcula el número de la siguiente semana basándose en el número más alto actual.
        const nextWeekNumber = inputs.length > 0 ? Math.max(...inputs.map(input => input.noSemana)) + 1 : 1;
        setInputs([
            ...inputs,
            { noSemana: nextWeekNumber, fechaInicio: '', fechaFin: '', descripcion: '', editable: true }
        ]);
    };


    // const handleRemoveClick = () => {
    //     setInputs(inputs.slice(0, -1));
    // };

    const handleTabChange = (tabId, event) => {
        event.preventDefault();
        setActiveTab(tabId);
    };

    const handleAsignaturaChange = (index, event) => {
        event.preventDefault();
        setActiveAsignaturaIndex(index);
        // Resetea la selección de la unidad al cambiar de asignatura
        setSelectedUnidad(null);
        setUnidadSeleccionada(null); // Asegúrate de que también se reinicia este estado si es diferente de `selectedUnidad`
        setAlumnos([]); // Resetea la lista de alumnos para la nueva asignatura
        setPorcentajesAsistencia([]); // Resetea los porcentajes de asistencia
        setFechasClase([]); // Resetea las fechas de clase
        setCalificaciones([]);
        const asignaturaSeleccionada = asignaturas[index];

        const planeacionesDeAsignatura = asignaturaSeleccionada.planeaciones || [];
        setInputs(planeacionesDeAsignatura.map(planeacion => ({
            noSemana: planeacion.noSemana, // Asegura que este campo se mapea correctamente
            fechaInicio: planeacion.fechaInicio,
            fechaFin: planeacion.fechaFin,
            descripcion: planeacion.descripcion,
            editable: false // Estas planeaciones no deben ser editables
        })));

        // Actualiza el estado del objetivo de la asignatura según la asignatura seleccionada
        if (asignaturaSeleccionada.objetivos && asignaturaSeleccionada.objetivos.length > 0) {
            setObjetivoAsignatura(asignaturaSeleccionada.objetivos[0].objetivo);
        } else {
            setObjetivoAsignatura(''); // Resetea el valor si la asignatura seleccionada no tiene objetivos
        }
    };

    const handleUnidadChange = (event) => {
        const unidadId = Number(event.target.value);
        const unidadSeleccionada = asignaturas[activeAsignaturaIndex].unidades.find(unidad => unidad.idUnidadesAsignatura === unidadId);
        setSelectedUnidad(unidadSeleccionada);
        setFechaEvaluacion(unidadSeleccionada.fechaEvaluacion || '');
    };

    const confirmarYEnviarDatos = async () => {
        const resultado = await Swal.fire({
            title: '¿Estás seguro?',
            text: "Confirma para guardar los cambios.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, guardar cambios!'
        });

        if (resultado.isConfirmed) {
            const fechaInicio = new Date(selectedUnidad.fechaInicio);
            const fechaCierre = new Date(selectedUnidad.fechaCierre);

            // Verifica que la fecha de inicio es anterior a la fecha de cierre
            if (fechaInicio >= fechaCierre) {
                Swal.fire('Error', 'La fecha de inicio debe ser anterior a la fecha de cierre.', 'error');
                return;
            }

            handleSubmit();
        }
    };


    const handleSubmit = async () => {

        if (!selectedUnidad || !user) {
            Swal.fire('Información faltante', 'Debe seleccionar una unidad y estar autenticado.', 'warning');
            return; // Detiene la ejecución si no se seleccionó una unidad o si no hay usuario autenticado
        }

        // Verificación de campos requeridos
        const camposRequeridos = [
            { valor: selectedUnidad.fechaInicio, mensaje: 'La fecha de inicio es obligatoria.' },
            { valor: selectedUnidad.fechaCierre, mensaje: 'La fecha de cierre es obligatoria.' },
            { valor: selectedUnidad.clasesActivas, mensaje: 'El total de clases activas es obligatorio.' },
        ];

        for (let campo of camposRequeridos) {
            if (!campo.valor) {
                Swal.fire('Información incompleta', campo.mensaje, 'warning');
                return; // Detiene la ejecución si alguno de los campos está vacío
            }
        }
        if (selectedUnidad && user) {
            const data = {
                matriculaDocente: user.matricula, //la matrícula está en el objeto user
                idUnidadesAsignatura: selectedUnidad.idUnidadesAsignatura,
                grupo: asignaturas[activeAsignaturaIndex].grupo, //ID de grupo 
                fechaInicio: selectedUnidad.fechaInicio,
                fechaCierre: selectedUnidad.fechaCierre,
                fechaEvaluacion: selectedUnidad.fechaEvaluacion,
                status: true,
                clasesActivas: selectedUnidad.clasesActivas,
            };

            try {
                const response = await docentesService.crearActualizarUnidad(data);
                Swal.fire(
                    '¡Guardado!',
                    response.data,
                    'success'
                );
            } catch (error) {
                console.error("Error al actualizar la unidad", error.response);
                Swal.fire(
                    'Error',
                    error.response.data,
                    'error'
                );
            }
        }
    };

    const handleFechaInicioChange = (event) => {
        setSelectedUnidad(prevUnidad => ({
            ...prevUnidad,
            fechaInicio: event.target.value
        }));
    };

    const handleFechaCierreChange = (event) => {
        setSelectedUnidad(prevUnidad => ({
            ...prevUnidad,
            fechaCierre: event.target.value
        }));
    };

    const handleFechaEvaluacionChange = (event) => {
        const newFechaEvaluacion = event.target.value;
        setFechaEvaluacion(newFechaEvaluacion);
        setSelectedUnidad(prevUnidad => ({
            ...prevUnidad,
            fechaEvaluacion: newFechaEvaluacion,
        }));
    };

    const handleClasesActivasChange = (event) => {
        setSelectedUnidad(prevUnidad => ({
            ...prevUnidad,
            clasesActivas: event.target.value
        }));
    };

    const ocultarHorario = (event) => {
        setDiaClase('');
        setHoraInicio('');
        setHoraFinal('');
        setMostrarFormularioHorario(false);
    }

    const guardarPlaneacion = async (index) => {

        const planeacion = inputs[index];

        // Validación de campos requeridos
        if (!planeacion.fechaInicio || !planeacion.fechaFin || !planeacion.descripcion.trim()) {
            Swal.fire('Información incompleta', 'Todos los campos son obligatorios.', 'warning');
            return; // Detiene la ejecución si algún campo está vacío
        }

        // Convertir las fechas a objetos Date para comparación
        const fechaInicio = new Date(planeacion.fechaInicio);
        const fechaFin = new Date(planeacion.fechaFin);

        if (fechaInicio > fechaFin) {
            Swal.fire('La fecha de inicio no puede ser posterior a la fecha de fin.', 'warning');
            return; // Detiene el guardado si la fecha de inicio es posterior a la fecha de fin
        }

        if (user && asignaturas[activeAsignaturaIndex] && planeacion) {
            const datosPlaneacion = {
                matriculaDocente: user.matricula,
                idAsignatura: asignaturas[activeAsignaturaIndex].idAsignatura, // Asegúrate de que este campo corresponde al backend
                idGrupo: asignaturas[activeAsignaturaIndex].idGrupo, // Verifica que este campo sea correcto y corresponda al backend
                noSemana: planeacion.noSemana,
                fechaInicio: planeacion.fechaInicio,
                fechaFin: planeacion.fechaFin,
                descripcion: planeacion.descripcion,
            };

            try {
                await docentesService.crearActualizarPlaneacion(datosPlaneacion);
                // Actualiza el estado para marcar la planeación como no editable
                const updatedInputs = [...inputs];
                updatedInputs[index] = { ...updatedInputs[index], editable: false }; // Marcar como no editable después de guardar
                setInputs(updatedInputs);

                // Actualiza el estado de asignaturas con los cambios
                const updatedAsignaturas = [...asignaturas];
                updatedAsignaturas[activeAsignaturaIndex].planeaciones = updatedInputs;
                setAsignaturas(updatedAsignaturas);

                Swal.fire('¡Éxito!', 'La planeación ha sido guardada correctamente.', 'success');
            } catch (error) {
                console.error("Error al guardar la planeación", error);
                Swal.fire('Error', 'No se pudo guardar la planeación. Intente de nuevo.', 'error');
            }
        } else {
            Swal.fire('Información faltante', 'Debe seleccionar un usuario y una asignatura.', 'warning');
        }
    };


    const guardarObjetivoAsignatura = async () => {

        if (!objetivoAsignatura.trim()) {
            Swal.fire('Información incompleta', 'El campo objetivo no debe estar vacío.', 'warning');
            return;
        }

        if (user && asignaturas[activeAsignaturaIndex]) {
            const idAsignatura = asignaturas[activeAsignaturaIndex].idAsignatura;
            const idGrupo = asignaturas[activeAsignaturaIndex].idGrupo;
            const datosObjetivo = {
                idAsignatura: idAsignatura,
                idGrupo: idGrupo,
                objetivo: objetivoAsignatura,
                matriculaDocente: user.matricula, // Asumiendo que la matrícula del docente está en el objeto user
            };

            try {
                await docentesService.crearObjetivoAsignatura(datosObjetivo);
                Swal.fire('¡Éxito!', 'Objetivo de la asignatura creado correctamente.', 'success');

                // Actualiza el estado de las asignaturas con el nuevo objetivo
                const nuevasAsignaturas = [...asignaturas];
                if (!nuevasAsignaturas[activeAsignaturaIndex].objetivos) {
                    nuevasAsignaturas[activeAsignaturaIndex].objetivos = [];
                }
                nuevasAsignaturas[activeAsignaturaIndex].objetivos.push({ objetivo: objetivoAsignatura }); // Asume que el formato coincide con tu estado
                setAsignaturas(nuevasAsignaturas);

                // Opcional: limpiar el campo del objetivo después de un éxito
                setObjetivoAsignatura('');
            } catch (error) {
                console.error("Error al crear el objetivo", error);
                Swal.fire('Error', 'No se pudo crear el objetivo. Intente de nuevo.', 'error');
            }
        } else {
            Swal.fire('Información faltante', 'Debe seleccionar una asignatura y estar autenticado.', 'warning');
        }
    };

    const enviarHorarioClase = async () => {
        if (!diaClase || !horaInicio || !horaFinal) {
            Swal.fire('Error', 'Por favor, completa todos los campos para el horario.', 'error');
            return;
        }

        const datosHorario = {
            diaClase,
            horaInicio,
            horaFinal,
            idAsignatura: asignaturas[activeAsignaturaIndex].idAsignatura,
            idGrupo: asignaturas[activeAsignaturaIndex].grupo,
            matriculaDocente: user.matricula,
        };

        try {
            await docentesService.crearHorarioClase(datosHorario);
            Swal.fire('¡Éxito!', 'Horario de clase creado correctamente.', 'success');

            // Actualizar el estado para incluir el nuevo horario
            let nuevasAsignaturas = [...asignaturas];
            let asignaturaActualizada = nuevasAsignaturas[activeAsignaturaIndex];
            if (!asignaturaActualizada.horarios) {
                asignaturaActualizada.horarios = [];
            }
            asignaturaActualizada.horarios.push(datosHorario); // Añadir el nuevo horario

            setAsignaturas(nuevasAsignaturas); // Actualizar el estado de asignaturas con el nuevo horario incluido

            // Restablecer los campos del formulario
            setDiaClase('');
            setHoraInicio('');
            setHoraFinal('');
            setMostrarFormularioHorario(false);
        } catch (error) {
            const errorMessage = error.response && error.response.data ? error.response.data : 'No se pudo crear el horario de clase. Intente nuevamente.';
            Swal.fire('Error', errorMessage, 'error');
        }
    };

    // Mapeo de días de la semana a valores numéricos
    const diasOrdenados = {
        "Lunes": 1,
        "Martes": 2,
        "Miércoles": 3,
        "Jueves": 4,
        "Viernes": 5
    };

    // Ordenar los horarios de clase de la asignatura seleccionada
    const horariosOrdenados = asignaturas[activeAsignaturaIndex]?.horarios?.sort((a, b) => {
        return diasOrdenados[a.diaClase] - diasOrdenados[b.diaClase];
    });


    const guardarFechaEvaluacion = async () => {
        if (selectedUnidad && user && fechaEvaluacion) {
            const data = {
                matriculaDocente: user.matricula,
                idUnidadesAsignatura: selectedUnidad.idUnidadesAsignatura,
                idAsignatura: asignaturas[activeAsignaturaIndex].idAsignatura,
                idGrupo: asignaturas[activeAsignaturaIndex].grupo,
                fechaEvaluacion: fechaEvaluacion,
            };

            try {
                const response = await docentesService.crearFechaEvaluacion(data);
                Swal.fire('¡Guardado!', response.data, 'success');

                // Actualizar el estado con la nueva fecha de evaluación
                const updatedAsignaturas = [...asignaturas];
                const asignaturaActualizada = updatedAsignaturas[activeAsignaturaIndex];
                const unidadIndex = asignaturaActualizada.unidades.findIndex(unidad => unidad.idUnidadesAsignatura === selectedUnidad.idUnidadesAsignatura);

                if (unidadIndex !== -1) {
                    asignaturaActualizada.unidades[unidadIndex].fechaEvaluacion = fechaEvaluacion;
                    setAsignaturas(updatedAsignaturas);
                }

            } catch (error) {
                console.error("Error al guardar la fecha de evaluación", error.response);
                Swal.fire('Error', error.response.data, 'error');
            }
        } else {
            Swal.fire('Información incompleta', 'Asegúrate de haber seleccionado una unidad y de haber definido una fecha de evaluación.', 'warning');
        }
    };

    const guardarProyectoAsignatura = async () => {
        if (!proyectoTitulo || !proyectoObjetivo || !proyectoFecha) {
            Swal.fire('Información incompleta', 'Todos los campos son obligatorios.', 'warning');
            return;
        }

        if (user && asignaturas[activeAsignaturaIndex]) {
            const idAsignatura = asignaturas[activeAsignaturaIndex].idAsignatura;
            const idGrupo = asignaturas[activeAsignaturaIndex].idGrupo;
            const data = {
                idAsignatura: idAsignatura,
                idGrupo: idGrupo,
                titulo: proyectoTitulo,
                objetivo: proyectoObjetivo,
                fecha: proyectoFecha,
                matriculaDocente: user.matricula, // Asumiendo que la matrícula del docente está en el objeto user
            };

            try {
                await docentesService.crearProyecto(data);
                Swal.fire('¡Éxito!', 'Proyecto creado correctamente.', 'success');

                // Actualiza el estado para incluir el nuevo proyecto
                const updatedAsignaturas = [...asignaturas];
                if (!updatedAsignaturas[activeAsignaturaIndex].proyecto) {
                    updatedAsignaturas[activeAsignaturaIndex].proyecto = [];
                }
                updatedAsignaturas[activeAsignaturaIndex].proyecto.push({
                    titulo: proyectoTitulo,
                    objetivo: proyectoObjetivo,
                    fecha: proyectoFecha
                }); // Asegúrate de que la estructura de este objeto coincida con lo que espera tu componente para mostrar proyectos
                setAsignaturas(updatedAsignaturas);

                // Limpia los campos después del éxito
                setProyectoTitulo('');
                setProyectoObjetivo('');
                setProyectoFecha('');

            } catch (error) {
                console.error("Error al crear el proyecto", error.response);
                Swal.fire('Error', 'No se pudo crear el proyecto. Intente de nuevo.', 'error');
            }
        } else {
            Swal.fire('Error', 'No se ha seleccionado una asignatura o no estás autenticado.', 'error');
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
        // Asegúrate de que unidadSeleccionada y cualquier otro dato requerido esté disponible
        if (unidadSeleccionada && asignaturas.length > 0 && activeAsignaturaIndex != null) {
            // Suponiendo que necesitas el ID de la asignatura seleccionada y el ID de la unidad seleccionada
            const asignaturaSeleccionada = asignaturas[activeAsignaturaIndex];
            const idAsignacionAsignatura = asignaturaSeleccionada.idAsignacionAsignatura; // Asegúrate de ajustar esto según tu estructura de datos

            obtenerPorcentajesAsistencia(unidadSeleccionada, asignaturaSeleccionada.idGrupo, idAsignacionAsignatura);
        }
    }, [unidadSeleccionada, asignaturas, activeAsignaturaIndex]); // Asegúrate de incluir todas las dependencias relevantes aquí


    useEffect(() => {
        if (unidadSeleccionada && asignaturas.length > 0) {
            const asignaturaSeleccionada = asignaturas[activeAsignaturaIndex];
            const idGrupo = asignaturaSeleccionada.idGrupo;
            const idAsignacionAsignatura = asignaturaSeleccionada.idAsignacionAsignatura; // Asegúrate de que este campo está presente en tus objetos de asignatura

            docentesService.obtenerFechasUnidad(unidadSeleccionada, idGrupo, idAsignacionAsignatura)
                .then(response => {
                    setFechasClase(response.data.fechasClase);
                })
                .catch(error => {
                    console.error("Error al obtener fechas de clase", error);
                    setFechasClase([]);
                });
        }
    }, [unidadSeleccionada, asignaturas, activeAsignaturaIndex]); // Ya no necesitas incluir idAsignacionAsignatura como dependencia aquí porque es extraído de 'asignaturas'


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


    // Función para calcular la diferencia en días hábiles
    // const calcularDiasHabiles = (inicio, fin) => {
    //     let totalDiasHabiles = 0;
    //     let fechaActual = new Date(inicio);

    //     while (fechaActual <= fin) {
    //         // Obtener el día de la semana de la fechaActual (0 = domingo, 6 = sábado)
    //         const diaSemana = fechaActual.getDay();

    //         // Verificar si es un día hábil (lunes a viernes)
    //         if (diaSemana > 0 && diaSemana < 6) {
    //             totalDiasHabiles++;
    //         }

    //         // Avanzar al siguiente día
    //         fechaActual.setDate(fechaActual.getDate() + 1);
    //     }

    //     return totalDiasHabiles;
    // };

    const actualizarEstadoAsistencia = (matriculaAlumno, fecha, estadoActual) => {

        // Inicio de verificacion de fecha de hoy
        // const fechaAsistencia = new Date(fecha);
        // const fechaHoy = new Date();
        // fechaHoy.setHours(0, 0, 0, 0); // Ajustar a medianoche para ignorar la hora

        // if (fechaAsistencia > fechaHoy) {
        //     // Muestra un mensaje indicando que no se puede modificar asistencias en fechas futuras
        //     Swal.fire('Error', 'No se puede registrar asistencia para fechas futuras.', 'error');
        //     return; // Detiene la ejecución si la fecha es futura
        // }

        // // Calcular la diferencia en días hábiles
        // const diasHabiles = calcularDiasHabiles(fechaAsistencia, fechaHoy);

        // // Verificar si se permite la modificación de la asistencia
        // if (diasHabiles > 3) {
        //     Swal.fire('Error', 'No se puede modificar la asistencia después de tres días hábiles.', 'error');
        //     return; // Detener si no se permite la modificación
        // }

        // Si se requiere comentar de aqui para arriba para pruebas de porcentajes  

        let nuevoEstado = estadoActual + 1;
        if (nuevoEstado > 5) nuevoEstado = 1;

        // Asegúrate de tener los valores correctos para estos IDs
        const idUnidadesAsignatura = unidadSeleccionada; // Asume que esto ya tiene el ID correcto
        const idGrupo = asignaturas[activeAsignaturaIndex]?.idGrupo;
        const idAsignacionAsignatura = asignaturas[activeAsignaturaIndex]?.idAsignacionAsignatura;

        // Objeto de datos que incluye todos los IDs necesarios.
        const data = {
            matriculaAlumno,
            idUnidadesAsignatura: unidadSeleccionada,
            idGrupo,
            fechaAsistencia: fecha,
            tipoAsistencia: nuevoEstado,
            idAsignacionAsignatura,

        };
        docentesService.registrarActualizarAsistencia(data)
            .then(() => {
                setEstadoInicialAsistencia(prevEstado => {
                    const clave = `${matriculaAlumno}-${fecha}`;
                    return { ...prevEstado, [clave]: nuevoEstado };

                });

                // Asegúrate de llamar a obtenerPorcentajesAsistencia con los argumentos correctos si es necesario
                obtenerPorcentajesAsistencia(idUnidadesAsignatura, idGrupo, idAsignacionAsignatura);

                Swal.fire({
                    position: 'top',
                    icon: 'success',
                    title: 'Asistencia actualizada',
                    showConfirmButton: false,
                    timer: 1500,
                    toast: true,
                });
            })
            .catch(error => {
                console.error("Error al actualizar asistencia", error);
                Swal.fire('Error', 'No se pudo actualizar la asistencia. Intente nuevamente.', 'error');
            });
    };


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

    const guardarCalificacion = (e, matriculaAlumno, idUnidadAsignatura, idAsignacionAsignatura, tipo) => {
        const valorInput = e.target.value;
        const valorCalificacion = Number(valorInput);

        if (valorInput === '') {
            Swal.fire('Error', 'Debe ingresar un valor de calificación.', 'error');
            return;
        }

        // Validación de calificación máxima
        if (valorCalificacion > 10) {
            Swal.fire('Error', 'La calificación máxima permitida es 10.', 'error');
            return;
        }

        // Asegúrate de que este es el ID correcto para la unidad y la asignación
        const calificacionData = {
            matriculaAlumno: matriculaAlumno,
            idAsignacionAsignatura: idAsignacionAsignatura,
            idUnidadesAsignatura: idUnidadAsignatura,
            calificacionOrdinaria: tipo === 'ordinaria' && valorInput !== '' ? valorCalificacion : undefined,
            recuperacion: tipo === 'recuperacion',
        };

        // Aquí tu llamada al servicio docentesService para registrar/actualizar la calificación
        docentesService.registrarActualizarCalificacion(calificacionData)
            .then(response => {
                // Procesar la respuesta si es necesario
                console.log('Calificación actualizada', response.data);
                Swal.fire({
                    position: 'top',
                    icon: 'success',
                    title: 'Calificación actualizada',
                    showConfirmButton: false,
                    timer: 1500,
                    toast: true,
                });
                // Llamada para recargar las calificaciones finales
                recargarCalificaciones();
                cargarCalificacionesFinales(idAsignacionAsignatura);
            })
            .catch(error => {
                const message = error.response && error.response.data ? error.response.data : 'Error al actualizar la calificación. Intente de nuevo.';
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: message,
                    showConfirmButton: true,
                });
                recargarCalificaciones();
                cargarCalificacionesFinales(idAsignacionAsignatura);
            });

    };

    const mapearCalificacionesConDetalles = (calificaciones) => {
        return calificaciones.map(alumno => ({
            ...alumno,
            calificaciones: alumno.calificaciones.map(detalle => ({
                ...detalle,
                nombreUnidad: asignaturas[activeAsignaturaIndex].unidades?.find(u => u.idUnidadesAsignatura === detalle.idUnidadAsignatura)?.nombreUnidad || 'Unidad no encontrada'
            }))
        }));
    };


    const recargarCalificaciones = () => {
        const asignaturaSeleccionada = asignaturas[activeAsignaturaIndex];
        docentesService.obtenerAlumnosConCalificaciones(asignaturaSeleccionada.idCarrera, asignaturaSeleccionada.idCuatrimestre, asignaturaSeleccionada.idGrupo)
            .then(response => {
                setCalificaciones(mapearCalificacionesConDetalles(response.data));
            })
            .catch(error => {
                console.error("Error al obtener las calificaciones", error);
                setCalificaciones(mapearCalificacionesConDetalles(error.data));
            });
    };

    const guardarCalificacionRecuperacion = (e, matriculaAlumno, idUnidadAsignatura, idAsignacionAsignatura) => {
        const valorInput = e.target.value; // Obtiene el valor directamente del input como string
        let valorCalificacionRecuperacion;

        if (valorInput === '') {
            Swal.fire('Error', 'Debe ingresar un valor de calificación de recuperación.', 'error');
            return;
        } else {
            valorCalificacionRecuperacion = Number(valorInput);
        }

        // Validación de calificación máxima
        if (valorCalificacionRecuperacion > 8) {
            Swal.fire('Error', 'La calificación máxima permitida es 8.', 'error');
            return;
        }

        // Construcción del objeto de datos para la calificación de recuperación
        const calificacionRecuperacionData = {
            matriculaAlumno: matriculaAlumno,
            idAsignacionAsignatura: idAsignacionAsignatura,
            idUnidadesAsignatura: idUnidadAsignatura,
            calificacionRecuperacion: valorCalificacionRecuperacion,
        };

        // Llamada al servicio de registrar calificación de recuperación
        docentesService.registrarCalificacionRecuperacion(calificacionRecuperacionData)
            .then(response => {
                console.log('Calificación de recuperación actualizada', response.data);
                Swal.fire({
                    position: 'top',
                    icon: 'success',
                    title: 'Calificación de recuperación actualizada',
                    showConfirmButton: false,
                    timer: 1500,
                    toast: true,
                });
                recargarCalificaciones();
                cargarCalificacionesFinales(idAsignacionAsignatura);
            })
            .catch(error => {
                const mensaje = error.response && error.response.data ? error.response.data : 'Error al actualizar la calificación de recuperación. Intenta de nuevo.';
                Swal.fire('Error', mensaje, 'error');
                recargarCalificaciones();
                cargarCalificacionesFinales(idAsignacionAsignatura);
            });
    };


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

    const cargarCalificacionesFinales = async (idAsignacionAsignatura) => {
        try {
            const response = await docentesService.obtenerCalificacionesPorAsignacionAsignatura(idAsignacionAsignatura);
            setCalificacionesFinales(response.data); // Actualiza el estado con las nuevas calificaciones finales
        } catch (error) {
            console.error('Error al obtener calificaciones finales', error);
            setCalificacionesFinales([]); // Resetear a lista vacía en caso de error
        }
    };

    const [modoRecuperacion, setModoRecuperacion] = useState({});

    const activarModoRecuperacion = (matricula, idUnidadAsignatura) => {
        // Activar el modo de recuperación para la combinación específica de alumno y unidad
        setModoRecuperacion(prevState => ({
            ...prevState,
            [`${matricula}-${idUnidadAsignatura}`]: true
        }));
    };

    const desactivarModoRecuperacion = (matricula, idUnidadAsignatura) => {
        // Desactivar el modo de recuperación para la combinación específica de alumno y unidad
        setModoRecuperacion(prevState => ({
            ...prevState,
            [`${matricula}-${idUnidadAsignatura}`]: false
        }));
    };

    const ajustarAnchoColumnas = (data) => {
        // Inicializa un arreglo para almacenar el ancho de cada columna
        let anchos = [
            { wch: 2.25 }, // Ancho para el número "#"
            { wch: 10 },  // Ancho para "MATRICULA"
            { wch: 40 },  // Ancho para "NOMBRE ALUMNO"
        ];

        // Agregar anchos fijos para las columnas de fecha de asistencia
        const fechasCount = data[1].length - 5; // Calcular la cantidad de fechas basado en la longitud de la fila de encabezados menos las columnas fijas
        for (let i = 0; i < fechasCount; i++) {
            anchos.push({ wch: 4 }); // Ancho fijo de 4 para las columnas de tipo de asistencia
        }

        // Añadir anchos fijos para las columnas "TOTAL %" y "D / SD"
        anchos.push({ wch: 8 }, { wch: 6 });

        return anchos;
    };

    const exportarAsistenciasExcel = () => {
        const wb = XLSX.utils.book_new();
        const wsName = "Asistencias";

        // Determinar los rangos de meses para las fechas
        const meses = {};
        fechasClase.forEach((fecha, index) => {
            const mes = new Date(fecha).toLocaleString('es', { month: 'long' }).toUpperCase();
            if (!meses[mes]) {
                meses[mes] = { inicio: 3 + index, fin: 3 + index }; // Ajuste para alinear con las columnas de Excel
            } else {
                meses[mes].fin = 3 + index;
            }
        });

        // Crear fila de encabezado para los meses
        const filaMeses = ["", "", ""];
        Object.keys(meses).forEach(mes => {
            filaMeses.push({ v: mes, s: { alignment: { horizontal: "center" } } });
            if (meses[mes].inicio !== meses[mes].fin) { // Si hay más de una fecha en el mes, preparar para combinar
                for (let i = meses[mes].inicio + 1; i <= meses[mes].fin; i++) {
                    filaMeses.push(null); // Espacios vacíos para las celdas que serán combinadas
                }
            }
        });
        filaMeses.push("", ""); // Espacios al final para "TOTAL %" y "D / SD"

        // Encabezados de las columnas y datos de los alumnos
        let data = [
            filaMeses, // Fila para los nombres de los meses
            ["#", "MATRICULA", "NOMBRE ALUMNO", ...fechasClase.map(fecha => formatDate(fecha)), "TOTAL %", "D / SD"]
        ];

        alumnos.forEach((alumno, index) => {
            let fila = [
                index + 1,
                alumno.matricula,
                `${alumno.ap_paterno} ${alumno.ap_materno} ${alumno.nombre}`,
                ...fechasClase.map(fecha => {
                    const claveAsistencia = `${alumno.matricula}-${fecha}`;
                    const tipoAsistencia = estadoInicialAsistencia[claveAsistencia] || 0;
                    return convertirTipoAsistencia(tipoAsistencia);
                }),
                (porcentajesAsistencia.find(p => p.matriculaAlumno === alumno.matricula)?.porcentajeAsistencia ?? 0).toFixed(2) + "%",
                "D"
            ];
            data.push(fila);
        });

        const ws = XLSX.utils.aoa_to_sheet(data);

        // Añadir las combinaciones de celdas para los meses
        ws['!merges'] = ws['!merges'] || [];
        Object.keys(meses).forEach(mes => {
            if (meses[mes].inicio !== meses[mes].fin) {
                ws['!merges'].push({ s: { r: 0, c: meses[mes].inicio }, e: { r: 0, c: meses[mes].fin } });
            }
        });

        ws['!cols'] = ajustarAnchoColumnas(data);

        // Estilo de celdas
        ws['!rows'] = [{ hpt: 20 }]; // Altura de fila para los encabezados de mes

        XLSX.utils.book_append_sheet(wb, ws, wsName);
        XLSX.writeFile(wb, `Asistencias_${new Date().toLocaleDateString()}.xlsx`);
    };


    const convertirTipoAsistencia = (tipoAsistencia) => {
        switch (tipoAsistencia) {
            case 1: return "•";
            case 2: return "/";
            case 3: return "J";
            case 4: return "R";
            case 5: return "*";
            default: return "";
        }
    };


    useEffect(() => {
        const blockScroll = (e) => {
            if (e.target.className.includes('input-calificacion') || e.target.className.includes('input-recuperacion') || e.target.className.includes('detener')) {
                e.preventDefault();
            }
        };

        window.addEventListener('wheel', blockScroll, { passive: false });

        return () => {
            window.removeEventListener('wheel', blockScroll);
        };
    }, []);



    const inputElem = useRef();
    const handleOnWheel = (e) => {
        // if not use preventDefault, it is working
        e.preventDefault();
        // The blur event fires when an element has lost focus. The event does not bubble,
        inputElem.current.blur();
    };

    // Habilitar Firma Final Cuatrimestre

    const actualizarEstadoFirma = (idCalificacion, estadoFirma) => {
        setCalificacionesFinales(calificacionesFinales.map(calificacion => {
            if (calificacion.idCalificaciones === idCalificacion) {
                return { ...calificacion, firmaDocente: estadoFirma };
            }
            return calificacion;
        }));
    };


    const firmarCalificacionFinalHandler = (idCalificacion, nombreAlumno) => {
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
                docentesService.firmarCalificacionFinal(idCalificacion)
                    .then(response => {
                        Swal.fire(
                            'Firmada!',
                            'La calificación ha sido firmada exitosamente.',
                            'success'
                        );
                        actualizarEstadoFirma(idCalificacion, response.data.firmaDocente);
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

    // Termina habilitacion de firma


    if (!user || !user.roles.includes("ROLE_DOCENTES")) {
        return <Navigate to="/" />;
    }

    // Si hay un error y aún no se cargan materias, muestra solo el mensaje de error
    if (tieneError) {
        return (
            <div className="alert alert-warning" role="alert">
                {mensajeError}
            </div>
        );
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
                            {activeTab === 'tab1' && (
                                <div className={`tab-pane fade show active`} id="ex3-tabs-1">
                                    {asignaturas[activeAsignaturaIndex] && (
                                        <>
                                            <div className="neu-card container-fluid mb-4">

                                                <h2 className="text-center mb-4 mt-3">Información de la Asignatura</h2>
                                                <hr />
                                                <div className="row">
                                                    <div className="col-md-6 mb-3">
                                                        <div className="neu-card p-3">
                                                            <h4>Detalles</h4>
                                                            <p><strong>Periodo:</strong> Enero - Abril 2024</p>
                                                            <p><strong>Programa Educativo:</strong> {asignaturas[activeAsignaturaIndex]?.programa_educativo}</p>
                                                            <p><strong>Asignatura:</strong> {asignaturas[activeAsignaturaIndex]?.asignaturas}</p>
                                                            <p><strong>Cuatrimestre:</strong> {asignaturas[activeAsignaturaIndex]?.cuatrimestre}</p>
                                                            <p><strong>Grupo:</strong> {asignaturas[activeAsignaturaIndex]?.grupo}</p>
                                                        </div>
                                                    </div>
                                                    <div className="col-md-6 mb-3">
                                                        <div className="neu-card-highlight p-3">
                                                            <h4>Objetivo de la materia</h4>
                                                            {asignaturas[activeAsignaturaIndex]?.objetivos && asignaturas[activeAsignaturaIndex].objetivos.length > 0 ? (
                                                                <p>{asignaturas[activeAsignaturaIndex].objetivos[0].objetivo}</p>
                                                            ) : (
                                                                <>
                                                                    <textarea className="neu-textarea" rows={6} value={objetivoAsignatura} onChange={(e) => setObjetivoAsignatura(e.target.value)} placeholder='Escribe el objetivo de la asignatura aquí...'></textarea>
                                                                    <button onClick={guardarObjetivoAsignatura} className="neu-button mt-2">Guardar Objetivo</button>
                                                                </>
                                                            )}
                                                        </div>
                                                    </div>
                                                </div>

                                                <div className='row'>
                                                    <div className="col-12 mb-3">
                                                        <div className="neu-card-highlight p-4">
                                                            <h4>Horarios de clase</h4>

                                                            {
                                                                horariosOrdenados?.length > 0 ? (
                                                                    horariosOrdenados.map((horario, index) => (
                                                                        <div key={index} className="mb-2">
                                                                            <span className="neu-label">Horario establecido: </span>
                                                                            <span>{horario.diaClase} - De {horario.horaInicio} hrs, a {horario.horaFinal} hrs.</span>
                                                                        </div>
                                                                    ))
                                                                ) : (
                                                                    <p>No hay horarios establecidos para esta asignatura.</p>
                                                                )
                                                            }

                                                            {
                                                                !mostrarFormularioHorario && (
                                                                    <button onClick={() => setMostrarFormularioHorario(true)} className="neu-button mt-3">
                                                                        Establecer nuevo horario <i className="fas fa-plus-circle"></i>
                                                                    </button>
                                                                )
                                                            }

                                                            {
                                                                mostrarFormularioHorario && (
                                                                    <div className='container-fluid mt-3'>
                                                                        <div className="neu-form">
                                                                            <div className="form-group mb-3">
                                                                                <label htmlFor="diaClase" className="form-label">Día de la clase:</label>
                                                                                <select id="diaClase" className="form-select neu-input" value={diaClase} onChange={(e) => setDiaClase(e.target.value)}>
                                                                                    <option value="">Selecciona un día</option>
                                                                                    <option value="Lunes">Lunes</option>
                                                                                    <option value="Martes">Martes</option>
                                                                                    <option value="Miércoles">Miércoles</option>
                                                                                    <option value="Jueves">Jueves</option>
                                                                                    <option value="Viernes">Viernes</option>
                                                                                </select>
                                                                            </div>

                                                                            <div className="form-group mb-3">
                                                                                <label htmlFor="horaInicio" className="form-label">Hora de Inicio:</label>
                                                                                <input
                                                                                    id="horaInicio"
                                                                                    type="time"
                                                                                    className="form-control neu-input"
                                                                                    value={horaInicio}
                                                                                    onChange={(e) => setHoraInicio(e.target.value)}
                                                                                    required
                                                                                />
                                                                            </div>

                                                                            <div className="form-group mb-3">
                                                                                <label htmlFor="horaFinal" className="form-label">Hora de Finalización:</label>
                                                                                <input
                                                                                    id="horaFinal"
                                                                                    type="time"
                                                                                    className="form-control neu-input"
                                                                                    value={horaFinal}
                                                                                    onChange={(e) => setHoraFinal(e.target.value)}
                                                                                    required
                                                                                />
                                                                            </div>

                                                                            <button onClick={enviarHorarioClase} className="neu-button">Establecer Horario</button>
                                                                            <button onClick={ocultarHorario} className='neu-button ml-2'>Ocultar Horario</button>
                                                                        </div>
                                                                    </div>
                                                                )
                                                            }
                                                        </div>
                                                    </div>
                                                </div>

                                                <div className="col-12 mb-3">
                                                    <div className="neu-card p-4">
                                                        <h3>Fechas de Evaluación de Unidades</h3>
                                                        {
                                                            asignaturas[activeAsignaturaIndex].unidades && asignaturas[activeAsignaturaIndex].unidades.length > 0 ? (
                                                                asignaturas[activeAsignaturaIndex].unidades.map((unidad, index) => (
                                                                    <div key={index} className="mb-2">
                                                                        <span className="neu-label">
                                                                            Unidad {unidad.nombreUnidad || index + 1}:{'\u00A0'}
                                                                        </span>
                                                                        <span>
                                                                            {fechaFormato(unidad.fechaEvaluacion)}
                                                                        </span>
                                                                    </div>

                                                                ))
                                                            ) : (
                                                                <p>No hay unidades o fechas de evaluación establecidas.</p>
                                                            )
                                                        }
                                                    </div>
                                                </div>


                                            </div>
                                        </>

                                    )}

                                    <div className="container-fluid planning-card mb-3">
                                        <h2 className='text-center mb-3'>Planeación Didáctica</h2>
                                        <p>Nota: Si recientemente añadiste semanas a tu planeación y desaparecieron, recarga la página.</p>
                                        {inputs.map((input, index) => (
                                            <div key={index} className="mb-3">
                                                <div className="input-group">
                                                    <span className="input-group-text input-s">Semana {input.noSemana}</span>
                                                    <span className="input-group-text input-s">Fecha Inicio</span>
                                                    <input
                                                        type="date"
                                                        className="form-control"
                                                        value={input.fechaInicio}
                                                        onChange={(event) => handleInputChange(index, event, 'fechaInicio')}
                                                        disabled={!input.editable}
                                                    />

                                                    <span className="input-group-text">Fecha Fin</span>
                                                    <input
                                                        type="date"
                                                        className="form-control"
                                                        value={input.fechaFin}
                                                        onChange={(event) => handleInputChange(index, event, 'fechaFin')}
                                                        disabled={!input.editable}
                                                    />

                                                    <textarea
                                                        className="form-control form-control-custom"
                                                        placeholder="Descripción del entregable y medio de entrega"
                                                        value={input.descripcion}
                                                        onChange={(event) => handleInputChange(index, event, 'descripcion')}
                                                        disabled={!input.editable}
                                                    ></textarea>
                                                    {input.editable && (
                                                        <button className="neu-button" onClick={() => guardarPlaneacion(index)}>Guardar cambios</button>

                                                    )}
                                                </div>
                                            </div>
                                        ))}

                                        <div className='mb-3'>
                                            <button className="neu-button" onClick={handleAddClick}>+ Añadir otra semana</button>
                                            {/* <button className="neu-button-danger" onClick={handleRemoveClick}>- Eliminar Semana</button> */}
                                        </div>
                                    </div>
                                    <div className='row'>
                                        <div className="container-fluid mb-3">
                                            <div className="neu-card p-4">
                                                <h2 className="text-center mb-4">Proyecto de la Asignatura</h2>
                                                {asignaturas.length > 0 && asignaturas[activeAsignaturaIndex]?.proyecto?.length > 0 ? (
                                                    asignaturas[activeAsignaturaIndex].proyecto.map((proyecto, index) => (
                                                        <div key={index} className="neu-card-highlight p-3 mb-3">
                                                            <h5>Título del Proyecto: <span className="project-title">{proyecto.titulo}</span></h5>
                                                            <p>Objetivo del Proyecto: {proyecto.objetivo}</p>
                                                            <p>Fecha del Proyecto: {proyecto.fecha}</p>
                                                        </div>
                                                    ))
                                                ) : (
                                                    <div>
                                                        <div className="input-group mb-3 neu-input-group">
                                                            <span className="input-group-text">Título</span>
                                                            <input
                                                                type="text"
                                                                className="form-control"
                                                                placeholder="Título del proyecto"
                                                                value={proyectoTitulo}
                                                                onChange={(e) => setProyectoTitulo(e.target.value)}
                                                            />
                                                        </div>
                                                        <div className="input-group mb-3 neu-input-group">
                                                            <span className="input-group-text">Objetivo</span>
                                                            <textarea
                                                                className="form-control"
                                                                placeholder="Objetivo del proyecto"
                                                                value={proyectoObjetivo}
                                                                onChange={(e) => setProyectoObjetivo(e.target.value)}
                                                            ></textarea>
                                                        </div>
                                                        <div className="input-group mb-3 neu-input-group">
                                                            <span className="input-group-text">Fecha</span>
                                                            <input
                                                                type="date"
                                                                className="form-control"
                                                                value={proyectoFecha}
                                                                onChange={(e) => setProyectoFecha(e.target.value)}
                                                            />
                                                        </div>
                                                        <button onClick={guardarProyectoAsignatura} className="neu-button">Crear Proyecto</button>
                                                    </div>
                                                )}
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            )}
                        </div>
                        {activeTab === 'tab2' && (
                            <div className={`tab-pane fade show active`} id="ex3-tabs-2">
                                <div className="neu-card p-4">
                                    <h2 className="text-center mb-4">Detalles de la Unidad</h2>
                                    <div className="mb-3">
                                        <p><strong>Periodo:</strong> Enero - Abril 2024</p>
                                        <p><strong>Programa Educativo:</strong> {asignaturas[activeAsignaturaIndex]?.programa_educativo}</p>
                                        <p><strong>Asignatura:</strong> {asignaturas[activeAsignaturaIndex]?.asignaturas}</p>
                                        <p><strong>Cuatrimestre:</strong> {asignaturas[activeAsignaturaIndex]?.cuatrimestre}</p>
                                        <p><strong>Grupo:</strong> {asignaturas[activeAsignaturaIndex]?.grupo}</p>
                                        <p><strong>Nota:</strong> Si recientemente guardaste datos y no puedes verlos, recarga la página. </p>
                                    </div>
                                    <div className="neu-card-highlight p-3 mb-3">
                                        <select className="form-select " onChange={handleUnidadChange} value={selectedUnidad ? selectedUnidad.idUnidadesAsignatura : ''}>
                                            <option disabled value=''>Selecciona una unidad</option>
                                            {asignaturas[activeAsignaturaIndex].unidades.map((unidad, index) => (
                                                <option key={index} value={unidad.idUnidadesAsignatura}>
                                                    {unidad.nombreUnidad}
                                                </option>
                                            ))}
                                        </select>
                                    </div>
                                    {selectedUnidad && (
                                        <div className="neu-form">
                                            <div className="form-group mb-3">
                                                <label>Fecha de Inicio:</label>
                                                <input
                                                    type='date'
                                                    className="form-control"
                                                    value={selectedUnidad.fechaInicio || ''}
                                                    onChange={handleFechaInicioChange}
                                                    onWheel={handleOnWheel}
                                                />
                                            </div>
                                            <div className="form-group mb-3">
                                                <label>Fecha de Cierre:</label>
                                                <input
                                                    type='date'
                                                    className="form-control"
                                                    value={selectedUnidad.fechaCierre || ''}
                                                    onChange={handleFechaCierreChange}
                                                />
                                            </div>
                                            <p>Porcentaje: {selectedUnidad.porcentaje || ''}%</p>
                                            <p>Total de Horas de la Unidad: {selectedUnidad.totalHorasUnidad || ''} horas</p>
                                            <div className="form-group mb-3">
                                                <label>Total de clases en la unidad:</label>
                                                <input
                                                    type='number'
                                                    className="form-control detener"
                                                    value={selectedUnidad.clasesActivas || ''}
                                                    onChange={handleClasesActivasChange}
                                                />
                                            </div>
                                            <button onClick={confirmarYEnviarDatos} className="neu-button">Guardar Cambios</button>
                                            <hr />
                                            <div className="form-group mb-3">
                                                <label>Fecha de Evaluación de la unidad:</label>
                                                <input
                                                    type="date"
                                                    className="form-control neu-input"
                                                    value={fechaEvaluacion || ''}
                                                    onChange={handleFechaEvaluacionChange}
                                                />
                                            </div>
                                            <button onClick={guardarFechaEvaluacion} className="neu-button">Guardar Fecha de Evaluación</button>
                                        </div>
                                    )}
                                </div>
                            </div>
                        )}

                        <div className={`tab-pane fade ${activeTab === 'tab3' ? 'show active' : ''}`} id="ex3-tabs-3">

                            <div className='mt-3 mb-3'>

                                <button onClick={() => exportarAsistenciasExcel(alumnos, fechasClase)}>
                                    Exportar Asistencias a Excel (Experimental)
                                </button>

                            </div>
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

                            <div className="simbologia-container">
                                <p className='mt-3'>Simbología:</p>
                                <div className="simbologia-item">
                                    <i className="fas fa-minus" style={{ color: 'black' }}></i>
                                    <span>Sin llenar</span>
                                </div>
                                <div className="simbologia-item">
                                    <i className="fas fa-check-circle" style={{ color: 'green' }}></i>
                                    <span>Asistencia</span>
                                </div>
                                <div className="simbologia-item">
                                    <i className="fas fa-times-circle" style={{ color: 'red' }}></i>
                                    <span>Falta</span>
                                </div>
                                <div className="simbologia-item">
                                    <i className="fas fa-user-doctor" style={{ color: 'orange' }}></i>
                                    <span>Justificación</span>
                                </div>
                                <div className="simbologia-item">
                                    <i className="fas fa-hourglass-half" style={{ color: '#517b99' }}></i>
                                    <span>Retardo</span>
                                </div>
                                <div className="simbologia-item">
                                    <i className="fas fa-thumbtack" style={{ color: '#e7017f' }}></i>
                                    <span>Día de asueto</span>
                                </div>

                            </div>


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
                                                    {unidadSeleccionada === '996' && <th>Acción</th>}
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {alumnos.map((alumno, indexAlumno) => (
                                                    <tr key={indexAlumno}>
                                                        <td>{alumno.matricula}</td>
                                                        <td>{`${alumno.ap_paterno} ${alumno.ap_materno} ${alumno.nombre}`}</td>
                                                        {fechasClase.map((fecha, indexFecha) => {
                                                            const claveAsistencia = `${alumno.matricula}-${fecha}`;
                                                            const tipoAsistencia = estadoInicialAsistencia[claveAsistencia] || 0;
                                                            return (
                                                                <td key={indexFecha} onClick={() => actualizarEstadoAsistencia(alumno.matricula, fecha, tipoAsistencia)}>
                                                                    <IconoAsistencia estado={tipoAsistencia} />
                                                                </td>
                                                            );
                                                        })}

                                                        <td>{(porcentajesAsistencia.find(p => p.matriculaAlumno === alumno.matricula)?.porcentajeAsistencia ?? 0).toFixed(2)}%</td>
                                                        {unidadSeleccionada === '996' && (
                                                            <td>
                                                                <button
                                                                    className="btn btn-success btn-sm"
                                                                    onClick={() => firmarCalificacion(alumno.matricula)}
                                                                >
                                                                    Firmar Asistencias
                                                                </button>
                                                            </td>
                                                        )}
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
                                                <th>Acciones</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            {calificaciones.map((alumno, indexAlumno) => (
                                                <tr key={indexAlumno}>
                                                    <td>{alumno.matricula}</td>
                                                    <td>{`${alumno.apPaterno} ${alumno.apMaterno} ${alumno.nombre}`}</td>
                                                    {asignaturas[activeAsignaturaIndex]?.unidades?.map((unidad, indexUnidad) => {
                                                        // Asumiendo que ya tienes el idAsignacionAsignatura disponible
                                                        const idAsignacionAsignatura = asignaturas[activeAsignaturaIndex].idAsignacionAsignatura; // Asegúrate de que este valor es correcto y está disponible

                                                        const calificacion = alumno.calificaciones.find(cal => cal.idUnidadAsignatura === unidad.idUnidadesAsignatura);
                                                        const clave = `${alumno.matricula}-${unidad.idUnidadesAsignatura}`;
                                                        const esRecuperacion = modoRecuperacion[clave];

                                                        return (
                                                            <td key={`cal-${indexUnidad}`}>
                                                                {esRecuperacion ? (
                                                                    <>
                                                                        <input
                                                                            type="number"
                                                                            defaultValue={calificacion ? calificacion.calificacionRecuperacion : ''}
                                                                            onBlur={(e) => guardarCalificacionRecuperacion(e, alumno.matricula, unidad.idUnidadesAsignatura, idAsignacionAsignatura)}
                                                                            className='input-recuperacion'

                                                                        />
                                                                        <button
                                                                            onClick={() => desactivarModoRecuperacion(alumno.matricula, unidad.idUnidadesAsignatura)}
                                                                            className='btn btn-success btn-recuperacion'
                                                                        >
                                                                            Desactivar Recuperación
                                                                        </button>
                                                                    </>
                                                                ) : (
                                                                    <input
                                                                        type="number"
                                                                        defaultValue={calificacion ? calificacion.calificacionOrdinaria : ''}
                                                                        onBlur={(e) => guardarCalificacion(e, alumno.matricula, unidad.idUnidadesAsignatura, idAsignacionAsignatura, 'ordinaria')}
                                                                        className='input-calificacion'
                                                                    />

                                                                )}
                                                                {calificacion && calificacion.recuperacion && (
                                                                    <button
                                                                        onClick={() => activarModoRecuperacion(alumno.matricula, unidad.idUnidadesAsignatura)}
                                                                        className='btn btn-danger btn-recuperacion-ord'
                                                                    >
                                                                        Recuperación
                                                                    </button>
                                                                )}

                                                            </td>

                                                        );
                                                    })}


                                                    <td>
                                                        {calificacionesFinales.find(final => final.matriculaAlumno === alumno.matricula)?.calificacionOrdinaria || 'N/A'}
                                                    </td>

                                                    <td>
                                                        {calificacionesFinales.find(final => final.matriculaAlumno === alumno.matricula)?.firmaDocente ? (
                                                            <span>Calificación Firmada</span>
                                                        ) : (
                                                            <button
                                                                className="btn btn-primary btn-sm"
                                                                onClick={() => firmarCalificacionFinalHandler(
                                                                    calificacionesFinales.find(final => final.matriculaAlumno === alumno.matricula)?.idCalificaciones,
                                                                    `${alumno.nombre} ${alumno.apPaterno} ${alumno.apMaterno}` // Asegúrate de que estos campos coincidan con la estructura de tu objeto alumno
                                                                )}
                                                            >
                                                                Firmar Calificación
                                                            </button>
                                                        )}
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
        </div>
    );
}

export default AsignaturasGeneral;