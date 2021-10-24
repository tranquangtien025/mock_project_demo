/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.repository;

import com.mycompany.mock.project.demo.entities.QuestionEntity;
import com.mycompany.mock.project.demo.entities.UserEntity;
import java.util.List;
import java.util.Set;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ASUS
 */
@Repository
public interface QuestionRepository
        extends CrudRepository<QuestionEntity, Integer>, JpaRepository<QuestionEntity, Integer> {

    @Query(value = "select * from question q"
            + " join category c on c.id = q.category_id"
            + " where c.categoryName = ?1", nativeQuery = true)
    public List<QuestionEntity> findQuestionByCategory(String categoryName);

   

}
