# Healthcare Analytics Database Management System

A Comprehensive DBMS for Hospital Operations, Patient Records, Billing & AI-Driven Health Analytics

![Database](https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
![Tables](https://img.shields.io/badge/Tables-15-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-Academic-orange?style=for-the-badge)

---

## Team Members

| Name | Role | Roll Number | Class |
|------|------|-------------|-------|
| **Gufran Ali** | Team Leader | 2410030922 | 2CSE12 |
| **Umar Iqbal** | Team Member | 2410030933 | 2CSE12 |
| **SaiKrishna Paila** | Team Member | 2410030908 | 2CSE12 |
| **Yuvraj Viplav** | Team Member | 2410030887 | 2CSE12 |

---

## Abstract

The Healthcare Analytics System is a database management system designed to efficiently store, manage, and analyze healthcare-related data. The system maintains records of patients, doctors, appointments, diagnoses, treatments, and billing information in a structured relational format.

The objective of this system is to reduce redundancy, ensure data integrity, and provide meaningful analytical insights such as monthly patient visits, common diseases, and revenue analysis. The system uses SQL for data definition and manipulation and applies normalization principles to maintain consistency and eliminate anomalies.

This project aims to showcase the practical implementation of ER modeling, relational

---

## Overview

### Introduction

Healthcare sector generates large volumes of data daily, including patient details, medical history, doctor information, and billing records. Managing this data manually can lead to errors, redundancy, and inefficiency. A database-driven healthcare system ensures structured storage, secure access, and efficient data retrieval.

### Objectives

- To manage patient and doctor records
- To schedule and track appointments
- To store diagnosis and treatment details
- To maintain billing and payment information
- To generate healthcare analytics reports

### Scope of this Healthcare Analytics System

The system is designed for hospitals and clinics to manage operational and analytical data efficiently using relational database concepts.

---

## ER Diagrams

### Complete Entity-Relationship Diagram

The following ER diagram illustrates the complete schema with all **15 tables**, their attributes, primary keys, and foreign key relationships:

![ER Diagram](Project%20Resources/ER%20Diagram.png)

The above ER diagram represents the structural design of the Healthcare Analytics System. The system consists of major entities such as Patients, Users, Doctors, Hospitals, Appointments, Medical_Records, Lab_Tests, Prescriptions, Billings, Insurance, and Analytics_Logs.

The Users entity manages authentication and role-based access control. Patients and Doctors are linked to Users through foreign key relationships. Appointments act as a connecting entity between patients, doctors, and hospitals.

Medical_Records store diagnosis and treatment-related information. Prescriptions are linked to medical records, and Billings are generated based on appointments and patient services. Insurance details are maintained for coverage tracking. Audit_Logs and Analytics_Logs are included to support system monitoring and analytical processing.

Primary keys uniquely identify each entity, and foreign keys maintain referential integrity across relationships.

---

## Relational Schema

### users

| Column | Key Constraints |
|--------|-----------------|
| user_id | PRIMARY KEY |
| username | UNIQUE, NOT NULL |
| password | NOT NULL |
| email | UNIQUE, NOT NULL |
| role | NOT NULL |
| created_on | DEFAULT CURRENT_TIMESTAMP |

### hospitals

| Column | Key Constraints |
|--------|-----------------|
| hospital_id | PRIMARY KEY |
| name | NOT NULL |
| location | — |
| contact_info | — |

### user_profiles

| Column | Key Constraints |
|--------|-----------------|
| profile_id | PRIMARY KEY |
| user_id | FOREIGN KEY → users(user_id) |
| first_name | — |
| last_name | — |
| date_of_birth | — |
| contact_number | — |
| address | — |

### patients

| Column | Key Constraints |
|--------|-----------------|
| patient_id | PRIMARY KEY |
| user_id | FOREIGN KEY → users(user_id) |
| gender | — |
| blood_group | — |
| emergency_contact | — |

### doctors

| Column | Key Constraints |
|--------|-----------------|
| doctor_id | PRIMARY KEY |
| user_id | FOREIGN KEY → users(user_id) |
| hospital_id | FOREIGN KEY → hospitals(hospital_id) |
| specialization | — |
| license_number | UNIQUE |

### appointments

| Column | Key Constraints |
|--------|-----------------|
| appointment_id | PRIMARY KEY |
| patient_id | FOREIGN KEY → patients(patient_id) |
| doctor_id | FOREIGN KEY → doctors(doctor_id) |
| hospital_id | FOREIGN KEY → hospitals(hospital_id) |
| appointment_date | — |
| status | — |
| reason | — |

### patient_vitals

| Column | Key Constraints |
|--------|-----------------|
| vital_id | PRIMARY KEY |
| patient_id | FOREIGN KEY → patients(patient_id) |
| recorded_at | DEFAULT CURRENT_TIMESTAMP |
| heart_rate | — |
| bp_systolic | — |
| bp_diastolic | — |
| temperature | — |
| respiratory_rate | — |

### medical_records

| Column | Key Constraints |
|--------|-----------------|
| record_id | PRIMARY KEY |
| patient_id | FOREIGN KEY → patients(patient_id) |
| doctor_id | FOREIGN KEY → doctors(doctor_id) |
| hospital_id | FOREIGN KEY → hospitals(hospital_id) |
| visit_date | — |
| diagnosis | — |
| treatment_plan | — |

### prescriptions

| Column | Key Constraints |
|--------|-----------------|
| prescription_id | PRIMARY KEY |
| record_id | FOREIGN KEY → medical_records(record_id) |
| medication_name | — |
| dosage | — |
| frequency | — |
| start_date | — |
| end_date | — |

### lab_tests

| Column | Key Constraints |
|--------|-----------------|
| test_id | PRIMARY KEY |
| test_name | NOT NULL |
| description | — |
| std_range_min | — |
| std_range_max | — |

### billings

| Column | Key Constraints |
|--------|-----------------|
| bill_id | PRIMARY KEY |
| appointment_id | FOREIGN KEY → appointments(appointment_id) |
| patient_id | FOREIGN KEY → patients(patient_id) |
| amount | — |
| payment_status | — |
| generated_at | DEFAULT CURRENT_TIMESTAMP |

### insurance

| Column | Key Constraints |
|--------|-----------------|
| insurance_id | PRIMARY KEY |
| patient_id | FOREIGN KEY → patients(patient_id) |
| provider_name | — |
| policy_number | — |
| coverage_details | — |
| expiry_date | — |

### health_risk_scores

| Column | Key Constraints |
|--------|-----------------|
| score_id | PRIMARY KEY |
| patient_id | FOREIGN KEY → patients(patient_id) |
| calculated_at | DEFAULT CURRENT_TIMESTAMP |
| risk_model | — |
| score_value | — |
| risk_level | — |

### analytics_logs

| Column | Key Constraints |
|--------|-----------------|
| log_id | PRIMARY KEY |
| user_id | FOREIGN KEY → users(user_id) |
| entity_affected | — |
| timestamp | DEFAULT CURRENT_TIMESTAMP |
| details | — |

### audit_logs

| Column | Key Constraints |
|--------|-----------------|
| audit_id | PRIMARY KEY |
| user_id | FOREIGN KEY → users(user_id) |
| table_name | — |
| record_id | — |
| action | — |
| old_value | — |
| new_value | — |
| timestamp | DEFAULT CURRENT_TIMESTAMP |

---

## Project Structure

```
Healthcare Analytics/
├──|
 README.md
│
├── Database Queries/
│   ├── Complete_Database_Queries.md
│   └── creating_and_settingup_database.sql
│
└── Project Resources/
    └── ER Diagram.png
```

---

## Project Structure

```
DBMS Project/
|
├── README.md                                           ← Project documentation
│
├── Database Queries/
│   ├── Complete_Database_Queries.md                    ← Full SQL schema with detailed comments
│   └── creating_and_settingup_database.sql            ← Complete SQL setup script
│
└── Project Resources/
    └── ER Diagram.png                                 ← Entity-Relationship diagram
```

---
