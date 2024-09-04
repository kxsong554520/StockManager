package com.example.StockManager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    
    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail (String email, String username, String password){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("kxsong205gmail.com");
        message.setTo(email);
        message.setText("Your username and password for Stock Manager \nUsername: " + username + "\nPassword: " + password);
        message.setSubject("Account For Stock Management System");
        
        mailSender.send(message);
    }
    
}
