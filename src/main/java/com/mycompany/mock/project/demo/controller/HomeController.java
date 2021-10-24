/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.controller;

import com.mycompany.mock.project.demo.entities.UserEntity;
import com.mycompany.mock.project.demo.enums.UserStatus;
import com.mycompany.mock.project.demo.service.UserService;
import com.mycompany.mock.project.demo.utils.SecurityUtils;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author TIEN
 */
@Controller
public class HomeController {
    
    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/home"}, method = RequestMethod.GET)
    public String home(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        UserEntity userEntity = userService.getUser(username);
        UserStatus userStatus = userEntity.getStatus();
        
        List<String> roles = SecurityUtils.getRolesOfUser();
        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_MEMBER"))) {
            if (userStatus == UserStatus.UNACTIVE) {
                return "redirect:/member/changePassword";
            } else if (userStatus == UserStatus.ACTIVE) {
                return "redirect:/member/learningQuizEngine";
            } else {
                model.addAttribute("message", "Your account has been locked");
                return "login";
            }            
        }
        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_MENTOR"))) {
            return "redirect:/mentor/listUser";
        }
        
        return "login";
    }

    @RequestMapping(value = {"/", "/login"})
    public String loginPage(Model model,
            @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Login Fail!");
        }
        return "login";
    }

    @RequestMapping("/403")
    public String accessDenied(Model model) {
        return "403Page";
    }

}
