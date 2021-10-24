/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.repository;

import com.mycompany.mock.project.demo.entities.CategoryEntity;
import com.mycompany.mock.project.demo.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ASUS
 */
@Repository
public interface CategoryRepository
        extends CrudRepository<CategoryEntity, Integer>, JpaRepository<CategoryEntity, Integer> {

    @Query(value = "select * from category"
            + " where category.categoryName = ?1", nativeQuery = true)
    public CategoryEntity findByCategoryName(String name);
}
