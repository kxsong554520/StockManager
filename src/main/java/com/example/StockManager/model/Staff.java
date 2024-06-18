package com.example.StockManager.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "staff")
public class Staff {
    @Id 
    @Column (name = "staff_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int staffId;

    @Column(length=100)
    private String username;

    @Column(length=100)
    private String password;

    @Column(length=100)
    private String email;

    @Column(length=100)
    private String role;

    @Column(length=100)
    private String phoneNum;
}
