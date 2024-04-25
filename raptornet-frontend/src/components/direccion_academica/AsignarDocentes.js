import React, { useEffect, useState } from 'react'
import { Navigate } from 'react-router-dom';
import "../../styles/Sidebar.css"
import userService from '../../services/user.service';
import Swal from 'sweetalert2';
const AsignarDocentes = () => {

    const user = JSON.parse(localStorage.getItem('user'));

    const [docentes, setDocentes] = useState([]);
    const [selectedDocente, setSelectedDocente] = useState('');

    const [carrera, setCarrera] = useState([]);
    const [selectedCarrera, setSelectedCarrera] = useState('');

    const [cuatrimestres, setCuatrimestres] = useState([]);
    const [selectedCuatrimestres, setSelectedCuatrimestres] = useState('');

    const [grupos, setGrupos] = useState([]);
    const [selectedGrupos, setSelectedGrupos] = useState('');

    const [asignaturas, setAsignaturas] = useState([]);
    const [selectedAsignaturas, setSelectedAsignaturas] = useState([]);

    const [errorMessages] = useState([]);


    useEffect(() => {

        userService.getCarrerasActivas().then(response => {
            setCarrera(response.data);
        });

        userService.getDocentes().then(response => {
            setDocentes(response.data);
        });

        userService.getCuatrimestres().then(response => {
            setCuatrimestres(response.data);
        });

        userService.getGrupos().then(response => {
            setGrupos(response.data);
        });

    }, []);

    useEffect(() => {
        if (selectedCarrera && selectedCuatrimestres) {
            userService.getAsignaturasPorCarreraYCuatrimestre(selectedCarrera, selectedCuatrimestres).then(response => {
                setAsignaturas(response.data);
            }).catch(error => {
                console.error("Error al obtener asignaturas", error);
            });
        }
    }, [selectedCarrera, selectedCuatrimestres]);

    const handleAsignaturaChange = (event) => {
        const value = parseInt(event.target.value);

        // Verificar si el valor es un número
        if (!isNaN(value)) {
            let newSelectedAsignaturas = [];

            if (event.target.checked) {
                // Agregar a la lista si está seleccionado y no es NaN
                newSelectedAsignaturas = [...selectedAsignaturas, value];
            } else {
                // Remover de la lista si no está seleccionado
                newSelectedAsignaturas = selectedAsignaturas.filter(id => id !== value);
            }

            console.log("Nuevas asignaturas seleccionadas:", newSelectedAsignaturas);
            setSelectedAsignaturas(newSelectedAsignaturas);
        } else {
            console.log("Valor no numérico detectado:", event.target.value);
        }
    };


    const handleAsignarMaterias = () => {
        // Verifica si se ha seleccionado un grupo
        if (!selectedGrupos) {
            Swal.fire({
                title: 'Error',
                text: 'Debes seleccionar un grupo.',
                icon: 'error',
            });
            return;
        }

        // Verifica si se ha seleccionado al menos una asignatura
        if (selectedAsignaturas.length === 0) {
            Swal.fire({
                title: 'Error',
                text: 'Debes seleccionar al menos una asignatura.',
                icon: 'error',
            });
            return;
        }

        const selectedMatricula = selectedDocente;

        // Crea el objeto de solicitud
        const request = {
            matricula: selectedMatricula,
            id_grupo: selectedGrupos,
            id_asignatura: selectedAsignaturas
        };

        userService.asignarMateria(request)
            .then(response => {
                if (response.data.success) {
                    Swal.fire({
                        position: 'top',
                        icon: 'success',
                        title: 'Materias asignadas correctamente',
                        showConfirmButton: false,
                        timer: 2000,
                        toast: true,
                    });

                    setSelectedAsignaturas([]);

                } else {
                    // Aquí manejas los errores devueltos específicamente en la respuesta como BadRequest
                    const errorMessages = response.data.messages.map(msgObj => msgObj.message).join('\n');
                    Swal.fire({
                        title: 'Error',
                        text: errorMessages,
                        icon: 'error',
                    });
                }
            })
            .catch(error => {
                console.error("Error al asignar materias", error);
                // Maneja casos donde el servidor devuelve un estado de error y verifica si hay mensajes de error
                if (error.response && error.response.data && error.response.data.length > 0) {
                    const errorMessages = error.response.data.map(msgObj => msgObj.message).join('\n');
                    Swal.fire({
                        title: 'Error',
                        text: errorMessages,
                        icon: 'error',
                    });
                } else {
                    // Mensaje genérico si la respuesta no contiene los datos esperados
                    Swal.fire({
                        title: 'Error',
                        text: 'Hubo un error al asignar las materias. Por favor, intenta de nuevo.',
                        icon: 'error',
                    });
                }
            });


    };

    //ordenar las carreras
    const ordenarCarreras = (a, b) => {
        const orden = {
            'T.S.U': 1,
            'Licenciatura': 2,
            'Ingeniería': 3
        };

        const ordenA = orden[a.carrera.split(' ')[0]] || 4;
        const ordenB = orden[b.carrera.split(' ')[0]] || 4;

        if (ordenA !== ordenB) {
            return ordenA - ordenB;
        }
        return a.carrera.localeCompare(b.carrera);
    };

    const carrerasOrdenadas = carrera.sort(ordenarCarreras);


    if (user && user.roles.includes("ROLE_DIRECCION_ACADEMICA")) {
        return (

            <div className='container'>

                <div className='card'>
                    <div className='row'>
                        <div className='mt-3 col-12 text-center'>
                            <h1>Asignación de materias a docentes</h1>
                            <hr />
                        </div>
                        <div className='col-12'>
                            <form className='form-inline'>

                                <div className="form-group mt-3">

                                    <strong>Docente: </strong>

                                    <select value={selectedDocente} onChange={e => setSelectedDocente(e.target.value)}>
                                        <option value="">Selecciona al docente</option>
                                        {docentes.map((docente, index) => (
                                            <option key={index} value={docente.matricula}>
                                                {docente.matricula} - {docente.nombreCompleto}
                                            </option>
                                        ))}
                                    </select>

                                </div>


                                <div className="form-group mt-3">

                                    <strong>Programa Educativo: </strong>

                                    <select value={selectedCarrera} onChange={e => setSelectedCarrera(e.target.value)} className='selectpicker'>
                                        <option value="">Selecciona el programa educativo</option>
                                        {carrerasOrdenadas.map((carrera, index) => (
                                            <option key={index} value={carrera.id_carrera}>
                                                {carrera.carrera}
                                            </option>
                                        ))}
                                    </select>
                                </div>


                                <div className="form-group mt-3">

                                    <strong>Cuatrimestre: </strong>

                                    <select value={selectedCuatrimestres} onChange={e => setSelectedCuatrimestres(e.target.value)}>
                                        <option value="">Selecciona el cuatrimestre</option>
                                        {cuatrimestres.map((cuatrimestres, index) => (
                                            <option key={index} value={cuatrimestres.id}>
                                                {cuatrimestres.cuatrimestre}
                                            </option>
                                        ))}
                                    </select>
                                </div>


                                <div className="form-group mt-3 mb-3">

                                    <strong>Grupo: </strong>
                                    <select value={selectedGrupos} onChange={e => setSelectedGrupos(e.target.value)}>
                                        <option value="">Selecciona el grupo</option>
                                        {grupos.map((grupos, index) => (
                                            <option key={index} value={grupos.id}>
                                                {grupos.grupo}
                                            </option>
                                        ))}
                                    </select>
                                </div>

                            </form>

                            {errorMessages.length > 0 && (
                                <div className="alert alert-danger">
                                    <h4 className="alert-heading">Error al asignar materias:</h4>
                                    <ul className="mb-0">
                                        {errorMessages.map((errorMessage, index) => (
                                            <li key={index}>{errorMessage}</li>
                                        ))}
                                    </ul>
                                </div>
                            )}

                        </div>

                        {selectedDocente && selectedCarrera && selectedCuatrimestres && selectedGrupos && (
                            <div className="form-check">
                                {asignaturas.map((asignatura, index) => (
                                    <div key={index} className="form-check formulario">
                                        <div className='checkbox'>
                                            <input
                                                type="checkbox"
                                                className="form-check-input"
                                                id={`asignatura-${asignatura.idAsignaturas}`}
                                                name={`asignatura-${asignatura.idAsignaturas}`}
                                                value={asignatura.idAsignaturas}
                                                onChange={handleAsignaturaChange}
                                                checked={selectedAsignaturas.includes(asignatura.idAsignaturas)}
                                            />
                                            <label className="form-check-label" htmlFor={`asignatura-${asignatura.idAsignaturas}`}>
                                                {asignatura.nombre_asignatura}
                                            </label>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}

                        <div className='container'>
                            <div className='row'>
                                <div >
                                    <button
                                        onClick={handleAsignarMaterias}
                                        className="btn btn-custom-green_utmir btn-sm d-block mx-auto mt-3 text-light"
                                    >
                                        Asignar Materias
                                    </button>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

        );
    } else {
        return <Navigate to="/" />;
    }
}

export default AsignarDocentes;