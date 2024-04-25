import React, { useState } from 'react';

const changelogEntries = [

    {
        version: "0.1.4", date: "09-04-2024",
        changes: [
            { text: "¡Parche de solución de errores!", type: "fixed" },
            { text: "Se solucionó un error con las estadísticas de aspirantes. Ahora funciona correctamente.", type: "fixed" },
            { text: 'System: La versión 1.0 de RaptorNet está a punto de ser lanzada. Se comenzarán pruebas extensas para poder ser liberada e implementada sin pérdida de información relevante.', type: "proximamente" },

        ]
    },

    {
        version: "0.1.3b", date: "26-03-2024",
        changes: [
            { text: "¡Parche de ajustes de elementos!", type: "fixed" },
            { text: "Vinculación: Las listas de aspirantes se muestran en orden descendiente por matricula.", type: "mejora" },
            { text: 'Vinculación: Se eliminó el filtro "Ordenar por fecha" de las listas de aspirantes.', type: "eliminado" },
            { text: 'System: Se continúa preparando y haciendo pruebas para el funcionamiento de RaptorNet para los docentes. La versión 1.0 de RaptorNet está cocinandose.', type: "proximamente" },

        ]
    },

    {
        version: "0.1.3", date: "15-03-2024",
        changes: [
            { text: "¡Parche de solución de errores e implementación de elementos!", type: "fixed" },
            { text: "¡Servicios escolares entró al juego!", type: "nuevo" },
            { text: "Servicios Escolares: Ahora puede ver las estadísticas de prospectos/aspirantes.", type: "nuevo" },
            { text: "Lista de Aspirantes: Ahora se puede descargar la lista con información completa del prospecto.", type: "mejora" },
            { text: "¡Se realizaron algunos ajustes! Los docentes comienzan a usar una versión de testeo de RaptorNet y comienzan a cargar calificaciones y asistencias.", type: "mejora" },
        ]
    },

    {
        version: "0.1.2", date: "11-03-2024",
        changes: [
            { text: "¡Parche de solución de errores e implementación de elementos!", type: "fixed" },
            { text: "Administrador: Puede reestablecer las contraseñas de cualquier usuario registrado en RaptorNet. Si olvidaste tu contraseña, contáctate con el administrador.", type: "nuevo" },
            { text: "Finanzas: Ahora puede descargar el historial de pagos y ver los folios de pago de los aspirantes.", type: "nuevo" },
            { text: "Servicios Escolares: En proceso. Se está realizando la búsqueda de información general por alumno matriculado.", type: "fixed" },
        ]
    },

    {
        version: "0.1.1", date: "05-03-2024",
        changes: [
            { text: "¡Parche de solución de errores e implementación de elementos!", type: "fixed" },
            { text: "System: Ahora las matrículas alfanuméricas no provocan errores en el sistema.", type: "fixed" },
            { text: "Se añadió botón de show/hide para las contraseñas.", type: "mejora" },
            { text: "System/Vinculación: Al aceptar el pago de ficha del aspirante, la fecha se almacena.", type: "nuevo" },
            { text: "(:" },


        ]
    },

    {
        version: "0.1 - Release", date: "02-03-2024",
        changes: [
            { text: "Release Version: Primer Versión oficial de raptornet, enfocado en el registro de aspirantes.", type: "nuevo" },
            { text: "Vinculación: Lista de registros no completados de aspirantes.", type: "nuevo" },
            { text: "Vinculación: Restablecimiento de contraseña a registros de aspirantes en RaptorNet.", type: "nuevo" },
            { text: "Vinculación: Exportar listas a Excel.", type: "nuevo" },
            { text: "Vinculación y Servicios Escolares: Estadística de cantidad de registros por día (Aspirantes)", type: "nuevo" },
            { text: "Vinculación: Filtro por fecha.", type: "fixed" },

        ]
    },
    {
        version: "0.0.1b", date: "01-03-2024",
        changes: [
            { text: "Versión Inicial de prueba.", type: "nuevo" },
            { text: "Registro de aspirantes.", type: "nuevo" },
            { text: "Aspirante: Puede completar su perfil cuando inicia sesión por primera vez.", type: "nuevo" },
            { text: "Aspirante: Mensajes de finalización de procesos.", type: "nuevo" },
            { text: "Ahora se envía un correo electrónico con la matricula generada al aspirante cuando se registra en RaptorNet.", type: "nuevo" },
            { text: "Admin: Registro de personal.", type: "nuevo" },
            { text: "Vinculación: Dashboard.", type: "nuevo" },
            { text: "Vinculación: Control de lista aspirantes", type: "nuevo" },
            { text: "Vinculación: Control de calificaciones de exámenes de admisión", type: "nuevo" },
            { text: "Vinculación: Control de aspirantes aceptados", type: "nuevo" },
            { text: "Vinculación: Estadísticas", type: "nuevo" },
            { text: "Finanzas: Proceso de generación de referencias bancarias", type: "nuevo" },
            { text: "Finanzas: Control de costos ", type: "nuevo" },
            { text: "Finanzas: Historial de Pagos", type: "nuevo" },
            { text: "Servicios Escolares: Lista de aspirantes", type: "nuevo" },
            { text: "Servicios Escolares: Asignación de grupos", type: "nuevo" },
            { text: "Servicios Escolares: Estadisticas", type: "nuevo" },
            { text: "Dirección Académica: Asignación de materias a docentes.", type: "nuevo" },
            { text: "Dirección Académica: Control de material docente.", type: "nuevo" },
            { text: "Docentes: Control de asignaturas.", type: "nuevo" },
            { text: "Docentes: Planeación Didáctica.", type: "nuevo" },
            { text: "Docentes: Periodo de Unidades.", type: "nuevo" },
            { text: "Docentes: Control de asistencias.", type: "nuevo" },
            { text: "Docentes: Control de calificaciones.", type: "nuevo" },
        ]
    }

];


const WhatsNew = () => {
    const [openIndex, setOpenIndex] = useState(null);

    const toggleAccordion = index => {
        setOpenIndex(openIndex === index ? null : index);
    };

    return (
        <div className="changelog-container">

            <div className="changelog-header">
                ¿Que hay de nuevo?

            </div>
            <p>Consulta los nuevos cambios y actualizaciónes de RaptorNet.</p>
            <div className="changelog-header">Changelog</div>
            {changelogEntries.map((entry, index) => (
                <div key={index} className="changelog-accordion">
                    <div
                        className="changelog-accordion-header"
                        onClick={() => toggleAccordion(index)}
                        tabIndex={0}
                    >
                        <span>{`${entry.version} - ${entry.date}`}</span>
                        <i className={`fas ${openIndex === index ? 'fa-minus' : 'fa-plus'}`}></i>
                    </div>
                    <div className={`changelog-accordion-content ${openIndex === index ? 'show' : ''}`}>
                        {entry.changes.map((change, changeIndex) => (
                            <div key={changeIndex} className="change-entry">
                                {change.type === 'nuevo' && <span className="change-tag nuevo">Nuevo</span>}
                                {change.type === 'mejora' && <span className="change-tag mejoras">Mejoras</span>}
                                {change.type === 'eliminado' && <span className="change-tag eliminado">Eliminado</span>}
                                {change.type === 'fixed' && <span className="change-tag arreglado">Fix</span>}
                                {change.type === 'proximamente' && <span className="change-tag proximamente">Próximamente</span>}
                                <span className="change-text">{change.text}</span>
                            </div>
                        ))}
                    </div>


                </div>
            ))}
        </div>
    );
};

export default WhatsNew;
