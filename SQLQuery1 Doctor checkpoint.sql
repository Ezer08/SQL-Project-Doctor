---- Doctor Table
CREATE TABLE Doctor (
  ID INT PRIMARY KEY IDENTITY,
  Name VARCHAR(50) NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  SpecialtyID VARCHAR(50),
  Address VARCHAR(255)
);

-- Patient Table
CREATE TABLE Patient (
  ID INT PRIMARY KEY IDENTITY,
  Name VARCHAR(50) NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  DateOfBirth DATE NOT NULL,
  Address VARCHAR(255)
);

-- Consultation Table
CREATE TABLE Consultation (
  ID INT PRIMARY KEY IDENTITY,
  PatientID INT FOREIGN KEY REFERENCES Patient(ID),
  DoctorID INT FOREIGN KEY REFERENCES Doctor(ID),
  Date DATE NOT NULL,
  Description TEXT,
  Duration INT,  -- Duration of the consultation in minutes (integer)
  Pricing DECIMAL(10,2)  -- Consultation pricing (decimal with 10 total digits, 2 decimal places)
);

-- Prescription table
CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY,
    consultation_id INT,
    prescription_date DATE,
    CONSTRAINT fk_consultation FOREIGN KEY (consultation_id) REFERENCES Consultation(ID)
);

-- Medicament table
CREATE TABLE Medicament (
    medicament_id INT PRIMARY KEY,
    medicament_name VARCHAR(100),
    medicament_description TEXT,
    CONSTRAINT uc_medicament_name UNIQUE (medicament_name)
);


-- Prescription table
CREATE TABLE Prescription_Medicament (
    prescription_id INT,
    medicament_id INT,
    dosage VARCHAR(50),
    PRIMARY KEY (prescription_id, medicament_id),
    FOREIGN KEY (prescription_id) REFERENCES Prescription(prescription_id),
    FOREIGN KEY (medicament_id) REFERENCES Medicament(medicament_id)
);



-- 2 DATA MANIPULATION
-- Insert data into Doctor table
INSERT INTO Doctor (Name, FirstName, SpecialtyID, Address)
VALUES ('Smith', 'John', 'SP001', '123 Main St'),
       ('Doe', 'Jane', 'SP002', '456 Elm St');

-- Insert data into Patient table
INSERT INTO Patient (Name, FirstName, DateOfBirth, Address)
VALUES ('Johnson', 'Michael', '1990-05-15', '789 Oak St'),
       ('Williams', 'Emily', '1985-09-20', '101 Pine St');

-- Insert data into Consultation table
INSERT INTO Consultation (PatientID, DoctorID, Date, Description, Duration, Pricing)
VALUES (1, 1, '2024-05-27', 'General checkup', 30, 50.00),
       (2, 2, '2024-05-28', 'Follow-up appointment', 20, 40.00);

-- Insert data into Medicament table
INSERT INTO Medicament (medicament_id,medicament_name, medicament_description)
VALUES (1,'Paracetamol', 'Pain reliever and fever reducer'),
       (2,'Amoxicillin', 'Antibiotic used to treat bacterial infections');



-- Insert data into Prescription table
INSERT INTO Prescription (prescription_id, consultation_id, prescription_date)
VALUES (1, 1, '2024-05-27'),
       (2, 2, '2024-05-28');

-- Insert data into Prescription_Medicament table
INSERT INTO Prescription_Medicament (prescription_id, medicament_id, dosage)
VALUES (1, 1, '500mg, 1 tablet every 4-6 hours as needed'),
       (2, 2, '250mg, 1 capsule three times a day for 7 days');

select * from  consultation

select * from  Doctor
select * from Medicament
select * from Patient
select * from Prescription
select * from Prescription_Medicament

--1. Retrieve all information about doctors.

select * from Doctor
-- 2. Get the names and addresses of patients.
select name , FirstName , address from Patient ;
--3. Find the consultations that occurred on '2024-05-27'.
select * from Consultation
where Date='2024-05-27';
-- 4. List all consultations with their associated patient names and doctor names.
select * from  consultation
select * from Patient
select * from  Doctor

SELECT Consultation.ID AS 'consultation id' ,Patient.Name as 'patient name' ,   Doctor.Name as 'doctor name'
FROM Consultation
INNER JOIN Patient ON Consultation.patientID = Patient.ID
INNER JOIN Doctor ON Consultation.doctorId = Doctor.ID;

--5. Find the total pricing of all consultations.

SELECT SUM(pricing) as 'the total pricing of all consultations' from Consultation  ;

--6. Display the duration of each consultation in hours.

SELECT ID AS 'consultation id',
       CAST(duration AS DECIMAL) / 60 AS 'consultation duration in hours'
FROM consultation;

-- 7. List the medications prescribed in each prescription.

select * from Prescription_Medicament
select * from Medicament

select Prescription_Medicament.prescription_id,  Medicament.medicament_name  
from Prescription_Medicament
inner join Medicament on Medicament.medicament_id= Prescription_Medicament.medicament_id
--8. Get the total number of prescriptions.
select COUNT(*) as 'the total number of prescriptions' from Prescription

--9 Find the medications with their descriptions.
select medicament_name , medicament_description from Medicament
--10. List the consultations with their durations in descending order.
select Consultation.ID as 'consultation id ' , Consultation.Duration  from Consultation
order by  duration DESC ;

