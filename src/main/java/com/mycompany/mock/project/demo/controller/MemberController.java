/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.controller;

import com.mycompany.mock.project.demo.entities.CategoriesReportEntity;
import com.mycompany.mock.project.demo.entities.QuestionEntity;
import com.mycompany.mock.project.demo.entities.UserEntity;
import com.mycompany.mock.project.demo.enums.UserStatus;
import com.mycompany.mock.project.demo.service.CategoriesReportService;
import com.mycompany.mock.project.demo.service.CategoryService;
import com.mycompany.mock.project.demo.service.QuestionService;
import com.mycompany.mock.project.demo.service.UserService;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author TIEN
 */
@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private UserService userService;

    @Autowired
    private BCryptPasswordEncoder encode;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private QuestionService questionService;
    
    @Autowired
    private CategoriesReportService categoriesReportService;

    @RequestMapping(value = {"/changePassword"}, method = RequestMethod.GET)
    public String changePassword(Model model) {
//        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        String username = principal.toString();
//        if (principal instanceof UserDetails) {
//            username = ((UserDetails) principal).getUsername();
//        }
        model.addAttribute("username", getUserName());
        return "/member/changePassword";
    }

    @RequestMapping(value = {"/changePassword"}, method = RequestMethod.POST)
    public String changePassword(Model model,
            @RequestParam("currentPassword") String currentPassword,
            @RequestParam("newPassword") String newPassword) {
//        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        String username = principal.toString();
//        if (principal instanceof UserDetails) {
//            username = ((UserDetails) principal).getUsername();
//        }
        UserEntity userEntity = userService.getUser(getUserName());

        if (encode.matches(currentPassword, userEntity.getPassword())) {
            String password = encrytePassword(newPassword);
            userEntity.setPassword(password);
            userEntity.setStatus(UserStatus.ACTIVE);
            userService.saveUser(userEntity);
            return "redirect:/login";
        }

        model.addAttribute("username", getUserName());
        model.addAttribute("message", "Password was wrong");
        return "/member/changePassword";
    }

    public static String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }

    @RequestMapping(value = {"/learningQuizEngine"}, method = RequestMethod.GET)
    public String learningQuizEngine(Model model) {

        model.addAttribute("categories", categoryService.getAllCategories());
        return "/member/learningQuizEngine";
    }

    @RequestMapping(value = {"/learningQuizEngine"}, method = RequestMethod.POST)
    public String createQuiz(Model model, HttpSession session,
            @RequestParam("number") int number,
            @RequestParam("category") String category) {

        session.setAttribute("categorySession", category);

        List<QuestionEntity> quizes = new ArrayList<>();
        if (category.equals("Random")) {
            for (QuestionEntity q : new HashSet<>(questionService.getAllQuestions())) {
                quizes.add(q);
                number--;
                if (number < 1) {
                    break;
                }
            }
        } else {
            for (QuestionEntity q : new HashSet<>(questionService.getQuestionByCategory(category))) {
                quizes.add(q);
                number--;
                if (number < 1) {
                    break;
                }
            }
        }

        List<String> answerList = new ArrayList<>();
        int totalDuration = 0;
        for (QuestionEntity q : quizes) {
            answerList.add(q.getAnswer());
            q.setAnswer("");
            totalDuration += q.getDuration();
        }
        session.setAttribute("answerList", answerList);
        session.setAttribute("quizes", quizes);
        model.addAttribute("index", 0);
        model.addAttribute("totalDuration", totalDuration);
        return "/member/learningQuiz";
    }

    @RequestMapping(value = {"/learningQuiz"}, method = RequestMethod.GET)
    public String learningQuiz(Model model) {
        return "redirect:/member/learningQuizEngine";
    }

    @RequestMapping(value = {"/learningQuiz"}, method = RequestMethod.POST)
    public String learningQuiz(Model model, HttpSession session,
            @RequestParam("index") int index,
            @RequestParam(value = "answer", required = false) String answer,
            @RequestParam(value = "command") String command,
            @RequestParam(value = "totalDuration", required = false) int totalDuration) {
        List<QuestionEntity> quizes = (List<QuestionEntity>) session.getAttribute("quizes");
        if (quizes == null) {
            return "redirect:/member/learningQuizEngine";
        }
        quizes.get(index).setAnswer(answer);
        session.setAttribute("quizes", quizes);
        if (command.equals("Next")) {
            model.addAttribute("index", index + 1);
        } else if (command.equals("Previous")) {
            model.addAttribute("index", index - 1);
        } else {
            return "redirect:/member/finishQuiz";
        }

        model.addAttribute("category", session.getAttribute("categorySession"));
        model.addAttribute("totalDuration", totalDuration/1000);
        return "/member/learningQuiz";
    }

    @RequestMapping(value = {"/finishQuiz"}, method = RequestMethod.GET)
    public String finishQuiz(Model model, HttpSession session) {
        List<String> answerList = (List<String>) session.getAttribute("answerList");
        List<QuestionEntity> quizes = (List<QuestionEntity>) session.getAttribute("quizes");
        if (answerList == null || quizes == null) {
            return "redirect:/member/learningQuizEngine";
        }

        int passed = 0;
        int timer = 0;
        for (int i = 0; i < answerList.size(); i++) {
            if (answerList.get(i).equals(quizes.get(i).getAnswer())) {
                passed++;
            }
            timer += quizes.get(i).getDuration();
        }
        
        CategoriesReportEntity categoriesReportEntity = 
                new CategoriesReportEntity(getUserName(), 
                        (String) session.getAttribute("categorySession"),
                        answerList.size(),
                        passed,
                        timer,
                        new Date());
        categoriesReportService.saveCategoriesReport(categoriesReportEntity);
        
        model.addAttribute("category", session.getAttribute("categorySession"));
        model.addAttribute("passed", passed + "/" + answerList.size());
        session.invalidate();
        return "member/finishQuiz";
    }
    
    private static String getUserName() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        return username;
    }
}
