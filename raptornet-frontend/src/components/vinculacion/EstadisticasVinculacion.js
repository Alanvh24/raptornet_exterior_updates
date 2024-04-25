import React, { useEffect, useState } from 'react';
import { Navigate } from 'react-router-dom';
import userService from '../../services/user.service';
import { Bar, Pie } from 'react-chartjs-2';
import ChartDataLabels from 'chartjs-plugin-datalabels';

import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Tooltip,
  Legend,
  ArcElement,
} from 'chart.js';

ChartJS.register(CategoryScale, LinearScale, BarElement, Tooltip, Legend, ArcElement, ChartDataLabels);

const EstadisticasVinculacion = () => {
  const [estadisticas, setEstadisticas] = useState([]);
  const [anioSeleccionado, setAnioSeleccionado] = useState(2024);
  const user = JSON.parse(localStorage.getItem('user'));
  const [mostrarPorcentajes, setMostrarPorcentajes] = useState(false);
  const [estadisticasDiarias, setEstadisticasDiarias] = useState([]);


  const handleChange = () => {
    setMostrarPorcentajes(!mostrarPorcentajes);
  };

  const formatter = (value, context) => {
    if (mostrarPorcentajes) {
      // Calcula y muestra el porcentaje
      const percentage = (value / totalGeneral * 100).toFixed(2);
      return `${percentage}%`;
    } else {
      // Muestra el valor absoluto
      return value;
    }
  };

  useEffect(() => {
    userService.obtenerTodasLasEstadisticas()
      .then(response => {
        const data = Array.isArray(response.data) ? response.data : [];
        setEstadisticasDiarias(data);
      })

      .catch(error => {
        console.log(error);
      });
  }, []);

  useEffect(() => {
    userService.listarEstadisticasCalificados()
      .then(response => {
        const datosTransformados = response.data.map(item => {
          // Verifica si el nombre de la carrera es el largo y lo cambia por la versión corta
          if (item.carrera === "T.S.U Tecnologías de la Información, Área Entornos Virtuales y Negocios Digitales") {
            return { ...item, carrera: "T.S.U Tecnologías de la Información" };
          }
          return item;
        });
        setEstadisticas(datosTransformados);
      })
      .catch(error => {
        console.log(error);
      });
  }, []);


  // Filtrar estadísticas basadas en el año seleccionado
  const estadisticasFiltradas = estadisticas.filter(e => e.anio === anioSeleccionado);
  const hayDatosDisponibles = estadisticas.length > 0 || estadisticasDiarias.length > 0 || estadisticasFiltradas.length > 0;

  // Preparar los datos para la gráfica de barras
  const barData = {
    labels: estadisticasFiltradas.map(e => e.carrera),
    datasets: [
      {
        label: 'Prospectos interesados (Se registraron y aplicaron exámen de admisión)',
        data: estadisticasFiltradas.map(e => e.cantidadAspirantesCompletos),
        backgroundColor: '#016837'
      },
      {
        label: 'Prospectos no interesados (se registraron pero no culminaron proceso)',
        data: estadisticasFiltradas.map(e => e.cantidadAspirantesNoCompletados),
        backgroundColor: '#C70039'
      }
    ]
  };

  const generalBarData = {
    labels: estadisticasDiarias.map(e => e.fecha), // Usar la fecha como etiqueta
    datasets: [
      {
        label: 'Cantidad de Registros Diarios',
        data: estadisticasDiarias.map(e => e.cantidadRegistros),
        backgroundColor: '#243958',
        borderColor: 'rgba(53, 162, 235, 1)',
        borderWidth: 1,
      }
    ]
  };

  // Calcular totales para la gráfica de pastel
  const totalCompletos = estadisticasFiltradas.reduce((acc, curr) => acc + curr.cantidadAspirantesCompletos, 0);
  const totalNoCompletos = estadisticasFiltradas.reduce((acc, curr) => acc + curr.cantidadAspirantesNoCompletados, 0);
  const totalGeneral = totalCompletos + totalNoCompletos;

  const pieData = {
    labels: ['Prospectos que completaron su proceso y APLICARON exámen de admisión', 'Prospectos que NO terminaron proceso (No aplicaron examen)'],
    datasets: [
      {
        data: [totalCompletos, totalNoCompletos],
        backgroundColor: ['#016837', '#C70039'],
        borderColor: ['rgba(54, 162, 235, 1)', 'rgba(255, 99, 132, 1)'],
        borderWidth: 1,
        responsive: true,
        maintainAspectRatio: false,
      }
    ]
  };

  const barOptions = {
    plugins: {
      datalabels: {
        color: '#FFFFFF',
        formatter: formatter
      }
    },
  };

  const pieOptions = {
    responsive: true,
    plugins: {
      datalabels: {
        color: '#FFFFFF', // Color de los datalabels
        formatter: formatter, // Utiliza tu función de formateo personalizada
        anchor: 'center',
        align: 'center',
        font: {
          size: 14, // Tamaño de la fuente de los datalabels
        }
      },
      legend: {
        position: 'top', // Posición de la leyenda
        labels: {
          color: '#333333', // Color de texto de la leyenda para mejorar contraste
          padding: 20, // Espaciado alrededor de la leyenda
          font: {
            size: 14, // Tamaño de la fuente de la leyenda
          }
        }
      },
      tooltip: {
        enabled: true,
        backgroundColor: 'rgba(0, 0, 0, 0.8)',
        bodyColor: '#FFFFFF',
        bodyFont: {
          size: 14,
        }
      }
    },
    animation: {
      animateScale: true,
      animateRotate: true
    },
  };


  const optionsDiarias = {
    scales: {
      x: {
        ticks: {
          maxRotation: 45,
          minRotation: 45,
          autoSkip: true,
          autoSkipPadding: 50,
          padding: 0,
        }
      }
    },
    plugins: {
      datalabels: {
        color: '#FFFFFF',
        formatter: formatter
      }
    }
  };


  if (user && (user.roles.includes('ROLE_VINCULACION') || user.roles.includes('ROLE_SERVICIOSESCOLARES'))) {
    return (
      <div className='container-fluid'>
        <div className="row text-center">

          <h1 className='mt-3'>Estadísticas - Registros que completaron perfil en RaptorNet</h1>

          <div className="mt-6">
            <button className="btn btn-graphs" onClick={() => setAnioSeleccionado(2023)}>Mostrar 2023</button>
            <button className="btn btn-graphs" onClick={() => setAnioSeleccionado(2024)}>Mostrar 2024</button>
            <button className="btn btn-graphs" onClick={handleChange}>
              {mostrarPorcentajes ? 'Mostrar Valores Absolutos' : 'Mostrar Porcentajes'}
            </button>
          </div>

          {!hayDatosDisponibles ? (
            <div className="alert alert-info" role="alert">
              Sin información todavía.
            </div>
          ) : (

            <>


              <section className='section-bar'>
                <div>
                  <h3>Total Registros (Completaron perfil) - {anioSeleccionado}</h3>
                  <p>Total de registros: {totalGeneral}</p>
                  <div className="graph-container-pie mb-3">
                    <Pie data={pieData} options={pieOptions} />
                  </div>
                </div>
              </section>

              <section className='section-bar'>
                <div>
                  <h3>Registros de aspirantes por Carrera - {anioSeleccionado}</h3>
                  <div className="graph-container">
                    <Bar data={barData} options={barOptions} />
                  </div>
                </div>
              </section>

              <section className='section-bar'>
                <div>
                  <h3>Cantidad de Registros Diarios</h3>
                  <div style={{ overflowX: 'auto', width: '100%' }}>
                    <div style={{ minWidth: '1000px' }}>
                      <Bar data={generalBarData} options={optionsDiarias} />
                    </div>
                  </div>

                </div>
              </section>
            </>
          )}
        </div>
      </div>
    );
  } else {
    return <Navigate to="/" />;
  }
}

export default EstadisticasVinculacion;
