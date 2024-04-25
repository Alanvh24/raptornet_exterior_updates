import React, { Component } from "react";
import { Routes, Route, Link } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import "./App.css";

import AuthService from "./services/auth.service";

import Login from "./components/login.component";
import Register from "./components/register.component";
import Profile from "./components/profile.component";
import BoardUser from "./components/board-user.component";
import BoardModerator from "./components/board-moderator.component";
import EventBus from "./common/EventBus";
import EditUser from "./components/edit-usuario.component";
import AuthVerify from "./common/auth-verify";
import CompletarPerfil from "./components/completar_perfil";
import BoardFinanzas from "./components/finanzas/board-finanzas.component";
import PerfilCompletadoAspirante from "./components/PerfilCompletadoAspirante";
import BoardFinanzasCargar from "./components/finanzas/board-finanzas.cargar.component";
import Referencia from "./components/referencia";
import { Guia } from "./components/guia_examen";
import TablasComponent from "./components/finanzas/dashboard.finanzas";
import BoardFinanzasValidacion from "./components/finanzas/board-finanzas.validacion";
import BoardVinculacion from "./components/vinculacion/lista-aspirantes-vinculacion.component";
import { Home } from "./components/home.component";
import RegisterAuth from "./components/registerAutoridades.component";
import DashboardVinculacion from "./components/vinculacion/dashboard.vinculacion";
import EditarAspiranteVinculacion from "./components/vinculacion/editar-aspirante.vinculacion";
import TablaCalificaciones from "./components/vinculacion/tablacalificaciones.component";
import DashboardServiciosEscolares from "./components/serviciosEscolares/dashboard.servicios.escolares";
import { Sidebar } from "./components/Sidebar";
import ListaAspirantesAceptados from "./components/vinculacion/aspirantes-aceptados";
import EstadisticasVinculacion from "./components/vinculacion/EstadisticasVinculacion";
import ActualizarCuotas from "./components/finanzas/ActualizarCuotas";
import ValidarPagosFichas from "./components/vinculacion/ValidarPagosFichas";
import AsignarGruposAlumnos from "./components/serviciosEscolares/AsignarGruposAlumnos";
import VerificarDatos from "./components/finanzas/VerificarDatos";
import HistorialPagos from "./components/finanzas/HistorialPagos";
import AspiranteFelicitaciones from "./components/AspiranteFelicitaciones";
import ReferenciaInscripcion from "./components/referenciaInscripcion";
import DashboardAcademia from "./components/direccion_academica/DashboardAcademia";
import AsignarDocentes from "./components/direccion_academica/AsignarDocentes";
import DashboardDocentes from "./components/Docentes/DashBoardDocentes";
import AsignaturasGeneral from "./components/Docentes/AsignaturasGeneral";
import PlaneacionesDocentes from "./components/direccion_academica/PlaneacionesDocentes";
import WhatsNew from "./components/ChangeLog/WhatsNew";
import TermsLink from "./components/Terms";
import ListaRegistrosRaptorNet from "./components/vinculacion/listaRegistrosRaptorNet";
import ResetPassword from "./components/vinculacion/ResetPasswordForm";
import AdminController from "./components/Admin/AdminController";
import InformacionAlumnoIndividual from "./components/serviciosEscolares/InformacionAlumnoIndividual";
import ListasAsistencias from "./components/Docentes/ListasAsistencias";
import ReferenciaCurso from "./components/referenciaCurso";
import SimuladorAsistencias from "./components/Simulador";
import CalificacionesCuatrimestreActual from "./components/serviciosEscolares/CalificacionesCuatrimestreActual";
import ListaExamenesRemediales from "./components/Docentes/ListaExamenesRemediales";
import CambioCuatrimestre from "./components/serviciosEscolares/CambioCuatrimestre";
import ListaAlumnosActivos from "./components/serviciosEscolares/ListaAlumnosActivos";
import Version1 from "./components/ChangeLog/Version1";

class App extends Component {
    constructor(props) {
        super(props);
        this.logOut = this.logOut.bind(this);

        this.state = {
            showModeratorBoard: false,
            showAdminBoard: false,
            showRegisterLink: true,
            currentUser: undefined,
            showSide: false,
            noAspirante: false,
            isSidebarOpen: false,
            showMenus: {
                menuAspirantes: false,
                menuAlumnos: false,
                menuBbva: false,
                menuFinanzas: false,
                menuDADocentes: false,
            }

        };

        this.toggleSidebar = this.toggleSidebar.bind(this);
        this.handleArrowClick = this.handleArrowClick.bind(this);
    }

