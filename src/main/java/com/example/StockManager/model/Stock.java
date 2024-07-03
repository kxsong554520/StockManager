package com.example.StockManager.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import java.time.LocalDate;

import jakarta.persistence.Column;

@Entity
@Table (name = "stock")
public class Stock {
    @Id 
    @Column (length=100)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int stockId;

    @Column(length=100)
    private String stockName;

    @Column(length=100)
    private String stockLocation;

    @ManyToOne
    @JoinColumn(name = "supplierId", referencedColumnName = "supplierId" )
    private Supplier supplier;

    private LocalDate expiryDate;

    @Column (length = 100)
    private int quantity;

    @Column (length = 100)
    private double costPerUnit;

    @Column (length=100)
    private double sellPricePerUnit;

    @ManyToOne
    @JoinColumn(name = "staffId", referencedColumnName = "staffId" )
    private Staff staff;

    public int getStockId() {
        return stockId;
    }

    public void setStockId(int stockId) {
        this.stockId = stockId;
    }

    public String getStockName() {
        return stockName;
    }

    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    public String getStockLocation() {
        return stockLocation;
    }

    public void setStockLocation(String stockLocation) {
        this.stockLocation = stockLocation;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public LocalDate getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(LocalDate expiryDate) {
        this.expiryDate = expiryDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getCostPerUnit() {
        return costPerUnit;
    }

    public void setCostPerUnit(double costPerUnit) {
        this.costPerUnit = costPerUnit;
    }

    public double getSellPricePerUnit(){
        return sellPricePerUnit;
    }

    public void setSellPricePerUnit(double sellPricePerUnit) {
        this.sellPricePerUnit = sellPricePerUnit;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    
}
