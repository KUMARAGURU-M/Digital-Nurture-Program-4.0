package com.example.jpa.entity;

import jakarta.persistence.*;

@Entity
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String department;

    // ✅ Getter and Setter for `id`
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    // ✅ Getter and Setter for `name`
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    // ✅ Getter and Setter for `department`
    public String getDepartment() {
        return department;
    }
    public void setDepartment(String department) {
        this.department = department;
    }
}
