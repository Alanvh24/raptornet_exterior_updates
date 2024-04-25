import React, { useEffect, useState } from "react";
import userService from "../../services/user.service";
import ReactPaginate from "react-paginate";
import { Navigate } from "react-router-dom";


const normalizeText = (text) => {
  return text.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase();
};


const BoardFinanzasValidacion = () => {
  const [usuarios, setUsuarios] = useState([]);
  const [pageNumber, setPageNumber] = useState(0); //Paginacion
  const itemsPerPage = 10; // Número de filas por página //Paginacion
  const [searchQuery, setSearchQuery] = useState("");
  const [searchText, setSearchText] = useState("");

  const [selectedFile, setSelectedFile] = useState(null);

  const handleFileChange = (event) => {
    setSelectedFile(event.target.files[0]);
  };

  const handleUpload = () => {
    if (selectedFile) {
      userService.cargarPagosExp(selectedFile)
        .then(response => {
          console.log("Archivo cargado con éxito:", response.data);
          alert("Archivo cargado con éxito");
          listarUsuarios();  // Recargar los datos
        })
        .catch(error => {
          console.error("Error al cargar el archivo:", error);
          alert("Error al cargar el archivo: " + error.message);
        });
    }
  };

  const handleUploadPago40 = () => {
    if (selectedFile) {
      userService.cargarPagosExpInscripcion(selectedFile)
        .then(response => {
          console.log("Archivo de inscripción cargado con éxito:", response.data);
          alert("Archivo de inscripción cargado con éxito");
          listarUsuarios();  // Recargar los datos
        })
        .catch(error => {
          console.error("Error al cargar el archivo de inscripción:", error);
          alert("Error al cargar el archivo de inscripción: " + error.message);
        });
    }
  };

  const handleUploadCursosPropedeuticos = () => {
    if (selectedFile) {
      userService.cargarPagosCursos(selectedFile)
        .then(response => {
          console.log("Archivo de cursos propedéuticos cargado con éxito:", response.data);
          alert("Archivo de cursos propedéuticos cargado con éxito");
          listarUsuarios();  // Para recargar los datos después de la carga
        })
        .catch(error => {
          console.error("Error al cargar el archivo de cursos propedéuticos:", error);
          alert("Error al cargar el archivo de cursos propedéuticos: " + error.message);
        });
    } else {
      alert("Por favor, selecciona un archivo antes de intentar cargarlo.");
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
    // Asegúrate de que referencia es una cadena antes de llamar a trim()
    const referencia = String(usuario.referencia).trim();
    if (!referencia) return false;

    let matchesSearchText = true;
    let matchesSearchDate = true;

    // Filtrar por texto si searchText tiene valor
    if (searchText) {
      const normalizedMatricula = normalizeText(usuario.matricula);
      const normalizedReferencia = normalizeText(referencia);
      const normalizedSearchText = normalizeText(searchText);

      matchesSearchText = normalizedMatricula.includes(normalizedSearchText) ||
        normalizedReferencia.includes(normalizedSearchText);
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


  const handleCheckboxChange = (event, matricula) => {
    const nuevoEstado = event.target.checked ? "si" : "no";

    // Aquí enviarías la solicitud de actualización al servidor
    userService.actualizarVerificarPago(matricula, nuevoEstado)
      .then(response => {
        console.log("Estado actualizado:", response.data);
        alert("Estado actualizado:", response.data);
        listarUsuarios();
      })
      .catch(error => {
        console.log("Error al actualizar el estado:", error);
        alert("Error al actualizar el estado: " + error.message);
        window.location.reload();
      });
  };

  const handleCheckboxChangePago40 = (e, matricula) => {
    if (e.target.checked) {
      userService.verificarInscripcionYActualizarRol(matricula)
        .then(response => {
          console.log("Inscripción verificada y rol actualizado: ", response.data);
          alert("Inscripción verificada y rol actualizado");
          listarUsuarios();
        })
        .catch(error => {
          console.log("Error al actualizar:", error);
          alert("Error al actualizar: " + error.message);
        });
    } else {
      // Opcional: Manejar la acción cuando el checkbox se desmarca.
      // Esto depende de la lógica.
    }
  };

  const handleCheckboxChangeCursoPropedeutico = (e, matricula) => {
    if (e.target.checked) {
      // Llama al método del servicio para verificar el pago del curso propedéutico
      userService.verificarPagoCursoPropedeutico(matricula)
        .then(response => {
          console.log("Pago de curso propedéutico verificado: ", response.data);
          alert("Pago de curso propedéutico verificado");
          listarUsuarios();
        })
        .catch(error => {
          console.log("Error al verificar el pago del curso propedéutico:", error);
          alert("Error al verificar el pago del curso propedéutico: " + error.message);
        });
    } else {
      // Opcional: Manejar la acción cuando el checkbox se desmarca.
      // Esto depende de la lógica de tu aplicación.
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
        console.log("Datos recibidos:", response.data);
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
      <div className="text-center">
        <h2>VALIDAR PAGOS</h2>
      </div>
      <div className='search-container mb-3'>
        <input
          type='date'
          placeholder='Filtrar por busqueda'
          // value={searchQuery}
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
            <th>Referencia Bancaria</th>
            <th>Fecha limite de pago</th>
            <th>Realizó pago</th>
            {/* <th>Estatus</th> */}
          </tr>
        </thead>
        <tbody>
          {currentData.map((usuario) => (
            <tr key={usuario.matricula}>
              <td>{usuario.matricula}</td>
              <td>{usuario.referencia}</td>
              <td>
                {filtroPagos === "pago40" || filtroPagos === "cursosPropedeuticos"
                  ? usuario.fecha_limite
                  : usuario.fecha_registro2}
              </td>
              <td>
                {filtroPagos === "pago40" ? (
                  <input
                    type="checkbox"
                    checked={usuario.verificarPago === "si"}
                    onChange={(e) => handleCheckboxChangePago40(e, usuario.matricula)}
                  />
                ) : filtroPagos === "cursosPropedeuticos" ? (
                  <input
                    type="checkbox"
                    checked={usuario.verificarPago === "si"}
                    onChange={(e) => handleCheckboxChangeCursoPropedeutico(e, usuario.matricula)}
                  />
                ) : (
                  <input
                    type="checkbox"
                    checked={usuario.verificarPago === "si"}
                    onChange={(e) => handleCheckboxChange(e, usuario.matricula)}
                  />
                )}
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
      <h5>Valida pagos mediante .exp:</h5>

      <div className="input-group mb-3">
        {filtroPagos === "pago40" && (
          <>
            <input type="file" className="form-control" id="fileUploadPago40" onChange={handleFileChange} />
            <button className="btn btn-warning" onClick={handleUploadPago40}>Cargar .exp de Inscripción</button>
          </>
        )}
        {filtroPagos === "cursosPropedeuticos" && (
          <>
            <input type="file" className="form-control" id="fileUploadCursos" onChange={handleFileChange} />
            <button className="btn btn-primary" onClick={handleUploadCursosPropedeuticos}>Cargar .exp de Cursos Propedéuticos</button>
          </>
        )}
        {filtroPagos === "" && (
          <>
            <input type="file" className="form-control" id="fileUploadExamen" onChange={handleFileChange} />
            <button className="btn btn-success" onClick={handleUpload}>Cargar .exp de Exámen de Admisión</button>
          </>
        )}
      </div>


    </div>
  );
};

export default BoardFinanzasValidacion;
