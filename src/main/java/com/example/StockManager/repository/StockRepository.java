package com.example.StockManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.StockManager.model.Stock;

public interface StockRepository extends JpaRepository <Stock, Integer>{

}
