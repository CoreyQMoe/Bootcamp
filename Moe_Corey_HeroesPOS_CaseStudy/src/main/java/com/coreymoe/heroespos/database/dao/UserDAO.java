package com.coreymoe.heroespos.database.dao;

import com.coreymoe.heroespos.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

    User findUserById(@Param("id") Integer id);

    List<User> findByEmailIgnoreCaseContaining(@Param("email") String email);

    List<User> findByFirstNameAndLastNameIgnoreCaseContaining(@Param("firstName") String firstName, @Param("lastName") String lastName);

    List<User> findByFirstNameIgnoreCaseContaining(@Param("firstName") String firstName);

    List<User> findByLastNameIgnoreCaseContaining(@Param("lastName") String latName);

    List<User> findByActive(@Param("active") Integer active);

    List<User> findByPhoneNumberContaining(@Param("phoneNumber")Integer phoneNumber);

    List<User> findByCreatedContaining(@Param("created") Date created);

    @Query(value = "SELECT e.first_name FROM Users e", nativeQuery = true)
    List<String> getAllUserFirstNames();

    @Query(value = "SELECT e.last_name FROM Users e", nativeQuery = true)
    List<String> getAllUserLastNames();

    @Query(value = "SELECT * FROM Users", nativeQuery = true)
    List<User> findAllUsers();

    User findByEmail(@Param("email") String email);
}