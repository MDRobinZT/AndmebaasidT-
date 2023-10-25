INSERT INTO dbo.Departments (DepartmentID, DepartmentName, HospitalID)
VALUES
(1, 'Lasnamäe haigla', 1),
(2, 'Must haigla', 2),
(3, 'Valge haigla', 3),
(4, 'Punane haigla', 4),
(5, 'Roosa haigla', 5),
(6, 'Roheline haigla', 6),
(7, 'Kollane haigla', 7),
(8, 'Mustamäe haigla', 8),
(9, 'Jaana haigla', 9),
(10, 'Kolga haigla', 10);


SET IDENTITY_INSERT RobinAas. dbo. Doctors ON


INSERT INTO dbo.Hospitals (HospitalName, Address, Phone)
VALUES
('Lasnamäe haigla', 'Vikerlase 12', '12432'),
('Must haigla', 'Vikerlase 12', '124245632'),
('Valge haigla', 'Vikerlase 1262', '1244256432'),
('Punane haigla', 'Vikerlase 16452', '124563546732'),
('Roosa haigla', 'Vikerlase 1262', '1243564732'),
('Roheline haigla', 'Vikerlase 14652', '1247456732'),
('Kollane haigla', 'Vikerlase 14562', '124574432'),
('Mustamäe haigla', 'Vikerlase 1232', '1364362432'),
('Jaana haigla', 'Vikerlase 123', '1263456432'),
('Kolga haigla', 'Vikerlase 152', '1273567432');


INSERT INTO dbo.Doctors (Name, Specialization, DepartmentID)
VALUES
('Arst1', 'Kirurg', 1),
('Arst2', 'Perearst', 2),
('Arst3', 'Neuroloog', 3),
('Arst4', 'Kardioloog', 4),
('Arst5', 'Günekoloog', 5),
('Arst6', 'Dermatoloog', 1),
('Arst7', 'Oftalmoloog', 2),
('Arst8', 'Ortopeed', 3),
('Arst9', 'Psühhiaater', 4),
('Arst10', 'Radioloog', 5);


INSERT INTO dbo.Patients (Name, PhoneNumber, Address, DateOfBirth)
VALUES
('Patsient1', '555-123-4567', 'Aadress1', '1990-01-01'),
('Patsient2', '555-987-6543', 'Aadress2', '1985-05-15'),
('Patsient3', '555-555-5555', 'Aadress3', '2000-12-31'),
('Patsient4', '555-111-2222', 'Aadress4', '1970-03-20'),
('Patsient5', '555-333-4444', 'Aadress5', '1995-08-10'),
('Patsient6', '555-999-8888', 'Aadress6', '1993-11-25'),
('Patsient7', '555-777-6666', 'Aadress7', '1988-07-17'),
('Patsient8', '555-666-9999', 'Aadress8', '1980-04-05'),
('Patsient9', '555-222-3333', 'Aadress9', '1965-10-30'),
('Patsient10', '555-444-5555', 'Aadress10', '2005-02-15');



INSERT INTO dbo.PatientStays (PatientID, StartDateTime, EndDateTime)
VALUES
(1, '2023-10-01 08:00:00', '2023-10-02 16:00:00'),
(2, '2023-10-03 10:30:00', '2023-10-05 14:15:00'),
(3, '2023-10-05 16:45:00', '2023-10-06 09:30:00'),
(4, '2023-10-07 11:20:00', '2023-10-08 12:40:00'),
(5, '2023-10-09 13:00:00', '2023-10-09 18:30:00'),
(6, '2023-10-11 09:15:00', '2023-10-11 14:45:00'),
(7, '2023-10-12 12:30:00', '2023-10-13 10:10:00'),
(8, '2023-10-14 15:00:00', '2023-10-15 18:20:00'),
(9, '2023-10-16 08:45:00', '2023-10-17 11:30:00'),
(10, '2023-10-18 10:00:00', '2023-10-18 16:45:00');



CREATE PROCEDURE GetPatientsByHospital
    @HospitalID INT
AS
BEGIN
    SELECT P.*
    FROM Patients AS P
    INNER JOIN Departments AS D ON P.PatientID = D.DepartmentID
    WHERE D.HospitalID = @HospitalID;
END;


EXEC GetPatientsByHospital @HospitalID = 1; 

SELECT H.HospitalName, D.DepartmentName
FROM Hospitals AS H
INNER JOIN Departments AS D ON H.HospitalID = D.HospitalID;


SELECT Departments.DepartmentName, Doctors.Name
FROM Departments
LEFT JOIN Doctors ON Departments.DepartmentID = Doctors.DepartmentID;



SELECT Doctors.Name AS DoctorName, Patients.Name AS PatientName, Hospitals.HospitalName
FROM Doctors
FULL JOIN Patients ON Doctors.DoctorID = Patients.PatientID
FULL JOIN Departments ON Doctors.DepartmentID = Departments.DepartmentID
FULL JOIN Hospitals ON Departments.HospitalID = Hospitals.HospitalID;
