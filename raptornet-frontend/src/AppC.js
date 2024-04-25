// import React, { Component } from "react";
// import { Routes, Route, Link } from "react-router-dom";
// import "bootstrap/dist/css/bootstrap.min.css";
// import "./App.css";

// import AuthService from "./services/auth.service";

// import Login from "./components/login.component";
// import Register from "./components/register.component";
// import Profile from "./components/profile.component";
// import BoardUser from "./components/board-user.component";
// import BoardModerator from "./components/board-moderator.component";
// import EventBus from "./common/EventBus";
// import ConsultarComponent from "./components/ConsultarComponent";
// import Resultados from "./components/ResultadosFechaDig";
// import EditUser from "./components/edit-usuario.component";
// import AuthVerify from "./common/auth-verify";
// import CompletarPerfil from "./components/completar_perfil";
// import BoardFinanzas from "./components/finanzas/board-finanzas.component";
// import PerfilCompletadoAspirante from "./components/PerfilCompletadoAspirante";
// import BoardFinanzasCargar from "./components/finanzas/board-finanzas.cargar.component";
// import Referencia from "./components/referencia";
// import { Sidebar } from "./components/Sidebar";
// import { Guia } from "./components/guia_examen";
// import TablasComponent from "./components/finanzas/dashboard.finanzas";
// import BoardFinanzasValidacion from "./components/finanzas/board-finanzas.validacion";
// import BoardVinculacion from "./components/vinculacion/board-vinculacion.component";
// import { Home } from "./components/home.component";
// import RegisterAuth from "./components/registerAutoridades.component";
// import DashboardVinculacion from "./components/vinculacion/dashboard.vinculacion";
// import EditarAspiranteVinculacion from "./components/vinculacion/editar-aspirante.vinculacion";
// import TablaCalificaciones from "./components/vinculacion/tablacalificaciones.component";
// import DashboardServiciosEscolares from "./components/serviciosEscolares/dashboard.servicios.escolares";

// class App extends Component {
//   constructor(props) {
//     super(props);
//     this.logOut = this.logOut.bind(this);

//     this.state = {
//       showModeratorBoard: false,
//       showAdminBoard: false,
//       showRegisterLink: true,
//       currentUser: undefined,
//     };
//   }

//   componentDidMount() {
//     const user = AuthService.getCurrentUser();

//     if (user) {
//       this.setState({
//         currentUser: user,
//         showModeratorBoard: user.roles.includes("ROLE_MODERATOR"),
//         showAdminBoard: user.roles.includes("ROLE_ADMIN"),
//         showFinanzasBoard: user.roles.includes("ROLE_FINANZAS"),
//         showVinculacionBoard: user.roles.includes("ROLE_VINCULACION"),
//         showServiciosEscolaresBoard: user.roles.includes("ROLE_SERVICIOSESCOLARES"),
//         showRegisterLink: undefined,
//       });
//     }

//     EventBus.on("logout", () => {
//       this.logOut();
//     });
//   }

//   componentWillUnmount() {
//     EventBus.remove("logout");
//   }

//   logOut() {
//     AuthService.logout();
//     this.setState({
//       showModeratorBoard: false,
//       showAdminBoard: false,
//       showRegisterLink: true,
//       showFinanzasBoard: false,
//       showVinculacionBoard: false,
//       currentUser: undefined,
//     });
//   }

//   render() {
//     const { currentUser,
//       showFinanzasBoard,
//       showRegisterLink,
//       showAdminBoard,
//       showVinculacionBoard,
//       showServiciosEscolaresBoard } = this.state;

//     return (


//       <div>

//         <AuthVerify logOut={this.logOut} />

//         <>
//           <nav className="navbar navbar-expand-md sticky-top bg-custom-green navbar-dark">
//             <div className="container-fluid">
//               <Link className="navbar-brand" to={'#'} >
//                 <img
//                   className="logo horizontal-logo"
//                   src="../../../logo_utmir_trazo.png"
//                   width="200px"
//                   alt="UTMiR logo"
//                 />
//               </Link>
//               <button
//                 className="navbar-toggler"
//                 type="button"
//                 data-bs-toggle="collapse"
//                 data-bs-target="#navbarSupportedContent"
//                 aria-controls="navbarSupportedContent"
//                 aria-expanded="false"
//                 aria-label="Toggle navigation"
//               >
//                 <span className="navbar-toggler-icon" />
//               </button>
//               <div className="collapse navbar-collapse" id="navbarSupportedContent">
//                 <ul className="navbar-nav ms-auto">

//                   {showRegisterLink && (
//                     <>
//                       <li className="nav-item rounded">
//                         <Link to={"/registro"} className="nav-link">
//                           <i className="fa fa-user-plus" /> {/* Icono ejemplo para Registrar Usuario */}
//                           Registro de Aspirantes
//                         </Link>
//                       </li>
//                     </>
//                   )}

