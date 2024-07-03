package com.example.StockManager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.StockManager.service.OrderService;
import com.example.StockManager.service.SalesService;
import com.example.StockManager.service.StaffService;
import com.example.StockManager.service.StockService;
import com.example.StockManager.service.SupplierService;

@Controller
public class DashboardController {

    @Autowired
    private StaffService staffService;

    @Autowired
    private SupplierService supplierService;

    @Autowired
    private StockService stockService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private SalesService salesService;

    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        double totalCost = stockService.calculateTotalCost();
        double totalSales = salesService.calculateTotalSales();
        double profit = totalSales - totalCost;
        long totalStaff = staffService.countAllStaff();
        long totalStocks = stockService.countAllStocks();
        long totalOrders = orderService.countAllOrders();
        long totalSold = salesService.countAllSold();
        long totalSupplier = supplierService.countSupplier();

        model.addAttribute("totalCost", totalCost);
        model.addAttribute("totalSales",totalSales);
        model.addAttribute("profit",profit);
        model.addAttribute("totalStaff", totalStaff);
        model.addAttribute("totalStocks", totalStocks);
        model.addAttribute("totalOrders", totalOrders);
        model.addAttribute("totalSold",totalSold);
        model.addAttribute("totalSupplier", totalSupplier);
        model.addAttribute("pageContent", "dashboard.jsp");
        return "mainpage";
    }

}
