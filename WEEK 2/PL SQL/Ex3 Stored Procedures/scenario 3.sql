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