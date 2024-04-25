import React, { Component } from 'react';
import ReactPaginate from 'react-paginate';

import userService from '../services/user.service';

class DigBitacoraComponent extends Component {
  state = {
    data: [],
    currentPage: 1,
    itemsPerPage: 15,
    searchQuery: '',
  };

  componentDidMount() {
    userService.getDigBitacora()
      .then((response) => {
        this.setState({ data: response.data });
      })
      .catch((error) => {
        console.error('Error al obtener datos de Dig Bitacora:', error);
      });
  }

  handlePageChange = (selectedPage) => {
    this.setState({
      currentPage: selectedPage,
    });
  };

  handleSearchChange = (event) => {
    this.setState({
      searchQuery: event.target.value,
    });
  };

  render() {
    const { data, currentPage, itemsPerPage, searchQuery } = this.state;

    const filteredData = data.filter((dig) =>
    Object.values(dig)
      .map((value) => value.toString().toLowerCase())
      .join(' ')
      .includes(searchQuery.toLowerCase())
  );
  

    const indexOfLastItem = currentPage * itemsPerPage;
    const indexOfFirstItem = indexOfLastItem - itemsPerPage;
    const currentItems = filteredData.slice(indexOfFirstItem, indexOfLastItem);

    const pageCount = Math.ceil(filteredData.length / itemsPerPage);

    return (
      <div className='container'>
        <h2>Lista de Datos de Dig Bitacora</h2>

        <div className='search-container'>
          <input
            type='text'
            placeholder='Filtrar por busqueda'
            value={searchQuery}
            onChange={this.handleSearchChange}
          />
        </div>

        <table className='table'>
          <thead className='table-light'>
            <tr>
              <th>Endoso</th>
              <th>Caja</th>
              <th>Fuar</th>
              <th>Tipo de Documento</th>
              <th>Clave Electoral</th>
              <th>Fecha de Consulta</th>
              <th>ID Usuario</th>
            </tr>
          </thead>
          <tbody className='table-group-divider'>
            {currentItems.map((dig) => (
              <tr key={dig.id_user}>
                <td>{dig.endoso}</td>
                <td>{dig.caja}</td>
                <td>{dig.fuar}</td>
                <td>{dig.tipodocumento_id}</td>
                <td>{dig.clave_electoral}</td>
                <td>{dig.fecha_consulta}</td>
                <td>{dig.id_user}</td>
              </tr>
            ))}
          </tbody>
        </table>

        <div className='pagination-container'>
          <ReactPaginate
            pageCount={pageCount}
            pageRangeDisplayed={5}
            marginPagesDisplayed={2}
            onPageChange={(selectedPage) => this.handlePageChange(selectedPage.selected + 1)}
            containerClassName={'pagination'}
            activeClassName={'active'}
            previousLabel={'<'}
            nextLabel={'>'}
          />
        </div>
      </div>
    );
  }
}

export default DigBitacoraComponent;

