DECLARE
    CURSOR acc_cursor IS
        SELECT AccountID, Balance FROM Accounts;

    fee CONSTANT NUMBER := 100;
BEGIN
    FOR acc IN acc_cursor LOOP
        IF acc.Balance >= fee THEN
            UPDATE Accounts
            SET Balance = Balance - fee,
                LastModified = SYSDATE
            WHERE AccountID = acc.AccountID;

            DBMS_OUTPUT.PUT_LINE('Rs. 100 annual fee applied to Account ID: ' || acc.AccountID);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Insufficient balance in Account ID: ' || acc.AccountID || ' - fee not applied.');
        END IF;
    END LOOP;

    COMMIT;
END;
/
