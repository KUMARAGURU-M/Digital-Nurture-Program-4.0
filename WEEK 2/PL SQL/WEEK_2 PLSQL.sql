CREATE TABLE customers (
    customer_id   NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    age           NUMBER,
    balance       NUMBER(15,2),
    IsVIP         VARCHAR2(5)
);

CREATE TABLE customer_loans (
    loan_id       NUMBER PRIMARY KEY,
    customer_id   NUMBER REFERENCES customers(customer_id),
    interest_rate NUMBER(5,2),
    due_date      DATE
);

CREATE TABLE savings_accounts (
    account_id   NUMBER PRIMARY KEY,
    customer_id  NUMBER REFERENCES customers(customer_id),
    balance      NUMBER(15,2)
);

CREATE TABLE employees (
    employee_id    NUMBER PRIMARY KEY,
    employee_name  VARCHAR2(100),
    department_id  NUMBER,
    salary         NUMBER(15,2)
);

CREATE TABLE accounts (
    account_id  NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    balance     NUMBER(15,2)
);

-- Example Scripts for Sample Data Insertion
-- Customers
INSERT INTO customers (customer_id, customer_name, age, balance, IsVIP) VALUES (1, 'John Doe', 65, 15000.00, 'FALSE');
INSERT INTO customers (customer_id, customer_name, age, balance, IsVIP) VALUES (2, 'Jane Smith', 45, 8000.00, 'FALSE');
INSERT INTO customers (customer_id, customer_name, age, balance, IsVIP) VALUES (3, 'Alice Johnson', 70, 12000.00, 'FALSE');
INSERT INTO customers (customer_id, customer_name, age, balance, IsVIP) VALUES (4, 'Bob Brown', 30, 5000.00, 'FALSE');

-- Customer loans
INSERT INTO customer_loans (loan_id, customer_id, interest_rate, due_date) VALUES (101, 1, 7.5, SYSDATE + 10);
INSERT INTO customer_loans (loan_id, customer_id, interest_rate, due_date) VALUES (102, 2, 8.0, SYSDATE + 40);
INSERT INTO customer_loans (loan_id, customer_id, interest_rate, due_date) VALUES (103, 3, 6.5, SYSDATE + 20);
INSERT INTO customer_loans (loan_id, customer_id, interest_rate, due_date) VALUES (104, 4, 9.0, SYSDATE + 5);

-- Savings accounts
INSERT INTO savings_accounts (account_id, customer_id, balance) VALUES (201, 1, 20000.00);
INSERT INTO savings_accounts (account_id, customer_id, balance) VALUES (202, 2, 10000.00);
INSERT INTO savings_accounts (account_id, customer_id, balance) VALUES (203, 3, 5000.00);
INSERT INTO savings_accounts (account_id, customer_id, balance) VALUES (204, 4, 8000.00);

-- Employees
INSERT INTO employees (employee_id, employee_name, department_id, salary) VALUES (301, 'Emily Davis', 10, 50000.00);
INSERT INTO employees (employee_id, employee_name, department_id, salary) VALUES (302, 'Michael Scott', 10, 60000.00);
INSERT INTO employees (employee_id, employee_name, department_id, salary) VALUES (303, 'Jim Halpert', 20, 55000.00);
INSERT INTO employees (employee_id, employee_name, department_id, salary) VALUES (304, 'Pam Beesly', 20, 52000.00);

-- Accounts
INSERT INTO accounts (account_id, customer_id, balance) VALUES (401, 1, 10000.00);
INSERT INTO accounts (account_id, customer_id, balance) VALUES (402, 1, 5000.00);
INSERT INTO accounts (account_id, customer_id, balance) VALUES (403, 2, 7000.00);
INSERT INTO accounts (account_id, customer_id, balance) VALUES (404, 3, 9000.00);
INSERT INTO accounts (account_id, customer_id, balance) VALUES (405, 4, 2000.00);

COMMIT;

-- QUESTIONS AND SOLUTIONS

/*
Exercise 1: Control Structures

Scenario 1: The bank wants to apply a discount to loan interest rates for customers above 60 years old.
	Question: Write a PL/SQL block that loops through all customers, checks their age, and if they are above 60, apply a 1% discount to their current loan interest rates.
Scenario 2: A customer can be promoted to VIP status based on their balance.
	Question: Write a PL/SQL block that iterates through all customers and sets a flag IsVIP to TRUE for those with a balance over $10,000.
Scenario 3: The bank wants to send reminders to customers whose loans are due within the next 30 days.
	Question: Write a PL/SQL block that fetches all loans due in the next 30 days and prints a reminder message for each customer.
*/

