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
        message.setText("Hi, " + username + "\nYour Stock Management System account had been setup!!\nYour password is " + password);
        message.setSubject("Account For Employee Management System");
        
        mailSender.send(message);
    }
    
}
