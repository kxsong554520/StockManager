package com.example.StockManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.StockManager.model.Staff;
import com.example.StockManager.model.Stock;
import com.example.StockManager.model.Supplier;
import com.example.StockManager.service.StaffService;
import com.example.StockManager.service.StockService;
import com.example.StockManager.service.SupplierService;

@Controller
public class StockController {

    @Autowired
    private StockService stockService;

    @Autowired
    private SupplierService supplierService;

    @Autowired
    private StaffService staffService;

    // Show all stock using GET
    @GetMapping("/stock")
    public String getAllStock(Model model) {
        List<Stock> stockList = stockService.getAllStockSortedByShelfLocation();
        model.addAttribute("stockList", stockList);
        model.addAttribute("pageContent", "stock.jsp");
        return "mainpage";
    }

    // GET mapping to show create stock form
    @GetMapping("/stock/create")
    public String showCreateForm(Model model) {
        List<Supplier> supplierList = supplierService.getAllSupplier();
        model.addAttribute("supplierList", supplierList);
        List<Staff> staffList = staffService.getAllStaff();
        model.addAttribute("staffList", staffList);
        model.addAttribute("pageContent", "createEditStock.jsp");
        return "mainpage";
    }

    // POST mapping for handling creation of stock
    @PostMapping("/stock/create")
    public String createStock(Model model, @ModelAttribute Stock stock, @RequestParam int supplierId, @RequestParam int staffId) {
        Supplier supplier = supplierService.getSupplierById(supplierId);
        Staff staff = staffService.getStaffById(staffId);

        stock.setSupplier(supplier);
        stock.setStaff(staff);
        stockService.saveOrUpdateStock(stock);
        return ("redirect:/stock");
    }

    // GET mapping to show edit form
    @GetMapping("stock/edit/{stockId}")
    public String showEditForm(@PathVariable("stockId") int stockId, Model model) {
        Stock stock = stockService.getStockById(stockId);
        model.addAttribute("stock", stock);
        List<Supplier> supplierList = supplierService.getAllSupplier();
        model.addAttribute("supplierList", supplierList);
        List<Staff> staffList = staffService.getAllStaff();
        model.addAttribute("staffList", staffList);
        model.addAttribute("pageContent", "createEditStock.jsp");
        return "mainpage";
    }

    // POST mapping to edit stock
    @PostMapping("stock/edit/{stockId}")
    public String editStock(@PathVariable("stockId") int stockId, @ModelAttribute Stock stock, Model model , @RequestParam int supplierId, @RequestParam int staffId) {
        Supplier supplier = supplierService.getSupplierById(supplierId);
        Staff staff = staffService.getStaffById(staffId);

        stock.setSupplier(supplier);
        stock.setStaff(staff);
        
        stockService.saveOrUpdateStock(stock);
        return ("redirect:/stock");
    }

    // Handle GET to delete stock record
    @GetMapping("stock/delete/{stockId}")
    public String deleteStock(@PathVariable("stockId") int stockId) {
        stockService.deleteStock(stockId);
        return "redirect:/stock";
    }

    
}
