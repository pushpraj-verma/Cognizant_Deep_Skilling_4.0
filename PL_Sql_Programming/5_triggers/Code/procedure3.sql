CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance
    FROM Accounts
    WHERE AccountID = :NEW.AccountID;

    IF UPPER(:NEW.TransactionType) = 'WITHDRAWAL' AND :NEW.Amount > v_balance THEN
        RAISE_APPLICATION_ERROR(-20001, 'Withdrawal exceeds account balance.');
    END IF;

    IF UPPER(:NEW.TransactionType) = 'DEPOSIT' AND :NEW.Amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Deposit must be positive.');
    END IF;
END;
/
