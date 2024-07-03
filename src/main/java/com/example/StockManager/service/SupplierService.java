package com.example.StockManager.service;

import java.util.ArrayList; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.StockManager.model.Supplier;
import com.example.StockManager.repository.SupplierRepository;

@Service
public class SupplierService {

    @Autowired
    SupplierRepository suppRepo;

    //get all supplier record
    public List <Supplier> getAllSupplier(){
        List <Supplier> supplier = new ArrayList<Supplier>();
        suppRepo.findAll().forEach(supplier1 -> supplier.add(supplier1) );
        return supplier;
    }

    // Get supplier by ID
    public Supplier getSupplierById(int supplierId) {
        return suppRepo.findById(supplierId).orElse(null);
    }

    //Create a supplier record
    public void saveOrUpdateSupplier (Supplier supplier){
        suppRepo.save(supplier);
    }

    //delete a staff record
    public void deleteSupplier (int supplierId){
        suppRepo.deleteById(supplierId);
    }

    //edit a supplier record
    public void editSupplier (Supplier supplier, int supplierId){
        suppRepo.save(supplier);
    }

    public List<Supplier> getAllSupplierSortedByName() {
        return suppRepo.findAll(Sort.by(Sort.Direction.ASC, "supplierName"));
    }

    public long countSupplier(){
        return suppRepo.count();
    }

}
