-- 1. DATABASE CREATION --

CREATE DATABASE VolleyballRegistrationDB;
GO

USE VolleyballRegistrationDB;
GO


-- 2. TABLE CREATION --


-- ATHLETE TABLE
CREATE TABLE Athlete (
    AthleteID INT PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Grade INT NOT NULL,
    Phone VARCHAR(15),
    Cell VARCHAR(15),
    Email VARCHAR(50),
    Address VARCHAR(60),
    PostalCode VARCHAR(10),
    TshirtSize VARCHAR(5)
);

-- PARENT / GUARDIAN TABLE
CREATE TABLE Parent_Guardian (
    ParentID INT PRIMARY KEY,
    ParentName VARCHAR(40) NOT NULL,
    ParentCell VARCHAR(15),
    ParentEmail VARCHAR(50)
);

-- PROGRAM OPTION TABLE
CREATE TABLE Program_Option (
    ProgramID INT PRIMARY KEY,
    ProgramName VARCHAR(40) NOT NULL,
    Fee DECIMAL(7,2) NOT NULL,
    Season VARCHAR(9) NOT NULL
);

-- TRAINING DAY TABLE
CREATE TABLE Training_Day (
    DayID INT PRIMARY KEY,
    DayName VARCHAR(15) NOT NULL
);

-- REGISTRATION TABLE
CREATE TABLE Registration (
    RegistrationID INT PRIMARY KEY,
    AthleteID INT NOT NULL,
    ParentID INT NOT NULL,
    ProgramID INT NOT NULL,
    RegistrationDate DATE NOT NULL,
    SignatureName VARCHAR(50) NOT NULL
);

-- REGISTRATION TRAINING DAY TABLE
CREATE TABLE Registration_Training_Day (
    RegTrainingDayID INT PRIMARY KEY,
    RegistrationID INT NOT NULL,
    DayID INT NOT NULL,
    PreferenceOrder INT NOT NULL
);

-- VOLLEYBALL EXPERIENCE TABLE
CREATE TABLE Volleyball_Experience (
    ExperienceID INT PRIMARY KEY,
    AthleteID INT NOT NULL,
    SchoolName VARCHAR(50),
    SchoolPosition VARCHAR(30),
    SchoolCoach VARCHAR(50),
    ClubName VARCHAR(50),
    ClubPosition VARCHAR(30),
    ClubCoach VARCHAR(50),
    OtherTeams VARCHAR(100)
);


-- 3 & 4. FOREIGN KEYS WITH CASCADE RULES --


-- Registration → Athlete
ALTER TABLE Registration
ADD CONSTRAINT FK_Registration_Athlete
FOREIGN KEY (AthleteID)
    REFERENCES Athlete(AthleteID)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Registration → Parent_Guardian
ALTER TABLE Registration
ADD CONSTRAINT FK_Registration_Parent
FOREIGN KEY (ParentID)
    REFERENCES Parent_Guardian(ParentID)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Registration → Program_Option
ALTER TABLE Registration
ADD CONSTRAINT FK_Registration_Program
FOREIGN KEY (ProgramID)
    REFERENCES Program_Option(ProgramID)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Registration_Training_Day → Registration
ALTER TABLE Registration_Training_Day
ADD CONSTRAINT FK_RegTrainingDay_Registration
FOREIGN KEY (RegistrationID)
    REFERENCES Registration(RegistrationID)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Registration_Training_Day → Training_Day
ALTER TABLE Registration_Training_Day
ADD CONSTRAINT FK_RegTrainingDay_TrainingDay
FOREIGN KEY (DayID)
    REFERENCES Training_Day(DayID)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Volleyball_Experience → Athlete
ALTER TABLE Volleyball_Experience
ADD CONSTRAINT FK_VolleyballExperience_Athlete
FOREIGN KEY (AthleteID)
    REFERENCES Athlete(AthleteID)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- END OF SCRIPT --


