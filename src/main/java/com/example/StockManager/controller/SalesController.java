package com.example.StockManager.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.StockManager.model.Order;
import com.example.StockManager.model.Sales;
import com.example.StockManager.model.Stock;
import com.example.StockManager.service.SalesService;
import com.example.StockManager.service.StockService;

@Controller
public class SalesController {
    @Autowired
    private SalesService salesService;

    @Autowired
    private StockService stockService;

    @GetMapping ("/sales")
    public String getAllSales (Model model){
        List  <Sales> salesList = salesService.getAllSales();
        model.addAttribute("salesList", salesList);
        model.addAttribute("pageContent","sales.jsp");
        return "mainpage";
    }

    @GetMapping ("/sales/create")
    public String showCreateForm (Model model){
        List <Stock> stockList = stockService.getAllStock();
        model.addAttribute ("stockList", stockList);
        model.addAttribute("pageContent","createEditSales.jsp");
        return "mainpage";
    }

    @PostMapping ("/sales/create")
    public String createSales (Model model, @ModelAttribute Sales sales, @RequestParam int stockId){
        Stock stock = stockService.getStockById(stockId);

        int newQuantity = stock.getQuantity() - sales.getSoldQty();
        stock.setQuantity(newQuantity);

        sales.setStock (stock);
        salesService.saveOrUpdateSales(sales);
        stockService.saveOrUpdateStock(stock);
        return "redirect:/sales";
    }

    //GET to show the edit form
    @GetMapping ("sales/edit/{salesId}")
    public String showEditForm (@PathVariable ("salesId") int salesId, Model model){
        Sales sales = salesService.getSalesById(salesId);
        model.addAttribute("sales", sales);
        List <Stock> stockList = stockService.getAllStock();
        model.addAttribute ("stockList", stockList);
        model.addAttribute ("pageContent", "createEditSales.jsp");
        return "mainpage";
    }

    //edit the order record using POST
    @PostMapping ("sales/edit/{salesId}")
    public String editSales(@PathVariable ("salesId") int salesId, @ModelAttribute Sales sales, Model model, @RequestParam int stockId){
        Stock stock = stockService.getStockById(stockId);
        
        int newQuantity = stock.getQuantity() - sales.getSoldQty();
        stock.setQuantity(newQuantity);

        sales.setStock (stock);
        salesService.saveOrUpdateSales(sales);
        stockService.saveOrUpdateStock(stock);
        return "redirect:/sales";
    }

    //delete the order record with GET
    @GetMapping ("sales/delete/{salesId}")        
    public String deleteSales (@PathVariable ("salesId") int salesId){
        salesService.deleteSales(salesId);
        return "redirect:/sales";
    }



}
