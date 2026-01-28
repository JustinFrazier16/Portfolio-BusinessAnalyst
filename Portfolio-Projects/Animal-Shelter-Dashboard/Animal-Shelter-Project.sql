-- Setup
create schema if not exists CSCI_CourseProject;
use CSCI_CourseProject;
drop table intakes;
drop table outcomes;
drop table animalshelterfulldataset;
-- Table Creation
Create table Intakes (
	IntakeID		int Primary Key,
	AnimalID 		Char(7), 
    Name			Varchar(30),
    DateTime		DateTime,
    MonthYear		VarChar(15),	
    FoundLocation	Varchar(100),
    Street			Varchar(100),
    City			Varchar(30),
    State			Char(2),
    IntakeType		varchar(20),
    IntakeCondition	varchar(15),
    AnimalType		varchar(15),
    SexUponIntake	varchar(20),
    AgeUponIntake	varchar(15),
    Breed			Varchar(55),
    Color			varchar(30)
    );
    
Create table Outcomes (
	OutcomeID		int Primary Key,
	AnimalID 		varchar(7), 
    DateOfBirth		Date,
    Name			varchar(30),
    DateTime		DateTime,
    MonthYear		VarChar(15),	
    OutcomeType		varchar(20),
    OutcomeSubtype	varchar(20),
    AnimalType		varchar(15),
    SexUponOutcome	varchar(20),
    AgeUponOutcome	varchar(20),
    Breed			Varchar(55),
    Color			varchar(30)
    );
    
Create table AnimalShelterFullDataset (
	JoinID				int Primary Key,
    IntakeID			int,
	AnimalID 			varchar(7), 
    Name				Varchar(30),
    IntakeDateTime		DateTime,
    IntakeMonthYear		VarChar(15),	
    FoundLocation		Varchar(100),
    Street				Varchar(100),
    City				Varchar(30),
    State				Char(2),
    IntakeType			varchar(20),
    IntakeCondition		varchar(15),
    AnimalType			varchar(15),
    SexUponIntake		varchar(20),
    AgeUponIntake		varchar(15),
    Breed				Varchar(55),
    Color				varchar(30),
	OutcomeID			int,
    DateOfBirth			Date,
    OutcomeDateTime		DateTime,
    OutcomeMonthYear	VarChar(15),	
    OutcomeType			varchar(20),
    OutcomeSubtype		varchar(15),
    SexUponOutcome		varchar(20),
    AgeUponOutcome		varchar(15)
    );
    
SELECT * FROM outcomes;
SELECT * FROM intakes;
SELECT * FROM temp;


-- Full Data Join
With DuplicatesDefined AS (
WITH FullDataSet AS (
SELECT 	CASE WHEN o.DateTime > i.DateTime AND i.DateTime < o.DateTime THEN i.IntakeID END AS IntakeID, 
		i.AnimalID, i.Name, o.DateOfBirth, i.AnimalType, i.Breed, i.Color,
		i.DateTime as IntakeDateTime, i.MonthYear as IntakeMonthYear, i.FoundLocation, i.Street, i.City, i.State, i.IntakeType, i.IntakeCondition,i.SexUponIntake, i.AgeUponIntake,
        o.DateTime AS OutcomeDateTime, 
        o.MonthYear AS OutcomeMonthYear, o.OutcomeType, o.OutcomeSubtype, o.SexUponOutCome, o.AgeUponOutcome
	FROM intakes i
	JOIN outcomes o on i.AnimalID = o.AnimalID
    Order by IntakeDateTime, OutcomeDateTime
)
SELECT * 
	FROM FullDataSet
)
SELECT 	IntakeID, AnimalID, Name, IntakeDateTime, IntakeMonthYear, FoundLocation, City, Street, State, IntakeType, IntakeCondition, AnimalType, SexUponIntake, AgeUponIntake, 
		Breed, Color, DateOfBirth, OutcomeDateTime, OutcomeMonthYear, OutcomeType, OutcomeSubtype, SexUponOutcome, AgeUponOutcome
FROM DuplicatesDefined;


-- Full Dataset inserted into FullDataset table
INSERT IGNORE INTO AnimalShelterFullDataset (
	JoinID, IntakeID, AnimalID, Name, IntakeDateTime, IntakeMonthYear, FoundLocation, Street, City, State, IntakeType, IntakeCondition, AnimalType, SexUponIntake, 
    AgeUponIntake, Breed, Color, OutcomeID, DateOfBirth, OutcomeDateTime, OutcomeMonthYear, OutcomeType, OutcomeSubtype, SexUponOutcome, 
    AgeUponOutcome
	)
With DuplicatesDefined AS (
WITH FullDataSet AS (
SELECT 	CASE WHEN o.DateTime > i.DateTime AND i.DateTime < o.DateTime THEN i.IntakeID END AS JoinID, 
		i.IntakeID, o.OutcomeID, i.AnimalID, i.Name, o.DateOfBirth, i.AnimalType, i.Breed, i.Color, i.DateTime as IntakeDateTime, 
        i.MonthYear AS IntakeMonthYear, i.FoundLocation, i.Street, i.City, i.State, i.IntakeType, i.IntakeCondition,i.SexUponIntake, i.AgeUponIntake,
        o.DateTime AS OutcomeDateTime, o.MonthYear AS OutcomeMonthYear, o.OutcomeType, o.OutcomeSubtype, o.SexUponOutCome, o.AgeUponOutcome
	FROM intakes i
	JOIN outcomes o on i.AnimalID = o.AnimalID
    Order by IntakeDateTime, OutcomeDateTime
)
SELECT *, RANK () OVER (PARTITION BY IntakeID ORDER BY OutcomeDateTime) AS IntakeDuplicate
   FROM FullDataSet
	)
SELECT 	JoinID, IntakeID, AnimalID, Name, IntakeDateTime, IntakeMonthYear, FoundLocation, Street, City, State, IntakeType, IntakeCondition, AnimalType, SexUponIntake, 
		AgeUponIntake, Breed, Color, OutcomeID, DateOfBirth, OutcomeDateTime, OutcomeMonthYear, OutcomeType, OutcomeSubtype, SexUponOutcome, 
		AgeUponOutcome
   FROM DuplicatesDefined;


-- Analysis
select *
From AnimalShelterFullDataset
ORDER BY IntakeDateTime, AnimalID
;

select *
From AnimalShelterFullDataset
-- WHere JoinID != IntakeID
ORDER BY JoinID
;

Delete from AnimalShelterFullDataset 
WHERE AnimalID = "A792015";

select AnimalID, Name, IntakeDateTime, OutcomeDateTime
From AnimalShelterFullDataset
WHERE AnimalID = "A721033"
ORDER BY IntakeDateTime, AnimalID;

select count(animalID) counts, AnimalID
From AnimalShelterFullDataset
Group by animalID
ORDER BY counts desc;

-- Temp table alteration
Drop table AnimalShelterFullDataset;