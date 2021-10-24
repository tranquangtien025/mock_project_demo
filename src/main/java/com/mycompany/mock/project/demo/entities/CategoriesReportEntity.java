/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "categories_report")
public class CategoriesReportEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String username;
    
    private String categories;
    
    @Column(name = "total_questions")
    private int totalQuestions;
    
    @Column(name = "passed_question")
    private int passedQuestion;
    
    private int timer;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    public CategoriesReportEntity() {
    }

    public CategoriesReportEntity(String username, String categories, int totalQuestions, int passedQuestion, int timer, Date date) {
        this.username = username;
        this.categories = categories;
        this.totalQuestions = totalQuestions;
        this.passedQuestion = passedQuestion;
        this.timer = timer;
        this.date = date;
    }
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCategories() {
        return categories;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }

    public int getTotalQuestions() {
        return totalQuestions;
    }

    public void setTotalQuestions(int totalQuestions) {
        this.totalQuestions = totalQuestions;
    }

    public int getPassedQuestion() {
        return passedQuestion;
    }

    public void setPassedQuestion(int passedQuestion) {
        this.passedQuestion = passedQuestion;
    }

    public int getTimer() {
        return timer;
    }

    public void setTimer(int timer) {
        this.timer = timer;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
    
}
