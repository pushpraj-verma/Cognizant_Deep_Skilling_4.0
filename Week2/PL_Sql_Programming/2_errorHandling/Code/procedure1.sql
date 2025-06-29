
CREATE OR REPLACE PROCEDURE SafeTransferFunds(
    p_from_acct IN NUMBER,
    p_to_acct IN NUMBER,
    p_amount IN NUMBER
)
IS
    v_balance NUMBER;
    v_error_msg VARCHAR2(4000);
BEGIN
  
    SELECT Balance INTO v_balance
    FROM Accounts
    WHERE AccountID = p_from_acct;

    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds.');
    END IF;

    UPDATE Accounts
    SET Balance = Balance - p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_from_acct;

    UPDATE Accounts
    SET Balance = Balance + p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_to_acct;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_error_msg := 'SafeTransferFunds Error: ' || SQLERRM; 
        INSERT INTO error_log (errormessage, logtime)
        VALUES (v_error_msg, SYSDATE);
END;

