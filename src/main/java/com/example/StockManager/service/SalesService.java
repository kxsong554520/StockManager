package com.example.StockManager.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.StockManager.model.Sales;
import com.example.StockManager.repository.SalesRepository;

@Service
public class SalesService {
    
    @Autowired
    SalesRepository salesRepo;

    //get all sales
    public List <Sales> getAllSales(){
        List <Sales> sales = new ArrayList<Sales>();
        salesRepo.findAll().forEach(sales1 -> sales.add(sales1));
        return sales;
    }

    public Sales getSalesById(int salesId){
        return salesRepo.findById(salesId).orElse(null);
    }

    public void saveOrUpdateSales (Sales sales){
        salesRepo.save (sales);
    }

    public void deleteSales (int salesId){
        salesRepo.deleteById(salesId);
    }

    public double calculateTotalSales(){
        double totalSales = 0.0;
        List <Sales> sales = getAllSales();
        for(Sales sale: sales){
            totalSales += sale.getTotalPrice();
        }
        return totalSales;
    }

    public long countAllSold(){
        return salesRepo.count();
    }
    
}
