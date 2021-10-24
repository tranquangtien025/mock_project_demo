/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.repository;

import com.mycompany.mock.project.demo.entities.UserEntity;
import com.mycompany.mock.project.demo.enums.UserStatus;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<UserEntity, Integer>, JpaRepository<UserEntity, Integer> {

    public UserEntity findByUsername(String username);
    
    public UserEntity findByUsernameLikeAndStatusLike(String username,
            UserStatus status);
    
    @Query(value = "select ur.role from user_role ur"
            + " join user_role_relationship urr on urr.role_id = ur.id"
            + " join user u on u.id = urr.user_id"
            + " where u.id = ?1", nativeQuery = true)
    public List<String> findListRolesOfUser(int userId);
    
    @Query(value = "select ur.id from user_role ur"
            + " join user_role_relationship urr on urr.role_id = ur.id"
            + " join user u on u.id = urr.user_id"
            + " where u.id = ?1", nativeQuery = true)
    public List<Integer> findListRoleIdOfUser(int userId);
    
    
}
