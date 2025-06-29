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

