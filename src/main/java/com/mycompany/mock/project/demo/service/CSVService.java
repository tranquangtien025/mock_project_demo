/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.service;

import com.mycompany.mock.project.demo.entities.QuestionEntity;
import com.mycompany.mock.project.demo.helper.CSVHelper;
import com.mycompany.mock.project.demo.repository.QuestionRepository;
import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author TIEN
 */
@Service
public class CSVService {

    @Autowired
    QuestionRepository questionRepository;

    public void save(MultipartFile file) {
        try {
            List<QuestionEntity> questions = CSVHelper.csvToQuestions(file.getInputStream());
            questionRepository.saveAll(questions);
        } catch (IOException e) {
            throw new RuntimeException("fail to store csv data: " + e.getMessage());
        }
    }

    public List<QuestionEntity> getAllQuestions() {
        return questionRepository.findAll();
    }
}
