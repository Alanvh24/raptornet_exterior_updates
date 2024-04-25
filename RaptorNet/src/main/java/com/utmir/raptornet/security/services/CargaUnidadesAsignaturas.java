package com.utmir.raptornet.security.services;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Sheet;

import java.io.IOException;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFWorkbook; // Agrega esta importación
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.utmir.raptornet.models.Asignaturas;
import com.utmir.raptornet.models.UnidadesPorAsignatura;
import com.utmir.raptornet.repository.AsignaturasRepository;
import com.utmir.raptornet.repository.UnidadesAsignaturaRepository;

@Service
public class CargaUnidadesAsignaturas {

    @Autowired
    private AsignaturasRepository asignaturaRepository;

    @Autowired
    private UnidadesAsignaturaRepository unidadesAsignaturaRepository;

    public void cargarDatosDesdeExcel(MultipartFile file) throws IOException {
        Workbook workbook = new XSSFWorkbook(file.getInputStream());
        Sheet sheet = workbook.getSheetAt(0);
        DataFormatter dataFormatter = new DataFormatter();

        for (Row row : sheet) {
            if (row.getRowNum() == 0) { // Ignorar encabezados
                continue;
            }

            UnidadesPorAsignatura unidadesPorAsignatura = new UnidadesPorAsignatura();
            unidadesPorAsignatura.setNombre_unidad(dataFormatter.formatCellValue(row.getCell(2)));
            unidadesPorAsignatura.setTotal_horas_unidad(dataFormatter.formatCellValue(row.getCell(4)));

            String porcentajeStr = dataFormatter.formatCellValue(row.getCell(3)).replace("%", "").trim();
            double porcentaje = Double.parseDouble(porcentajeStr);

            unidadesPorAsignatura.setPorcentaje(porcentaje);
            // Verificar y convertir ID de Carrera
            String carreraIdStr = dataFormatter.formatCellValue(row.getCell(5));
            if (!carreraIdStr.isEmpty()) {
                Long idAsignatura = Long.parseLong(carreraIdStr);
                Asignaturas asignaturas = asignaturaRepository.findById(idAsignatura)
                        .orElseThrow(() -> new RuntimeException("Carrera no encontrada con ID: " + idAsignatura));
                unidadesPorAsignatura.setAsignaturas(asignaturas);
            } else {
            }
            unidadesAsignaturaRepository.save(unidadesPorAsignatura);
        }

        workbook.close();
    }

}
