/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.repository;

import com.mycompany.mock.project.demo.entities.UserRoleEntity;
import com.mycompany.mock.project.demo.enums.Role;
import java.util.List;
import java.util.Set;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleRepository extends CrudRepository<UserRoleEntity, Integer>, JpaRepository<UserRoleEntity, Integer> {

    public Set<UserRoleEntity> findByUsers_Username(String username);
    public UserRoleEntity findByRole(Role role);
    
    @Query(value = "select * from user_role ur"
            + " join user_role_relationship urr on ur.id = urr.role_id"
            + " join user u on u.id = urr.user_id"
            + " where u.id = ?1", nativeQuery = true)
    public Set<UserRoleEntity> findByUserId(int userId);
    
    @Query(value = "select * from user_role ur"
            + " where ur.id in ?1", nativeQuery = true)
    public Set<UserRoleEntity> findListByUserRoleId(List<Integer> listRoleId);
    
    @Query(value = "select * from user_role ur where ur.role like ?1", nativeQuery = true)
    public Set<UserRoleEntity> findByRoleName(String roleName);
}
