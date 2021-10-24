/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.helper;

import com.mycompany.mock.project.demo.entities.CategoryEntity;
import com.mycompany.mock.project.demo.entities.QuestionEntity;
import com.mycompany.mock.project.demo.service.CategoryService;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author TIEN
 */
public class CSVHelper {

    @Autowired
    private CategoryService categoryService;

    public static String TYPE = "text/csv";
    static String[] HEADERs = {"No", "Categories", "Question", "Ans1(A)", "Ans2(B)", "Ans3(C)", "Ans4(D)",
        "Ans", "Duration(seconds)"};

    public static boolean hasCSVFormat(MultipartFile file) {

        if (!TYPE.equals(file.getContentType())) {
            return false;
        }

        return true;
    }

    public static List<QuestionEntity> csvToQuestions(InputStream is) {
        try (BufferedReader fileReader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                CSVParser csvParser = new CSVParser(fileReader,
                        CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());) {

            List<QuestionEntity> questions = new ArrayList<QuestionEntity>();

            Iterable<CSVRecord> csvRecords = csvParser.getRecords();

            for (CSVRecord csvRecord : csvRecords) {

                QuestionEntity question = new QuestionEntity(
                        Integer.parseInt(csvRecord.get("No")),
                        csvRecord.get("Question"),
                        csvRecord.get("Ans1(A)"),
                        csvRecord.get("Ans2(B)"),
                        csvRecord.get("Ans3(C)"),
                        csvRecord.get("Ans4(D)"),
                        csvRecord.get("Ans"),
                        Integer.parseInt(csvRecord.get("Duration(seconds)")),
                        new CategoryService().getCategoryByName(csvRecord.get("Categories"))
);

                questions.add(question);
            }

            return questions;
        } catch (IOException e) {
            throw new RuntimeException("fail to parse CSV file: " + e.getMessage());
        }
    }
}