    // Función para alternar el sidebar
    toggleSidebar() {
        this.setState(prevState => ({
            isSidebarOpen: !prevState.isSidebarOpen
        }));
    }

    // Función para manejar el clic en los elementos del menú
    handleArrowClick(menuName) {
        this.setState(prevState => ({
            showMenus: {
                ...prevState.showMenus,
                [menuName]: !prevState.showMenus[menuName]
            }
        }));
    }


    componentDidMount() {
        const user = AuthService.getCurrentUser();

        if (user) {
            this.setState({
                currentUser: user,
                noAspirante: user.roles && !user.roles.includes("ROLE_ASPIRANTE"),
                showSide: user.roles && !user.roles.includes("ROLE_ASPIRANTE"),
                showModeratorBoard: user.roles.includes("ROLE_MODERATOR"),
                showAdminBoard: user.roles.includes("ROLE_ADMIN"),
                showFinanzasBoard: user.roles.includes("ROLE_FINANZAS"),
                showVinculacionBoard: user.roles.includes("ROLE_VINCULACION"),
                showServiciosEscolaresBoard: user.roles.includes("ROLE_SERVICIOSESCOLARES"),
                showDocentesBoard: user.roles.includes("ROLE_DOCENTES"),
                showDAcademicaBoard: user.roles.includes("ROLE_DIRECCION_ACADEMICA"),
                showRegisterLink: undefined,
            });
        }

        EventBus.on("logout", () => {
            this.logOut();

        });
    }

    componentWillUnmount() {
        EventBus.remove("logout");
    }

    logOut() {
        AuthService.logout();
        this.setState({
            showModeratorBoard: false,
            showAdminBoard: false,
            showRegisterLink: true,
            showFinanzasBoard: false,
            showVinculacionBoard: false,
            showDocentesBoard: false,
            showDAcademicaBoard: false,
            currentUser: undefined,
            showSide: false,
            noAspirante: false,
        }, () => {
            window.location.reload();
        });
    }

