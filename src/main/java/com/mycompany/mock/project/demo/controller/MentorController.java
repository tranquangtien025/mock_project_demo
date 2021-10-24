/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.controller;

import com.google.gson.Gson;
import com.mycompany.mock.project.demo.entities.CategoryEntity;
import com.mycompany.mock.project.demo.entities.QuestionEntity;
import com.mycompany.mock.project.demo.entities.UserEntity;
import com.mycompany.mock.project.demo.entities.UserRoleEntity;
import com.mycompany.mock.project.demo.service.CSVService;
import com.mycompany.mock.project.demo.service.CategoriesReportService;
import com.mycompany.mock.project.demo.service.CategoryService;
import com.mycompany.mock.project.demo.service.QuestionService;
import com.mycompany.mock.project.demo.service.UserRoleService;
import com.mycompany.mock.project.demo.service.UserService;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author TIEN
 */
@Controller
@RequestMapping("/mentor")
public class MentorController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private QuestionService questionService;
    
    @Autowired
    private CategoriesReportService categoriesReportService;

    @Autowired
    CSVService csvService;

//    User Management
    @RequestMapping(value = {"/listUser"}, method = RequestMethod.GET)
    public String listUser(Model model) {

        model.addAttribute("users", userService.getUsers());
        model.addAttribute("userService", userService);
        return "/mentor/listUser";
    }

    @RequestMapping(value = {"/addUser"}, method = RequestMethod.GET)
    public String addUser(Model model) {

        model.addAttribute("user", new UserEntity());
        model.addAttribute("userRoles", userRoleService.getUserRoles());
        model.addAttribute("userService", userService);
        model.addAttribute("action", "add");
        return "/mentor/editUser";
    }

    @RequestMapping(value = {"/editUser/{userId}"}, method = RequestMethod.GET)
    public String editUser(Model model,
            @PathVariable("userId") int userId) {

        model.addAttribute("user", userService.getUserById(userId));
        model.addAttribute("userRoles", userRoleService.getUserRoles());
        model.addAttribute("userService", userService);
        model.addAttribute("action", "edit");
        return "/mentor/editUser";
    }

    @RequestMapping(value = {"/userResult"}, method = RequestMethod.POST)
    public String userResult(Model model,
            @ModelAttribute("user") UserEntity userEntity,
            @RequestParam(value = "listUserRoleId", required = false) List<Integer> listUserRoleId) {

        String password = encrytePassword(userEntity.getPassword());
        userEntity.setPassword(password);
        userService.saveUser(userEntity);
        if (listUserRoleId != null) {
            userEntity.setUserRoles(userRoleService.getListUserRoles(listUserRoleId));
            userService.saveAndFlush(userEntity);
        }

        return "redirect:/mentor/listUser";
    }

    @RequestMapping(value = {"/confirmDeleteUser/{userId}"}, method = RequestMethod.GET)
    public String confirmDeleteUser(Model model,
            @PathVariable("userId") int userId) {

        model.addAttribute("userId", userId);
        return "/mentor/confirmDeleteUser";
    }

    @RequestMapping(value = {"/deleteUser/{userId}"}, method = RequestMethod.GET)
    public String deleteUser(@PathVariable("userId") int userId) {

        userService.deleteUser(userId);
        return "redirect:/mentor/listUser";
    }

    public static String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }

//    Categories Management
    @RequestMapping(value = {"/listCategories"}, method = RequestMethod.GET)
    public String listCategories(Model model) {

        model.addAttribute("categories", categoryService.getAllCategories());
        return "/mentor/listCategories";
    }

    @RequestMapping(value = {"/addCategory"}, method = RequestMethod.GET)
    public String addCatagory(Model model) {

        model.addAttribute("category", new CategoryEntity());
        return "/mentor/editCategory";
    }

    @RequestMapping(value = {"/editCategory/{categoryId}"}, method = RequestMethod.GET)
    public String editCategory(Model model,
            @PathVariable("categoryId") int categoryId) {

        model.addAttribute("category", categoryService.getCategoryById(categoryId));
        return "/mentor/editCategory";
    }

    @RequestMapping(value = {"/categoryResult"}, method = RequestMethod.POST)
    public String categoryResult(Model model,
            @ModelAttribute("category") CategoryEntity categoryEntity) {

        categoryService.saveCategory(categoryEntity);
        return "redirect:/mentor/listCategories";
    }

    @RequestMapping(value = {"/confirmDeleteCategory/{categoryId}"}, method = RequestMethod.GET)
    public String confirmDeleteCategory(Model model,
            @PathVariable("categoryId") int categoryId) {

        model.addAttribute("categoryId", categoryId);
        return "/mentor/confirmDeleteCategory";
    }

    @RequestMapping(value = {"/deleteCategory/{categoryId}"}, method = RequestMethod.GET)
    public String deleteCategory(@PathVariable("categoryId") int categoryId) {

        categoryService.deleteCategory(categoryId);
        return "redirect:/mentor/listCategories";
    }

//    Questions Management
    @RequestMapping(value = {"/listQuestions"}, method = RequestMethod.GET)
    public String listQuestions(Model model) {

        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("questions", questionService.getQuestionByCategory("Java"));
        return "/mentor/listQuestions";
    }

    @RequestMapping(value = {"/addQuestion"}, method = RequestMethod.GET)
    public String addQuestion(Model model) {

        model.addAttribute("question", new QuestionEntity());
        model.addAttribute("categories", categoryService.getAllCategories());
        return "/mentor/editQuestion";
    }

    @RequestMapping(value = {"/editQuestion/{questionId}"}, method = RequestMethod.GET)
    public String editQuestion(Model model,
            @PathVariable("questionId") int questionId) {

        model.addAttribute("question", questionService.getQuestionById(questionId));
        model.addAttribute("categories", categoryService.getAllCategories());
        return "/mentor/editQuestion";
    }

    @RequestMapping(value = {"/questionResult"}, method = RequestMethod.POST)
    public String questionResult(Model model,
            @ModelAttribute("question") QuestionEntity questionEntity) {

        questionService.saveQuestion(questionEntity);
        return "redirect:/mentor/listQuestions";
    }

    @RequestMapping(value = {"/confirmDeleteQuestion/{questionId}"}, method = RequestMethod.GET)
    public String confirmDeleteQuestion(Model model,
            @PathVariable("questionId") int questionId) {

        model.addAttribute("questionId", questionId);
        return "/mentor/confirmDeleteQuestion";
    }

    @RequestMapping(value = {"/deleteQuestion/{questionId}"}, method = RequestMethod.GET)
    public String deleteQuestion(@PathVariable("questionId") int questionId) {

        questionService.deleteQuestion(questionId);
        return "redirect:/mentor/listQuestions";
    }
    
//  Categories Report
    @RequestMapping(value = {"/listCategoriesReports"}, method = RequestMethod.GET)
    public String listCategoriesReports(Model model) {

        model.addAttribute("categoriesReports", categoriesReportService.getAllCategoriesReport());
        return "/mentor/listCategoriesReports";
    }

//  Upload    
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String upload(Model model, @RequestParam("file") MultipartFile file) {
        
        csvService.save(file);
        return "redirect:/mentor/listQuestions";
    }
    
    @RequestMapping(value = "/loadQuestionsByCategory/{categoryId}", method = RequestMethod.GET)
    public String loadQuestionsByCategory(Model model, @PathVariable("categoryId") int categoryId) {
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("questions", questionService.getQuestionByCategory(
                categoryService.getCategoryById(categoryId).getCategoryName()));
        return "mentor/listQuestions";
    }
    
}
