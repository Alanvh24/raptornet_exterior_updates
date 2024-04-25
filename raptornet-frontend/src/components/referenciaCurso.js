import React from "react";
import { useState } from "react";
import { useEffect } from "react";
import userService from "../services/user.service"
import { PDFDocument, rgb } from "pdf-lib";
import { Navigate } from "react-router-dom";
import fontkit from '@pdf-lib/fontkit';

const ReferenciaCurso = () => {


  const [usuarios, setUsuarios] = useState([]);

  useEffect(() => {
    verReferenciaCurso();
  }, []);

  const verReferenciaCurso = () => {
    userService.verReferenciaCurso().then((response) => {
      const datos = Array.isArray(response.data) ? response.data : [response.data];
      setUsuarios(datos);
      console.log(datos);
    }).catch((error) => {
      console.log(error);
    });
  };

  const descargarPdf = async () => {

    const MAX_NAME_LENGTH = 40;

    const splitNameIfNeeded = (fullName) => {
      if (fullName.length <= MAX_NAME_LENGTH) {
        return [fullName];
      } else {

        const splitIndex = fullName.lastIndexOf(' ', MAX_NAME_LENGTH);
        return [
          fullName.substring(0, splitIndex),
          fullName.substring(splitIndex + 1)
        ];
      }
    };

    const MAX_ID_CARRERA_LENGTH = 40;

    const splitTextIfNeeded = (text, maxLength) => {
      if (text.length <= maxLength) {
        return [text];
      } else {
        const splitIndex = text.includes(' ') ? text.lastIndexOf(' ', maxLength) : maxLength;
        return [
          text.substring(0, splitIndex),
          text.substring(splitIndex + 1)
        ];
      }
    };

    const MAX_CUOTA_LENGTH = 40;

    const url = '../formato_referencias.pdf'; // Reemplaza con la URL de la plantilla del PDF
    const existingPdfBytes = await fetch(url).then(res => res.arrayBuffer());

    const pdfDoc = await PDFDocument.load(existingPdfBytes);

    pdfDoc.registerFontkit(fontkit);
    const fontUrl = '../NewJune-Regular.otf'; // Asegúrate de que esta ruta sea correcta
    const fontBytes = await fetch(fontUrl).then(res => res.arrayBuffer());
    const customFont = await pdfDoc.embedFont(fontBytes);

    const pages = pdfDoc.getPages();
    const firstPage = pages[0];

    usuarios.forEach((usuario, index) => {
      firstPage.drawText(usuario.matricula, { x: 140, y: 596, size: 20, font: customFont, color: rgb(0, 0, 0) });
      const nombresDivididos = splitNameIfNeeded(usuario.nombre + " " + usuario.ap_paterno + " " + usuario.ap_materno);
      firstPage.drawText(nombresDivididos[0], { x: 120, y: 542, size: 20, font: customFont, color: rgb(0, 0, 0) });
      if (nombresDivididos.length > 1) {
        firstPage.drawText(nombresDivididos[1], { x: 120, y: 522, size: 20, font: customFont, color: rgb(0, 0, 0) }); // Ajusta la coordenada Y según sea necesario
      }
      const idCarreraDividido = splitTextIfNeeded(usuario.id_carrera_1, MAX_ID_CARRERA_LENGTH);
      firstPage.drawText(idCarreraDividido[0], { x: 240, y: 486, size: 20, font: customFont, color: rgb(0, 0, 0) });
      if (idCarreraDividido.length > 1) {
        firstPage.drawText(idCarreraDividido[1], { x: 240, y: 466, size: 20, font: customFont, color: rgb(0, 0, 0) }); // Ajusta la coordenada Y según sea necesario
      }
      firstPage.drawText("$" + usuario.costo, { x: 190, y: 428, size: 20, font: customFont, color: rgb(0, 0, 0) });
      const cuotaDividida = splitTextIfNeeded(usuario.cuota, MAX_CUOTA_LENGTH);
      firstPage.drawText(cuotaDividida[0], { x: 220, y: 373, size: 20, font: customFont, color: rgb(0, 0, 0) });
      if (cuotaDividida.length > 1) {
        firstPage.drawText(cuotaDividida[1], { x: 220, y: 353, size: 20, font: customFont, color: rgb(0, 0, 0) }); // Ajusta la coordenada Y según sea necesario
      }

      firstPage.drawText(usuario.referencia, { x: 155, y: 205, size: 20, font: customFont, color: rgb(0, 0, 0) });

      firstPage.drawText(usuario.fecha_limite, { x: 260, y: 148, size: 20, font: customFont, color: rgb(0, 0, 0) });
    });

    const pdfBytes = await pdfDoc.save();
    const matricula = usuarios[0].matricula;
    download(pdfBytes, `referencia-${matricula}.pdf`, "application/pdf");
  };

  const user = JSON.parse(localStorage.getItem('user'));

  if (user && user.roles.includes('ROLE_ASPIRANTE') && user.asp_etapa === '5') {
    return (
      <div className="container">

        <div className="text-center mb-3">
          <h1>Ya está disponible tu Referencia. Descárgala</h1>
        </div>

        {usuarios.map((usuario, index) => (
          <div key={index} className="usuario-info">
            <p><strong>Matrícula:</strong> {usuario.matricula}</p>
            <p><strong>Nombre:</strong> {usuario.nombre}</p>
            <p><strong>Apellidos:</strong> {usuario.ap_paterno} {usuario.ap_materno}</p>
            <p><strong>Carrera:</strong> {usuario.id_carrera_1}</p>
            <p><strong>Referencia Bancaria:</strong> {usuario.referencia}</p>
            <p><strong>Cantidad a pagar:</strong> {usuario.costo}</p>
            <p><strong>Fecha límite de Pago:</strong> {usuario.fecha_limite}</p>
          </div>
        ))}

        <div>

          <button className="btn btn-success" onClick={descargarPdf}>
            Descargar Referencia de Pago
          </button>

        </div>

      </div>
    );

  } else {
    return <Navigate to="/login" />;
  };
}

// Función auxiliar para descargar el PDF
function download(data, filename, type) {
  const file = new Blob([data], { type: type });
  const a = document.createElement("a");
  const url = URL.createObjectURL(file);
  a.href = url;
  a.download = filename;
  document.body.appendChild(a);
  a.click();
  setTimeout(() => {
    document.body.removeChild(a);
    window.URL.revokeObjectURL(url);
  }, 0);
}

export default ReferenciaCurso;
