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
