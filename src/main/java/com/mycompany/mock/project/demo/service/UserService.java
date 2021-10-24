/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.service;

import com.mycompany.mock.project.demo.entities.UserEntity;
import com.mycompany.mock.project.demo.repository.UserRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    public List<UserEntity> getUsers() {
        return (List<UserEntity>) userRepository.findAll();
    }
    
    public UserEntity getUserById(int id) {
        Optional<UserEntity> optional = userRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new UserEntity();
        }
    }
    
    public void saveUser(UserEntity userEntity) {
        userRepository.save(userEntity);
    }
    
    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }
    
    public void saveAndFlush(UserEntity userEntity) {
        userRepository.saveAndFlush(userEntity);
    }
    
    public List<String> getListRolesOfUser(int userId) {
        return userRepository.findListRolesOfUser(userId);
    }
    
    public List<Integer> getListRoleIdOfUser(int userId) {
        return userRepository.findListRoleIdOfUser(userId);
    }
    
    public UserEntity getUser(String username) {
        return userRepository.findByUsername(username);
    }
    
    public boolean isUsernameExist(String username) {
        if (userRepository.findByUsername(username) != null) {
            return true;
        } else {
            return false;
        }
    }

}
