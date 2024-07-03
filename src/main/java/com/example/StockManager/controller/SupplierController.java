package com.example.StockManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.StockManager.model.Supplier;
import com.example.StockManager.service.SupplierService;

@Controller
public class SupplierController {

    @Autowired
    private SupplierService supplierService;

    // Handle GET request to show all supplier
    @GetMapping("/supplier")
    public String getAllSupplier(Model model) {
        List<Supplier> supplierList = supplierService.getAllSupplierSortedByName();
        model.addAttribute("supplierList", supplierList);
        model.addAttribute("pageContent","supplier.jsp");
        return "mainpage"; 
    }

    // Handle GET request to create supplier
    @GetMapping("/supplier/create")
    public String showCreateForm (Model model){
        model.addAttribute("pageContent","createEditSupplier.jsp");
        return "mainpage"; 
    }

    @PostMapping ("/supplier/create")
    public String createSupplier (Model model, @ModelAttribute Supplier supplier ){
        supplierService.saveOrUpdateSupplier(supplier);
        return "redirect:/supplier";
    }

    // Handle GET request to show edit form for supplier
    @GetMapping("/supplier/edit/{supplierId}")
    public String showEditForm(@PathVariable("supplierId")int supplierId, Model model){
        Supplier supplier = supplierService.getSupplierById(supplierId);
        model.addAttribute("supplier", supplier);
        model.addAttribute("pageContent","createEditSupplier.jsp");
        return "mainpage";
    }

    //Handle POST to update supplier
    @PostMapping("/supplier/edit/{supplierId}")
    public String editSupplier (@PathVariable("supplierId")int supplierId, @ModelAttribute Supplier supplier, Model model){
        supplierService.saveOrUpdateSupplier(supplier);
        return "redirect:/supplier";
    }

    //Handle GET to delete supplier
    @GetMapping("/supplier/delete/{supplierId}")
    public String deleteSupplier (@PathVariable("supplierId") int supplierId){
        supplierService.deleteSupplier(supplierId);
        return "redirect:/supplier";
    }
}
