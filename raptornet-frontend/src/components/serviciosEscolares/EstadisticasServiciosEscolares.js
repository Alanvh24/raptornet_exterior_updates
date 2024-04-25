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

ChartJS.register(CategoryScale, LinearScale, BarElement, Tooltip, Legend, ArcElement);
ChartJS.register(ChartDataLabels);

const EstadisticasServiciosEscolares = () => {
  const [estadisticas, setEstadisticas] = useState([]);
  const [anioSeleccionado, setAnioSeleccionado] = useState(2024);
  const user = JSON.parse(localStorage.getItem('user'));

  useEffect(() => {
    userService.listarEstadisticasCalificados()
      .then(response => {
        setEstadisticas(response.data);
      })
      .catch(error => {
        console.log(error);
      });
  }, []);

  // Filtrar estadísticas basadas en el año seleccionado
  const estadisticasFiltradas = estadisticas.filter(e => e.anio === anioSeleccionado);

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

  const barOptions = {
    plugins: {
      datalabels: {
        color: '#FFFFFF',
        formatter: (value, context) => {
          return value;
        }
      }
    }
  };

  const pieOptions = {
    plugins: {
      datalabels: {
        color: '#FFFFFF',
        formatter: (value, context) => {
          return value;
        }
      }
    }
  };

  // Calcular totales para la gráfica de pastel
  const totalCompletos = estadisticasFiltradas.reduce((acc, curr) => acc + curr.cantidadAspirantesCompletos, 0);
  const totalNoCompletos = estadisticasFiltradas.reduce((acc, curr) => acc + curr.cantidadAspirantesNoCompletados, 0);
  const totalGeneral = totalCompletos + totalNoCompletos;

  const pieData = {
    labels: ['Aspirantes Completos', 'Aspirantes No Completos'],
    datasets: [
      {
        data: [totalCompletos, totalNoCompletos],
        backgroundColor: ['#016837', '#C70039'],
        borderColor: ['rgba(54, 162, 235, 1)', 'rgba(255, 99, 132, 1)'],
        borderWidth: 1,
        responsive: true,
        maintainAspectRatio: false,
        aspectRatio: 12,
      }
    ]
  };

  if (user && user.roles.includes('ROLE_SERVICIOSESCOLARES')) {
    return (
      <div className='container-fluid'>
        <div className="row text-center">

          <h1 className='mt-3'>Estadísticas - Registros que completaron perfil en RaptorNet</h1>
          <div className="mt-6">
            <button className="btn btn-success" onClick={() => setAnioSeleccionado(2023)}>Mostrar 2023</button>
            <button className="btn btn-success" onClick={() => setAnioSeleccionado(2024)}>Mostrar 2024</button>
          </div>

          <div className="col-xl-6 col-sm-6 col-12 graph-box d-flex flex-column justify-content-center align-items-center">
            <div>
              <h3>Total Registros (Completaron perfil) - {anioSeleccionado}</h3>
              <p>Total de registros: {totalGeneral}</p>
              <div className="graph-container">
                <Pie data={pieData} options={pieOptions} />
              </div>
            </div>
          </div>

          <div className="col-xl-6 col-sm-6 col-12 ">
            <div>
              <h3>Registros de aspirantes por Carrera - {anioSeleccionado}</h3>
              <div className="graph-container">
                <Bar data={barData} options={barOptions} />
              </div>
            </div>
          </div>

        </div>
      </div>
    );
  } else {
    return <Navigate to="/login" />;
  }
}

export default EstadisticasServiciosEscolares;
