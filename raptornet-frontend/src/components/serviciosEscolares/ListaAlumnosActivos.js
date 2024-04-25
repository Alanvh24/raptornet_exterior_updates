import React, { useEffect, useState } from "react";
import userService from "../../services/user.service";
import ReactPaginate from "react-paginate";
import { Link, Navigate } from "react-router-dom";
import serviciosEscolaresService from "../../services/serviciosEscolares.service";
import "../../styles/Loading.css";

const ListaAlumnosActivos = () => {
    const [usuarios, setUsuarios] = useState([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [pageNumber, setPageNumber] = useState(0); //Paginacion
    const itemsPerPage = 15; // Número de filas por página
    const [pageCount, setPageCount] = useState(0);
    const [filtroCarrera, setFiltroCarrera] = useState("");
    const [grupos, setGrupos] = useState([]);
    const [cuatrimestres, setCuatrimestres] = useState([]);
    const [filtroCuatrimestre, setFiltroCuatrimestre] = useState("");
    const [filtroGrupos, setFiltroGrupos] = useState("");
    const [filteredUsuarios, setFilteredUsuarios] = useState([]);
    const [isLoading, setIsLoading] = useState(false);

    const cambiarFiltroCuatrimestre = (e) => {
        setFiltroCuatrimestre(e.target.value);
    };

    const cambiarFiltroCarrera = (e) => {
        setFiltroCarrera(e.target.value);
    };

    const cambiarFiltroGrupo = (e) => {
        setFiltroGrupos(e.target.value);
    };

    useEffect(() => {
        obtenerGrupos();
        obtenerCuatrimestres();
        listaAlumnosActivos();
    }, []); // Lista de dependencias vacía para que solo se ejecute al montar el componente


    const obtenerGrupos = () => {
        userService.getGrupos().then(response => {
            setGrupos(response.data);
        }).catch(error => {
            console.log(error);
            setGrupos([]);
        });
    };

    const obtenerCuatrimestres = () => {
        userService.getCuatrimestres().then(response => {
            setCuatrimestres(response.data);
        }).catch(error => {
            console.log(error);
        });
    };

    const listaAlumnosActivos = () => {
        setIsLoading(true);
        serviciosEscolaresService.obtenerAlummnos().then((response) => {
            setIsLoading(false);
            setUsuarios(response.data);
            setPageCount(Math.ceil(response.data.length / itemsPerPage));
            console.log(response.data);
        }).catch((error) => {
            setIsLoading(false);
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
    useEffect(() => {
        // Este efecto maneja el filtrado y el recálculo de la paginación
        const newFilteredUsuarios = usuarios.filter(usuario => {
            const matchesCarrera = !filtroCarrera || usuario.programa_educativo === filtroCarrera;
            const matchesCuatrimestre = !filtroCuatrimestre || usuario.cuatrimestre === filtroCuatrimestre;
            const searchTermNormalized = normalizeString(searchTerm);
            const nombreCompleto = `${usuario.nombre ?? ''} ${usuario.ap_paterno ?? ''} ${usuario.ap_materno ?? ''}`;
            const nombreNormalized = normalizeString(nombreCompleto);
            const emailNormalized = normalizeString(usuario.email);
            const matriculaNormalized = normalizeString(usuario.matricula?.toString());

            return (nombreNormalized.includes(searchTermNormalized) ||
                emailNormalized.includes(searchTermNormalized) ||
                matriculaNormalized.includes(searchTermNormalized)) &&
                matchesCarrera && matchesCuatrimestre;
        });

        setFilteredUsuarios(newFilteredUsuarios);
        setPageCount(Math.ceil(newFilteredUsuarios.length / itemsPerPage));
        setPageNumber(0); // Vuelve a la primera página tras un cambio en los datos filtrados
    }, [searchTerm, filtroCarrera, filtroCuatrimestre, usuarios]);


    const handlePageClick = (data) => {
        const selectedPage = data.selected;
        setPageNumber(selectedPage);
    };


    useEffect(() => {
        const normalizeString = (str) => {
            return (str ?? "").normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().trim();
        };

        // Filtrado de usuarios según los filtros aplicados
        const newFilteredUsuarios = usuarios.filter(usuario => {
            const matchesCarrera = !filtroCarrera || usuario.programa_educativo === filtroCarrera;
            const matchesCuatrimestre = !filtroCuatrimestre || usuario.cuatrimestre === filtroCuatrimestre;
            const matchesGrupo = !filtroGrupos || usuario.grupo === filtroGrupos;
            const searchTermNormalized = normalizeString(searchTerm);
            const nombreCompleto = `${usuario.nombre ?? ''} ${usuario.ap_paterno ?? ''} ${usuario.ap_materno ?? ''}`;
            const nombreNormalized = normalizeString(nombreCompleto);
            const emailNormalized = normalizeString(usuario.email);
            const matriculaNormalized = normalizeString(usuario.matricula?.toString());

            return (nombreNormalized.includes(searchTermNormalized) ||
                emailNormalized.includes(searchTermNormalized) ||
                matriculaNormalized.includes(searchTermNormalized)) &&
                matchesCarrera && matchesCuatrimestre && matchesGrupo;
        });

        setFilteredUsuarios(newFilteredUsuarios);
        setPageCount(Math.ceil(newFilteredUsuarios.length / itemsPerPage));
        setPageNumber(0); // Restablecer a la primera página cada vez que los filtros cambian
    }, [searchTerm, filtroCarrera, filtroCuatrimestre, filtroGrupos, usuarios]);


    const currentUsers = filteredUsuarios.slice(startIndex, endIndex);


    const user = JSON.parse(localStorage.getItem('user'));

    if (!user || !(user.roles.includes("ROLE_SERVICIOSESCOLARES"))) {
        return <Navigate to="/" />;
    }

    return (
        <div className="container-fluid mt-3">

            {isLoading && (
                <div className="loading-screen">
                    <img src="../../icono_raptor_esperando.png" alt="Cargando..." className="loading-image" />
                    <p className="loading-text">Cargando lista de Alumnos, por favor espera...</p>
                </div>
            )}

            {!isLoading && (
                <div className="text-center mb-3">
                    <h3>LISTA DE ALUMNOS ACTIVOS</h3>
                </div>
            )}
            <div className="search-container">
                <input
                    type="text"
                    placeholder="Buscar matrícula/nombre/carrera..."
                    onChange={(e) => setSearchTerm(e.target.value)}
                />
            </div>
            <div className="row mt-3 mb-3">
                <div className="col-5 filter-container">
                    <select onChange={cambiarFiltroCarrera} value={filtroCarrera}>
                        <option value="">Todas las Carreras</option>
                        <option value="T.S.U en Turismo">T.S.U en Turismo</option>
                        <option value="T.S.U en Construcción">T.S.U en Construcción</option>
                        <option value="T.S.U Tecnologías de la Información, Área Entornos Virtuales y Negocios Digitales">T.S.U Tecnologías de la Información</option>
                        <option value="T.S.U en Gastronomía">T.S.U en Gastronomía</option>
                        <option value="T.S.U en Agrobiotecnología">T.S.U en Agrobiotecnología</option>
                        <option value="T.S.U en Administración">T.S.U en Administración</option>
                        <option value="Licenciatura en Gestión y Desarrollo Turístico">Licenciatura en Gestión y Desarrollo Turístico</option>
                        <option value="Ingeniería en Entornos Virtuales y Negocios Digitales">Ingenieria en Entornos Virtuales y Negocios Digitales</option>
                        <option value="Licenciatura en Gastronomia">Licenciatura en Gastronomía</option>
                        <option value="Ingeniería en Agrobiotecnología">Ingeniería Agrobiotecnología</option>
                        <option value="Licenciatura en Gestión del Capital Humano">Licenciatura en Gestión del Capital Humano</option>
                    </select>
                </div>

                <div className="col-4 filter-container">
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

                <div className="col-3 filter-container">
                    {/* Filtro de Grupos */}
                    <select onChange={cambiarFiltroGrupo} value={filtroGrupos}>
                        <option value="">Todos los Grupos</option>
                        {grupos.map(grupo => (
                            <option key={grupo.id} value={grupo.grupo}>
                                {grupo.grupo}
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
                        <th>Programa Educativo</th>
                        <th>Cuatrimestre</th>
                        <th>Grupo</th>
                    </tr>
                </thead>
                <tbody>
                    {currentUsers.map((usuario, index) => (
                        <tr key={usuario.matricula} >
                            <td>{startIndex + index + 1}</td>
                            <td>{usuario.matricula}</td>
                            <td>{usuario.nombre} {usuario.ap_paterno} {usuario.ap_materno}</td>
                            <td>{usuario.programa_educativo}</td>
                            <td> {usuario.cuatrimestre} </td>
                            <td> {usuario.grupo} </td>
                            <td>
                                <Link className='btn btn-info btn-sm' to={`/aspirantes/${usuario.matricula}`}>Editar</Link>
                            </td>
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

export default ListaAlumnosActivos;
