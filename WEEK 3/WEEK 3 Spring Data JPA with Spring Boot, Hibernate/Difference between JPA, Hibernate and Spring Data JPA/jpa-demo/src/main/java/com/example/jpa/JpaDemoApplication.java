package com.example.jpa;

import com.example.jpa.entity.Employee;
import com.example.jpa.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class JpaDemoApplication implements CommandLineRunner {

    @Autowired
    private EmployeeService service;

    public static void main(String[] args) {
        SpringApplication.run(JpaDemoApplication.class, args);
    }

    @Override
    public void run(String... args) {
        Employee e = new Employee();
        e.setName("John Doe");
        e.setDepartment("Engineering");
        service.addEmployee(e);
    }
}
