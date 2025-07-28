CREATE DATABASE hospital_db;
GO
USE hospital_db;
GO
CREATE TABLE Room (
    Room_ID INT PRIMARY KEY IDENTITY(1,1),
    Room_Type VARCHAR(50),
    Capacity INT CHECK (Capacity > 0),
    Charges_Per_Day DECIMAL(10,2)
);
CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);
CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(200),
    Room_ID INT,
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);
CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY IDENTITY(1,1),
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Appointment_Date DATETIME DEFAULT GETDATE(),
    Diagnosis VARCHAR(255),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);
CREATE TABLE Cashier (
    Cashier_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);
CREATE TABLE Bill (
    Bill_ID INT PRIMARY KEY IDENTITY(1,1),
    Appointment_ID INT UNIQUE,
    Room_ID INT,
    Cashier_ID INT,
    Total_Amount DECIMAL(10,2),
    Billing_Date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
    FOREIGN KEY (Cashier_ID) REFERENCES Cashier(Cashier_ID)
);
CREATE TABLE Admin (
    Admin_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Role VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Admin_ID INT,
    FOREIGN KEY (Admin_ID) REFERENCES Admin(Admin_ID)
);
