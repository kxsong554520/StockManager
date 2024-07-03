package com.example.StockManager.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.StockManager.model.Stock;
import com.example.StockManager.repository.StockRepository;

import jakarta.transaction.Transactional;

@Service
public class StockService {
    
    @Autowired
    StockRepository stockRepo;

    public List <Stock> getAllStock(){
        List <Stock> stock = new ArrayList<Stock>();
        stockRepo.findAll().forEach(stock1 -> stock.add(stock1) );
        return stock;
    }

    public Stock getStockById(int stockId) {
        return stockRepo.findById(stockId).orElse(null);
    }

    //Create a stock record
    @Transactional
    public void saveOrUpdateStock (Stock stock){
        stockRepo.save(stock);
    }

    //delete a staff record
    public void deleteStock (int stockId){
        stockRepo.deleteById(stockId);
    }

    //edit a stock record
    public void editStock (Stock stock, int stockId){
        stockRepo.save(stock);
    }

    public double calculateTotalCost() {
        double totalCost = 0.0;
        List<Stock> stocks = getAllStock();
        for (Stock stock : stocks) {
            totalCost += stock.getCostPerUnit() * stock.getQuantity();
        }
        return totalCost;
    }

    public long countAllStocks(){
        return stockRepo.count();
    }

    public List<Stock> getAllStockSortedByShelfLocation() {
        return stockRepo.findAll(Sort.by(Sort.Direction.ASC, "stockLocation"));
    }

}
