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
