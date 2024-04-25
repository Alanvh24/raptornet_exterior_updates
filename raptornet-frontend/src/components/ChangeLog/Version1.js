import React, { useEffect, useState } from 'react';
import "../../styles/Versiones.css";

const Version1 = () => {

    const [scrollPosition, setScrollPosition] = useState(0);

    const handleScroll = () => setScrollPosition(window.scrollY);

    useEffect(() => {
        window.addEventListener("scroll", handleScroll, { passive: true });

        return () => {
            window.removeEventListener("scroll", handleScroll);
        };
    }, []);

    return (
        <div className="container-fluid">
            <div className='row'>
                <section
                    style={{
                        backgroundSize: `${(window.outerHeight - scrollPosition) / 5}%`,
                    }}
                    className="parallax-banner parallax-container text-light section-v"
                >
                    <h1>RaptorNet - Versión 1.0</h1>
                    <h3>Bienvenidos a la primera versión oficial de RaptorNet.</h3>
                    <p>Este sitio es una plataforma web diseñada para centralizar la gestión académica y administrativa, facilitando el acceso a información sobre estudiantes, horarios, registros académicos y finanzas de la UTMiR.</p>
                    <label>Descubra a continuación los detalles más relevantes de esta primera versión oficial:</label>
                </section>
                <div className="row">
                    <div className="col-md-4 mt-3">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>

                                <div className="timeline-label">
                                    <h4>Versión 1.0.0 - Lanzamiento</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../raptornet_10.png" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "40%" }} className="timeline-image" />
                            <p>
                                Estamos felices de anunciar la primera versión oficial del Sistema Integral RaptorNet. A continuación, los detalles más destacables de esta versión inicial.
                            </p>
                        </div>
                    </div>

                </div>
            </div>

            {/* Segunda sección */}

            <div className='row'>
                <div className="header header-v text-dark">
                    <h1>Aspirantes</h1>
                    <p>
                        Un componente esencial de cualquier sistema es el registro de futuros estudiantes. Por ello, RaptorNet comenzó con una versión preliminar 0.1 que incluyó el registro de aspirantes antes del lanzamiento de la versión 1.0.
                    </p>
                </div>
                <div className="row">
                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>

                                <div className="timeline-label">
                                    <h4>Registro de Aspirantes</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../gif_registro.gif" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                Los prospectos interesados en nuestros programas pueden registrarse en RaptorNet, donde lo nuevo y destacado es la generación automática de matrículas.
                            </p>
                            <p>Una interfaz amigable e intuitiva acompaña a los aspirantes durante este proceso.</p>
                            <p>
                                RaptorNet ahora automatiza las matrículas dependiendo del año, período y número del aspirante, generando y enviando la matrícula directamente al correo del usuario en el momento del registro.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            {/* Tercera sección */}

            <div className='row'>
                <div className="header header-v text-dark">
                    <h1>Vinculación</h1>
                    <p>
                        El área de Vinculación ahora dispone de un sistema dedicado para monitorear cada etapa del proceso de los aspirantes.
                    </p>
                </div>
                <div className="row">
                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>

                                <div className="timeline-label">
                                    <h4>Listado de Registros de Aspirantes</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../vinculacion_1.gif" alt="RaptorNet - Estadisticas" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                Vinculación ahora puede visualizar, editar y descargar la lista de aspirantes registrados, permitiendo correcciones en caso de errores.
                            </p>
                            <p>
                                Además, las estadísticas en tiempo real están disponibles para visualizar cuántos aspirantes se han registrado y qué programas educativos han seleccionado, información que se actualiza diariamente en RaptorNet.
                            </p>
                        </div>
                    </div>
                </div>
            </div>


            {/* Cuarta sección */}

            <div className='row'>
                <div className="header header-v text-dark">
                    <h1>Finanzas</h1>
                    <p>
                        El departamento de Finanzas se beneficia ahora de un acceso integrado al sistema RaptorNet, mejorando la gestión del historial de pagos y la eficiencia en los trámites administrativos.
                    </p>
                </div>
                <div className="row">
                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>

                                <div className="timeline-label">
                                    <h4>Actualización de Cuotas e Historial de Pagos</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../finanzas_v1.png" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                Las cuotas ahora pueden actualizarse directamente en RaptorNet, permitiendo un seguimiento detallado y en tiempo real del historial de pagos.
                            </p>
                        </div>
                    </div>

                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>

                                <div className="timeline-label">
                                    <h4>Automatización de Trámites y Gestión de Referencias Bancarias</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../finanzas_v2.png" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                RaptorNet introduce un módulo financiero avanzado que facilita la creación de trámites financieros y la generación automática de referencias bancarias, simplificando significativamente la administración financiera.
                            </p>
                            <p>
                                Actualmente, este módulo está disponible únicamente para el proceso de aspirantes, con planes de expansión para incluir todos los tipos de pagos en el futuro cercano.
                            </p>
                        </div>
                    </div>
                </div>
            </div>


            {/* Quinta sección */}

            <div className='row'>
                <div className="header header-v text-dark">
                    <h1>Dirección académica</h1>
                    <p>
                        El área de Dirección Académica cuenta con un sistema personalizado para el control de docentes y clases.
                    </p>
                </div>
                <div className="row">
                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>

                                <div className="timeline-label">
                                    <h4>Asignación de tira de materias a docentes</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../direccion_1.gif" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                En RaptorNet, el personal de Dirección Académica puede asignar grupos y asignaturas correspondientes a los docentes matriculados y activos.
                            </p>
                        </div>
                    </div>

                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>

                                <div className="timeline-label">
                                    <h4>Control de docentes</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../direccion_2.gif" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                RaptorNet ofrece un sistema de visualización de planeaciones, asistencias, proyectos y calificaciones de cada docente activo. Esto permite un seguimiento diario del trabajo de los docentes en estas áreas.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            {/* Sexta sección */}

            <div className='row'>
                <div className="header header-v text-dark">
                    <h1>Docentes</h1>
                    <p>
                        Dada la importancia fundamental de los docentes en nuestra universidad, RaptorNet ha implementado herramientas avanzadas para facilitar la gestión de evaluaciones, asistencias y otras actividades académicas esenciales.
                    </p>
                </div>

                <div className="row">
                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>
                                <div className="timeline-label">
                                    <h4>"Mis Asignaturas"</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../docentes_1.gif" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                RaptorNet ha desarrollado una sección especial denominada "Mis Asignaturas" diseñada para que los docentes gestionen de manera integral las asignaturas que les han sido asignadas por la Dirección Académica. Esta funcionalidad incluye cinco herramientas clave:
                            </p>
                            <ul>
                                <li>1. Planeación Didáctica</li>
                                <li>2. Unidades</li>
                                <li>3. Asistencias</li>
                                <li>4. Calificaciones</li>
                                <li>5. Anexos (Próximamente)</li>
                            </ul>
                        </div>
                    </div>


                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>
                                <div className="timeline-label">
                                    <h4>Planeación Didáctica</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../planeacion.png" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                RaptorNet permite a los docentes administrar y actualizar la información de sus cursos, incluyendo objetivos específicos, horarios de clases, y fechas clave como las evaluaciones y planeaciones didácticas semanales.
                            </p>
                        </div>
                    </div>

                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>
                                <div className="timeline-label">
                                    <h4>Unidades</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../unidades.png" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                Los docentes tienen la capacidad de definir las fechas de inicio y de conclusión para cada unidad de sus asignaturas, establecer el número de clases y programar las fechas de evaluación pertinentes.
                            </p>
                        </div>
                    </div>


                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>
                                <div className="timeline-label">
                                    <h4>Control de Asistencias</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../asistencias.png" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                RaptorNet permite a los docentes registrar diariamente las asistencias de los estudiantes, automatizando el cálculo del porcentaje de asistencia por unidad.
                            </p>
                            <p>
                                La plataforma clasifica las asistencias en cinco categorías, las cuales se pueden visualizar de manera gráfica y dinámica:
                                <ul>
                                    <li><i className="fas fa-check-circle" style={{ color: 'green' }}></i> Presente</li>
                                    <li><i className="fas fa-times-circle" style={{ color: 'red' }}></i> Ausente</li>
                                    <li><i className="fas fa-user-doctor" style={{ color: 'orange' }}></i> Justificado</li>
                                    <li><i className="fas fa-hourglass-half" style={{ color: '#517b99' }}></i> Retardo</li>
                                    <li><i className="fas fa-thumbtack" style={{ color: '#e7017f' }}></i> Día de asueto</li>
                                </ul>
                            </p>
                        </div>
                    </div>
                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>
                                <div className="timeline-label">
                                    <h4>Calificaciones</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../calificaciones.png" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                RaptorNet facilita que los docentes ingresen calificaciones por unidad para cada estudiante, con cálculos automáticos de los promedios finales que además consideran el porcentaje de asistencia de los estudiantes.
                            </p>
                            <p>
                                Adicionalmente, se ha implementado un sistema de firma digital de calificaciones al final de cada cuatrimestre, permitiendo identificar a los estudiantes que necesitarán participar en exámenes remediales.
                            </p>
                        </div>
                    </div>

                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>
                                <div className="timeline-label">
                                    <h4>Herramientas</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../simulador.gif" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                Para optimizar la gestión de las clases activas, RaptorNet ha incorporado un simulador de asistencias. Esta herramienta permite calcular con precisión el porcentaje de asistencias de los estudiantes, asegurando una administración eficiente y exacta
                                para el cálculo de las mismas.
                            </p>
                        </div>
                    </div>

                </div>
            </div>

            {/* Séptima sección */}

            <div className='row'>
                <div className="header header-v text-dark">
                    <h1>Servicios Escolares</h1>
                    <p>
                        El área de Servicios Escolares ahora dispone de un sistema personalizado para el control eficiente de alumnos, asistencias y calificaciones.
                    </p>
                </div>
                <div className="row">
                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>

                                <div className="timeline-label">
                                    <h4>Proceso de aspirantes</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../vinculacion_1.gif" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                El área de Servicios Escolares ahora puede monitorear completamente el proceso de los aspirantes, incluyendo registros, calificaciones de exámenes de admisión y estadísticas relevantes.
                            </p>
                        </div>
                    </div>

                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>

                                <div className="timeline-label">
                                    <h4>Listas de alumnos activos e información individual</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../lista.gif" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                RaptorNet ahora permite visualizar los alumnos inscritos en el cuatrimestre activo y editar la información individual de cada uno de ellos.
                            </p>
                        </div>
                    </div>

                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>

                                <div className="timeline-label">
                                    <h4>Kardex e Historial académico</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../info.gif" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "70%" }} className="timeline-image" />
                            <p>
                                El sistema ahora facilita la visualización del kardex y del historial académico del alumno, permitiendo seleccionar entre las calificaciones actuales del cuatrimestre o el historial completo de calificaciones finales de cada periodo cursado.
                            </p>
                            <label className='text-danger'>
                                NOTA: RaptorNet comenzará a registrar el historial académico a partir del periodo Mayo - Agosto 2024 por lo que la información histórica, aún no está disponible.
                            </label>
                        </div>
                    </div>
                </div>
            </div>

            {/* Octava sección */}

            <div className='row'>
                <div className="header header-v text-dark">
                    <h1>Seguridad</h1>
                    <h5 className="card-title">
                        Mejoras en Seguridad y Gestión de Roles
                    </h5>
                </div>
                <div className="row">
                    <div className="col-md-4">
                        <div className="timeline-vertical">
                            <div className="timeline-item">
                                <div className="timeline-date">Abril 2024</div>
                                <div className="timeline-mark">
                                    <div className="timeline-dot"></div>
                                    <div className="vertical-line"></div>
                                </div>

                                <div className="timeline-label">
                                    <h4>Seguridad de la información en RaptorNet</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="col-md-8">
                        <div className="timeline-details">
                            <img src="../ia_raptornet.jpg" alt="RaptorNet versión 1.0.0" style={{ maxWidth: "35%" }} className="timeline-image" />
                            <p>
                                <strong>Seguridad Reforzada:</strong> RaptorNet ha implementado mejoras significativas en la seguridad para proteger la información crítica.
                                Esto incluye el cifrado avanzado de contraseñas, asegurando que los datos sensibles de los usuarios se mantengan seguros y protegidos contra accesos no autorizados.
                            </p>

                            <p>
                                <strong>Gestión de Roles Mejorada:</strong> Hemos desarrollado un sistema sofisticado de detección de roles que optimiza la experiencia del usuario y fortalece la seguridad. Esta característica asegura que cada usuario acceda solo a las funciones y datos que su rol permite,
                                aumentando así la eficacia y la seguridad operativa de RaptorNet.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div className='row'>

                <div className="header header-v text-dark">
                    <h1>RaptorNet 1.0</h1>
                    <h5 className="card-title">
                        Gracias por explorar las primeras notas de versión de RaptorNet.
                    </h5>
                    <p>
                        Estamos encantados de haber presentado las características y capacidades de la primera versión oficial de RaptorNet, diseñada para revolucionar la administración educativa y enriquecer la experiencia académica. Este lanzamiento es fruto de una intensa colaboración con expertos en educación, asegurando que nuestras soluciones satisfagan las necesidades de estudiantes y administradores por igual.
                    </p>
                    <p>
                        Con funcionalidades que mejoran la comunicación, simplifican procedimientos administrativos y ofrecen acceso sin precedentes a análisis y recursos educativos, estamos seguros de que RaptorNet marcará una diferencia significativa. Esperamos que estas herramientas no solo optimicen la gestión diaria sino que también potencien el rendimiento y la interacción en toda la comunidad educativa. Apreciamos su interés y estamos emocionados por las posibilidades que RaptorNet continúa desarrollando. ¡Aguardamos con entusiasmo sus comentarios y su activa participación en este camino de mejora continua!

                    </p>
                    <hr />
                    <div className="contributors">
                        <label>Colaboradores</label>
                        <hr />
                        <p>
                            Proyecto desarrollado por: Ing. Alan Velázquez Hernández.
                        </p>
                        <p>
                            Dirección del proyecto a cargo del Ing. Noé Linarte Vázquez.
                        </p>
                    </div>

                </div>

            </div>




        </div >
    );
};

export default Version1;
