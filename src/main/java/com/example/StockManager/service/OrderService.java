package com.example.StockManager.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.StockManager.model.Order;
import com.example.StockManager.repository.OrderRepository;

@Service
public class OrderService {
    
    @Autowired
    OrderRepository orderRepo;

    //get all order record
    public List <Order> getAllOrder(){
        List<Order> order = new ArrayList<Order>();
        orderRepo.findAll().forEach(order1 -> order.add(order1));
        return order;
    }

    //find order by id
    public Order getOrderById(int orderId) {
        return orderRepo.findById(orderId).orElse(null);
    }

    //Create an order record
    public void saveOrUpdateOrder (Order order){
        orderRepo.save(order);
    }

    //delete an order record
    public void deleteOrder (int orderId){
        orderRepo.deleteById(orderId);
    }

    //edit an order record
    public void editOrder (Order order, int orderId){
        orderRepo.save(order);
    }

    public long countAllOrders(){
        return orderRepo.count();
    }

}
