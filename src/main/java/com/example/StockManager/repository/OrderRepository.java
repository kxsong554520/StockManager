package com.example.StockManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.StockManager.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{

}
