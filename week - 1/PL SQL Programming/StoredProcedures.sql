-- Scenario - 1

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    AccountType VARCHAR2(20),
    Balance NUMBER(10,2)
);

INSERT INTO Accounts VALUES (101,'Ramu','Savings',12000);
INSERT INTO Accounts VALUES (102,'Suresh','Savings',25000);
INSERT INTO Accounts VALUES (103,'Prateek','Current',15000);
COMMIT;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE Accounts SET Balance = Balance + (Balance * 0.01) WHERE AccountType = 'Savings';
    COMMIT;
END;
/

EXEC ProcessMonthlyInterest;

SELECT * FROM Accounts;


-- Scenario - 2

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    Department VARCHAR2(30),
    Salary NUMBER(10,2)
);

INSERT INTO Employees VALUES (1,'Raju','IT',55000);
INSERT INTO Employees VALUES (2,'Kranthi','IT',60000);
INSERT INTO Employees VALUES (3,'Anju','HR',75000);
COMMIT;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
)
IS
BEGIN
    UPDATE Employees SET Salary = Salary + (Salary * p_bonus_percent/100) WHERE Department = p_department;
    COMMIT;
END;
/

EXEC UpdateEmployeeBonus('IT',10);

SELECT * FROM Employees;


-- Scenario - 3

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
)
IS
    v_balance NUMBER;
BEGIN

    SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = p_from_account;
    IF v_balance >= p_amount THEN

        UPDATE Accounts SET Balance = Balance - p_amount WHERE AccountID = p_from_account;
        UPDATE Accounts SET Balance = Balance + p_amount WHERE AccountID = p_to_account;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
    END IF;

END;
/

EXEC TransferFunds(101,102,2000);

SELECT * FROM Accounts;