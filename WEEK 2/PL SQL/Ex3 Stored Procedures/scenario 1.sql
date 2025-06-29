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
