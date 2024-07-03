package com.example.StockManager.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.example.StockManager.model.Staff;
import com.example.StockManager.service.StaffService;

@Controller
public class StaffController {

    @Autowired
    private StaffService staffService;

    // Handle GET request to show all staff
    @GetMapping("/staff")
    public String getAllStaff(Model model) {
        List<Staff> staffList = staffService.getAllStaffSortedByName();
        model.addAttribute("staffList", staffList);
        model.addAttribute("pageContent", "staff.jsp");
        return "mainpage";
    }


    // Handle GET request to show form for updating staff
    @GetMapping("/staff/edit/{staffId}")
    public String showUpdateForm(@PathVariable("staffId") int staffId, Model model) {
        Staff staff = staffService.getStaffById(staffId);
        model.addAttribute("staff", staff);
        model.addAttribute("pageContent", "updatestaff.jsp");
        return "mainpage";
    }

    // Handle POST request to update staff
    @PostMapping("/staff/edit/{staffId}")
    public String updateStaff(@PathVariable("staffId") int staffId, @ModelAttribute Staff staff, Model model) {
        staffService.saveOrUpdateStaff(staff);
        return "redirect:/staff";
    }

    // Handle GET request to delete staff
    @GetMapping("/staff/delete/{staffId}")
    public String deleteStaff(@PathVariable("staffId") int staffId) {
        staffService.deleteStaff(staffId);
        return "redirect:/staff";
    }

}
