/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.service;

import com.mycompany.mock.project.demo.entities.CategoriesReportEntity;
import com.mycompany.mock.project.demo.repository.CategoriesReportRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class CategoriesReportService {
    
    @Autowired
    private CategoriesReportRepository categoriesReportRepository;
    
    public List<CategoriesReportEntity> getAllCategoriesReport() {
        return categoriesReportRepository.findAll();
    }
    
    public void saveCategoriesReport(CategoriesReportEntity categoriesReportEntity) {
        categoriesReportRepository.save(categoriesReportEntity);
    }
}
