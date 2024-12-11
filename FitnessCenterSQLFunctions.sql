SELECT t.Name AS TrainerName,
	   t.LastName AS TrainerLastName,
	   t.Gender AS TrainerGender,
	   c.Name AS CountryName,
	   c.AverageSalary	FROM Trainers t
JOIN Countries c ON c.CountryId=t.CountryIdReference    --PRVI UPIT


SELECT ac.ActivityType AS ActivityType,
	   ac.ActivityDateTime AS ActivityDateTime,
	   t.Name AS TrainerName,
	   t.LastName AS TrainerLastName
	   FROM Activities ac 
JOIN Trainers t ON t.TrainerId=ac.TrainerIdReference
WHERE t.TypeOfTrainer='Glavni trener'
GROUP BY ac.ActivityId, ac.ActivityType, ac.ActivityDatetime, t.Name, t.LastName      --DRUGI UPIT


SELECT c.Name AS CenterName,
	    COUNT(ac.ActivityId) AS ActivityCount  FROM Centers c
JOIN Activities ac ON c.CenterId=ac.CenterIdRefernece
GROUP BY c.Name
ORDER BY ActivityCount DESC
LIMIT 3											--TRECI UPIT


SELECT t.Name AS TrainerName,
	   COUNT(ac.ActivityId) AS ActivityCount,
	   CASE 
	   	WHEN COUNT(ac.ActivityId) = 0 THEN 'DOSTUPAN'
	   	WHEN COUNT(ac.ActivityId) <= 3 THEN 'AKTIVAN'
       	ELSE 'POTPUNO ZAUZET' END  AS Status
FROM Trainers t
LEFT JOIN Activities ac ON t.TrainerId=ac.TrainerIdReference
GROUP BY t.TrainerId, t.Name
ORDER BY ActivityCount DESC					--CETVRTI UPIT


SELECT p.Name AS ParticipantName,
	   ac.ActivityDateTime as ActivityDateTime FROM Participants p
JOIN Activities ac ON ac.ActivityId=p.ActivityIdReference
WHERE ac.ActivityDateTime>NOW()			--PETI UPIT


SELECT DISTINCT t.Name AS TrainerName,
	   t.LastName AS TrainerLastName FROM Trainers t
JOIN Activities ac ON t.TrainerId=ac.TrainerIdReference
WHERE ActivityDateTime BETWEEN '2019-01-01' AND '2022-12-31'     --SESTI UPIT


SELECT ac.ActivityType,
       c.Name AS CountryName,
       CAST(AVG(ac.CurrentNumberOfParticipants) AS DECIMAL(10,2)) AS AvgParticipants FROM Activities ac
JOIN Trainers t ON ac.TrainerIdReference = t.TrainerId
JOIN Countries c ON t.CountryIdReference = c.CountryId
GROUP BY ac.ActivityType, c.Name						--SEDMI UPIT


SELECT c.Name AS CountryName,
	   SUM(ac.CurrentNumberOfParticipants) AS TotalParticipants FROM Activities ac
JOIN Trainers t ON t.TrainerId=ac.TrainerIdReference
JOIN Countries c ON c.CountryId=t.CountryIdReference
WHERE ActivityType='Injury Rehabilitation'
GROUP BY c.Name
ORDER BY TotalParticipants DESC
LIMIT 10											--OSMI UPIT


SELECT ac.ActivityType AS ActivityType, 
	   CASE 
	   	  WHEN MaxParticipants=CurrentNumberOfParticipants THEN 'POPUNJENO'
		  ELSE  'IMA MJESTA' END AS Status
FROM Activities ac
ORDER BY Status DESC						--DEVETI UPIT


SELECT t.Name AS TrainerName,
	   t.LastName AS TrainerLastName,
	   SUM(ac.Price * ac.CurrentNumberOfParticipants) AS TotalEarnings FROM Trainers t
JOIN Activities ac ON t.Trainerid=ac.TrainerIdReference
GROUP BY t.TrainerId, t.Name
ORDER BY TotalEarnings DESC
LIMIT 10								    --DESETI UPIT







	



 


	   






