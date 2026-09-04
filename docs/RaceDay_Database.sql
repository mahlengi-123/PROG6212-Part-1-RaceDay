-- ============================================================
-- RaceDay Management System
--SQL Database Script
-- ============================================================

-- Create the database if it does not already exist
IF DB_ID('RaceDayDB') IS NULL
BEGIN
    CREATE DATABASE RaceDayDB;
END;
GO

USE RaceDayDB;
GO



-- Tables are removed in this order because of foreign keys
-- ============================================================

DROP TABLE IF EXISTS Result;
DROP TABLE IF EXISTS Enrolment;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Participant;
DROP TABLE IF EXISTS Organiser;
GO




CREATE TABLE Organiser (
    Organiser_ID INT IDENTITY(1,1) PRIMARY KEY,
    Organiser_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Phone_Number VARCHAR(20),
    Password_Hash VARCHAR(255) NOT NULL
);
GO



CREATE TABLE Participant (
    Participant_ID INT IDENTITY(1,1) PRIMARY KEY,
    First_Name VARCHAR(100) NOT NULL,
    Last_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Phone_Number VARCHAR(20),
    Date_Of_Birth DATE,
    Password_Hash VARCHAR(255) NOT NULL
);
GO



CREATE TABLE Event (
    Event_ID INT IDENTITY(1,1) PRIMARY KEY,
    Organiser_ID INT NOT NULL,
    Event_Name VARCHAR(150) NOT NULL,
    Event_Date DATE NOT NULL,
    Location VARCHAR(200) NOT NULL,
    Event_Type VARCHAR(50) NOT NULL,
    Status VARCHAR(30) NOT NULL DEFAULT 'Upcoming',

    CONSTRAINT FK_Event_Organiser
        FOREIGN KEY (Organiser_ID)
        REFERENCES Organiser(Organiser_ID)
);
GO



CREATE TABLE Category (
    Category_ID INT IDENTITY(1,1) PRIMARY KEY,
    Event_ID INT NOT NULL,
    Category_Name VARCHAR(100) NOT NULL,
    Distance_KM DECIMAL(6,2) NOT NULL,
    Entry_Fee DECIMAL(10,2) NOT NULL DEFAULT 0,
    Maximum_Participants INT NOT NULL,

    CONSTRAINT FK_Category_Event
        FOREIGN KEY (Event_ID)
        REFERENCES Event(Event_ID)
);
GO


-- ============================================================
-- 5. ENROLMENT TABLE
-- Links participants to event categories
-- ============================================================

CREATE TABLE Enrolment (
    Enrolment_ID INT IDENTITY(1,1) PRIMARY KEY,
    Participant_ID INT NOT NULL,
    Category_ID INT NOT NULL,
    Enrolment_Date DATE NOT NULL DEFAULT GETDATE(),
    Race_Number VARCHAR(20) UNIQUE,
    Status VARCHAR(30) NOT NULL DEFAULT 'Registered',

    CONSTRAINT FK_Enrolment_Participant
        FOREIGN KEY (Participant_ID)
        REFERENCES Participant(Participant_ID),

    CONSTRAINT FK_Enrolment_Category
        FOREIGN KEY (Category_ID)
        REFERENCES Category(Category_ID),

    CONSTRAINT UQ_Participant_Category
        UNIQUE (Participant_ID, Category_ID)
);
GO



CREATE TABLE Result (
    Result_ID INT IDENTITY(1,1) PRIMARY KEY,
    Enrolment_ID INT NOT NULL UNIQUE,
    Finish_Time TIME,
    Overall_Position INT,
    Category_Position INT,
    Result_Status VARCHAR(30) NOT NULL DEFAULT 'Completed',

    CONSTRAINT FK_Result_Enrolment
        FOREIGN KEY (Enrolment_ID)
        REFERENCES Enrolment(Enrolment_ID)
);
GO


-- ============================================================
-- SAMPLE DATA
-- ============================================================




INSERT INTO Organiser
    (Organiser_Name, Email, Phone_Number, Password_Hash)
VALUES
    ('Thabo Mkhize', 'thabo@raceday.co.za', '0712345678', 'hash_thabo'),
    ('Naledi Dlamini', 'naledi@raceday.co.za', '0723456789', 'hash_naledi');
GO



INSERT INTO Participant
    (First_Name, Last_Name, Email, Phone_Number, Date_Of_Birth, Password_Hash)
VALUES
    ('Sipho', 'Nkosi', 'sipho@gmail.com', '0734567890', '2002-05-14', 'hash_sipho'),
    ('Lerato', 'Molefe', 'lerato@gmail.com', '0745678901', '2001-09-22', 'hash_lerato');
GO




INSERT INTO Event
    (Organiser_ID, Event_Name, Event_Date, Location, Event_Type, Status)
VALUES
    (1, 'Durban Beach Run', '2026-10-10', 'Durban', 'Running', 'Upcoming'),
    (1, 'Umhlanga Charity Walk', '2026-11-15', 'Umhlanga', 'Walking', 'Upcoming'),
    (2, 'Cape Town Cycle Challenge', '2026-12-05', 'Cape Town', 'Cycling', 'Upcoming');
GO


-- ------------------------------------------------------------
-- Add categories for every event
-- ------------------------------------------------------------

INSERT INTO Category
    (Event_ID, Category_Name, Distance_KM, Entry_Fee, Maximum_Participants)
VALUES
    (1, '5km Run', 5.00, 100.00, 300),
    (1, '10km Run', 10.00, 150.00, 200),

    (2, '5km Walk', 5.00, 80.00, 250),
    (2, '10km Walk', 10.00, 120.00, 150),

    (3, '20km Cycle', 20.00, 200.00, 200),
    (3, '50km Cycle', 50.00, 350.00, 100);
GO


-- ------------------------------------------------------------
-- Add sample enrolments
-- ------------------------------------------------------------

INSERT INTO Enrolment
    (Participant_ID, Category_ID, Enrolment_Date, Race_Number, Status)
VALUES
    (1, 1, '2026-09-04', 'DBR001', 'Registered'),
    (2, 2, '2026-09-04', 'DBR002', 'Registered'),
    (1, 3, '2026-09-04', 'UCW001', 'Registered'),
    (2, 5, '2026-09-04', 'CTC001', 'Registered');
GO


-- ------------------------------------------------------------
-- Add sample results
-- ------------------------------------------------------------

INSERT INTO Result
    (Enrolment_ID, Finish_Time, Overall_Position, Category_Position, Result_Status)
VALUES
    (1, '00:28:45', 15, 6, 'Completed'),
    (2, '00:55:30', 20, 8, 'Completed');
GO


-- ============================================================
-- These queries show that the sample records were created
-- ============================================================

SELECT * FROM Organiser;
SELECT * FROM Participant;
SELECT * FROM Event;
SELECT * FROM Category;
SELECT * FROM Enrolment;
SELECT * FROM Result;
GO


-- ============================================================
-- Display the number of records in each table
-- ============================================================

SELECT COUNT(*) AS Organisers FROM Organiser;
SELECT COUNT(*) AS Participants FROM Participant;
SELECT COUNT(*) AS Events FROM Event;
SELECT COUNT(*) AS Categories FROM Category;
SELECT COUNT(*) AS Enrolments FROM Enrolment;
SELECT COUNT(*) AS Results FROM Result;
GO