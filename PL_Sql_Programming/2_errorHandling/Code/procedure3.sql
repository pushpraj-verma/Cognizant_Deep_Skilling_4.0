
CREATE OR REPLACE PROCEDURE AddNewCustomer(
    p_customer_id IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER
)
IS
    v_error_msg VARCHAR2(4000);
BEGIN
    
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
    VALUES (p_customer_id, p_name, p_dob, p_balance, SYSDATE);

    COMMIT;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        v_error_msg := 'AddNewCustomer Error: Duplicate Customer ID.';
        INSERT INTO Error_Log(ErrorMessage, LogTime)
        VALUES (v_error_msg, SYSDATE);

    WHEN OTHERS THEN
        ROLLBACK;
        v_error_msg := 'AddNewCustomer Error: ' || SQLERRM;
        INSERT INTO Error_Log(ErrorMessage, LogTime)
        VALUES (v_error_msg, SYSDATE);
END;
