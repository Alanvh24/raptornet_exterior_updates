import React, { useEffect, useState } from "react";
import userService from "../../services/user.service";
import { Navigate } from "react-router-dom";
import serviciosEscolaresService from "../../services/serviciosEscolares.service";
import "../../Perfil.css";

const InformacionAlumnoIndividual = () => {
    const [usuarios, setUsuarios] = useState([]);
    const [generos, setGeneros] = useState([]);
    const [nacionalidades, setNacionalidades] = useState([]);
    const [estadosMexico, setEstadosMexico] = useState([]);
    const [tipoSangre, setTipoSangre] = useState([]);
    const [busquedaMatricula, setBusquedaMatricula] = useState("");
    const [alumnoSeleccionado, setAlumnoSeleccionado] = useState(null);
    const [tabActivo, setTabActivo] = useState("informacionPersonal");
    const [sugerencias, setSugerencias] = useState([]);
    const [indiceSeleccionado, setIndiceSeleccionado] = useState(-1);


    useEffect(() => {
        obtenerGeneros();
        obtenerNacionalidades();
        obtenerEstadosMexico();
        obtenerTipoSangre();
        listaAlumnos();
    }, []);


    const obtenerGeneros = () => {
        userService.getGeneros().then(response => {
            setGeneros(response.data);
            console.log(response.data);
        }).catch(error => {
            console.log(error);
        });
    }

    const obtenerNacionalidades = () => {
        userService.getNacionalidades().then(response => {
            setNacionalidades(response.data);
            console.log(response.data);
        }).catch(error => {
            console.log(error);
        });
    }

    const obtenerEstadosMexico = () => {
        userService.getEstados().then(response => {
            setEstadosMexico(response.data);
            console.log(response.data);
        }).catch(error => {
            console.log(error);
        });
    }

    const obtenerTipoSangre = () => {
        userService.getSangre().then(response => {
            setTipoSangre(response.data);
            console.log(response.data);
        }).catch(error => {
            console.log(error);
        });
    }

    const listaAlumnos = () => {
        serviciosEscolaresService.obtenerAlummnos().then((response) => {
            setUsuarios(response.data);
            console.log(response.data);
        }).catch((error) => {
            console.log(error);
        });
    };

    const convertirFechaNacimiento = (fechaNacimiento) => {
        const fecha = new Date(fechaNacimiento);
        if (!isNaN(fecha.getTime())) {
            // La fecha es válida, procede con el formateo
            return fecha.toISOString().split('T')[0];
        } else {
            // La fecha es inválida, retorna un string vacío o maneja el caso como prefieras
            return "";
        }
    };


    const buscarAlumnoPorMatricula = () => {
        const alumnoEncontrado = usuarios.find(usuario => usuario.matricula === busquedaMatricula.trim() || usuario.curp === busquedaMatricula.trim());
        if (alumnoEncontrado) {
            // Utilizar convertirFechaNacimiento para formatear la fecha de nacimiento del alumno encontrado
            const fechaFormatoISO = convertirFechaNacimiento(alumnoEncontrado.fecha_nacimiento);
            setAlumnoSeleccionado({
                ...alumnoEncontrado,
                fecha_nacimiento: fechaFormatoISO, // Utiliza el valor retornado por convertirFechaNacimiento
                id_genero: alumnoEncontrado.id_genero,
                id_nacionalidad: alumnoEncontrado.id_nacionalidad,
                id_estado_mexico: alumnoEncontrado.id_estado_mexico,
                id_tipo_sangre: alumnoEncontrado.id_tipo_sangre,
            });
        } else {
            setAlumnoSeleccionado(null);
        }
    };


    const actualizarBusquedaYBuscar = (texto) => {
        setBusquedaMatricula(texto);
        setIndiceSeleccionado(-1);
        if (!texto.trim()) {
            setSugerencias([]);
            return;
        }

        const filtrados = usuarios.filter(usuario =>
            (usuario.matricula && usuario.matricula.toLowerCase().includes(texto.toLowerCase())) ||
            (usuario.curp && usuario.curp.toLowerCase().includes(texto.toLowerCase()))
        );
        setSugerencias(filtrados.slice(0, 5)); // Muestra solo las primeras 5 coincidencias como sugerencias
    };


    const seleccionarAlumnoDesdeSugerencia = (alumno) => {
        setBusquedaMatricula(alumno.matricula); // Actualiza la búsqueda con la matrícula seleccionada
        const fechaFormatoISO = convertirFechaNacimiento(alumno.fecha_nacimiento);
        setAlumnoSeleccionado({
            ...alumno,
            fecha_nacimiento: fechaFormatoISO,
        });
        setSugerencias([]); // Limpia las sugerencias después de seleccionar una
    };



    const cambiarTab = (tab) => {
        setTabActivo(tab);
    };

    const user = JSON.parse(localStorage.getItem('user'));

    if (!user || !(user.roles.includes("ROLE_SERVICIOSESCOLARES"))) {
        return <Navigate to="/" />;
    }

    return (
        <div className="container-fluid mt-3">

            <div className="container_registro " >
                <div className="card_perfil-se">
                    <div className="form">
                        <div className="left-side">
                            <div className="left-heading">
                                <h5>Información General</h5>
                            </div>

                            <div className="col-auto">
                                <form onSubmit={(e) => {
                                    e.preventDefault(); // Previene el comportamiento por defecto del formulario
                                    buscarAlumnoPorMatricula();
                                }}>
                                    <div className="input-group input-group-sm">
                                        <input
                                            type="text"
                                            className="form-control"
                                            placeholder="Buscar por matrícula o CURP..."
                                            value={busquedaMatricula}
                                            onChange={(e) => actualizarBusquedaYBuscar(e.target.value)}
                                            onKeyDown={(e) => {
                                                if (e.key === 'Enter') {
                                                    e.preventDefault(); // Previene la acción por defecto para evitar el envío del formulario
                                                    if (indiceSeleccionado >= 0) {
                                                        seleccionarAlumnoDesdeSugerencia(sugerencias[indiceSeleccionado]);
                                                    } else {
                                                        buscarAlumnoPorMatricula();
                                                    }
                                                } else if (e.key === 'ArrowDown' && indiceSeleccionado < sugerencias.length - 1) {
                                                    setIndiceSeleccionado(indiceSeleccionado + 1);
                                                } else if (e.key === 'ArrowUp' && indiceSeleccionado > 0) {
                                                    setIndiceSeleccionado(indiceSeleccionado - 1);
                                                }
                                            }}

                                        />

                                        {sugerencias.length > 0 && (
                                            <div className="lista-sugerencias">
                                                {sugerencias.map((sugerencia, index) => (
                                                    <div
                                                        key={sugerencia.matricula}
                                                        onClick={() => seleccionarAlumnoDesdeSugerencia(sugerencia)}
                                                        className={`sugerencia-item ${index === indiceSeleccionado ? 'seleccionada' : ''}`}
                                                        style={{ backgroundColor: index === indiceSeleccionado ? '#f0f0f0' : 'transparent' }}
                                                    >
                                                        {sugerencia.matricula}
                                                    </div>
                                                ))}
                                            </div>

                                        )}

                                        <div className="input-group-append">
                                            <button className="btn btn-outline-secondary" type="submit">
                                                <i className="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </div>

                                </form>
                            </div>

                            <div className="steps-content content-justify">
                                <p className="step-number-content active">
                                    Debajo, puedes seleccionar el tipo de Información que deseas ver de la matricula seleccionada. No olvides darle al botón de guardar si modificas algo.
                                </p>
                            </div>
                            <ul className="progress-bar-se">
                                <li className={tabActivo === "informacionPersonal" ? "active" : ""} onClick={() => cambiarTab("informacionPersonal")}>Información Personal</li>
                                <li className={tabActivo === "datosGenerales" ? "active" : ""} onClick={() => cambiarTab("datosGenerales")}>Datos Generales</li>
                                <li className={tabActivo === "informacionMedica" ? "active" : ""} onClick={() => cambiarTab("informacionMedica")}>Información Médica</li>
                                <li className={tabActivo === "contactoEmergencia" ? "active" : ""} onClick={() => cambiarTab("contactoEmergencia")}>Contacto de Emergencia</li>
                                <li className={tabActivo === "antecedentesAcademicos" ? "active" : ""} onClick={() => cambiarTab("antecedentesAcademicos")}>Antecedentes Académicos</li>
                            </ul>
                        </div>

                        <div className="container right-side">
                            {tabActivo === "informacionPersonal" && (
                                <div className="main active">
                                    <small>
                                        <i className="fa fa-home text-dark" />
                                    </small>
                                    <p>{alumnoSeleccionado ? alumnoSeleccionado.nombre + " " + alumnoSeleccionado.ap_paterno + " " + alumnoSeleccionado.ap_materno : ''}</p>
                                    <p>{alumnoSeleccionado ? alumnoSeleccionado.programa_educativo + " - Cuatrimestre: " + alumnoSeleccionado.cuatrimestre + " - Grupo " + alumnoSeleccionado.grupo : ''} </p>
                                    <div className="text">
                                        <p className="anuncio_obligatorio">
                                            Todos los campos son obligatorios, en caso de faltar información no sera válido el registro de aspirante y no se generará tu matricula.
                                        </p>
                                        <h2>Información Personal</h2>
                                        <p>Ingresa tu información personal</p>
                                    </div>
                                    <div className="input-text">
                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="nombre"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.nombre : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, nombre: e.target.value })}
                                            />
                                            <span>Nombre</span>

                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="ap_paterno"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.ap_paterno : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, ap_paterno: e.target.value })}

                                            />
                                            <span>Apellido Paterno</span>
                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="ap_materno"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.ap_materno : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, ap_materno: e.target.value })}
                                            />
                                            <span>Apellido Materno</span>
                                        </div>

                                    </div>

                                    <div className="input-text">
                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="curp"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.curp : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, curp: e.target.value })}

                                            />
                                            <span>CURP (Modifica SOLO SI ES NECESARIO)</span>
                                        </div>
                                    </div>

                                    <div className="input-text">
                                        <div className="input-div">
                                            <input
                                                type="date"
                                                className="form-control"
                                                name="fecha_nacimiento"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.fecha_nacimiento : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, fecha_nacimiento: e.target.value })}
                                            />
                                            <span>Fecha de Nacimiento</span>
                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="number"
                                                className="form-control"
                                                name="edad"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.edad : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, edad: e.target.value })}

                                            />
                                            <span>Edad</span>
                                        </div>

                                        <div className="input-div">
                                            <select
                                                className="form-control"
                                                name="id_genero"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.id_genero : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, id_genero: e.target.value })}
                                            >
                                                <option value="">Seleccione un género</option>
                                                {generos.map((genero) => (
                                                    <option key={genero.id_genero} value={genero.id_genero}>{genero.genero}</option>
                                                ))}
                                            </select>
                                        </div>



                                    </div>

                                    <div className="input-text">
                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="email"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.email : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, email: e.target.value })}

                                            />
                                            <span>Email</span>
                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="number"
                                                className="form-control"
                                                name="numero_telefonico"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.numero_telefonico : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, numero_telefonico: e.target.value })}

                                            />
                                            <span>Número Telefónico</span>

                                        </div>

                                        <div className="input-div">
                                            <select
                                                className="form-control"
                                                name="id_nacionalidad"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.id_nacionalidad : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, id_nacionalidad: e.target.value })}
                                            >
                                                <option value="">Nacionalidad</option>
                                                {nacionalidades.map((nacionalidad) => (
                                                    <option key={nacionalidad.id_nacionalidad} value={nacionalidad.id_nacionalidad}>{nacionalidad.nacionalidad}</option>
                                                ))}
                                            </select>
                                        </div>



                                    </div>

                                    <div className="input-text">
                                        <div className="input-div">
                                            <select
                                                className="form-control"
                                                name="id_estado_mexico"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.id_estado_mexico : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, id_estado_mexico: e.target.value })}
                                            >
                                                <option value="">Estado de Nacimiento</option>
                                                {estadosMexico.map((estado) => (
                                                    <option key={estado.id_estado_mexico} value={estado.id_estado_mexico}>{estado.estado}</option>
                                                ))}
                                            </select>
                                        </div>


                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="municipio_nacimiento"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.municipio_nacimiento : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, municipio_nacimiento: e.target.value })}

                                            />
                                            <span>Municipio de Nacimiento</span>
                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="localidad_nacimiento"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.localidad_nacimiento : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, localidad_nacimiento: e.target.value })}

                                            />
                                            <span>Localidad de Nacimiento</span>
                                        </div>

                                    </div>

                                    <div className="buttons">
                                        <button className="next_button btn custom-btn-perfil">Guardar Datos</button>
                                    </div>
                                </div>
                            )}


                            {tabActivo === "datosGenerales" && (
                                <div className="main active">
                                    <small>
                                        <i className="fa fa-clipboard text-dark" />
                                    </small>
                                    <p>{alumnoSeleccionado ? alumnoSeleccionado.nombre + " " + alumnoSeleccionado.ap_paterno + " " + alumnoSeleccionado.ap_materno : ''}</p>
                                    <p>{alumnoSeleccionado ? alumnoSeleccionado.programa_educativo + " - Cuatrimestre: " + alumnoSeleccionado.cuatrimestre + " - Grupo " + alumnoSeleccionado.grupo : ''} </p>
                                    <div className="text">
                                        <h2>Datos Generales</h2>
                                        <p>Ingresa tus datos generales</p>
                                    </div>

                                    <div className="input-text">
                                        <div className="input-div">
                                            <p className="span_custom">¿Hablas alguna lengua indígena?</p>
                                            <label className="radio-btn">
                                                <input
                                                    type="radio"
                                                    name="habla_indigena"
                                                    value="si"
                                                    checked={alumnoSeleccionado?.habla_indigena === 'si'}
                                                    onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, habla_indigena: e.target.value })}
                                                />
                                                Sí
                                            </label>
                                            <label className="radio-btn">
                                                <input
                                                    type="radio"
                                                    name="habla_indigena"
                                                    value="no"
                                                    checked={alumnoSeleccionado?.habla_indigena === 'no'}
                                                    onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, habla_indigena: e.target.value })}
                                                />
                                                No
                                            </label>
                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="lengua_indigena"
                                                value={alumnoSeleccionado?.lengua_indigena || ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, lengua_indigena: e.target.value })}
                                            />
                                            <span>Especifíca cuál</span>
                                        </div>
                                    </div>

                                    <div className="input-text">
                                        <div className="input-div">
                                            <p className="span_custom">¿Tienes alguna discapacidad?</p>
                                            <label className="radio-btn">
                                                <input
                                                    type="radio"
                                                    name="tiene_discapacidad"
                                                    value="si"
                                                    checked={alumnoSeleccionado?.tiene_discapacidad === 'si'}
                                                    onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, tiene_discapacidad: e.target.value })}
                                                />
                                                Sí
                                            </label>
                                            <label className="radio-btn">
                                                <input
                                                    type="radio"
                                                    name="tiene_discapacidad"
                                                    value="no"
                                                    checked={alumnoSeleccionado?.tiene_discapacidad === 'no'}
                                                    onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, tiene_discapacidad: e.target.value })}
                                                />
                                                No
                                            </label>
                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="discapacidad"
                                                value={alumnoSeleccionado?.discapacidad || ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, discapacidad: e.target.value })}
                                            />
                                            <span>Especifíca cuál</span>
                                        </div>
                                    </div>

                                    <div className="buttons">
                                        <button className="next_button btn custom-btn-perfil">Guardar Datos</button>
                                    </div>
                                </div>
                            )}



                            {tabActivo === "informacionMedica" && (
                                <div className="main active">
                                    <small>
                                        <i className="fa fa-house-medical text-dark" />
                                    </small>
                                    <p>{alumnoSeleccionado ? alumnoSeleccionado.nombre + " " + alumnoSeleccionado.ap_paterno + " " + alumnoSeleccionado.ap_materno : ''}</p>
                                    <p>{alumnoSeleccionado ? alumnoSeleccionado.programa_educativo + " - Cuatrimestre: " + alumnoSeleccionado.cuatrimestre + " - Grupo " + alumnoSeleccionado.grupo : ''} </p>
                                    <div className="text">
                                        <h2>Información Médica</h2>
                                        <p>Ingresa tu información médica</p>
                                    </div>

                                    <div className="input-text">
                                        <select
                                            className="form-control"
                                            name="id_tipo_sangre"
                                            value={alumnoSeleccionado?.id_tipo_sangre || ''}
                                            onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, id_tipo_sangre: e.target.value })}
                                        >
                                            <option value="">Selecciona un Tipo de Sangre</option>
                                            {tipoSangre.map((sangre) => (
                                                <option key={sangre.id_tipo_sangre} value={sangre.id_tipo_sangre}>{sangre.tipo_sangre}</option>
                                            ))}
                                        </select>
                                    </div>


                                    <div className="input-text">
                                        <div className="input-div">
                                            <p className="span_custom">¿Alergias?</p>
                                            <label className="radio-btn">
                                                <input
                                                    type="radio"
                                                    name="tiene_alergias"
                                                    value="si"
                                                    checked={alumnoSeleccionado?.tiene_alergias === 'si'}
                                                    onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, tiene_alergias: e.target.value })}
                                                />
                                                Sí
                                            </label>
                                            <label className="radio-btn">
                                                <input
                                                    type="radio"
                                                    name="tiene_alergias"
                                                    value="no"
                                                    checked={alumnoSeleccionado?.tiene_alergias === 'no'}
                                                    onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, tiene_alergias: e.target.value })}
                                                />
                                                No
                                            </label>
                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="alergias"
                                                value={alumnoSeleccionado?.alergias || ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, alergias: e.target.value })}
                                            />
                                            <span>Especifíca cuál</span>
                                        </div>
                                    </div>
                                    <div className="buttons">
                                        <button className="next_button btn custom-btn-perfil">Guardar Datos</button>
                                    </div>
                                </div>
                            )}

                            {tabActivo === "contactoEmergencia" && (
                                <div className="main active">
                                    <small>
                                        <i className="fa fa-phone text-dark" />
                                    </small>
                                    <p>{alumnoSeleccionado ? alumnoSeleccionado.nombre + " " + alumnoSeleccionado.ap_paterno + " " + alumnoSeleccionado.ap_materno : ''}</p>
                                    <p>{alumnoSeleccionado ? alumnoSeleccionado.programa_educativo + " - Cuatrimestre: " + alumnoSeleccionado.cuatrimestre + " - Grupo " + alumnoSeleccionado.grupo : ''} </p>
                                    <div className="text">
                                        <h2>Contacto de Emergencia</h2>
                                        <p>Ingresa la información de un contacto en caso de Emergencia</p>
                                    </div>
                                    <div className="input-text">
                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control mayus-text"
                                                name="nombre_contacto_e"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.nombre_contacto_e : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, nombre_contacto_e: e.target.value })}
                                            />
                                            <span>Nombre completo de contacto de Emergencia (Ej. Juan López Pérez)</span>
                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="number"
                                                className="form-control mayus-text"
                                                name="telefono_contacto_e"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.telefono_contacto_e : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, telefono_contacto_e: e.target.value })}
                                            />
                                            <span>Teléfono de contacto de Emergencia</span>
                                        </div>
                                    </div>

                                    <div className="input-text">
                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="email_contacto_e"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.email_contacto_e : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, email_contacto_e: e.target.value })}
                                            />
                                            <span>Correo electrónico de contacto de Emergencia (En caso de no tener, escriba N/A)</span>
                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control mayus-text"
                                                name="parentesco_contacto_e"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.parentesco_contacto_e : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, parentesco_contacto_e: e.target.value })}
                                            />
                                            <span>Parentesco de contacto de Emergencia (ej. PADRE, MADRE, etc...)</span>
                                        </div>
                                    </div>

                                    <div className="buttons">
                                        <button className="next_button btn custom-btn-perfil">Guardar Datos</button>
                                    </div>

                                </div>
                            )}

                            {tabActivo === "antecedentesAcademicos" && (
                                <div className="main active">
                                    <small>
                                        <i className="fa fa-scroll text-dark" />
                                    </small>
                                    <p>Bienvenido/a </p>
                                    <div className="text">
                                        <h2>Antecedentes Académicos</h2>
                                        <p>Ingresa la información de tus Antecedentes Académicos</p>
                                    </div>
                                    <div className="input-text">
                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control mayus-text"
                                                name="nombre_bachillerato"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.nombre_bachillerato : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, nombre_bachillerato: e.target.value })}
                                            />
                                            <span>Nombre de tu Bachillerato de Egreso con plantel (ABREVIADO. ej. CECYTEH Plantel Mineral de la Reforma, CONALEP Plantel, etc...)</span>
                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control mayus-text"
                                                name="periodo_bachillerato"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.periodo_bachillerato : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, periodo_bachillerato: e.target.value })}
                                            />
                                            <span>Periodo de ingreso/egreso (ej. 2016-2019)</span>
                                        </div>

                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control mayus-text"
                                                name="promedio_bachillerato"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.promedio_bachillerato : ''}
                                                onChange={(e) => setAlumnoSeleccionado({ ...alumnoSeleccionado, promedio_bachillerato: e.target.value })}
                                            />
                                            <span>Promedio de Bachillerato (ej. 9.2)</span>
                                        </div>
                                    </div>

                                    <div className="input-text">


                                        <span>Primera opción para estudiar en la UTMiR</span>
                                        <div className="input-div">

                                            <input
                                                type="text"
                                                className="form-control mayus-text"
                                                name="id_carrera_1"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.id_carrera_1 : ''}
                                                disabled={true}
                                            />
                                        </div>
                                        <span>Segunda opción para estudiar en la UTMiR</span>
                                        <div className="input-div">
                                            <input
                                                type="text"
                                                className="form-control mayus-text"
                                                name="id_carrera_2"
                                                value={alumnoSeleccionado ? alumnoSeleccionado.id_carrera_2 : ''}
                                                disabled={true}
                                            />
                                        </div>
                                    </div>
                                    <div className="buttons">
                                        <button className="next_button btn custom-btn-perfil">Guardar Datos</button>
                                    </div>

                                </div>
                            )}

                        </div>
                    </div>

                </div>
            </div>

        </div >
    );
};

export default InformacionAlumnoIndividual;