import React, { useEffect, useState } from "react";
import userService from "../../services/user.service";
import ReactPaginate from "react-paginate";
import { Navigate } from "react-router-dom";
import Swal from "sweetalert2";
import "../../styles/Loading.css";


const BoardFinanzasCargar = () => {
  const [usuarios, setUsuarios] = useState([]);
  const [pageNumber, setPageNumber] = useState(0); //Paginacion
  const itemsPerPage = 10; // Número de filas por página 
  const [searchQuery, setSearchQuery] = useState("");

  const [archivo, setArchivo] = useState(null);
  const [isLoading, setIsLoading] = useState(false);


  const handleFileChange = (event) => {
    setArchivo(event.target.files[0]); // Almacenar el archivo seleccionado
  };

  const handleUpload = () => {
    if (archivo) {
      setIsLoading(true);
      userService.cargarReferencias(archivo)
        .then(response => {
          setIsLoading(false);
          Swal.fire({
            title: 'Éxito',
            text: 'Archivo cargado exitosamente',
            icon: 'success',
            confirmButtonText: 'Ok',
            allowEscapeKey: false,
            allowOutsideClick: false,
          }).then((result) => {
            if (result.isConfirmed) {
              window.location.reload();
            }
          });
          console.log("Archivo cargado exitosamente:", response.data);
        })
        .catch(error => {
          setIsLoading(false);
          Swal.fire({
            title: 'Error',
            text: 'Error al cargar el archivo',
            icon: 'error',
            confirmButtonText: 'Ok'
          });
          console.log("Error al cargar el archivo:", error);
        });

    } else {
      Swal.fire({
        title: 'Advertencia',
        text: 'Por favor, selecciona un archivo .txt para cargar.',
        icon: 'warning',
        confirmButtonText: 'Ok'
      });
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


  const [filtroPagos, setFiltroPagos] = useState("");

  const cambiarFiltroPagos = (e) => {
    const filtroSeleccionado = e.target.value;
    setFiltroPagos(filtroSeleccionado);

    if (filtroSeleccionado === "pago40") {
      userService.listarAspirantesPago40().then((response) => {
        setUsuarios(response.data);
        console.log("Datos recibidos:", response.data); // Agrega esto para depurar
      }).catch((error) => {
        console.log(error);
      });

    } else if (filtroSeleccionado === "cursosPropedeuticos") { //cursos propedéuticos
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

  const user = JSON.parse(localStorage.getItem('user'));

  if (!user || !(user.roles.includes("ROLE_FINANZAS"))) {
    return <Navigate to="/" />;
  }

  return (

    <div className="container mt-3">

      {isLoading && (
        <div className="loading-screen">
          <img src="../icono_raptor_esperando.png" alt="Cargando..." className="loading-image" />
          <p className="loading-text">Subiendo referencias. Cargando, por favor espera...</p>
        </div>
      )}


      {!isLoading && (
        <div>

          <div className="text-center">
            <h2>CARGAR REFERENCIA BANCARIA</h2>
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
            <h5>Selecciona el tipo de pago: </h5>
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
                <th>Cuota</th>
                <th>Cantidad de Pago</th>
                <th>Fecha Límite de Pago</th>
                <th>Referencia Bancaria</th>
                {/* <th>Estatus</th> */}
              </tr>
            </thead>
            <tbody>
              {currentData.map((usuario) => (
                <tr key={usuario.matricula}>
                  <td>{usuario.matricula}</td>
                  <td>
                    {usuario.cuota.map((item, index) => (
                      <p key={index}>{item}</p>
                    ))}
                  </td>
                  <td>{usuario.costo}</td>
                  <td>
                    {filtroPagos === "pago40" || filtroPagos === "cursosPropedeuticos"
                      ? usuario.fecha_limite
                      : usuario.fecha_registro2}
                  </td>
                  <td>{usuario.referencia}</td>
                </tr>
              ))}
            </tbody>
          </table>

          <div>
            <input type="file" onChange={handleFileChange} accept=".txt" />
            <button className="btn btn-success" onClick={handleUpload}>Cargar Referencias (.txt)</button>
          </div>


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
      )}


    </div>
  );
};

export default BoardFinanzasCargar;
