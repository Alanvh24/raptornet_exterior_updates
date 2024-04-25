import React, { useEffect, useState } from "react";
import userService from "../../services/user.service";
import ReactPaginate from "react-paginate";
import { Navigate } from "react-router-dom";

const ListaAspirantesAceptados = () => {
    const [usuarios, setUsuarios] = useState([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [pageNumber, setPageNumber] = useState(0); //Paginacion
    const itemsPerPage = 15; // Número de filas por página
    const [pageCount, setPageCount] = useState(0);
    const [filtroCarrera, setFiltroCarrera] = useState("");


    const cambiarFiltroCarrera = (e) => {
        setFiltroCarrera(e.target.value);
    };

    useEffect(() => {
        listarAceptados();
    }, []);


    const listarAceptados = () => {
        userService.listarAceptados().then((response) => {
            setUsuarios(response.data);
            setPageCount(Math.ceil(response.data.length / itemsPerPage));
            console.log(response.data);
        }).catch((error) => {
            console.log(error);
        });
    };

    // Manejar la aceptación del aspirante
    const rechazarAspirante = (matricula) => {
        userService.rechazarAspirante(matricula)
            .then(response => {
                console.log("Aspirante aceptado:", response.data);
                listarAceptados();
            })
            .catch(error => {
                console.error("Error al aceptar aspirante:", error);
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

    if (!user || !(user.roles.includes("ROLE_VINCULACION"))) {
        return <Navigate to="/" />;
    }

    return (
        <div className="container-fluid mt-3">

            <div className="text-center mb-3">
                <h3>LISTA DE ASPIRANTES ACEPTADOS </h3>
            </div>

            <div className="search-container">
                <input
                    type="text"
                    placeholder="Buscar matrícula/nombre/carrera..."
                    onChange={(e) => setSearchTerm(e.target.value)}
                />
            </div>
            <div className="filter-container">
                <select onChange={cambiarFiltroCarrera} value={filtroCarrera}>
                    <option value="">Todas las Carreras</option>
                    <option value="T.S.U en Turismo">Turismo</option>
                    <option value="T.S.U en Construcción">Construcción</option>
                    <option value="T.S.U Tecnologías de la Información y Comunicación Area Entornos Virtuales y Negocios Digitales">Tecnologías de la Información y Comunicación</option>
                    <option value="T.S.U en Gastronomía">Gastronomía</option>
                    <option value="T.S.U en Agrobiotecnología">Agrobiotecnologia</option>
                    <option value="T.S.U en Administración">Administración</option>
                </select>
            </div>


            <table className='table table-bordered table-striped text-center'>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Matrícula</th>
                        <th>Nombre</th>
                        <th>Correo electrónico</th>
                        <th>Contacto</th>
                        <th>Programa Educativo</th>
                        <th>Estatus</th>

                    </tr>
                </thead>
                <tbody>
                    {filteredUsuarios.map((usuario, index) => (
                        <tr key={usuario.matricula} className={usuario.asp_etapa === 101 ? "row-asp-etapa-101" : ""}>
                            <td>{startIndex + index + 1}</td>
                            <td>{usuario.matricula}</td>
                            <td>{usuario.nombre} {usuario.ap_paterno} {usuario.ap_materno}</td>
                            <td>{usuario.email}</td>
                            <td>{usuario.numero_telefonico}</td>
                            <td>{usuario.id_carrera_1}</td>
                            <td>
                                <button
                                    className="btn btn-danger btn-sm"
                                    onClick={() => rechazarAspirante(usuario.matricula)}
                                >
                                    Rechazar aspirante
                                </button>
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

export default ListaAspirantesAceptados;
