import React, { useEffect, useState } from "react";
import userService from "../../services/user.service";
import ReactPaginate from "react-paginate";
import { Navigate } from "react-router-dom";
import Swal from "sweetalert2";

const AsignarGruposAlumnos = () => {
    const [usuarios, setUsuarios] = useState([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [pageNumber, setPageNumber] = useState(0); //Paginacion
    const itemsPerPage = 15; // Número de filas por página
    const [pageCount, setPageCount] = useState(0);
    const [filtroCarrera, setFiltroCarrera] = useState("");
    const [ordenCalificacion, setOrdenCalificacion] = useState(false); // false = ascendente, true = descendente
    const [grupos, setGrupos] = useState([]);
    const [cuatrimestres, setCuatrimestres] = useState([]);
    const [filtroCuatrimestre, setFiltroCuatrimestre] = useState("");

    const cambiarFiltroCuatrimestre = (e) => {
        setFiltroCuatrimestre(e.target.value);
    };



    const cambiarFiltroCarrera = (e) => {
        setFiltroCarrera(e.target.value);
    };

    const cambiarOrdenCalificacion = () => {
        setOrdenCalificacion(!ordenCalificacion);
    };

    useEffect(() => {
        obtenerGrupos();
        obtenerCuatrimestres();
        listarParaAsignacion();
    }, []);

    const obtenerGrupos = () => {
        userService.getGrupos().then(response => {
            setGrupos(response.data);
        }).catch(error => {
            console.log(error);
        });
    };

    const obtenerCuatrimestres = () => {
        userService.getCuatrimestres().then(response => {
            setCuatrimestres(response.data);
        }).catch(error => {
            console.log(error);
        });
    };

    const handleAsignarGrupo = (matricula, grupoSeleccionado) => {
        userService.asignarGrupo(matricula, { grupo: grupoSeleccionado }).then(response => {
            console.log(response.data);
            Swal.fire({
                position: 'top', // Posición en la esquina inferior derecha
                icon: 'success', // Ícono de éxito
                title: 'Grupo asignado correctamente', // Mensaje
                showConfirmButton: false,
                timer: 2000,
                toast: true,
                customClass: {
                    popup: 'swal-wide' // Clase personalizada para el popup
                }
            });

            setUsuarios(usuariosAnteriores =>
                usuariosAnteriores.map(usuario => {
                    if (usuario.matricula === matricula) {
                        return { ...usuario, grupo: grupoSeleccionado };
                    }
                    return usuario;
                })
            );
        }).catch(error => {
            console.log(error);
            alert(error);
        });
    };

    const listarParaAsignacion = () => {
        userService.listarParaAsignacion().then((response) => {
            setUsuarios(response.data);
            setPageCount(Math.ceil(response.data.length / itemsPerPage));
            console.log(response.data);
        }).catch((error) => {
            console.log(error);
        });
    };

    const startIndex = pageNumber * itemsPerPage; //Paginacion
    const endIndex = startIndex + itemsPerPage;

    // Función para normalizar y eliminar caracteres especiales no deseados
    const normalizeString = (str) => {
        return (str ?? "").normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().trim();
    };

    // Filtrado y segmentación de usuarios
    const filteredUsuarios = usuarios
        .filter(usuario => {
            // Aplicar la normalización a la búsqueda y a las propiedades del usuario

            if (filtroCarrera === "noPago") {
                return usuario.asp_etapa === "101";
            }

            if (filtroCarrera && usuario.programa_educativo !== filtroCarrera) {
                return false;
            }

            if (filtroCuatrimestre && usuario.cuatrimestre !== filtroCuatrimestre) {
                return false;
            }
            const searchTermNormalized = normalizeString(searchTerm);
            const nombreCompleto = `${usuario.nombre ?? ''} ${usuario.ap_paterno ?? ''} ${usuario.ap_materno ?? ''}`;
            const nombreNormalized = normalizeString(nombreCompleto);
            const emailNormalized = normalizeString(usuario.email);
            const matriculaNormalized = normalizeString(usuario.matricula?.toString());
            const carreraNormalized = normalizeString(usuario.programa_educativo);
            return nombreNormalized.includes(searchTermNormalized) ||
                emailNormalized.includes(searchTermNormalized) ||
                carreraNormalized.includes(searchTermNormalized) ||
                matriculaNormalized.includes(searchTermNormalized);

        })
        .sort((a, b) => {
            if (ordenCalificacion) {
                return b.calificacion - a.calificacion; // De mayor a menor calificación
            }
            return a.calificacion - b.calificacion; // De menor a mayor calificación
        }).slice(startIndex, endIndex);

    const handlePageClick = (data) => {
        const selectedPage = data.selected;
        setPageNumber(selectedPage);
    };

    useEffect(() => {
        // Función para normalizar y eliminar caracteres especiales no deseados
        const normalizeString = (str) => {
            return (str ?? "").normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().trim();
        };

        // Lógica de filtrado
        const filteredLength = usuarios.filter(usuario => {

            if (filtroCarrera && usuario.id_carrera_1 !== filtroCarrera) {
                return false;
            }
            const searchTermNormalized = normalizeString(searchTerm);
            const nombreCompleto = `${usuario.nombre ?? ''} ${usuario.ap_paterno ?? ''} ${usuario.ap_materno ?? ''}`;
            const nombreNormalized = normalizeString(nombreCompleto);
            const emailNormalized = normalizeString(usuario.email);
            const matriculaNormalized = normalizeString(usuario.matricula?.toString());
            const carreraNormalized = normalizeString(usuario.id_carrera_1);

            return nombreNormalized.includes(searchTermNormalized) ||
                emailNormalized.includes(searchTermNormalized) ||
                carreraNormalized.includes(searchTermNormalized) ||
                matriculaNormalized.includes(searchTermNormalized);
        }).length;

        setPageCount(Math.ceil(filteredLength / itemsPerPage));
        setPageNumber(0); // Opcional: resetear a la primera página tras una nueva búsqueda
    }, [searchTerm, filtroCarrera, usuarios]);

    const user = JSON.parse(localStorage.getItem('user'));

    if (!user || !(user.roles.includes("ROLE_SERVICIOSESCOLARES"))) {
        return <Navigate to="/" />;
    }

    return (
        <div className="container-fluid mt-3">

            <div className="text-center mb-3">
                <h3>ASIGNACIÓN DE GRUPOS</h3>
            </div>
            <div className="search-container">
                <input
                    type="text"
                    placeholder="Buscar matrícula/nombre/carrera..."
                    onChange={(e) => setSearchTerm(e.target.value)}
                />
            </div>
            <div className="row mt-3 mb-3">
                <div className="col-6 filter-container">
                    <select onChange={cambiarFiltroCarrera} value={filtroCarrera}>
                        <option value="">Todas las Carreras</option>
                        <option value="T.S.U en Turismo">Turismo</option>
                        <option value="T.S.U en Construcción">Construcción</option>
                        <option value="T.S.U Tecnologías de la Información, Área Entornos Virtuales y Negocios Digitales">Tecnologías de la Información y Comunicación</option>
                        <option value="T.S.U en Gastronomía">Gastronomía</option>
                        <option value="T.S.U en Agrobiotecnología">Agrobiotecnologia</option>
                        <option value="T.S.U en Administración">Administración</option>
                    </select>
                </div>

                <div className="col-6 filter-container">
                    {/* Filtro de Cuatrimestres */}
                    <select onChange={cambiarFiltroCuatrimestre} value={filtroCuatrimestre}>
                        <option value="">Todos los Cuatrimestres</option>
                        {cuatrimestres.map(cuatrimestre => (
                            <option key={cuatrimestre.id} value={cuatrimestre.cuatrimestre}>
                                {cuatrimestre.cuatrimestre}
                            </option>
                        ))}
                    </select>
                </div>
            </div>


            <table className='table table-bordered table-striped text-center'>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Matrícula</th>
                        <th>Nombre</th>
                        <th>Género</th>
                        <th>Programa Educativo</th>
                        <th onClick={cambiarOrdenCalificacion}>
                            Calificación
                            {ordenCalificacion ? <i className="fa fa-arrow-down" /> : <i className="fa fa-arrow-up" />}
                        </th>
                        <th>Cuatrimestre</th>
                        <th>Asignar Grupo</th>
                        <th>Etapa</th>

                    </tr>
                </thead>
                <tbody>
                    {filteredUsuarios.map((usuario, index) => (
                        <tr key={usuario.matricula} >
                            <td>{startIndex + index + 1}</td>
                            <td className={usuario.asp_etapa === "101" ? "row-asp-etapa-101" : ""}>{usuario.matricula}</td>
                            <td>{usuario.nombre} {usuario.ap_paterno} {usuario.ap_materno}</td>
                            <td>{usuario.genero}</td>
                            <td>{usuario.programa_educativo}</td>
                            <td>{usuario.calificacion}</td>
                            <td> {usuario.cuatrimestre} </td>
                            <td>
                                <select
                                    value={usuario.grupo || ""}
                                    onChange={(e) => handleAsignarGrupo(usuario.matricula, e.target.value)}
                                >
                                    <option value="" disabled>Seleccionar Grupo</option>
                                    {grupos.map(grupo => (
                                        <option key={grupo.id} value={grupo.grupo}>{grupo.grupo}</option>
                                    ))}
                                </select>
                            </td>
                            <td> {usuario.asp_etapa} </td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <div className="pagination-container">

                <ReactPaginate
                    previousLabel={<i className="fa fa-chevron-left" />}
                    nextLabel={<i className="fa fa-chevron-right" />}
                    breakLabel={"..."}
                    pageCount={pageCount}
                    marginPagesDisplayed={2}
                    pageRangeDisplayed={5}
                    onPageChange={handlePageClick}
                    containerClassName={"pagination"}
                    subContainerClassName={"pages pagination"}
                    activeClassName={"active"}
                />

            </div>
        </div>
    );
};

export default AsignarGruposAlumnos;
