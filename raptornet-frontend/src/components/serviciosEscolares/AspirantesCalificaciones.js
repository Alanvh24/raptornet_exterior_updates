import React, { useEffect, useState } from "react";
import userService from "../../services/user.service";
import ReactPaginate from "react-paginate";
const AspirantesCalificados = () => {
  const [usuarios, setUsuarios] = useState([]);
  const [pageNumber, setPageNumber] = useState(0); //Paginacion
  const itemsPerPage = 10; // Número de filas por página //Paginacion
  const generarContenidoTxt = () => {
    let contenido = filteredUsers.map(usuario => {
      // Asumiendo que 'usuario.concatenaciones', 'usuario.cantidadPago', y 'usuario.fecha_registro' existen
      return `${usuario.concatenaciones.join("\n")}\t${usuario.costo}\t${usuario.fecha_registro}\n`;
    }).join("");

    return contenido;
  };

  const [searchQuery, setSearchQuery] = useState("");

  useEffect(() => {
    listarUsuarios();
  }, []);

  const listarUsuarios = () => {
    userService.listarFinanzas().then((response) => {
      setUsuarios(response.data);
      console.log(response.data);
    }).catch((error) => {
      console.log(error);
    });
  };

  const handlePageClick = (data) => {
    const selectedPage = data.selected;
    setPageNumber(selectedPage);
  };

  const filteredUsers = usuarios.filter(usuario => {


    const tieneReferencia = usuario.referencia && usuario.referencia.length > 0;
    if (tieneReferencia) return false;

    if (!searchQuery) return true;
    const queryLower = searchQuery.toLowerCase();

    return usuario.matricula.toLowerCase().includes(queryLower) ||
      usuario.id_carrera_1.toLowerCase().includes(queryLower) ||
      usuario.fecha_registro2.toLowerCase().includes(queryLower) ||
      usuario.fecha_registro.toLowerCase().includes(queryLower);
  });



  const pageCount = Math.ceil(filteredUsers.length / itemsPerPage); //Paginacion
  const startIndex = pageNumber * itemsPerPage; //Paginacion
  const endIndex = startIndex + itemsPerPage;

  const currentData = filteredUsers.slice(startIndex, endIndex);

  const descargarTxt = () => {
    const contenido = generarContenidoTxt();
    const blob = new Blob([contenido], { type: "text/plain;charset=utf-8" });
    const href = URL.createObjectURL(blob);

    // Obtener la fecha actual y formatearla
    const fechaActual = new Date();
    const dia = String(fechaActual.getDate()).padStart(2, '0');
    const mes = String(fechaActual.getMonth() + 1).padStart(2, '0'); // Enero es 0
    const año = fechaActual.getFullYear().toString().substr(-2); // Últimos dos dígitos del año
    // Construir el nombre del archivo
    const nombreArchivo = `concatenado_${dia}_${mes}_${año}.txt`;
    // Crear un enlace temporal y hacer clic en él para descargar
    const link = document.createElement("a");
    link.href = href;
    link.download = nombreArchivo; // Nombre del archivo
    document.body.appendChild(link);
    link.click();

    // Limpiar y remover el enlace
    document.body.removeChild(link);
    URL.revokeObjectURL(href);
  };


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



  return (
    <div className="container mt-3">
      <div className='search-container mb-3'>
        <input
          type='date'
          placeholder='Filtrar por busqueda'
          onChange={handleSearchDateFormat}
        />
      </div>


      <table className='table table-bordered table-striped text-center'>
        <thead>
          <tr>
            <th>Matricula</th>
            <th>Carrera</th>
            <th>Formato Númerico</th>
            <th>Cuota</th>
            <th>Formato Numérico</th>
            <th>Periodo</th>
            <th>Concatenado</th>
            <th>Cantidad de Pago</th>
            <th>Fecha de registro</th>
            <th>Fecha Límite de Pago</th>
          </tr>
        </thead>
        <tbody>
          {currentData.map((usuario) => (
            <tr key={usuario.matricula}>
              <td>{usuario.matricula}</td>
              <td>{usuario.id_carrera_1}</td>
              <td>{usuario.formato_numerico}</td>
              <td>
                {usuario.cuota.map((item, index) => (
                  <p key={index}>{item}</p>
                ))}
              </td>
              <td>
                {usuario.formato_numerico_cuota.map((item, index) => (
                  <p key={index}>{item}</p>
                ))}
              </td>
              <td>3</td>
              <td>
                {usuario.concatenaciones.map((item, index) => (
                  <p key={index}>{item}</p>
                ))}
              </td>
              <td>{usuario.costo}</td>
              <td>{usuario.fecha_registro}</td>
              <td>{usuario.fecha_registro2}</td>
            </tr>
          ))}
        </tbody>
      </table>
      <button className="btn btn-success" onClick={descargarTxt}>Descargar (.txt)</button>

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

export default AspirantesCalificados;
