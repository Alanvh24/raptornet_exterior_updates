import React from 'react';
import Swal from 'sweetalert2';
import serviciosEscolaresService from '../../services/serviciosEscolares.service';

const CambioCuatrimestre = () => {
    let timeoutHandle;

    const handleAvanzarCuatrimestre = () => {
        Swal.fire({
            title: 'Confirmar Avance de Cuatrimestre',
            text: "Esta acción avanzará a todos los estudiantes al siguiente cuatrimestre y cerrará el acceso a las materias actuales para los docentes. ¿Deseas continuar?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, avanzar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                // Segundo mensaje de confirmación
                Swal.fire({
                    title: 'Estás seguro?',
                    text: "Confirma nuevamente para proceder con el avance de cuatrimestre. Esta acción no puede deshacerse.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Confirmar',
                    cancelButtonText: 'Cancelar'
                }).then((secondResult) => {
                    if (secondResult.isConfirmed) {
                        Swal.fire({
                            title: 'Cambiando de cuatrimestre',
                            html: 'Por favor espera...',
                            willOpen: () => {
                                Swal.showLoading();
                                timeoutHandle = setTimeout(() => {
                                    ejecutarCambioCuatrimestre();
                                }, 5000);
                            },
                            showCancelButton: true,
                            cancelButtonColor: '#d33',
                            cancelButtonText: 'Cancelar',
                            showConfirmButton: false,
                            willClose: () => {
                                clearTimeout(timeoutHandle);
                            },
                            allowOutsideClick: false, 
                            allowEscapeKey: false     
                        });
                    }

                });
            }
        });
    };

    const ejecutarCambioCuatrimestre = () => {
        serviciosEscolaresService.avanzarCuatrimestre()
            .then(() => {
                Swal.fire(
                    '¡Operación Exitosa!',
                    'Todos los estudiantes han avanzado al siguiente cuatrimestre.',
                    'success'
                );
            })
            .catch(error => {
                const errorMessage = error.response && error.response.data ? error.response.data : 'No se pudo avanzar el cuatrimestre debido a un error desconocido.';
                Swal.fire(
                    'Error',
                    errorMessage,
                    'error'
                );
            });
    };

    return (
        <div className="container mt-5">
            <h2>Gestión de Cuatrimestre</h2>
            <p className="text-muted">
                Este proceso es crítico y modifica la configuración actual del cuatrimestre en curso. Por favor, verifica que sea el momento adecuado para presionar el botón.
            </p>
            <button onClick={handleAvanzarCuatrimestre} className="btn btn-danger btn-lg">
                Avanzar al Siguiente Cuatrimestre
            </button>
        </div>
    );
};

export default CambioCuatrimestre;
