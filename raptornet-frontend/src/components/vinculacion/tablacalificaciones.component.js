import React, { useEffect, useState } from "react";
import userService from "../../services/user.service";
import ReactPaginate from "react-paginate";
import { Navigate } from "react-router-dom";

const TablaCalificaciones = () => {
    const [usuarios, setUsuarios] = useState([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [pageNumber, setPageNumber] = useState(0); //Paginacion
    const itemsPerPage = 15; // Número de filas por página
    const [pageCount, setPageCount] = useState(0);
    const [filtroCarrera, setFiltroCarrera] = useState("");
    const [ordenCalificacion, setOrdenCalificacion] = useState(false); // false = ascendente, true = descendente

    const cambiarFiltroCarrera = (e) => {
        setFiltroCarrera(e.target.value);
    };

    const cambiarOrdenCalificacion = () => {
        setOrdenCalificacion(!ordenCalificacion);
    };

    useEffect(() => {
        listarCalificaciones();
    }, []);


    const listarCalificaciones = () => {
        userService.listarCalificaciones().then((response) => {
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


    // Para editar la calificación
    // Estado para controlar la fila en edición
    const [editRow, setEditRow] = useState(null);

    // Estado para almacenar los valores editados
    const [editData, setEditData] = useState({});

    // Manejar el inicio de la edición
    const handleEdit = (usuario) => {
        setEditRow(usuario.matricula);
        setEditData({ ...usuario });
    };

    // Actualizar el estado con los nuevos valores
    const handleEditChange = (e) => {
        setEditData({ ...editData, [e.target.name]: e.target.value });
    };

    const handleEditConfirm = () => {
        if (editRow && editData.aciertos) {
            const aciertosActualizados = parseInt(editData.aciertos, 10);
            if (!isNaN(aciertosActualizados)) {
                userService.actualizarCalificacion(editRow, { aciertos: aciertosActualizados })
                    .then((response) => {
                        console.log(response.data);
                        setEditRow(null);
                        listarCalificaciones(); // Volver a cargar los datos
                    }).catch((error) => {
                        console.log(error);
                    });
            } else {
                alert("Los aciertos deben ser un número");
            }
        } else {
            alert("Falta información para actualizar");
        }
    };


    // Manejar la cancelación de la edición
    const handleEditCancel = () => {
        setEditRow(null);
    };

    // Manejar la aceptación del aspirante
    const aceptarAspirante = (matricula) => {
        userService.actualizarEtapa4(matricula)
            .then(response => {
                console.log("Aspirante aceptado:", response.data);
                listarCalificaciones(); // Actualizar la lista de usuarios
            })
            .catch(error => {
                console.error("Error al aceptar aspirante:", error);
            });
    };

    const user = JSON.parse(localStorage.getItem('user'));

    if (!user || !(user.roles.includes("ROLE_VINCULACION"))) {
        return <Navigate to="/" />;
    }

    return (
        <div className="container-fluid mt-3">

            <div className="text-center mb-3">
                <h3>CALIFICACIONES DE EXÁMENES DE ADMISIÓN</h3>
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
                    <option value="noPago">No pagó</option>
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
                        <th>Carrera</th>
                        <th>Aciertos del exámen</th>
                        <th>Total de aciertos</th>
                        <th onClick={cambiarOrdenCalificacion}>
                            Calificación
                            {ordenCalificacion ? <i className="fa fa-arrow-down" /> : <i className="fa fa-arrow-up" />}
                        </th>
                        <th>Acción</th>

                    </tr>
                </thead>
                <tbody>
                    {filteredUsuarios.map((usuario, index) => (
                        <tr key={usuario.matricula} >
                            <td>{startIndex + index + 1}</td>
                            <td className={usuario.asp_etapa === "101" ? "row-asp-etapa-101" : ""}>{usuario.matricula}</td>
                            <td>{usuario.nombre} {usuario.ap_paterno} {usuario.ap_materno}</td>
                            <td>{usuario.email}</td>
                            <td>{usuario.numero_telefonico}</td>
                            <td>{usuario.id_carrera_1}</td>
                            {editRow === usuario.matricula ? (
                                <td>
                                    <input
                                        type="text"
                                        name="aciertos"
                                        value={editData.aciertos}
                                        onChange={handleEditChange}
                                    />
                                </td>
                            ) : (
                                <td onClick={() => handleEdit(usuario)}>{usuario.aciertos}</td>
                            )}
                            <td>{usuario.total_aciertos}</td>
                            <td className={usuario.asp_etapa === "101" ? "row-asp-etapa-101" : ""} >{usuario.calificacion}</td>

                            {editRow === usuario.matricula && (
                                <td>
                                    <button className="btn btn-success" onClick={handleEditConfirm}>Confirmar</button>
                                    <button className="btn btn-danger" onClick={handleEditCancel}>Cancelar</button>
                                </td>
                            )}

                            <td>
                                <button
                                    className="btn btn-success btn-sm"
                                    onClick={() => aceptarAspirante(usuario.matricula)}
                                >
                                    Aceptar Aspirante
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

export default TablaCalificaciones;
