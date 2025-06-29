CREATE OR REPLACE FUNCTION CalculateAge(p_customer_id IN NUMBER)
RETURN NUMBER
IS
    v_dob DATE;
    v_age NUMBER;
BEGIN
    SELECT DOB INTO v_dob FROM Customers WHERE CustomerID = p_customer_id;
    v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);
    RETURN v_age;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/
