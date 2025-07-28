CREATE DATABASE bankingsystem;
GO
USE bankingsystem;
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
    Branch_ID INT,
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
    Branch_ID INT,
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);
CREATE TABLE Account_Customer (
    Account_ID INT,
    Customer_ID INT,
    PRIMARY KEY (Account_ID, Customer_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE Loan (
    Loan_ID INT PRIMARY KEY IDENTITY(1,1),
    Loan_Type VARCHAR(50),
    Amount DECIMAL(15,2) CHECK (Amount > 0),
    Interest_Rate DECIMAL(5,2),
    Branch_ID INT,
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);
CREATE TABLE Loan_Customer (
    Loan_ID INT,
    Customer_ID INT,
    PRIMARY KEY (Loan_ID, Customer_ID),
    FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

  