-- SCENARIO 1
BEGIN
   FOR rec IN (
      SELECT customer_id, loan_id, interest_rate, age
      FROM customer_loans
      JOIN customers USING (customer_id)
   )
   LOOP
      IF rec.age > 60 THEN
         UPDATE customer_loans
         SET interest_rate = interest_rate - 1
         WHERE loan_id = rec.loan_id;

         DBMS_OUTPUT.PUT_LINE(
            'Applied 1% discount to loan ID ' || rec.loan_id ||
            ' for customer ID ' || rec.customer_id
         );
      END IF;
   END LOOP;

   COMMIT;
END;
/
SELECT * FROM customer_loans;


-- SCENARIO 2

BEGIN
   FOR rec IN (
      SELECT customer_id, balance
      FROM customers
   )
   LOOP
      IF rec.balance > 10000 THEN
         UPDATE customers
         SET IsVIP = 'TRUE'
         WHERE customer_id = rec.customer_id;

         DBMS_OUTPUT.PUT_LINE(
            'Customer ID ' || rec.customer_id || ' promoted to VIP.'
         );
      END IF;
   END LOOP;

   COMMIT;
END;
/


-- SCENARIO 3

BEGIN
   FOR rec IN (
      SELECT loan_id, customer_id, due_date
      FROM customer_loans
      WHERE due_date BETWEEN SYSDATE AND SYSDATE + 30
   )
   LOOP
      DBMS_OUTPUT.PUT_LINE(
         'Reminder: Loan ID ' || rec.loan_id ||
         ' for Customer ID ' || rec.customer_id ||
         ' is due on ' || TO_CHAR(rec.due_date, 'DD-MON-YYYY')
      );
   END LOOP;
END;
/


/*

Exercise 3: Stored Procedures

Scenario 1: The bank needs to process monthly interest for all savings accounts.
	Question: Write a stored procedure ProcessMonthlyInterest that calculates and updates the balance of all savings accounts by applying an interest rate of 1% to the current balance.

Scenario 2: The bank wants to implement a bonus scheme for employees based on their performance.
	Question: Write a stored procedure UpdateEmployeeBonus that updates the salary of employees in a given department by adding a bonus percentage passed as a parameter.

Scenario 3: Customers should be able to transfer funds between their accounts.
	Question: Write a stored procedure TransferFunds that transfers a specified amount from one account to another, checking that the source account has sufficient balance before making the transfer.


*/


-- SCENARIO 1
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
   UPDATE savings_accounts
   SET balance = balance + (balance * 0.01);

   DBMS_OUTPUT.PUT_LINE('Monthly interest applied to all savings accounts.');

   COMMIT;
END;
/
BEGIN
   ProcessMonthlyInterest;
END;
/






-- SCENARIO 2
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
   p_department_id IN NUMBER,
   p_bonus_percent IN NUMBER
) AS
BEGIN
   UPDATE employees
   SET salary = salary + (salary * p_bonus_percent / 100)
   WHERE department_id = p_department_id;

   DBMS_OUTPUT.PUT_LINE(
      'Bonus of ' || p_bonus_percent || '% applied to Department ID ' || p_department_id
   );

   COMMIT;
END;
/
BEGIN
   UpdateEmployeeBonus(10, 5);
END;
/


-- SCENARIO 3
CREATE OR REPLACE PROCEDURE TransferFunds (
   p_source_account_id IN NUMBER,
   p_dest_account_id   IN NUMBER,
   p_amount            IN NUMBER
) AS
   v_balance NUMBER;
BEGIN
   SELECT balance INTO v_balance
   FROM accounts
   WHERE account_id = p_source_account_id
   FOR UPDATE;

   IF v_balance < p_amount THEN
      RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in source account.');
   END IF;

   UPDATE accounts
   SET balance = balance - p_amount
   WHERE account_id = p_source_account_id;

   UPDATE accounts
   SET balance = balance + p_amount
   WHERE account_id = p_dest_account_id;

   DBMS_OUTPUT.PUT_LINE(
      'Transferred ' || p_amount ||
      ' from Account ID ' || p_source_account_id ||
      ' to Account ID ' || p_dest_account_id
   );

   COMMIT;
END;
/
BEGIN
   TransferFunds(401, 402, 2000);
END;
/