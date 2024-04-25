import React from 'react';
import { useLocation } from 'react-router-dom';

const Resultados = () => {
  const location = useLocation();

  if (!location.state || !location.state.data) {
    
    return (
      <div>
        <h1>Resultados</h1>
        <p>No hay datos disponibles.</p>
      </div>
    );
  }

  const data = location.state.data;
  const headers = data[0].slice(1); 
  const userData = data.slice(1);

  return (
    <div className='container'>
      <h1>Resultados</h1>
      <table className='table'>
        <thead>
          <tr>
            <th>Usuario</th>
            {headers.map((header, index) => (
              <th key={index}>{`D${index + 1}`}</th>
            ))}
          </tr>
        </thead>
        <tbody className='table-group-divider'>
          {userData.map((user, index) => (
            <tr key={index}>
              <td>{user[0]}</td>
              {user.slice(1).map((value, index) => (
                <td key={index}>{value}</td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Resultados;
