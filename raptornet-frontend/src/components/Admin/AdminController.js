import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import ReactPaginate from "react-paginate";
import adminService from "../../services/admin.service";

const AdminController = () => {
    const [usuarios, setUsuarios] = useState([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [pageNumber, setPageNumber] = useState(0); //Paginacion
    const itemsPerPage = 15; // Número de filas por página
    const [pageCount, setPageCount] = useState(0);
    const [ordenFechaRegistro, setOrdenFechaRegistro] = useState(false);

    useEffect(() => {
        listarUsuarios();
    }, []);


    const listarUsuarios = () => {
        adminService.listarRegistros().then((response) => {
            setUsuarios(response.data);
            setPageCount(Math.ceil(response.data.length / itemsPerPage));
            console.log(response.data);
        }).catch((error) => {
            console.log(error);
        });
    };

    const cambiarOrdenFechaRegistro = () => {
        setOrdenFechaRegistro(!ordenFechaRegistro);
    };


    const startIndex = pageNumber * itemsPerPage; //Paginacion
    const endIndex = startIndex + itemsPerPage;

    // Función para normalizar y eliminar caracteres especiales no deseados
    const normalizeString = (str) => {
        return (str ?? "").normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().trim();
    };

    // Filtrado y segmentación de usuarios
    const filteredUsuarios = usuarios

        .sort((a, b) => {
            const fechaA = new Date(a.fechaRegistro);
            const fechaB = new Date(b.fechaRegistro);
            return ordenFechaRegistro ? fechaB - fechaA : fechaA - fechaB;
        })
        .filter(usuario => {
            // Aplicar la normalización a la búsqueda y a las propiedades del usuario
            const searchTermNormalized = normalizeString(searchTerm);
            const nombreCompleto = `${usuario.nombre ?? ''} ${usuario.ap_paterno ?? ''} ${usuario.ap_materno ?? ''}`;
            const nombreNormalized = normalizeString(nombreCompleto);
            const emailNormalized = normalizeString(usuario.email);
            const matriculaNormalized = normalizeString(usuario.matricula?.toString());
            const carreraNormalized = normalizeString(usuario.id_carrera_1);
            const curpNormalized = normalizeString(usuario.curp);

            return nombreNormalized.includes(searchTermNormalized) ||
                emailNormalized.includes(searchTermNormalized) ||
                carreraNormalized.includes(searchTermNormalized) ||
                matriculaNormalized.includes(searchTermNormalized) ||
                curpNormalized.includes(searchTermNormalized);
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
            const searchTermNormalized = normalizeString(searchTerm);
            const nombreCompleto = `${usuario.nombre ?? ''} ${usuario.ap_paterno ?? ''} ${usuario.ap_materno ?? ''}`;
            const nombreNormalized = normalizeString(nombreCompleto);
            const emailNormalized = normalizeString(usuario.email);
            const matriculaNormalized = normalizeString(usuario.matricula?.toString());
            const carreraNormalized = normalizeString(usuario.id_carrera_1);
            const curpNormalized = normalizeString(usuario.curp);


            return nombreNormalized.includes(searchTermNormalized) ||
                emailNormalized.includes(searchTermNormalized) ||
                carreraNormalized.includes(searchTermNormalized) ||
                curpNormalized.includes(searchTermNormalized) ||
                matriculaNormalized.includes(searchTermNormalized) ||
                curpNormalized.includes(searchTermNormalized);

        }).length;

        setPageCount(Math.ceil(filteredLength / itemsPerPage));
        setPageNumber(0); // Opcional: resetear a la primera página tras una nueva búsqueda
    }, [searchTerm, usuarios]);

    const user = JSON.parse(localStorage.getItem("user"));

    if (user && user.roles.includes('ROLE_ADMIN')) {
        return (
            <div className="container-fluid mt-3">

                <div className="text-center mb-3">
                    <h3>LISTA DE PROSPECTOS REGISTRADOS EN RAPTORNET</h3>
                </div>

                <div className="search-container">
                    <input
                        type="text"
                        placeholder="Buscar usuario..."
                        onChange={(e) => setSearchTerm(e.target.value)}
                    />
                </div>

                <table className='table table-bordered table-striped text-center'>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Matricula</th>
                            <th>Nombre</th>
                            <th>Rol</th>
                            <th onClick={cambiarOrdenFechaRegistro} style={{ cursor: 'pointer' }}>
                                Fecha de Registro
                                <span style={{ marginLeft: '10px' }}>
                                    {ordenFechaRegistro ? (
                                        <i className="fa fa-arrow-down" title="Orden Descendente" />
                                    ) : (
                                        <i className="fa fa-arrow-up" title="Orden Ascendente" />
                                    )}
                                </span>
                            </th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        {filteredUsuarios.map((usuario, index) => (
                            <tr key={usuario.matricula}>
                                <td>{startIndex + index + 1}</td>
                                <td>{usuario.matricula}</td>
                                <td>{usuario.nombre} {usuario.ap_paterno} {usuario.ap_materno} </td>
                                <td>{usuario.roles} </td>
                                <td>{usuario.fechaRegistro}</td>
                                <td>
                                    <Link className='btn btn-info btn-sm' to={`/resetPassword/${usuario.matricula}`}>Restablecer Contraseña</Link>
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
    }
};

export default AdminController;
