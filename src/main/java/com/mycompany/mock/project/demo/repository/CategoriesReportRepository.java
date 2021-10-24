/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.repository;

import com.mycompany.mock.project.demo.entities.CategoriesReportEntity;
import com.mycompany.mock.project.demo.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriesReportRepository extends CrudRepository<CategoriesReportEntity, Integer>, JpaRepository<CategoriesReportEntity, Integer> {
    
}
