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
import com.utmir.raptornet.models.Carreras;
import com.utmir.raptornet.models.Cuatrimestre;
import com.utmir.raptornet.repository.AsignaturasRepository;
import com.utmir.raptornet.repository.CarrerasRepository;
import com.utmir.raptornet.repository.CuatrimestreRepository;

@Service
public class CargaMateriasService {

    @Autowired
    private AsignaturasRepository asignaturaRepository;

    // Suponiendo que tienes estos repositorios
    @Autowired
    private CarrerasRepository carrerasRepository;
    @Autowired
    private CuatrimestreRepository cuatrimestreRepository;

    public void cargarDatosDesdeExcel(MultipartFile file) throws IOException {
        Workbook workbook = new XSSFWorkbook(file.getInputStream());
        Sheet sheet = workbook.getSheetAt(0);
        DataFormatter dataFormatter = new DataFormatter();

        for (Row row : sheet) {
            if (row.getRowNum() == 0) { // Ignorar encabezados
                continue;
            }

            Asignaturas asignatura = new Asignaturas();
            asignatura.setNombre_asignatura(dataFormatter.formatCellValue(row.getCell(1)));

            // Verificar y convertir ID de Carrera
            String carreraIdStr = dataFormatter.formatCellValue(row.getCell(2));
            if (!carreraIdStr.isEmpty()) {
                Long idCarrera = Long.parseLong(carreraIdStr);
                Carreras carrera = carrerasRepository.findById(idCarrera)
                        .orElseThrow(() -> new RuntimeException("Carrera no encontrada con ID: " + idCarrera));
                asignatura.setCarreras(carrera);
            } else {
                // Manejar celda vacía o asignar un valor predeterminado
            }

            // Verificar y convertir ID de Cuatrimestre
            String cuatrimestreIdStr = dataFormatter.formatCellValue(row.getCell(3));
            if (!cuatrimestreIdStr.isEmpty()) {
                Long idCuatrimestre = Long.parseLong(cuatrimestreIdStr);
                Cuatrimestre cuatrimestre = cuatrimestreRepository.findById(idCuatrimestre)
                        .orElseThrow(
                                () -> new RuntimeException("Cuatrimestre no encontrado con ID: " + idCuatrimestre));
                asignatura.setCuatrimestre(cuatrimestre);
            } else {
                // Manejar celda vacía o asignar un valor predeterminado
            }

            asignaturaRepository.save(asignatura);
        }

        workbook.close();
    }

}
