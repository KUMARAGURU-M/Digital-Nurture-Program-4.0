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
