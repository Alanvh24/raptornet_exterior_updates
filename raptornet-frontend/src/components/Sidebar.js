import React, { useState } from 'react'
import "../styles/Sidebar.css";
import { Link } from 'react-router-dom';

export const Sidebar = () => {

    const [isSidebarOpen, setIsSidebarOpen] = useState(false);
    const [showMenus, setShowMenus] = useState({
        menuCategoria: false,
        menuPosts: false,
        // otros menús 
    });


    const handleArrowClick = (menuName) => {
        setShowMenus(prevShowMenus => ({
            ...prevShowMenus,
            [menuName]: !prevShowMenus[menuName]
        }));
    };

    const toggleSidebar = () => {
        setIsSidebarOpen(!isSidebarOpen);
    };


    return (

        <div>
            <div className={`sidebar ${isSidebarOpen ? "" : "close"}`}>
                <div className='logo-details'>
                    <i className="fa-solid fa-globe " onClick={toggleSidebar}></i>
                    <span className='logo_name'>Raptornet</span>
                </div>

                <ul className='nav-links'>

                    <li>
                        <Link to="/finanzas">
                            <i className="fa-solid fa-table-cells-large"></i>
                            <span className='link_name'>Dashboard</span>
                        </Link>

                        <ul className='sub-menu blank'>
                            <li> <Link to="#" className='link_name'>Dashboard</Link> </li>
                        </ul>

                    </li>

                    <li>
                        <div className='icon-link' onClick={() => handleArrowClick('menuCategoria')}>
                            <Link to="#">
                                <i className="fa-solid fa-layer-group"></i>
                                <span className='link_name'>Categoria</span>
                            </Link>
                            <i className={`fa-solid fa-caret-down arrow ${showMenus.menuCategoria ? "rotateIcon" : ""}`}></i>
                        </div>
                        <ul className={`sub-menu ${showMenus.menuCategoria ? "showMenu" : ""}`}>
                            <li> <Link to="#" className='link_name'>Categoría</Link> </li>
                            <li> <Link to="#">Iniciar Sesión</Link> </li>
                            <li> <Link to="#">Formulario de Registro</Link> </li>
                        </ul>
                    </li>

                    <li>
                        <div className='icon-link' onClick={() => handleArrowClick('menuPosts')}>
                            <Link to="#">
                                <i className="fa-solid fa-book"></i>
                                <span className='link_name'>Posts</span>
                            </Link>
                            <i className={`fa-solid fa-caret-down arrow ${showMenus.menuPosts ? "rotateIcon" : ""}`}></i>
                        </div>

                        <ul className={`sub-menu ${showMenus.menuPosts ? "showMenu" : ""}`}>
                            <li> <Link to="#" className='link_name'>Posts</Link> </li>
                            <li> <Link to="#">Concatenaciones para CIE BBVA</Link> </li>
                            <li> <Link to="#">Cargar Referencias de Aspirantes</Link> </li>
                        </ul>
                    </li>

                    <li>
                        <Link to="#">
                            <i className="fa-solid fa-chart-line"></i>
                            <span className='link_name'>Analiticas</span>
                        </Link>
                        <ul className='sub-menu blank'>
                            <li> <Link to="#" className='link_name'>Analiticas</Link> </li>
                            <li> <Link to="#">Concatenaciones para CIE BBVA</Link> </li>
                            <li> <Link to="#">Cargar Referencias de Aspirantes</Link> </li>
                        </ul>
                    </li>

                    <li>
                        <div className='profile-details'>
                            <div className='profile-content'>
                                <img src="../raptor.png" alt="profile" />
                            </div>

                            <div className='name-job'>
                                <div className='profile_name'>Nombre</div>
                                <div className='job '>Rol</div>
                            </div>
                            <i className="fa-solid fa-right-from-bracket text-light"></i>
                        </div>
                    </li>
                </ul>

            </div>
        </div>
    )
}

