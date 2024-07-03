package com.example.StockManager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.StockManager.model.Staff;
import com.example.StockManager.service.EmailService;
import com.example.StockManager.service.StaffService;


import org.springframework.web.bind.annotation.PostMapping;

@Controller

public class AuthController {

    @GetMapping("/")
    public String loginPage(Model model) {
        model.addAttribute("pageContent", "login.jsp");
        return "mainpage";
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("pageContent", "register.jsp");
        return "mainpage";
    }

    @Autowired
    private StaffService staffService;

    @Autowired
    private EmailService emailService;

    @PostMapping("/userpf")
    public String userPage(@ModelAttribute Staff staff, Model model) {
        staffService.saveOrUpdateStaff(staff);
        emailService.sendEmail(staff.getEmail(), staff.getUsername(), staff.getPassword());

        model.addAttribute("staff", staff);
        model.addAttribute("pageContent", "userpf.jsp");
        return "mainpage";
    }


    @PostMapping("/logintopfp")
    public String login(@ModelAttribute Staff staff, Model model) {
        Staff loginStaff = staffService.login(staff.getUsername(), staff.getPassword());
        if (loginStaff != null) {
            model.addAttribute("staff", loginStaff);
            model.addAttribute("pageContent", "userpf.jsp");
            return "mainpage";
        } else {
            return "redirect:/";
        }
    }

    // @GetMapping("/gotopfp")
    // public String getStaffDetails(@RequestParam("staffId") int staffId, Model model) {
    //     Staff staff = staffService.getStaffById(staffId);
    //     if (staff != null) {
    //         model.addAttribute("staff", staff);
    //     } else {
    //         model.addAttribute("error", "Staff not found");
    //     }
    //     return "staffDetails";  // This should be the name of your JSP file
    // }

}