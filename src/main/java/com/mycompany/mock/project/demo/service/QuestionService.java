/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.service;

import com.mycompany.mock.project.demo.entities.QuestionEntity;
import com.mycompany.mock.project.demo.repository.QuestionRepository;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class QuestionService {
    
    @Autowired
    private QuestionRepository questionRepository;
    
    public List<QuestionEntity> getQuestionByCategory(String categoryName) {
        return questionRepository.findQuestionByCategory(categoryName);
    }
    
    public QuestionEntity getQuestionById(int questionId) {
        Optional<QuestionEntity> optional = questionRepository.findById(questionId);
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return new QuestionEntity();
        }
    }
    
    public List<QuestionEntity> getAllQuestions() {
        return questionRepository.findAll();
    }
    
    public void saveQuestion(QuestionEntity questionEntity) {
        questionRepository.save(questionEntity);
    }
    
    public void deleteQuestion(int questionId) {
        questionRepository.deleteById(questionId);
    }
}
