/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.service;

import com.mycompany.mock.project.demo.entities.CategoryEntity;
import com.mycompany.mock.project.demo.repository.CategoryRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class CategoryService {
    
    @Autowired
    private CategoryRepository categoryRepository;
    
    public List<CategoryEntity> getAllCategories() {
        return categoryRepository.findAll();
    }
    
    public CategoryEntity getCategoryById(int id) {
        Optional<CategoryEntity> optional = categoryRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new CategoryEntity();
        }
    }
    
    public void saveCategory(CategoryEntity categoryEntity) {
        categoryRepository.save(categoryEntity);
    }
    
    public void deleteCategory(int categoryId) {
        categoryRepository.deleteById(categoryId);
    }
    
    public CategoryEntity getCategoryByName(String name) {
        return categoryRepository.findByCategoryName(name);
    }
}
