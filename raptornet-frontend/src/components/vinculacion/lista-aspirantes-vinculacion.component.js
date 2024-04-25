import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import userService from "../../services/user.service";
import ReactPaginate from "react-paginate";
import * as XLSX from "xlsx";
import { utils } from "xlsx";



const BoardVinculacion = () => {
  const [usuarios, setUsuarios] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [pageNumber, setPageNumber] = useState(0); //Paginacion
  const itemsPerPage = 15; // Número de filas por página
  const [pageCount, setPageCount] = useState(0);
  const ordenadosPorMatricula = [...usuarios].sort((a, b) => parseInt(b.matricula) - parseInt(a.matricula));

  useEffect(() => {
    listarUsuarios();
  }, []);


  const listarUsuarios = () => {
    userService.listarUsuarios().then((response) => {
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
  const filteredUsuarios = ordenadosPorMatricula.filter(usuario => {


    // Aplicar la normalización a la búsqueda y a las propiedades del usuario
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
  }, [searchTerm, usuarios]);

  const handleExportExcel = () => {
    if (usuarios.length === 0) {
      console.log("No hay datos de usuarios disponibles");
      return;
    }

    const data = usuarios.map(usuario => {
      return [
        usuario.matricula,
        `${usuario.nombre} ${usuario.ap_paterno} ${usuario.ap_materno}`,
        usuario.email,
        usuario.numero_telefonico,
        usuario.id_carrera_1,
        usuario.id_carrera_2,
        usuario.fecha_registro
      ];
    });


    data.unshift([
      "Matricula",
      "Nombre",
      "Correo electrónico",
      "Contacto",
      "Primera opción",
      "Segunda Opción",
      "Fecha de Registro"
    ]);

    const ws = utils.aoa_to_sheet(data);

    // Establecer el ancho de las columnas
    const columnWidths = data[0].map(() => ({ width: 30 }));
    ws['!cols'] = columnWidths;

    const wb = utils.book_new();
    utils.book_append_sheet(wb, ws, "Aspirantes");

    // Obtener la fecha actual
    const currentDate = new Date();
    const formattedDate = currentDate.toLocaleDateString().replace(/\//g, "_");

    // Aquí es donde se escribe el archivo Excel con el nombre basado en la fecha actual
    XLSX.writeFile(wb, `lista_aspirantes_${formattedDate}.xlsx`);
  };

  const handleExportExcelDetailed = () => {
    if (usuarios.length === 0) {
      alert("No hay datos de usuarios disponibles para exportar.");
      return;
    }

    const data = usuarios.map(usuario => ({
      Matricula: usuario.matricula,
      Nombre: usuario.nombre,
      ApellidoPaterno: usuario.ap_paterno,
      ApellidoMaterno: usuario.ap_materno,
      CURP: usuario.curp,
      RFC: usuario.rfc || "",
      NSS: usuario.nss || "",
      Email: usuario.email,
      Contacto: usuario.numero_telefonico,
      FechaNacimiento: usuario.fecha_nacimiento,
      Edad: usuario.edad,
      Genero: usuario.genero,
      Nacionalidad: usuario.nacionalidad,
      Estado: usuario.estado,
      MunicipioNacimiento: usuario.municipio_nacimiento,
      LocalidadNacimiento: usuario.localidad_nacimiento,
      Roles: usuario.roles.join(", "),
      FechaRegistro: usuario.fecha_registro,
      HablaIndigena: usuario.habla_indigena,
      LenguaIndigena: usuario.lengua_indigena || "",
      TieneDiscapacidad: usuario.tiene_discapacidad,
      Discapacidad: usuario.discapacidad || "",
      TipoSangre: usuario.tipo_sangre,
      TieneAlergias: usuario.tiene_alergias,
      Alergias: usuario.alergias || "",
      NombreContactoE: usuario.nombre_contacto_e,
      TelefonoContactoE: usuario.telefono_contacto_e,
      EmailContactoE: usuario.email_contacto_e,
      ParentescoContactoE: usuario.parentesco_contacto_e,
      NombreBachillerato: usuario.nombre_bachillerato,
      PeriodoBachillerato: usuario.periodo_bachillerato,
      PromedioBachillerato: usuario.promedio_bachillerato,
      Carrera1: usuario.id_carrera_1,
      Carrera2: usuario.id_carrera_2
    }));

    const ws = XLSX.utils.json_to_sheet(data);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Usuarios Detallados");

    const fileName = `Usuarios_Detallados_${new Date().toLocaleDateString().replace(/\//g, "_")}.xlsx`;
    XLSX.writeFile(wb, fileName);
  };


  const user = JSON.parse(localStorage.getItem("user"));

  if (user && (user.roles.includes('ROLE_VINCULACION') || user.roles.includes('ROLE_SERVICIOSESCOLARES'))) {
    return (
      <div className="container-fluid mt-3">

        <div className="text-center mb-3">
          <h3>LISTA DE PROSPECTOS Y ASPIRANTES REGISTRADOS EN RAPTORNET</h3>
        </div>

        <div className="search-container">
          <input
            type="text"
            placeholder="Buscar usuario..."
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>

        <div className="d-grid gap-2 d-md-block mt-3 mb-3">


          <button className="btn btn-labeled btn-success btn-dow" onClick={handleExportExcel}><span className="btn-label">Exportar tabla a Excel</span><i className="fa fa-file-excel"></i></button>

          <button className="btn btn-labeled btn-success btn-dow" onClick={handleExportExcelDetailed}>
            <span className="btn-label">Exportar Información completa de Aspirantes</span><i className="fa fa-file-excel"></i>
          </button>

        </div>


        <table className='table table-bordered table-striped text-center'>
          <thead>
            <tr>
              <th>#</th>
              <th>Matricula</th>
              <th>Nombre</th>
              <th>Correo electrónico</th>
              <th>Contacto</th>
              <th>Primera opción</th>
              <th>Segunda Opción</th>
              <th>Fecha de Registro</th>
              <th>Rol</th>
              {user && user.roles.includes('ROLE_SERVICIOSESCOLARES') && (
                <th>Etapa</th>
              )}

              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {filteredUsuarios.map((usuario, index) => (
              <tr key={usuario.matricula}>
                <td>{startIndex + index + 1}</td>
                <td>{usuario.matricula}</td>
                <td>{usuario.nombre} {usuario.ap_paterno} {usuario.ap_materno}</td>
                <td>{usuario.email}</td>
                <td>{usuario.numero_telefonico}</td>
                <td>{usuario.id_carrera_1}</td>
                <td>{usuario.id_carrera_2}</td>
                <td>{usuario.fecha_registro}</td>
                <td>
                  {usuario.roles.map((role, index) => {
                    const roleDisplay = role.replace('ROLE_', '');
                    return (
                      <h6 className="text-center" key={index}>{roleDisplay}<br /></h6>
                    );
                  })}
                </td>

                {user && user.roles.includes('ROLE_SERVICIOSESCOLARES') && (
                  <td> {usuario.asp_etapa} </td>
                )}

                <td>
                  <Link className='btn btn-info btn-sm' to={`/aspirantes/${usuario.matricula}`}>Editar</Link>
                  {/* <button style={{ marginLeft: "10px" }} className='btn btn-danger' onClick={() => deleteUsuario(usuario.id)}>Eliminar</button> */}
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

export default BoardVinculacion;
