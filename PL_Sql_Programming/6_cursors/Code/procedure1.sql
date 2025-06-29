DECLARE
    CURSOR txn_cursor IS
        SELECT c.CustomerID, c.Name, t.TransactionDate, t.Amount, t.TransactionType
        FROM Customers c
        JOIN Accounts a ON c.CustomerID = a.CustomerID
        JOIN Transactions t ON a.AccountID = t.AccountID
        WHERE EXTRACT(MONTH FROM t.TransactionDate) = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM t.TransactionDate) = EXTRACT(YEAR FROM SYSDATE)
        ORDER BY c.CustomerID, t.TransactionDate;

    prev_customer_id NUMBER := NULL;
BEGIN
    FOR rec IN txn_cursor LOOP
        IF prev_customer_id IS NULL OR prev_customer_id != rec.CustomerID THEN
            DBMS_OUTPUT.PUT_LINE('---- Statement for Customer ID: ' || rec.CustomerID || ', Name: ' || rec.Name || ' ----');
        END IF;

        DBMS_OUTPUT.PUT_LINE(rec.TransactionDate || ' | ' || rec.TransactionType || ' | Rs.' || rec.Amount);

        prev_customer_id := rec.CustomerID;
    END LOOP;
END;
/
