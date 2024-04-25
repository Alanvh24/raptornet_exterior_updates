import React, { useEffect, useState } from "react";
import userService from "../../services/user.service";
import ReactPaginate from "react-paginate";
import { Navigate } from "react-router-dom";
import * as XLSX from "xlsx";


const normalizeText = (text) => {
  if (text === null || text === undefined) {
    return "";
  }
  return text.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase();
};


const HistorialPagos = () => {


  const [usuarios, setUsuarios] = useState([]);
  const [pageNumber, setPageNumber] = useState(0); //Paginacion
  const itemsPerPage = 25; // Número de filas por página //Paginacion
  const [searchQuery, setSearchQuery] = useState("");
  const [searchText, setSearchText] = useState("");

  useEffect(() => {
    historialPagos();
  }, []);

  const historialPagos = () => {
    userService.historialPagos().then((response) => {
      const sortedData = response.data.sort((a, b) => b.id - a.id); // Orden descendente por ID
      setUsuarios(sortedData);
      console.log(sortedData);
    }).catch((error) => {
      console.log(error);
    });
  };



  const handlePageClick = (data) => {
    const selectedPage = data.selected;
    setPageNumber(selectedPage);
  };

  const filteredUsers = usuarios.filter(usuario => {
    let matchesSearchText = true;
    let matchesSearchDate = true;
    // Filtrar por texto si searchText tiene valor
    if (searchText) {
      const normalizedMatricula = normalizeText(usuario.matricula);
      const normalizedNombre = normalizeText(usuario.nombre);
      const normalizedAp_paterno = normalizeText(usuario.ap_paterno);
      const normalizedAp_materno = normalizeText(usuario.ap_materno);
      const nombreCompleto = `${usuario.nombre} ${usuario.ap_paterno} ${usuario.ap_materno}`;
      const normalizedNombreCompleto = normalizeText(nombreCompleto);
      const normalizedSearchText = normalizeText(searchText);

      matchesSearchText = normalizedMatricula.includes(normalizedSearchText) ||
        normalizedNombre.includes(normalizedSearchText) || normalizedAp_paterno.includes(normalizedSearchText) ||
        normalizedAp_materno.includes(normalizedSearchText) || normalizedNombreCompleto.includes(normalizedSearchText);
    }

    // Filtrar por fecha si searchQuery tiene valor
    if (searchQuery) {
      const fechaRegistro = usuario.fecha_registro ? usuario.fecha_registro.toLowerCase() : "";
      matchesSearchDate = fechaRegistro.includes(searchQuery);
    }

    return matchesSearchText && matchesSearchDate;
  });

  const pageCount = Math.ceil(filteredUsers.length / itemsPerPage); //Paginacion
  const startIndex = pageNumber * itemsPerPage; //Paginacion
  const endIndex = startIndex + itemsPerPage;

  const currentData = filteredUsers.slice(startIndex, endIndex);

  // Función para manejar el cambio de formato de la fecha
  const handleSearchDateFormat = (event) => {
    const fecha = event.target.value; // yyyy-mm-dd 
    if (fecha) {
      const [year, month, day] = fecha.split('-');
      const formattedDate = `${day}/${month}/${year}`; // dd/mm/yyyy
      setSearchQuery(formattedDate);
    } else {
      setSearchQuery('');
    }
  };

  const descargarExcel = () => {
    // Crear un nuevo libro de trabajo y una hoja de trabajo
    const wb = XLSX.utils.book_new();
    const ws = XLSX.utils.json_to_sheet(usuarios);

    // Añadir la hoja de trabajo al libro de trabajo
    XLSX.utils.book_append_sheet(wb, ws, "Historial Pagos");

    // Generar un archivo Excel y descargarlo
    XLSX.writeFile(wb, "HistorialPagos.xlsx");
  };


  const user = JSON.parse(localStorage.getItem('user'));

  if (!user || !(user.roles.includes("ROLE_FINANZAS"))) {
    return <Navigate to="/" />;
  }

  return (

    <div className="container mt-3">
      <div className="text-center">
        <h2>HISTORIAL DE PAGOS</h2>
      </div>
      <div className='search-container mb-3'>
        <input
          type='date'
          placeholder='Filtrar por busqueda'
          onChange={handleSearchDateFormat}
        />
      </div>

      <div className='search-container mb-3'>
        <input
          type='text'
          placeholder='Buscar por referencia o matrícula'
          value={searchText}
          onChange={(e) => setSearchText(e.target.value)}
        />
      </div>

      <button onClick={descargarExcel} className="btn btn-success">Descargar Excel</button>

      <table className='table table-bordered table-striped text-center'>
        <thead>
          <tr>
            <th>ID</th>
            <th>Matricula</th>
            <th>Nombre Completo</th>
            <th>Programa Educativo</th>
            <th>Cuota</th>
            <th>Costo</th>
            <th>Folio</th>
            <th>Realizó Pago</th>
          </tr>
        </thead>
        <tbody>
          {currentData.map((usuario) => (
            <tr key={usuario.id}>
              <td> {usuario.id} </td>
              <td>{usuario.matricula}</td>
              <td>{usuario.nombre} {usuario.ap_paterno} {usuario.ap_materno} </td>
              <td>{usuario.programa_educativo}</td>
              <td>{usuario.cuota}</td>
              <td>{usuario.costo}</td>
              <td> {usuario.folio} </td>
              <td> {usuario.verificarPago || "NO"} </td>
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

export default HistorialPagos;
