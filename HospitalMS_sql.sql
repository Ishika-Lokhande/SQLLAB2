create database HealthCareManagementDB;
use HealthCareManagementDB;
create table Patients
(
PatientID int primary key,FirstName varchar (20), LastName varchar (20), Gender varchar (10),Age int, Phone varchar (15), Address varchar (100), BlloodGroup varchar (10)
);

create table Departments
(
DepartmentID int primary key, DepartmentName varchar (50), FloorNumber int, Contact varchar (15)
);

create table Doctors
(
DoctorID int primary key, DoctorName varchar (20), Specialization varchar (20), Phone varchar (15), Email varchar (20), DepartmentID int, foreign key (DepartmentID) references Departments(DepartmentID)
);

create table Appointmentss
(
AppointmentID int primary key, PatientID int, DoctorID int, AppointmentDate date, AppointmentTime time, Status varchar (10), foreign key (PatientID) references Patients(PatientID), foreign key (DoctorID) references Doctors(DoctorID)
); 

create table Medicines
(
MedicineID int primary key, MedicineName varchar (50), Manufacturer varchar (100), UnitPrice decimal (10,2), MedicineType varchar (20)
);

create table  MedicalRecords
(
RecordID int primary key, PatientID int, DoctorID int, MedicineID int, Diagnosis varchar (50), Treatment varchar (50), VisitDate date, foreign key (PatientID) references Patients(PatientID), foreign key (DoctorID) references Doctors(DoctorID), foreign key (MedicineID) references Medicines(MedicineID)
);

create table  Inventory
(
InventoryID int primary key, MedicineID int, QuantityInStock int, ExpiryDate date, BatchNumber varchar (50), foreign key (MedicineID) references Medicines(MedicineID)
);

create table Payments
(
PaymentID int primary key, PatientID int, Amount decimal (10,2), PaymentDate date, PaymentMethod varchar (20), PaymentStatus varchar (20), foreign key (PatientID) references Patients(PatientID)
);
Show databases; 




 


