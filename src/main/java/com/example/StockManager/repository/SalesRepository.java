package com.example.StockManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.StockManager.model.Sales;

public interface SalesRepository extends JpaRepository <Sales, Integer> {

}
