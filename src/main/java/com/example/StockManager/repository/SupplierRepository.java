package com.example.StockManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.StockManager.model.Supplier;

public interface SupplierRepository extends JpaRepository<Supplier, Integer> {

    
}
