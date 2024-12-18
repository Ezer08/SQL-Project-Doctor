🏥 Healthcare Management System


This project implements a relational database system to manage healthcare information, focusing on doctors, patients, consultations, prescriptions, and medications. The database allows for easy tracking of patient consultations, prescriptions, and the treatments provided by healthcare professionals.

📂 Project Structure


Tables

Doctor: Stores details about doctors. 👩‍⚕️👨‍⚕️

Doctor's ID, Name, Specialty, and Address.
Patient: Stores patient information. 👩‍🦰👨‍🦱

Patient's ID, Name, Date of Birth, and Address.
Consultation: Stores information about consultations between patients and doctors. 💬

Consultation ID, Patient and Doctor references, Date, Description, Duration, and Pricing.
Prescription: Stores prescription data associated with consultations. 💊

Prescription ID, Consultation ID, and Prescription Date.
Medicament: Stores information about medications. 💊📝

Medicament ID, Name, and Description.
Prescription_Medicament: Stores the medications prescribed in each prescription. 💊💊

Prescription ID, Medicament ID, and Dosage.


📊 Key Queries


Data Insertion
Insert doctors, patients, consultations, prescriptions, and medications into their respective tables.
Data Retrieval
Retrieve all information about doctors.
Get the names and addresses of patients.
Find consultations that occurred on a specific date.
List consultations with their associated patient and doctor names.
Find the total pricing of all consultations.
Display consultation durations in hours.
List medications prescribed in each prescription.
Additional Queries
Get the total number of prescriptions.
Find medications with descriptions.
List consultations ordered by duration in descending order.
Display patients' ages based on their birthdate.
Find consultations with pricing higher than a specific amount.
Get doctors by specialty.
List consultations with the patient's address.
Find consultations with duration between a specified range.


🛠️ Requirements


Database Management System (DBMS): The project can be run on any relational DBMS such as MySQL or PostgreSQL.
SQL Knowledge: Basic understanding of SQL operations such as JOIN, INSERT, SELECT, and GROUP BY.


🚀 Setup Instructions


Clone this repository to your local machine.
Set up your DBMS and create a new database.
Execute the SQL commands to create tables and populate them with sample data.
Run the provided queries to retrieve relevant data.
