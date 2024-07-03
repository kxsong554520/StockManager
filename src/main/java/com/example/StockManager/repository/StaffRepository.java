package com.example.StockManager.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.StockManager.model.Staff;

public interface StaffRepository extends JpaRepository<Staff, Integer>{
    Optional <Staff> findByUsernameAndPassword(String username, String password);

    

}
