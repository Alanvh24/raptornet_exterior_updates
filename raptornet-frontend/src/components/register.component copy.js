// import React, { Component } from "react";
// import Form from "react-validation/build/form";
// import Input from "react-validation/build/input";
// import CheckButton from "react-validation/build/button";
// import { isEmail } from "validator";

// import AuthService from "../services/auth.service";
// import { Navigate } from "react-router-dom";

// const required = value => {
//   if (!value) {
//     return (
//       <div className="alert alert-danger" role="alert">
//         El campo es requerido!
//       </div>
//     );
//   }
// };

// const email = value => {
//   if (!isEmail(value)) {
//     return (
//       <div className="alert alert-danger" role="alert">
//         No es un correo válido o ya existe.
//       </div>
//     );
//   }
// };

// const vpassword = value => {
//   if (value.length < 6 || value.length > 40) {
//     return (
//       <div className="alert alert-danger" role="alert">
//         La contraseña debe tener entre 6 y 40 caracteres.
//       </div>
//     );
//   }
// };

// export default class Register extends Component {
//   constructor(props) {
//     super(props);
//     this.handleRegister = this.handleRegister.bind(this);
//     this.onChangeEmail = this.onChangeEmail.bind(this);
//     this.onChangeCurp = this.onChangeCurp.bind(this);
//     // this.onChangeGenero = this.onChangeGenero.bind(this);
//     this.onChangePassword = this.onChangePassword.bind(this);

//     this.state = {
//       email: "",
//       curp: "",
//       // id_genero: "",
//       password: "",
//       successful: false,
//       message: ""
//     };
//   }


//   onChangeEmail(e) {
//     this.setState({
//       email: e.target.value
//     });
//   }


//   onChangeCurp(e) {
//     this.setState({
//       curp: e.target.value
//     });
//   }

//   // onChangeGenero(e) {
//   //   this.setState({
//   //     id_genero: e.target.value
//   //   });
//   // }

//   onChangePassword(e) {
//     this.setState({
//       password: e.target.value
//     });
//   }

//   handleRegister(e) {
//     e.preventDefault();

//     this.setState({
//       message: "",
//       successful: false
//     });

//     this.form.validateAll();

//     if (this.checkBtn.context._errors.length === 0) {
//       AuthService.register(
//         this.state.email,
//         this.state.curp,
//         this.state.password
//       ).then(
//         response => {
//           this.setState({
//             message: response.data.message,
//             successful: true
//           });
//         },
//         error => {
//           const resMessage =
//             (error.response &&
//               error.response.data &&
//               error.response.data.message) ||
//             error.message ||
//             error.toString();

//           this.setState({
//             successful: false,
//             message: resMessage
//           });
//         }
//       );
//     }
//   }

//   render() {

//     const user = JSON.parse(localStorage.getItem('user'));

//     if (user) {
//       return <Navigate to="/" />;
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
//             onSubmit={this.handleRegister}
//             ref={c => {
//               this.form = c;
//             }}
//           >
//             {!this.state.successful && (
//               <div>
//                 <div className="form-group">
//                   <label htmlFor="email">Email</label>
//                   <Input
//                     type="text"
//                     className="form-control"
//                     name="email"
//                     value={this.state.email}
//                     onChange={this.onChangeEmail}
//                     validations={[required, email]}
//                   />
//                 </div>

//                 <div className="form-group">
//                   <label htmlFor="curp">CURP</label>
//                   <Input
//                     type="text"
//                     className="form-control"
//                     name="curp"
//                     value={this.state.curp}
//                     onChange={this.onChangeCurp}
//                     validations={[required]}
//                   />
//                 </div>

//                 {/* <div className="form-group">
//                   <label htmlFor="genero">Género</label>
//                   <select
//                     className="form-control"
//                     name="genero"
//                     value={this.state.id_genero}
//                     onChange={this.onChangeGenero}
//                     validations={[required]}
//                   >
//                     <option value="">Selecciona un género</option>
//                     <option value="1">Masculino</option>
//                     <option value="2">Femenino</option>
//                   </select>
//                 </div> */}


//                 <div className="form-group">
//                   <label htmlFor="password">Contraseña</label>
//                   <Input
//                     type="password"
//                     className="form-control"
//                     name="password"
//                     value={this.state.password}
//                     onChange={this.onChangePassword}
//                     validations={[required, vpassword]}
//                   />
//                 </div>

//                 <div className="form-group">
//                   <button className="btn btn-custom-green_utmir btn-block text-light mt-3">Registrarse</button>
//                 </div>
//               </div>
//             )}

//             {this.state.message && (
//               <div className="form-group">
//                 <div
//                   className={
//                     this.state.successful
//                       ? "alert alert-success"
//                       : "alert alert-danger"
//                   }
//                   role="alert"
//                 >
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
//       </div>
//     );
//   }
// }