//                   {showFinanzasBoard && (
//                     <>
//                       <li className="nav-item rounded">
//                         <Link to={"/finanzas"} className="nav-link active" aria-current="page">
//                           <i className="fa-solid fa-house" />
//                           Inicio
//                         </Link>
//                       </li>
//                     </>
//                   )}

//                   {showServiciosEscolaresBoard && (
//                     <>
//                       <li className="nav-item rounded">
//                         <Link to={"/servicios-escolares"} className="nav-link active" aria-current="page">
//                           <i className="fa-solid fa-house" />
//                           Inicio
//                         </Link>
//                       </li>
//                     </>
//                   )}

//                   {showVinculacionBoard && (
//                     <>
//                       <li className="nav-item rounded">
//                         <Link to={"/vinculacion"} className="nav-link active" aria-current="page">
//                           <i className="fa-solid fa-house" />
//                           Inicio
//                         </Link>
//                       </li>
//                     </>
//                   )}

//                   {showAdminBoard && (

//                     <>
//                       <li className="nav-item rounded">
//                         <Link to={"/registro/personal"} className="nav-link">
//                           <i className="fa fa-user-plus" /> {/* Icono ejemplo para Registrar Usuario */}
//                           Registro del Personal
//                         </Link>
//                       </li>
//                     </>
//                   )}


//                   {currentUser && (
//                     <>


//                       <li className="nav-item rounded">
//                         <Link to={"/login"} className="nav-link active" onClick={this.logOut}>
//                           Cerrar Sesión
//                         </Link>
//                       </li>

//                     </>

//                   )}

//                   {currentUser ? (
//                     <>
//                       <li className="nav-item dropdown rounded">
//                         <a
//                           className="nav-link dropdown-toggle"
//                           href="."
//                           id="navbarDropdown"
//                           role="button"
//                           data-bs-toggle="dropdown"
//                           aria-expanded="false"
//                         >
//                           <i clas="fa-solid fa-user" />
//                           {currentUser.username}
//                         </a>
//                         <ul
//                           className="dropdown-menu dropdown-menu-end"
//                           aria-labelledby="navbarDropdown"
//                         >
//                           <li>
//                             <Link to={"/profile"} className="dropdown-item">
//                               Perfil
//                             </Link>
//                           </li>
//                         </ul>
//                       </li>



//                     </>
//                   ) : (
//                     <>


//                       <li className="nav-item">
//                         <Link to={"/login"} className="nav-link">
//                           <i className="fa fa-sign-in-alt" />
//                           Iniciar Sesión
//                         </Link>
//                       </li>
//                     </>

//                   )}
//                 </ul>
//               </div>
//             </div>
//           </nav>

//         </>


//         <div className="container-fluid">
//           <Routes>
//             <Route exact path='/' element={<Home />}></Route>
//             <Route exact path='/registro/personal' element={<RegisterAuth />}></Route>
//             <Route path="/vinculacion" element={<DashboardVinculacion />} />
//             <Route path="/aspirantes/:matricula" element={<EditarAspiranteVinculacion />} />
//             <Route path="/finanzas" element={<TablasComponent />} />
//             <Route path="/login" element={<Login />} />
//             <Route path="/registro" element={<Register />} />
//             <Route path="/completar_registro" element={<CompletarPerfil />} />
//             <Route path="/profile" element={<Profile />} />
//             <Route path="/user" element={<BoardUser />} />
//             <Route path="/mod" element={<BoardModerator />} />
//             <Route path="/finanzas/concatenado" element={<BoardFinanzas />} />
//             <Route path="/finanzas/cargar-referencias" element={<BoardFinanzasCargar />} />
//             <Route path="/finanzas/validar-pagos" element={<BoardFinanzasValidacion />} />
//             <Route path="/consultar" element={<ConsultarComponent />}></Route>
//             <Route path="/resultados" element={<Resultados />} />
//             <Route exact path='/edit-user' element={<EditUser />}></Route>
//             <Route exact path='/completo' element={<PerfilCompletadoAspirante />}></Route>
//             <Route exact path='/referencia' element={<Referencia />}></Route>
//             <Route exact path='/guia_examen' element={<Guia />}></Route>
//             <Route exact path='/sidebar' element={<Sidebar />}></Route>
//             <Route exact path='/vinculacion/aspirantes' element={<BoardVinculacion />}></Route>
//             <Route exact path='/vinculacion/aspirantes/calificaciones' element={<TablaCalificaciones />}></Route>

//             <Route exact path='/servicios-escolares' element={<DashboardServiciosEscolares />}></Route>
//             <Route exact path='/servicios-escolares/aspirantes' element={<BoardVinculacion />}></Route>

//           </Routes>
//         </div>
//       </div>

//     );
//   }
// }

// export default App;