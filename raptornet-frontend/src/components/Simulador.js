import React, { useState, useEffect, useRef, useCallback } from 'react';
import Swal from 'sweetalert2';

const SimuladorAsistencias = () => {
    const [fechaInicio, setFechaInicio] = useState('');
    const [fechaCierre, setFechaCierre] = useState('');
    const [diasClase, setDiasClase] = useState([]);
    const [fechasClase, setFechasClase] = useState([]);
    const [clasesActivas, setClasesActivas] = useState('');
    const [estudiantes, setEstudiantes] = useState([
        { matricula: 'Estudiante1', asistencias: {} },
        { matricula: 'Estudiante2', asistencias: {} },
        { matricula: 'Estudiante3', asistencias: {} },
    ]);
    const isFirstRun = useRef(true);
    const dias = {
        'Lunes': 1,
        'Martes': 2,
        'Miércoles': 3,
        'Jueves': 4,
        'Viernes': 5,
    };

    useEffect(() => {
        // Este Sweet Alert solo se mostrará una vez, cuando el componente se monta.
        Swal.fire({
            title: 'Información para el Simulador de Asistencias',
            html: `
              <p>Para incluir el último día de clases en el simulador, debes seleccionar el día <strong>siguiente</strong> a tu última clase en la fecha de cierre.</p>
              <p><b>Ejemplo:</b> Si tu última clase es el viernes 22 de marzo, selecciona el sábado 23 de marzo como fecha de cierre para que el viernes sea incluido en el simulador.</p>
              <p>Este ajuste es necesario para que el simulador contabilice correctamente todas las sesiones de clase en tu rango de fechas.</p>
            `,
            icon: 'info',
            confirmButtonText: 'Entendido',
            confirmButtonColor: '#3085d6'
        });
    }, []);

    const calcularFechasClase = useCallback(() => {
        if (!fechaInicio || !fechaCierre || diasClase.length === 0) return;

        let startDate = new Date(fechaInicio);
        let endDate = new Date(fechaCierre);
        endDate.setHours(23, 59, 59, 999);

        let fechas = [];

        while (startDate <= endDate) {
            if (diasClase.includes(startDate.getDay())) {
                fechas.push(new Date(startDate));
            }
            startDate.setDate(startDate.getDate() + 1);
        }

        setFechasClase(fechas);
    }, [fechaInicio, fechaCierre, diasClase]);

    useEffect(() => {
        calcularFechasClase();
    }, [fechaCierre, calcularFechasClase]);

    useEffect(() => {
        isFirstRun.current = false;
    }, []);

    const toggleAsistencia = (matricula, fecha) => {
        setEstudiantes(estudiantes.map(estudiante => {
            if (estudiante.matricula === matricula) {
                const fechaStr = fecha.toISOString().split('T')[0];
                const nuevaAsistencia = estudiante.asistencias[fechaStr] === 1 ? 2 : 1;
                return { ...estudiante, asistencias: { ...estudiante.asistencias, [fechaStr]: nuevaAsistencia } };
            }
            return estudiante;
        }));
    };

    const calcularPorcentaje = (asistencias) => {
        const totalAsistencias = Object.values(asistencias).filter(asistencia => asistencia === 1).length;
        const clasesActivasNum = Number(clasesActivas) || 0; // Convertir a número, usando 0 si es una cadena vacía
        return (totalAsistencias / clasesActivasNum) * 100;
    };



    return (
        <div className="container mt-3">
            <h2>Simulador de Asistencias</h2>
            <p>Para incluir el último día de clases en el simulador, debes seleccionar el día <strong>siguiente</strong> a tu última clase en la fecha de cierre.</p>
            <p><b>Ejemplo:</b> Si tu última clase es el viernes 22 de marzo, selecciona el sábado 23 de marzo como fecha de cierre para que el viernes sea incluido en el simulador.</p>
            <p>Este ajuste es necesario para que el simulador contabilice correctamente todas las sesiones de clase en tu rango de fechas.</p>
            <div className="mb-3">
                <label htmlFor="fechaInicio" className="form-label">Fecha de inicio:</label>
                <input type="date" id="fechaInicio" className="form-control" value={fechaInicio} onChange={(e) => setFechaInicio(e.target.value)} />
            </div>
            <div className="mb-3">
                <label htmlFor="fechaCierre" className="form-label">Fecha de cierre:</label>
                <input
                    type="date"
                    id="fechaCierre"
                    className="form-control"
                    value={fechaCierre}
                    onChange={(e) => setFechaCierre(e.target.value)}
                />

            </div>
            <div className="mb-3">
                <label className="form-label">Días de clase:</label>
                {Object.keys(dias).map(dia => (
                    <div key={dia} className="form-check form-check-inline">
                        <input className="form-check-input" type="checkbox" id={`check-${dia}`} value={dia} onChange={(e) => {
                            const checked = e.target.checked;
                            setDiasClase(checked ? [...diasClase, dias[dia]] : diasClase.filter(d => d !== dias[dia]));
                        }} />
                        <label className="form-check-label" htmlFor={`check-${dia}`}>{dia}</label>
                    </div>
                ))}
            </div>
            <div className="mb-3">
                <label htmlFor="clasesActivas" className="form-label">Clases activas:</label>
                <input
                    type="number"
                    id="clasesActivas"
                    className="form-control"
                    value={clasesActivas}
                    min="0"
                    onChange={(e) => {
                        const value = e.target.value;
                        setClasesActivas(value.match(/^\d*$/) ? value : clasesActivas);
                    }}
                />

            </div>

            {fechasClase.length > 0 && (
                <table className="table">
                    <thead>
                        <tr>
                            <th>Matrícula</th>
                            {fechasClase.map((fecha, index) => (
                                <th key={index}>{`${fecha.getDate()}/${fecha.getMonth() + 1}`}</th>
                            ))}
                            <th>Porcentaje</th>
                        </tr>
                    </thead>
                    <tbody>
                        {estudiantes.map((estudiante, indexEstudiante) => (
                            <tr key={indexEstudiante}>
                                <td>{estudiante.matricula}</td>
                                {fechasClase.map((fecha, indexFecha) => {
                                    const fechaStr = fecha.toISOString().split('T')[0];
                                    const asistencia = estudiante.asistencias[fechaStr];
                                    return (
                                        <td key={indexFecha} className={`asistencia-${asistencia}`} onClick={() => toggleAsistencia(estudiante.matricula, fecha)}>
                                            {asistencia === 1 ? '✓' : asistencia === 2 ? '✗' : ''}
                                        </td>
                                    );
                                })}
                                <td>{calcularPorcentaje(estudiante.asistencias).toFixed(2)}%</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            )}
        </div>
    );

}

export default SimuladorAsistencias;