--11. Display the patient names and their respective ages (based on date of birth).

select * from Patient

SELECT Name, FirstName, DATEDIFF(YEAR, DateOfBirth, GETDATE()) AS Age
FROM Patient;

--12. Find the consultations where the pricing is greater than $50.
select *  from Consultation
 
 select Consultation.ID as 'consultation id ' , Consultation.Pricing as 'price' 
 from Consultation
 where Pricing >= 50;
 --13. Get the doctors' names and their specialties.
 select Doctor.Name,Doctor.FirstName, Doctor.SpecialtyID from Doctor
 --14. List the consultations along with the patient's address
 select * from Patient
 select * from Consultation

 select  Patient.Name, Patient.Address, Consultation.id as ' consultation id ' 
 from Patient
 inner join Consultation on Patient.ID = Consultation.PatientID;

 -- 15. Find the consultations where the duration is between 20 and 40 minutes.
 select Consultation.ID as 'consultation id', Consultation.Duration from Consultation
 where Duration between 20 and 40 ;

 --16. Get the consultations ordered by consultation date in descending order.
 select Consultation.ID , Consultation.Date from Consultation
 order by date DESC ;
 -- 17. Find the patients who have consultations on '2024-05-27'.
 select Patient.Name , Patient.ID , Consultation.date 
 from Patient
 inner join	Consultation on Consultation.PatientID= Patient.ID
 where Consultation.date ='2024-05-27';
 --18. Display the prescriptions along with their prescription dates.
 select prescription_id, prescription_date from Prescription

 --19. Get the doctors who are specialized in a specific specialty (e.g., 'SP001').
 select * from Doctor
 where SpecialtyID='SP001'
 --20--Find the consultations with their respective patient and doctor names where the patient's name starts with 'J'.
 select  * from Patient
 select * from Doctor
 select * from Consultation
 SELECT Consultation.ID AS 'consultation id', Patient.Name AS 'patient name', Doctor.Name AS 'doctor name'
FROM Consultation
INNER JOIN Patient ON Consultation.patientID = Patient.ID
INNER JOIN Doctor ON Consultation.doctorId = Doctor.ID
WHERE Patient.Name LIKE '%j%';
--21. Display the patients who are older than 30 years.
SELECT Name, FirstName, DATEDIFF(YEAR, DateOfBirth, GETDATE()) AS Age
FROM Patient
WHERE DATEDIFF(YEAR, DateOfBirth, GETDATE()) >= 30;
--22. Find the consultations where the doctor's first name is 'Jane'.
select * from Consultation
select * from Doctor
select Doctor.FirstName , Consultation.ID as 'consultation id' 
from Doctor
inner join Consultation on Consultation.DoctorID= Doctor.ID
where Doctor.FirstName = 'Jane' ;
-- 23. Get the medications prescribed in each prescription along with their dosages.
select * from Prescription_Medicament
select * from Medicament
select Medicament.medicament_id , Medicament.medicament_name , Prescription_Medicament.dosage
from Medicament
inner join Prescription_Medicament on Prescription_Medicament.medicament_id= Medicament.medicament_id;
--24. Find the consultations where the pricing is the highest.
select * from Consultation

SELECT Consultation.ID as 'consultation with the highest price', Consultation.Pricing
FROM Consultation
WHERE Pricing = (SELECT MAX(Pricing) FROM Consultation);

--25. Get the medications with their descriptions sorted alphabetically.

SELECT * 
FROM Medicament 
ORDER BY CAST(medicament_description AS VARCHAR(MAX));
-- 26. Find the consultations where the patient's address contains 'St'.
SELECT Consultation.ID , Patient.Address
FROM Consultation 
JOIN Patient  ON Consultation.PatientID = Patient.ID
WHERE Patient.Address LIKE '%St%';
--27. Display the prescriptions along with their associated consultations and medications.
select * from Prescription
select * from Medicament
select * from Prescription_Medicament

SELECT p.prescription_id, c.ID AS 'consultation_id', m.medicament_id, m.medicament_description
FROM Prescription p
INNER JOIN Consultation c ON p.consultation_id = c.ID
INNER JOIN Prescription_Medicament pm ON p.prescription_id = pm.prescription_id
INNER JOIN Medicament m ON pm.medicament_id = m.medicament_id;
-- 28. Find the doctors who have consultations with a duration less than 25 minutes.
select * from Doctor
select * from Consultation
select Doctor.Name , Consultation.Duration
from Doctor
inner join Consultation on Doctor.ID= Consultation.DoctorID
where Consultation.Duration <= 25 ; 
--29. Get the patients who were born between '1990-01-01' and '1995-12-31'.
SELECT Patient.Name , Patient.DateOfBirth 
FROM Patient
WHERE DateOfBirth BETWEEN '1990-01-01' AND '1995-12-31';
--30. List the prescriptions along with their associated consultation dates and pricing.
select * from Prescription
select * from Consultation
select Prescription.prescription_id , Consultation.Date, Consultation.Pricing
from Prescription
inner join Consultation on Consultation.ID= Prescription.consultation_id ;
--31. Display the patients who have never had a consultation.
select * from Patient
select * from Consultation
select Patient.Name , Consultation.ID
from Patient
inner join Consultation on Patient.ID=Consultation.PatientID
where Consultation.ID is null ; 
























 









