package com.example.StockManager.service;

import java.util.ArrayList; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.StockManager.model.Staff;
import com.example.StockManager.repository.StaffRepository;

@Service
public class StaffService {
    
    @Autowired
    StaffRepository staffRepo;

    //get all staff record
    public List <Staff> getAllStaff(){
        List<Staff> staff = new ArrayList<Staff>();
        staffRepo.findAll().forEach(staff1 -> staff.add(staff1));
        return staff;
    }

    // Get staff by ID
    public Staff getStaffById(int staffId) {
        return staffRepo.findById(staffId).orElse(null);
    }

    //save a staff record
    public void saveOrUpdateStaff (Staff staff){
        staffRepo.save(staff);
    }

    //delete a staff record
    public void deleteStaff (int staffId){
        staffRepo.deleteById(staffId);
    }

    //edit staff record
    public void updateStaff (Staff staff, int staffId) {
        staffRepo.save(staff);
    }

    //for retrieving username and password to validate user for login
    public Staff login(String username, String password){
        return staffRepo.findByUsernameAndPassword(username, password).orElse(null);
    }

    public long countAllStaff() {
        return staffRepo.count();
    }

    public List<Staff> getAllStaffSortedByName() {
        return staffRepo.findAll(Sort.by(Sort.Direction.ASC, "name"));
    }

}
