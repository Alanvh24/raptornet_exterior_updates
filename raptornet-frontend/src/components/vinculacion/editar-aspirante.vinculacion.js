import React, { useEffect, useState } from "react";
import "../../Perfil.css";
import UserService from "../../services/user.service";
import { Navigate, useParams } from "react-router-dom";

const EditarAspiranteVinculacion = () => {

  const [aspirante, setAspirante] = useState({
    habla_indigena: '',
    lengua_indigena: '',
    tiene_discapacidad: '',
    discapacidad: '',
    tiene_alergias: '',
    alergias: ''
  });
  const [generos, setGeneros] = useState([]);
  const { matricula } = useParams();
  const [estados, setEstados] = useState([]);
  const [nacionalidades, setNacionalidades] = useState([]);
  const [tipoSangre, setTipoSangre] = useState([]);
  const [carrera, setCarrera] = useState([]);
  const handleRadioChange = (e) => {
    const { name, value } = e.target;
    setAspirante({ ...aspirante, [name]: value });

    // Resetear la lengua indígena si se selecciona "No"
    if (name === 'habla_indigena' && value === 'no') {
      setAspirante(prevAspirante => ({ ...prevAspirante, lengua_indigena: '' }));
    }

    // Resetear la discapacidad si se selecciona "No"
    if (name === 'tiene_discapacidad' && value === 'no') {
      setAspirante(prevAspirante => ({ ...prevAspirante, discapacidad: '' }));
    }

    // Resetear la alergia si se selecciona "No"
    if (name === 'tiene_alergias' && value === 'no') {
      setAspirante(prevAspirante => ({ ...prevAspirante, alergias: '' }));
    }
  };

  useEffect(() => {
    if (matricula) {
      UserService.obtenerInfoAspirante(matricula)
        .then(response => {
          const data = response.data;
          const generoId = generos.find(g => g.genero === data.genero)?.id_genero;
          const estadoId = estados.find(e => e.estado === data.estado)?.id_estado_mexico;
          const nacionalidadId = nacionalidades.find(n => n.nacionalidad === data.nacionalidad)?.id_nacionalidad;
          const tipoSangreId = tipoSangre.find(t => t.tipo_sangre === data.tipo_sangre)?.id_tipo_sangre;
          const carrera1Id = carrera.find(c => c.carrera === data.id_carrera_1)?.id_carrera;
          const carrera2Id = carrera.find(c => c.carrera === data.id_carrera_2)?.id_carrera;
          setAspirante({
            ...data,
            id_genero: generoId,
            id_estado_mexico: estadoId,
            id_nacionalidad: nacionalidadId,
            id_tipo_sangre: tipoSangreId,
            id_carrera_1: carrera1Id,
            id_carrera_2: carrera2Id,
          });
        })
        .catch(error => {
          console.log('Error al obtener la información del aspirante:', error);
        });
    }
  }, [matricula, generos, estados, nacionalidades, tipoSangre, carrera]);



  useEffect(() => {
    UserService.getGeneros()
      .then(response => {
        setGeneros(response.data);
      })
      .catch(error => {
        console.log('Error al obtener géneros:', error);
      });
  }, []);

  useEffect(() => {
    UserService.getNacionalidades()
      .then(response => {
        setNacionalidades(response.data);
      })
      .catch(error => {
        console.log('Error al obtener nacionalidades:', error);
      });

    UserService.getEstados()
      .then(response => {
        setEstados(response.data);
      })
      .catch(error => {
        console.log('Error al obtener nacionalidades:', error);
      });

    UserService.getSangre()
      .then(response => {
        setTipoSangre(response.data);
      })
      .catch(error => {
        console.log('Error al obtener estados:', error);
      });

    UserService.getCarrera()
      .then(response => {
        setCarrera(response.data);
      })
      .catch(error => {
        console.log('Error al obtener carreras:', error);
      });
  }, []);


  const handleChange = (e) => {
    const { name, value } = e.target;
    setAspirante({ ...aspirante, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    UserService.actualizarDatosAspirante(matricula, aspirante)
      .then(response => {
        console.log('Datos actualizados con éxito:', response.data);
        alert("Datos actualizados correctamente");
      })
      .catch(error => {
        console.log('Error al actualizar los datos:', error);
      });
  };


  const user = JSON.parse(localStorage.getItem('user'));

  if (!user || !(user.roles.includes("ROLE_VINCULACION") || user.roles.includes("ROLE_SERVICIOSESCOLARES"))) {
    // Redirige a la página de inicio si el usuario no tiene los roles requeridos
    return <Navigate to="/" />;
  }

  return (

    <div>
      <div className="main active">
        <small>
          <i className="fa fa-home text-dark" />
        </small>
        <div className="text">
          <h2>Información Personal</h2>
          <h5>Matrícula: {aspirante.matricula} </h5>
          <p>Ingresa tu información personal</p>
        </div>
        <div className="input-text">
          {/* Primer Bloque */}

          <div className="input-div">
            <input
              type="text"
              name="nombre"
              className="form-control mayus-text"
              value={aspirante.nombre || ''}
              onChange={handleChange} />
            <span>Nombre</span>
          </div>

          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              name="ap_paterno"
              value={aspirante.ap_paterno || ''}
              onChange={handleChange}
            />
            <span>Apellido Paterno</span>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              name="ap_materno"
              value={aspirante.ap_materno || ''}
              onChange={handleChange}
            />
            <span>Apellido Materno</span>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              name="curp"
              value={aspirante.curp || ''}
              onChange={handleChange}
            />
            <span>CURP (Modifica SOLO SI ES NECESARIO)</span>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              name="rfc"
              value={aspirante.rfc || ''}
              onChange={handleChange}
            />
            <span>RFC</span>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              name="nss"
              value={aspirante.nss || ''}
              onChange={handleChange}
            />
            <span>NSS</span>
          </div>
        </div>
        <div className="input-text">
          <div className="input-div">
            <input
              type="date"
              className="form-control mayus-text"
              name="fecha_nacimiento"
              value={aspirante.fecha_nacimiento || ''}
              onChange={handleChange}
            />
            <span>Fecha de Nacimiento</span>
          </div>
          <div className="input-div">
            <input
              type="number"
              className="form-control mayus-text"
              name="edad"
              value={aspirante.edad || ''}
              onChange={handleChange}
            />
            <span>Edad</span>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control"
              name="email"
              value={aspirante.email || ''}
              onChange={handleChange}
            />
            <span>Email</span>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              name="numero_telefonico"
              value={aspirante.numero_telefonico || ''}
              onChange={handleChange}
            />
            <span>Número Telefónico</span>
          </div>
          <div className="input-div">
            <select
              className="form-control"
              name="id_genero"
              value={aspirante.id_genero || ''}
              onChange={handleChange}
            >
              <option value="">Seleccione un género</option>
              {generos.map((genero) => (
                <option key={genero.id_genero} value={genero.id_genero}>
                  {genero.genero}
                </option>
              ))}
            </select>
          </div>


          <div className="input-div">
            <select
              className="form-control"
              name="id_nacionalidad"
              value={aspirante.id_nacionalidad || ''}
              onChange={handleChange}
            >
              <option value="">Seleccione una nacionalidad</option>
              {nacionalidades.map(nacionalidad => (
                <option key={nacionalidad.id_nacionalidad} value={nacionalidad.id_nacionalidad}>
                  {nacionalidad.nacionalidad}
                </option>
              ))}
            </select>
          </div>

        </div>
        <div className="input-text">

          <div className="input-div">
            <select
              className="form-control"
              name="id_estado_mexico"
              value={aspirante.id_estado_mexico || ''}
              onChange={handleChange}
            >
              <option value="">Seleccione un estado</option>
              {estados.map(estado => (
                <option key={estado.id_estado_mexico} value={estado.id_estado_mexico}>
                  {estado.estado}
                </option>
              ))}
            </select>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              name="municipio_nacimiento"
              value={aspirante.municipio_nacimiento || ''}
              onChange={handleChange}
            />
            <span>Municipio de Nacimiento</span>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              name="localidad_nacimiento"
              value={aspirante.localidad_nacimiento || ''}
              onChange={handleChange}
            />
            <span>Localidad de Nacimiento</span>
          </div>
        </div>
      </div>

      {/* Datos Generales */}

      <div className="main active">
        <div className="text">
          <h2>Datos Generales</h2>
          <p>Ingresa tus datos generales</p>
        </div>

        <div className="input-text">
          <div className="input-div">
            <p className="span_custom">¿Hablas alguna lengua indígena?</p>
            <label>
              <input
                type="radio"
                name="habla_indigena"
                value="si"
                checked={aspirante.habla_indigena === 'si'}
                onChange={handleRadioChange}
              />
              Sí
            </label>

            <label>
              <input
                type="radio"
                name="habla_indigena"
                value="no"
                checked={aspirante.habla_indigena === 'no'}
                onChange={handleRadioChange}
              />
              No
            </label>
          </div>

          {aspirante.habla_indigena === 'si' && (
            <div className="input-div">
              <input
                type="text"
                className="form-control"
                name="lengua_indigena"
                value={aspirante.lengua_indigena || ''}
                onChange={handleChange}
              />
              <span>Especifíca cuál</span>
            </div>
          )}
        </div>


        <div className="input-text">

          <div className="input-div">
            <p className="span_custom">¿Tienes alguna discapacidad?</p>
            <label>
              <input
                type="radio"
                name="tiene_discapacidad"
                value="si"
                checked={aspirante.tiene_discapacidad === 'si'}
                onChange={handleRadioChange}
              />
              Sí
            </label>

            <label>
              <input
                type="radio"
                name="tiene_discapacidad"
                value="no"
                checked={aspirante.tiene_discapacidad === 'no'}
                onChange={handleRadioChange}
              />
              No
            </label>
          </div>

          {aspirante.tiene_discapacidad === 'si' && (
            <div className="input-div">
              <input
                type="text"
                className="form-control"
                name="discapacidad"
                value={aspirante.discapacidad || ''}
                onChange={handleChange}
              />
              <span>Especifíca cuál</span>
            </div>
          )}

        </div>


      </div>

      {/* Información Médica */}
      <div className="main active">
        <small>
          <i className="fa fa-home text-dark" />
        </small>
        <div className="text">
          <h2>Información Médica</h2>
          <p>Ingresa tu información médica</p>
        </div>

        <div className="input-div">
          <select
            className="form-control"
            name="id_tipo_sangre"
            value={aspirante.id_tipo_sangre || ''}
            onChange={handleChange}
          >
            <option value="">Seleccione tipo de sangre</option>
            {tipoSangre.map((ts) => (
              <option key={ts.id_tipo_sangre} value={ts.id_tipo_sangre}>
                {ts.tipo_sangre}
              </option>
            ))}
          </select>
        </div>

        <div className="input-text">

          <div className="input-div">
            <p className="span_custom">¿Tienes alguna alergia?</p>
            <label>
              <input
                type="radio"
                value="si"
                name="tiene_alergias"
                checked={aspirante.tiene_alergias === 'si'}
                onChange={handleRadioChange}
              />
              Sí
            </label>

            <label>
              <input
                type="radio"
                value="no"
                name="tiene_alergias"
                checked={aspirante.tiene_alergias === 'no'}
                onChange={handleRadioChange}
              />
              No
            </label>
          </div>
          {aspirante.tiene_alergias === 'si' && (
            <div className="input-div">
              <input
                type="text"
                name="alergias"
                className="form-control"
                value={aspirante.alergias || ''}
                onChange={handleChange}
              />
              <span>Especifíca cuál</span>
            </div>
          )}
        </div>
      </div>

      {/* Contacto de Emergencia */}
      <div className="main active">
        <small>
          <i className="fa fa-home text-dark" />
        </small>
        <div className="text">
          <h2>Contacto de Emergencia</h2>
          <p>Ingresa tu información personal</p>
        </div>
        <div className="input-text">
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              value={aspirante.nombre_contacto_e || ''}
              name="nombre_contacto_e"
              onChange={handleChange}
            />
            <span>Nombre de contacto de Emergencia</span>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              value={aspirante.telefono_contacto_e || ''}
              name="telefono_contacto_e"
              onChange={handleChange}
            />
            <span>Número de contacto de Emergencia</span>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              name="email_contacto_e"
              value={aspirante.email_contacto_e || ''}
              onChange={handleChange}
            />
            <span>Correo de contacto de Emergencia</span>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              name="parentesco_contacto_e"
              value={aspirante.parentesco_contacto_e || ''}
              onChange={handleChange}
            />
            <span>Parentesco de contacto de Emergencia</span>
          </div>
        </div>
      </div>

      {/* Antecedentes Académicos */}
      <div className="main active">
        <small>
          <i className="fa fa-home text-dark" />
        </small>
        <div className="text">
          <h2>Antecedentes Académicos</h2>
          <p>Ingresa tus Antecedentes Académicos</p>
        </div>
        <div className="input-text">
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              value={aspirante.nombre_bachillerato || ''}
              name="nombre_bachillerato"
              onChange={handleChange}
            />
            <span>Nombre de Bachillerato de Egreso</span>
          </div>
          <div className="input-div">
            <input
              type="text"
              className="form-control mayus-text"
              value={aspirante.periodo_bachillerato || ''}
              name="periodo_bachillerato"
              onChange={handleChange}
            />
            <span>Periodo de Bachillerato</span>
          </div>

          <div className="input-div">

            <input
              type="text"
              className="form-control mayus-text"
              value={aspirante.promedio_bachillerato || ''}
              name="promedio_bachillerato"
              onChange={handleChange}
            />
            <span>Promedio de Bachillerato </span>
          </div>
          <div className="input-div">
            <select
              className="form-control"
              name="id_carrera_1"
              value={aspirante.id_carrera_1 || ''}
              onChange={handleChange}
              disabled
            >
              <option value="" disabled>Primera opción para estudiar en la UTMiR</option>
              {carrera.map(c => (
                <option key={c.id_carrera} value={c.id_carrera}>
                  {c.carrera}
                </option>
              ))}
            </select>
          </div>

          <div className="input-div">
            <select
              className="form-control"
              name="id_carrera_2"
              value={aspirante.id_carrera_2 || ''}
              onChange={handleChange}
              disabled
            >
              <option value="">Segunda opción para estudiar en la UTMiR</option>
              {carrera.map(c => (
                <option key={c.id_carrera} value={c.id_carrera}>
                  {c.carrera}
                </option>
              ))}
            </select>
          </div>

        </div>
        <button className="btn btn-success" type="submit" onClick={handleSubmit}>Actualizar Datos</button>
      </div>


    </div>
  );
};

export default EditarAspiranteVinculacion;