    render() {
        const { currentUser,
            showFinanzasBoard,
            showRegisterLink,
            showAdminBoard,
            showVinculacionBoard,
            showServiciosEscolaresBoard,
            showDocentesBoard,
            showDAcademicaBoard,
            isSidebarOpen,
            showMenus,
            noAspirante,
            showSide } = this.state;

        const homeSectionClass = isSidebarOpen ? "home-section with-sidebar" : "home-section close";

        function formatRole(role) {
            const roleMappings = {
                "ROLE_DOCENTES": "DOCENTE",
                "ROLE_SERVICIOSESCOLARES": "SERVICIOS ESCOLARES",
                "ROLE_ASPIRANTE": "ASPIRANTE",
                "ROLE_MODERATOR": "MODERADOR",
                "ROLE_ADMIN": "ADMINISTRADOR",
                "ROLE_FINANZAS": "FINANZAS",
                "ROLE_VINCULACION": "VINCULACIÓN",
                "ROLE_DIRECCION_ACADEMICA": "DIRECCIÓN ACADÉMICA"
            };

            return roleMappings[role] || role;
        }

        return (
            <div>

                <AuthVerify logOut={this.logOut} />

                <>
                    <nav className="navbar navbar-expand-md sticky-top bg-custom-green navbar-dark">
                        <div className="container-fluid">
                            <img
                                className="logo horizontal-logo"
                                src="../../../logo_utmir_trazo.png"
                                width="200px"
                                alt="UTMiR logo"
                            />
                            <button
                                className="navbar-toggler"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent"
                                aria-expanded="false"
                                aria-label="Toggle navigation"
                            >
                                <span className="navbar-toggler-icon" />
                            </button>
                            <div className="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul className="navbar-nav ms-auto">

                                    {showRegisterLink && (
                                        <>
                                            <li className="nav-item rounded">
                                                <Link to={"/registro"} className="nav-link">
                                                    <i className="fa fa-user-plus" /> {/* Icono ejemplo para Registrar Usuario */}
                                                    Registro de Aspirantes
                                                </Link>
                                            </li>
                                        </>
                                    )}

                                    {showFinanzasBoard && (
                                        <>
                                            <li className="nav-item rounded">
                                                <Link to={"/finanzas"} className="nav-link active" aria-current="page">
                                                    <i className="fa-solid fa-house icon-mar" />
                                                    Inicio
                                                </Link>
                                            </li>
                                        </>
                                    )}

                                    {showServiciosEscolaresBoard && (
                                        <>
                                            <li className="nav-item rounded">
                                                <Link to={"/servicios-escolares"} className="nav-link active" aria-current="page">
                                                    <i className="fa-solid fa-house icon-mar" />
                                                    Inicio
                                                </Link>
                                            </li>
                                        </>
                                    )}

                                    {showVinculacionBoard && (
                                        <>
                                            <li className="nav-item rounded">
                                                <Link to={"/vinculacion"} className="nav-link active" aria-current="page">
                                                    <i className="fa-solid fa-house icon-mar" />
                                                    Inicio
                                                </Link>
                                            </li>
                                        </>
                                    )}

                                    {showDocentesBoard && (
                                        <>
                                            <li className="nav-item rounded">
                                                <Link to={"/docentes"} className="nav-link active" aria-current="page">
                                                    <i className="fa-solid fa-house icon-mar" />
                                                    Inicio
                                                </Link>
                                            </li>
                                        </>
                                    )}

                                    {showDAcademicaBoard && (
                                        <>
                                            <li className="nav-item rounded">
                                                <Link to={"/direccion-academica"} className="nav-link active" aria-current="page">
                                                    <i className="fa-solid fa-house icon-mar" />
                                                    Inicio
                                                </Link>
                                            </li>
                                        </>
                                    )}

                                    {showAdminBoard && (

                                        <>
                                            <li className="nav-item rounded">
                                                <Link to={"/registro/personal"} className="nav-link">
                                                    <i className="fa fa-user-plus" /> {/* Icono ejemplo para Registrar Usuario */}
                                                    Registro del Personal
                                                </Link>
                                            </li>
                                        </>
                                    )}

                                    {noAspirante && (
                                        <>

                                            <li className="nav-item rounded">
                                                <Link to={"/version-1"} className="nav-link active">

                                                    <i className="fa-solid fa-bell icon-mar" />
                                                    ¡Versión 1.0 Oficial! [Presiona aquí]
                                                </Link>
                                            </li>

                                            <li className="nav-item rounded">
                                                <Link to={"/whatsNew"} className="nav-link active">

                                                    <i className="fa-solid fa-newspaper icon-mar" />
                                                    What's New
                                                </Link>
                                            </li>

                                        </>

                                    )}


                                    {currentUser && (
                                        <>

                                            <li className="nav-item rounded">
                                                <Link to={"/login"} className="nav-link active" onClick={this.logOut}>
                                                    Cerrar Sesión
                                                </Link>
                                            </li>

                                        </>

                                    )}



                                    {currentUser ? (
                                        <>
                                            <li className="nav-item dropdown rounded">
                                                <a
                                                    className="nav-link dropdown-toggle"
                                                    href="."
                                                    id="navbarDropdown"
                                                    role="button"
                                                    data-bs-toggle="dropdown"
                                                    aria-expanded="false"
                                                >
                                                    <i clas="fa-solid fa-user" />
                                                    {currentUser.username}
                                                </a>
                                                <ul
                                                    className="dropdown-menu dropdown-menu-end"
                                                    aria-labelledby="navbarDropdown"
                                                >
                                                    <li>
                                                        <Link to={"/profile"} className="dropdown-item">
                                                            Perfil
                                                        </Link>
                                                    </li>
                                                </ul>
                                            </li>
                                        </>
                                    ) : (
                                        <>
                                            <li className="nav-item">
                                                <Link to={"/login"} className="nav-link">
                                                    <i className="fa fa-sign-in-alt" />
                                                    Iniciar Sesión
                                                </Link>
                                            </li>
                                        </>
                                    )}
                                </ul>
                            </div>
                        </div>
                    </nav>
                </>

                {showSide && (

                    <div className={`sidebar ${isSidebarOpen ? "" : "close"}`}>

                        <div className='logo-details'>
                            <i className="fa-solid fa-globe" onClick={this.toggleSidebar}></i>
                            <span className='logo_name'>RaptorNet</span>
                        </div>

                        <ul className='nav-links'>
                            {showFinanzasBoard && (
                                <li>
                                    <Link to="/finanzas">
                                        <i className="fa-solid fa-table-cells-large"></i>
                                        <span className='link_name'>Dashboard</span>
                                    </Link>

                                    <ul className='sub-menu blank'>
                                        <li> <Link to="/finanzas" className='link_name'>Dashboard</Link> </li>
                                    </ul>

                                </li>
                            )}

                            {showVinculacionBoard && (
                                <li>
                                    <Link to="/vinculacion">
                                        <i className="fa-solid fa-table-cells-large"></i>
                                        <span className='link_name'>Dashboard</span>
                                    </Link>

                                    <ul className='sub-menu blank'>
                                        <li> <Link to="/vinculacion" className='link_name'>Dashboard</Link> </li>
                                    </ul>

                                </li>
                            )}

                            {showDAcademicaBoard && (
                                <li>
                                    <Link to="/direccion-academica">
                                        <i className="fa-solid fa-table-cells-large"></i>
                                        <span className='link_name'>Dashboard</span>
                                    </Link>

                                    <ul className='sub-menu blank'>
                                        <li> <Link to="/direccion-academica" className='link_name'>Dashboard</Link> </li>
                                    </ul>


                                </li>
                            )}


                            {showDocentesBoard && (
                                <>
                                    <li>
                                        <Link to="/docentes">
                                            <i className="fa-solid fa-table-cells-large"></i>
                                            <span className='link_name'>Dashboard</span>
                                        </Link>

                                        <ul className='sub-menu blank'>
                                            <li> <Link to="/docentes" className='link_name'>Dashboard</Link> </li>
                                        </ul>

                                    </li>

                                    <li>
                                        <div className='icon-link' onClick={() => this.handleArrowClick('menuDADocentes')}>
                                            <Link to="#">
                                                <i className="fa-solid fa-chalkboard-user"></i>
                                                <span className='link_name'>Asignaturas</span>
                                            </Link>
                                            <i className={`fa-solid fa-caret-down arrow ${showMenus.menuDADocentes ? "rotateIcon" : ""}`}></i>
                                        </div>
                                        <ul className={`sub-menu ${showMenus.menuDADocentes ? "showMenu" : ""}`}>
                                            <li> <Link to="#" className='link_name'>Asignaturas</Link> </li>
                                            <li> <Link to="/docentes/asignaturas">Mis asignaturas</Link></li>
                                        </ul>
                                    </li>
                                </>
                            )}

                            {showDAcademicaBoard && (
                                <li>
                                    <div className='icon-link' onClick={() => this.handleArrowClick('menuDADocentes')}>
                                        <Link to="#">
                                            <i className="fa-solid fa-chalkboard-user"></i>
                                            <span className='link_name'>Docentes</span>
                                        </Link>
                                        <i className={`fa-solid fa-caret-down arrow ${showMenus.menuDADocentes ? "rotateIcon" : ""}`}></i>
                                    </div>
                                    <ul className={`sub-menu ${showMenus.menuDADocentes ? "showMenu" : ""}`}>
                                        <li> <Link to="#" className='link_name'>Docentes</Link> </li>
                                        <li> <Link to="/direccion-academica/asignar-docentes">Asignar Materias</Link></li>
                                    </ul>
                                </li>
                            )}

                            {showFinanzasBoard && (

                                <li>
                                    <div className='icon-link' onClick={() => this.handleArrowClick('menuAspirantes')}>
                                        <Link to="#">
                                            <i className="fa-solid fa-user-large-slash"></i>
                                            <span className='link_name'>Aspirantes</span>
                                        </Link>
                                        <i className={`fa-solid fa-caret-down arrow ${showMenus.menuAspirantes ? "rotateIcon" : ""}`}></i>
                                    </div>
                                    <ul className={`sub-menu ${showMenus.menuAspirantes ? "showMenu" : ""}`}>
                                        <li> <Link to="#" className='link_name'>Aspirantes</Link> </li>
                                        <li> <Link to="/finanzas/concatenado">Descargar concatenado</Link> </li>
                                        <li> <Link to="/finanzas/cargar-referencias">Cargar referencias</Link> </li>
                                        <li> <Link to="/finanzas/validar-pagos">Validar Pagos</Link> </li>
                                    </ul>
                                </li>
                            )}

                            {showVinculacionBoard && (

                                <li>
                                    <div className='icon-link' onClick={() => this.handleArrowClick('menuAspirantes')}>
                                        <Link to="#">
                                            <i className="fa-solid fa-user-large-slash"></i>
                                            <span className='link_name'>Aspirantes</span>
                                        </Link>
                                        <i className={`fa-solid fa-caret-down arrow ${showMenus.menuAspirantes ? "rotateIcon" : ""}`}></i>
                                    </div>
                                    <ul className={`sub-menu ${showMenus.menuAspirantes ? "showMenu" : ""}`}>
                                        <li> <Link to="#" className='link_name'>Aspirantes</Link> </li>
                                        <li> <Link to="/vinculacion/aspirantes">Lista de aspirantes</Link> </li>
                                        <li> <Link to="/vinculacion/aspirantes/calificaciones">Exámen de admisión</Link> </li>
                                        <li> <Link to="/vinculacion/aspirantes/aceptados">Aspirantes Aceptados</Link> </li>
                                        <li> <Link to="/vinculacion/verificar-pagos">Verificar Pagos de ficha</Link> </li>
                                        <li> <Link to="/vinculacion/estadisticas">Estadisticas</Link> </li>
                                    </ul>
                                </li>
                            )}


                            {showFinanzasBoard && (
                                <li>
                                    <div className='icon-link' onClick={() => this.handleArrowClick('menuAlumnos')}>
                                        <Link to="#">
                                            <i className="fa-solid fa-users"></i>
                                            <span className='link_name'>Alumnos</span>
                                        </Link>
                                        <i className={`fa-solid fa-caret-down arrow ${showMenus.menuAlumnos ? "rotateIcon" : ""}`}></i>
                                    </div>

                                    <ul className={`sub-menu ${showMenus.menuAlumnos ? "showMenu" : ""}`}>
                                        <li> <Link to="#" className='link_name'>Alumnos</Link> </li>
                                        <li> <Link to="#">Próximamente</Link> </li>
                                    </ul>
                                </li>
                            )}

                            {showFinanzasBoard && (
                                <li>
                                    <div className='icon-link' onClick={() => this.handleArrowClick('menuBbva')}>
                                        <Link to="#">
                                            <i className="fa-solid fa-building-columns"></i>
                                            <span className='link_name'>BBVA</span>
                                        </Link>
                                        <i className={`fa-solid fa-caret-down arrow ${showMenus.menuBbva ? "rotateIcon" : ""}`}></i>
                                    </div>

                                    <ul className={`sub-menu ${showMenus.menuBbva ? "showMenu" : ""}`}>
                                        <li> <a href="https://cie.adquiramexico.com.mx/#/" target="_blank" rel="noopener noreferrer">CIE BBVA</a> </li>
                                    </ul>
                                </li>
                            )}

                            {showFinanzasBoard && (
                                <li>
                                    <div className='icon-link' onClick={() => this.handleArrowClick('menuFinanzas')}>
                                        <Link to="#">
                                            <i className="fa-solid fa-coins"></i>
                                            <span className='link_name'>Finanzas</span>
                                        </Link>
                                        <i className={`fa-solid fa-caret-down arrow ${showMenus.menuFinanzas ? "rotateIcon" : ""}`}></i>
                                    </div>

                                    <ul className={`sub-menu ${showMenus.menuFinanzas ? "showMenu" : ""}`}>
                                        <li> <Link to="/finanzas/actualizar-cuotas">Cuotas y Tarifas</Link> </li>
                                        <li> <Link to="/finanzas/pagos/historial">Historial de Pagos</Link> </li>
                                    </ul>


                                </li>
                            )}

                            <li>
                                <div className='profile-details'>
                                    <div className='profile-content'>
                                        <img src="../../../icono_raptor.png" alt="profile" />
                                    </div>

                                    <div className='name-job'>
                                        <div className='profile_name'>
                                            <p>{currentUser.nombre}</p>
                                        </div>
                                        <div className='job '>
                                            {currentUser.roles && currentUser.roles.map((role, index) => (
                                                <p key={index}>{formatRole(role)}</p>
                                            ))}
                                        </div>
                                    </div>

                                    <i className="fa-solid fa-right-from-bracket text-light" onClick={this.logOut}></i>
                                </div>
                            </li>
                        </ul>



                    </div>
                )}


                <section className={homeSectionClass}>
                    <Routes>

                        <Route exact path='/' element={<Home />}></Route>
                        <Route path="/login" element={<Login />} />
                        <Route path="/registro" element={<Register />} />
                        <Route exact path="/completar_registro" element={<CompletarPerfil />} />
                        <Route exact path='/referencia' element={<Referencia />}></Route>
                        <Route exact path='/guia_examen' element={<Guia />}></Route>
                        <Route exact path='/aspirante/congratulations' element={<AspiranteFelicitaciones />}></Route>
                        <Route exact path='/referencia/curso' element={<ReferenciaCurso />}></Route>
                        <Route exact path='/referencia/inscripcion' element={<ReferenciaInscripcion />}></Route>

                        <Route exact path='/registro/personal' element={<RegisterAuth />}></Route>

                        <Route path="/profile" element={<Profile />} />
                        <Route path="/user" element={<BoardUser />} />
                        <Route path="/mod" element={<BoardModerator />} />

                        <Route path="/finanzas" element={<TablasComponent />} />
                        <Route path="/finanzas/datos" element={<VerificarDatos />} />
                        <Route path="/finanzas/concatenado" element={<BoardFinanzas />} />
                        <Route path="/finanzas/cargar-referencias" element={<BoardFinanzasCargar />} />
                        <Route path="/finanzas/validar-pagos" element={<BoardFinanzasValidacion />} />
                        <Route path="/finanzas/actualizar-cuotas" element={<ActualizarCuotas />} />
                        <Route path="/finanzas/pagos/historial" element={<HistorialPagos />} />


                        <Route exact path='/edit-user' element={<EditUser />}></Route>
                        <Route exact path='/completo' element={<PerfilCompletadoAspirante />}></Route>
                        <Route exact path='/sidebar' element={<Sidebar />}></Route>

                        <Route path="/vinculacion" element={<DashboardVinculacion />} />
                        <Route exact path='/vinculacion/registros' element={<ListaRegistrosRaptorNet />}></Route>
                        <Route exact path='/vinculacion/aspirantes' element={<BoardVinculacion />}></Route>
                        <Route exact path='/vinculacion/aspirantes/calificaciones' element={<TablaCalificaciones />}></Route>
                        <Route exact path='/vinculacion/aspirantes/aceptados' element={<ListaAspirantesAceptados />}></Route>
                        <Route exact path='/vinculacion/estadisticas' element={<EstadisticasVinculacion />}></Route>
                        <Route exact path='/vinculacion/verificar-pagos' element={<ValidarPagosFichas />}></Route>
                        <Route path="/aspirantes/:matricula" element={<EditarAspiranteVinculacion />} />
                        <Route path="/resetPassword/:matricula" element={<ResetPassword />} />

                        <Route exact path='/servicios-escolares' element={<DashboardServiciosEscolares />}></Route>
                        <Route exact path='/servicios-escolares/aspirantes' element={<BoardVinculacion />}></Route>
                        <Route exact path='/servicios-escolares/estadisticas' element={<EstadisticasVinculacion />}></Route>
                        <Route exact path='/servicios-escolares/alumnos/asignar-grupos' element={<AsignarGruposAlumnos />}></Route>
                        <Route exact path='/servicios-escolares/alumnos' element={<InformacionAlumnoIndividual />}></Route>
                        <Route exact path='/servicios-escolares/alumnos/calificaciones-cuatrimestre-actual' element={<CalificacionesCuatrimestreActual />}></Route>
                        <Route exact path='/servicios-escolares/cambio-cuatrimestre' element={<CambioCuatrimestre />}></Route>
                        <Route exact path='/servicios-escolares/alumnos/lista-alumnos' element={<ListaAlumnosActivos />}></Route>

                        <Route exact path='/direccion-academica' element={<DashboardAcademia />}></Route>
                        <Route exact path='/direccion-academica/asignar-docentes' element={<AsignarDocentes />}></Route>
                        <Route exact path='/direccion-academica/planeaciones' element={<PlaneacionesDocentes />}></Route>


                        <Route exact path='/docentes' element={<DashboardDocentes />}></Route>
                        <Route exact path='/docentes/asignaturas' element={<AsignaturasGeneral />}></Route>
                        <Route exact path='/docentes/lista-asistencias' element={<ListasAsistencias />}></Route>
                        <Route exact path='/docentes/remediales' element={<ListaExamenesRemediales />}></Route>
                        <Route exact path='/docentes/simulador' element={<SimuladorAsistencias />}></Route>

                        <Route exact path='/whatsNew' element={<WhatsNew />}></Route>

                        <Route exact path='/terminos' element={<TermsLink />}></Route>
                        <Route exact path='/admin' element={<AdminController />}></Route>
                        <Route exact path='/version-1' element={<Version1 />}></Route>



                    </Routes>
                </section>
            </div >

        );
    }
}

export default App;