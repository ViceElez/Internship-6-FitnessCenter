CREATE TABLE Centers(
	CenterId SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL UNIQUE,
	OpeningHours TIME NOT NULL,
	ClosingHours TIME NOT NULL
)
ALTER TABLE Centers
	ALTER COLUMN Name TYPE VARCHAR(100)


CREATE TABLE Countries(
	CountryId SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Population INT NOT NULL,
	AverageSalary DECIMAL(10,2) 
)

CREATE TABLE Trainer(
	TrainerId SERIAL PRIMARY KEY,
	CenterIdReference INT REFERENCES Centers(CenterId),
	CountryIdReference INT REFERENCES Countries(CountryId),
	Name VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	DateOfBirth TIMESTAMP NOT NULL,
	Gender VARCHAR(20) CHECK(Gender IN('Muško','Žensko','Nepoznato','Ostalo')),
	TypeOfTrainer VARCHAR(20) CHECK(TypeOfTrainer IN('Glavni trener','Pomoćni trener'))	
)

ALTER TABLE Trainer
	RENAME TO Trainers

CREATE TABLE Activities(
	ActivityId SERIAL PRIMARY KEY,
	FitnessCenterIdRefernece INT REFERENCES Centers(CenterId),
	TrainerIdReference INT REFERENCES Trainers(TrainerId),
	ActivityType VARCHAR(30) CHECK (ActivityType IN('Trening snage','Kardio','Yoga','Ples','Injury Rehabilitation')),
	Price DECIMAL(10,2) NOT NULL,
	CurrentNumberOfParticipants INT NOT NULL,
	MaxParticipants INT NOT NULL,
	ActivityDatetime TIMESTAMP NOT NULL
)
ALTER TABLE Activities
	RENAME COLUMN FitnessCenterIdRefernece TO CenterIdRefernece

ALTER TABLE Activities
	ADD CONSTRAINT CheckMaxBiggerThanCurrent CHECK(MaxParticipants>=CurrentNumberOfParticipants)

CREATE TABLE Participants(
	ParticipantId SERIAL PRIMARY KEY,
	ActivityIdReference INT REFERENCES Activities(ActivityId),
	Name VARCHAR(50) NOT NULL
)