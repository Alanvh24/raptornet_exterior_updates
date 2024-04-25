import React, { useEffect, useState } from "react";
import userService from "../../services/user.service";
import ReactPaginate from "react-paginate";
import { Navigate } from "react-router-dom";


const normalizeText = (text) => {
    return text.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase();
};


const ValidarPagosFicha = () => {
    const [usuarios, setUsuarios] = useState([]);
    const [pageNumber, setPageNumber] = useState(0); //Paginacion
    const itemsPerPage = 10; // Número de filas por página //Paginacion
    const [searchText, setSearchText] = useState("");
    const [folios, setFolios] = useState({});


    useEffect(() => {
        listarEtapa1();
    }, []);

    const listarEtapa1 = () => {
        userService.listarEtapa1().then((response) => {
            setUsuarios(response.data);
            console.log(response.data);
        }).catch((error) => {
            console.log(error);
        });
    };

    const handleFolioChange = (matricula, value) => {
        setFolios(prevFolios => ({
            ...prevFolios,
            [matricula]: value
        }));
    };


    const handleCheckboxChange = (matricula, folio) => {
        if (!folio || isNaN(folio)) {
            alert("Por favor, ingrese un folio válido.");
            return;
        }

        userService.verificarPagodeFicha(matricula, folio) // Ahora pasando 'folio' como segundo argumento
            .then(response => {
                console.log("Pago verificado con éxito para la matrícula:", matricula);
                alert("Pago verificado con éxito para la matrícula: " + matricula); // Ajuste para concatenar correctamente
                listarEtapa1();
            })
            .catch(error => {
                console.error("Error al verificar el pago para la matrícula:", matricula, error);
            });
    };

    const handlePageClick = (data) => {
        const selectedPage = data.selected;
        setPageNumber(selectedPage);
    };

    const filteredUsers = usuarios.filter(usuario => {

        let matchesSearchText = true;
        let matchesSearchDate = true;

        if (searchText) {
            const normalizedMatricula = normalizeText(usuario.matricula);
            const normalizedNombre = normalizeText(usuario.nombre);
            const normalizedSearchText = normalizeText(searchText);

            matchesSearchText = normalizedMatricula.includes(normalizedSearchText) || normalizedNombre.includes(normalizedSearchText);
        }

        return matchesSearchText && matchesSearchDate;
    });

    const pageCount = Math.ceil(filteredUsers.length / itemsPerPage); //Paginacion
    const startIndex = pageNumber * itemsPerPage; //Paginacion
    const endIndex = startIndex + itemsPerPage;

    const currentData = filteredUsers.slice(startIndex, endIndex);

    const user = JSON.parse(localStorage.getItem('user'));

    if (!user || !(user.roles.includes("ROLE_VINCULACION"))) {
        return <Navigate to="/" />;
    }

    return (

        <div className="container mt-3">
            <div className="text-center">
                <h2>VALIDAR PAGOS DE FICHAS</h2>
            </div>

            <div className='search-container mb-3'>
                <input
                    type='text'
                    placeholder='Buscar por referencia o matrícula'
                    value={searchText}
                    onChange={(e) => setSearchText(e.target.value)}
                />
            </div>
            <table className='table table-bordered table-striped text-center'>
                <thead>
                    <tr>
                        <th>Matricula</th>
                        <th>Nombre</th>
                        <th>Etapa del prospecto</th>
                        <th>Folio</th>
                        <th>Realizó pago</th>
                    </tr>
                </thead>
                <tbody>
                    {currentData.map((usuario) => (
                        <tr key={usuario.matricula}>
                            <td>{usuario.matricula}</td>
                            <td>{usuario.nombre} {usuario.ap_paterno} {usuario.ap_materno}</td>
                            <td>{usuario.asp_etapa}</td>
                            <td>
                                <input
                                    type="text"
                                    className="text-center"
                                    value={folios[usuario.matricula] || ''}
                                    onChange={(e) => handleFolioChange(usuario.matricula, e.target.value)}
                                />
                            </td>
                            <td>
                                <input
                                    type="checkbox"
                                    onChange={() => handleCheckboxChange(usuario.matricula, folios[usuario.matricula])}
                                    checked={usuario.asp_etapa === '3'}
                                    disabled={!folios[usuario.matricula] || isNaN(folios[usuario.matricula])}
                                />

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

export default ValidarPagosFicha;