package com.example.jpa.service;

import com.example.jpa.entity.Employee;
import com.example.jpa.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository repository;

    @Transactional
    public void addEmployee(Employee emp) {
        repository.save(emp);
    }
}
