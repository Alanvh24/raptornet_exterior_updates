import React, { useEffect, useState } from "react";
import userService from "../../services/user.service";
import ReactPaginate from "react-paginate";
import { Navigate } from "react-router-dom";
import Swal from "sweetalert2";
const BoardFinanzas = () => {
  const [usuarios, setUsuarios] = useState([]);
  const [pageNumber, setPageNumber] = useState(0); //Paginacion
  const itemsPerPage = 10; // Número de filas por página //Paginacion
  const generarContenidoTxt = () => {
    let contenido = filteredUsers.map(usuario => {
      let fechaMostrar = usuario.fecha_registro; // Default
      if (filtroPagos === "pago40") {
        fechaMostrar = usuario.fecha_limite; // Para el filtro de pago40, se muestra fecha_limite
      } else if (filtroPagos === "cursosPropedeuticos") {
        fechaMostrar = usuario.fecha_limite;
      }
      return `${usuario.concatenaciones.join("\n")}\t${usuario.costo}\t${fechaMostrar}\n`;
    }).join("");

    return contenido;
  };



  const [searchQuery, setSearchQuery] = useState("");

  const [filtroPagos, setFiltroPagos] = useState("");

  const cambiarFiltroPagos = (e) => {
    const filtroSeleccionado = e.target.value;
    setFiltroPagos(filtroSeleccionado);

    if (filtroSeleccionado === "pago40") {
      userService.listarAspirantesPago40().then((response) => {
        setUsuarios(response.data);
      }).catch((error) => {
        console.log(error);
      });
    } else if (filtroSeleccionado === "cursosPropedeuticos") { // Nuevo caso para cursos propedéuticos
      userService.listaPagosCursosPropedeutico().then((response) => {
        setUsuarios(response.data);
        console.log(response.data);
      }).catch((error) => {
        console.log(error);
      });
    } else {
      listarUsuarios();
    }
  };


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
    // Verifica si el campo de carrera está vacío
    if (!usuario.id_carrera_1 || usuario.id_carrera_1.trim() === "") return false;

    const tieneReferencia = usuario.referencia && usuario.referencia.length > 0;
    if (tieneReferencia) return false;

    if (!searchQuery) return true;

    const matricula = usuario.matricula ? usuario.matricula.toLowerCase() : "";
    const idCarrera = usuario.id_carrera_1 ? usuario.id_carrera_1.toLowerCase() : "";
    const fechaRegistro = usuario.fecha_registro ? usuario.fecha_registro.toLowerCase() : "";
    const fechaRegistro2 = usuario.fecha_registro2 ? usuario.fecha_registro2.toLowerCase() : "";

    return matricula.includes(searchQuery) ||
      idCarrera.includes(searchQuery) ||
      fechaRegistro.includes(searchQuery) ||
      fechaRegistro2.includes(searchQuery);
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

    Swal.fire({
      position: 'top',
      icon: 'success',
      title: 'Tu archivo .txt se ha descargado exitosamente',
      showConfirmButton: false,
      timer: 1500
    });
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

  const user = JSON.parse(localStorage.getItem('user'));

  if (!user || !(user.roles.includes("ROLE_FINANZAS"))) {
    return <Navigate to="/" />;
  }

  return (
    <div className="container mt-3">

      <div className="text-center">
        <h2>GENERAR CONCATENADO Y DESCARGAR .TXT</h2>
      </div>

      <div className='search-container mb-3'>
        <input
          type='date'
          placeholder='Filtrar por busqueda'
          // value={searchQuery}
          onChange={handleSearchDateFormat}
        />
      </div>

      <div className='filter-container mb-3'>
        <select onChange={cambiarFiltroPagos} value={filtroPagos}>
          <option value="">Exámen de Admisión</option>
          <option value="cursosPropedeuticos">Cursos Propedéuticos</option>
          <option value="pago40">Paquete de inscripción</option>

        </select>
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
              <td>
                {filtroPagos === "pago40" || filtroPagos === "cursosPropedeuticos"
                  ? usuario.fecha_generacion
                  : usuario.fecha_registro}
              </td>
              <td>
                {filtroPagos === "pago40" || filtroPagos === "cursosPropedeuticos"
                  ? usuario.fecha_limite
                  : usuario.fecha_registro2}
              </td>

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

export default BoardFinanzas;
