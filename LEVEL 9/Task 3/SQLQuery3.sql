CREATE DATABASE banking_system;
GO
USE banking_system;
GO
CREATE TABLE Branch (
    Branch_ID INT PRIMARY KEY IDENTITY(1,1),
    Branch_Name VARCHAR(100) NOT NULL,
    Branch_Location VARCHAR(100),
    Contact_Number VARCHAR(15)
);
CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Position VARCHAR(50),
    Branch_ID INT NOT NULL,
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(200),
    Date_of_Birth DATE
);
CREATE TABLE Account (
    Account_ID INT PRIMARY KEY IDENTITY(1,1),
    Account_Type VARCHAR(50),
    Balance DECIMAL(15,2) CHECK (Balance >= 0),
    Customer_ID INT NOT NULL,
    Branch_ID INT NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);
CREATE TABLE Loan (
    Loan_ID INT PRIMARY KEY IDENTITY(1,1),
    Loan_Type VARCHAR(50),
    Amount DECIMAL(15,2) CHECK (Amount > 0),
    Interest_Rate DECIMAL(5,2),
    Customer_ID INT NOT NULL,
    Branch_ID INT NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);
CREATE TABLE Transaction (
    Transaction_ID INT PRIMARY KEY IDENTITY(1,1),
    Account_ID INT NOT NULL,
    Transaction_Type VARCHAR(50),
    Amount DECIMAL(15,2) CHECK (Amount > 0),
    Transaction_Date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);
