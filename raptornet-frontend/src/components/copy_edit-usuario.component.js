import React, { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";
import authHeader from "../services/auth-header";

const EditUser = () => {
    const { id } = useParams();
    const [user, setUser] = useState({
        usuario: '',
        nombre: '',
        apellidos: '',
        email: '',
        fecha: '',
        roles: []
    });
    const [selectedRole, setSelectedRole] = useState("");
    const availableRoles = ["admin", "mod", "user"];

    useEffect(() => {
        axios.get(`http://localhost:8080/api/administrar/${id}`, { headers: authHeader() })
            .then(response => {
                setUser(response.data);
            })
            .catch(error => {
                console.error(error);
            });
    }, [id]);

    const handleChange = (event) => {
        const { name, value } = event.target;
        setUser({ ...user, [name]: value });
    };

    const handleRoleChange = (event) => {
        const { value } = event.target;
        setSelectedRole(value);
    };

    const handleSubmit = (event) => {
        event.preventDefault();
    
        console.log("Datos a enviar al servidor:", user);
        console.log("Nuevo rol seleccionado:", selectedRole);
    
        // Envía la solicitud con los cambios, incluyendo el nuevo rol seleccionado como un array.
        axios.put(`http://localhost:8080/api/administrar/${id}`, { ...user, role: [selectedRole] }, { headers: authHeader() })
            .then(response => {
                console.log("User updated successfully");
                alert("Usuario actualizado correctamente");
            })
            .catch(error => {
                console.error("Error updating user:", error);
            });
    };
    

    return (
        <div className="container">
            <h2>Editar Usuario</h2>
            <form onSubmit={handleSubmit}>
                <div className="form-group">
                    <label htmlFor="usuario">Usuario:</label>
                    <input type="text" className="form-control" id="usuario" name="usuario" value={user.usuario} onChange={handleChange} />
                </div>
                <div className="form-group">
                    <label htmlFor="nombre">Nombre:</label>
                    <input type="text" className="form-control" id="nombre" name="nombre" value={user.nombre} onChange={handleChange} />
                </div>
                <div className="form-group">
                    <label htmlFor="apellidos">Apellidos:</label>
                    <input type="text" className="form-control" id="apellidos" name="apellidos" value={user.apellidos} onChange={handleChange} />
                </div>
                <div className="form-group">
                    <label htmlFor="email">Email:</label>
                    <input type="email" className="form-control" id="email" name="email" value={user.email} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label>Rol Actual:</label>
                    {user.roles.map((role) => (
                        <p key={role.id}>{role.name}</p>
                    ))}
                </div>

                <div className="form-group">
                    <label>Elegir Nuevo Rol:</label>
                    <select className="form-control" name="mod" onChange={handleRoleChange}>
                        <option value="">Seleccionar un nuevo rol</option>
                        {availableRoles.map((role) => (
                            <option key={role} value={role}>
                                {role}
                            </option>
                        ))}
                    </select>
                </div>

                <button type="submit" className="btn btn-primary mt-3">Guardar Cambios</button>
            </form>
        </div>
    );
};

export default EditUser;
