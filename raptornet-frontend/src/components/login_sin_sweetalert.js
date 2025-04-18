// import React, { Component } from "react";
// import Form from "react-validation/build/form";
// import Input from "react-validation/build/input";
// import CheckButton from "react-validation/build/button";

// import AuthService from "../services/auth.service";

// import { withRouter } from '../common/with-router';
// import Swal from 'sweetalert2';

// const required = value => {
//   if (!value) {
//     return (
//       <div className="alert alert-danger" role="alert">
//         El campo es requerido!
//       </div>
//     );
//   }
// };

// class Login extends Component {
//   constructor(props) {
//     super(props);
//     this.handleLogin = this.handleLogin.bind(this);
//     this.onChangeUsername = this.onChangeUsername.bind(this);
//     this.onChangePassword = this.onChangePassword.bind(this);

//     this.state = {
//       username: "",
//       password: "",
//       loading: false,
//       message: ""
//     };
//   }

//   onChangeUsername(e) {
//     this.setState({
//       username: e.target.value
//     });
//   }

//   onChangePassword(e) {
//     this.setState({
//       password: e.target.value
//     });
//   }

//   handleLogin(e) {
//     e.preventDefault();

//     this.setState({
//       message: "",
//       loading: true
//     });

//     this.form.validateAll();

//     if (this.checkBtn.context._errors.length === 0) {
//       AuthService.login(this.state.username, this.state.password).then(
//         () => {
//           this.props.router.navigate("/profile");
//           window.location.reload();
//         },
//         error => {
//           const resMessage =
//             (error.response &&
//               error.response.data &&
//               error.response.data.message) ||
//             error.message ||
//             error.toString();

//           this.setState({
//             loading: false,
//             message: resMessage
//           });
//         }
//       );
//     } else {
//       this.setState({
//         loading: false
//       });
//     }
//   }



//   componentDidMount() {
//     const user = AuthService.getCurrentUser();

//     if (user) this.setState({ redirect: "/home" });
//     this.setState({
//       currentUser: { username: "" },
//       userReady: true
//     })
//   }


//   render() {

//     if (this.state.redirect) {

//       this.props.router.navigate("/home");

//     }
//     return (
//       <div className="col-md-12">
//         <div className="card card-container">
//           <img
//             src="//ssl.gstatic.com/accounts/ui/avatar_2x.png"
//             alt="profile-img"
//             className="profile-img-card"
//           />

//           <Form
//             onSubmit={this.handleLogin}
//             ref={c => {
//               this.form = c;
//             }}
//           >
//             <div className="form-group">
//               <label htmlFor="username">Usuario</label>
//               <Input
//                 type="text"
//                 className="form-control"
//                 name="username"
//                 value={this.state.username}
//                 onChange={this.onChangeUsername}
//                 validations={[required]}
//               />
//             </div>

//             <div className="form-group">
//               <label htmlFor="password">Contraseña</label>
//               <Input
//                 type="password"
//                 className="form-control"
//                 name="password"
//                 value={this.state.password}
//                 onChange={this.onChangePassword}
//                 validations={[required]}
//               />
//             </div>

//             <div className="form-group">
//               <button
//                 className="btn btn-custom-blue btn-block text-light"
//                 disabled={this.state.loading}
//               >
//                 {this.state.loading && (
//                   <span className="spinner-border spinner-border-sm"></span>
//                 )}
//                 <span>Login</span>
//               </button>
//             </div>

//             {this.state.message && (
//               <div className="form-group">
//                 <div className="alert alert-danger" role="alert">
//                   {this.state.message}
//                 </div>
//               </div>
//             )}
//             <CheckButton
//               style={{ display: "none" }}
//               ref={c => {
//                 this.checkBtn = c;
//               }}
//             />
//           </Form>
//         </div>
//         {/* <div className="container">
//           <footer className='footer'>

//             <span className='text-light'>
//               SisCo - INE
//             </span>
//             <label>
//               Versión: 0.1 - Pruebas
//             </label>

//             <span>Desarrollado Por:</span>
//             <label>Alan Velázquez Hernández</label>
//             <label>Pablo Velázquez Hernández</label>
//           </footer>

//         </div> */}
//       </div>


//     );
//   }
// }

// export default withRouter(Login);