# Complete Database Insert Records

This document contains all SQL INSERT statements to populate the Healthcare Database Management System.

---

## STEP 1: Insert into `users`

```sql
INSERT INTO users (username, password, email, role) VALUES
('admin1', 'pass123', 'admin1@mail.com', 'admin'),
('dr_sharma', 'pass123', 'sharma@mail.com', 'doctor'),
('dr_khan', 'pass123', 'khan@mail.com', 'doctor'),
('patient_rahul', 'pass123', 'rahul@mail.com', 'patient'),
('patient_aman', 'pass123', 'aman@mail.com', 'patient'),
('patient_sara', 'pass123', 'sara@mail.com', 'patient'),
('analyst1', 'pass123', 'analyst@mail.com', 'analyst'),
('patient_neha', 'pass123', 'neha@mail.com', 'patient'),
('dr_mehta', 'pass123', 'mehta@mail.com', 'doctor'),
('patient_raj', 'pass123', 'raj@mail.com', 'patient');
```

---

## STEP 2: Insert into `hospitals`

```sql
INSERT INTO hospitals (name, location, contact_info) VALUES
('AIIMS Delhi', 'Delhi', '011-26588500'),
('Fortis Hospital', 'Noida', '0120-2400222'),
('Apollo Hospital', 'Delhi', '011-26925858'),
('Max Hospital', 'Saket', '011-26515050'),
('Medanta', 'Gurgaon', '0124-4141414');
```

---

## STEP 3: Insert into `user_profiles`

```sql
INSERT INTO user_profiles (user_id, first_name, last_name, date_of_birth, contact_number, address)
VALUES
(1,'Admin','One','1990-01-01','9999999991','Delhi'),
(2,'Ravi','Sharma','1980-05-12','9999999992','Delhi'),
(3,'Ali','Khan','1985-07-20','9999999993','Noida'),
(4,'Rahul','Verma','2000-03-10','9999999994','Delhi'),
(5,'Aman','Singh','1999-08-15','9999999995','Noida'),
(6,'Sara','Ali','2001-11-22','9999999996','Delhi'),
(7,'Data','Analyst','1995-02-14','9999999997','Gurgaon'),
(8,'Neha','Gupta','2002-06-18','9999999998','Delhi'),
(9,'Vikas','Mehta','1982-09-30','9999999999','Delhi'),
(10,'Raj','Kumar','1998-12-25','9999999900','Noida');
```

---

## STEP 4: Insert into `patients`

```sql
INSERT INTO patients (user_id, gender, blood_group, emergency_contact) VALUES
(4,'Male','B+','8888888881'),
(5,'Male','O+','8888888882'),
(6,'Female','A+','8888888883'),
(8,'Female','AB+','8888888884'),
(10,'Male','O-','8888888885');
```

---

## STEP 5: Insert into `doctors`

```sql
INSERT INTO doctors (user_id, hospital_id, specialization, license_number) VALUES
(2,1,'Cardiologist','LIC123'),
(3,2,'Neurologist','LIC124'),
(9,3,'Orthopedic','LIC125'),
(2,4,'General Physician','LIC126');
```

---

## STEP 6: Insert into `appointments`

```sql
INSERT INTO appointments (patient_id, doctor_id, hospital_id, appointment_date, status, reason) VALUES
(1,1,1,'2026-03-20','completed','Chest pain'),
(2,2,2,'2026-03-21','scheduled','Headache'),
(3,3,3,'2026-03-22','completed','Fracture'),
(4,1,1,'2026-03-23','cancelled','Routine check'),
(5,2,2,'2026-03-24','scheduled','Migraine'),
(1,3,3,'2026-03-25','completed','Back pain'),
(2,1,1,'2026-03-26','completed','BP issue'),
(3,2,2,'2026-03-27','scheduled','Dizziness'),
(4,3,3,'2026-03-28','completed','Joint pain'),
(5,1,1,'2026-03-29','scheduled','Heart check');
```

---

## STEP 7: Insert into `patient_vitals`

```sql
INSERT INTO patient_vitals (patient_id, heart_rate, bp_systolic, bp_diastolic, temperature, respiratory_rate)
VALUES
(1,72,120,80,98.6,16),
(2,85,130,85,99.1,18),
(3,90,140,90,100.2,20),
(4,70,110,75,98.4,15),
(5,88,135,88,99.5,19);
```

---

## STEP 8: Insert into `medical_records`

```sql
INSERT INTO medical_records (patient_id, doctor_id, hospital_id, visit_date, diagnosis, treatment_plan)
VALUES
(1,1,1,'2026-03-20','Hypertension','Medication'),
(2,2,2,'2026-03-21','Migraine','Painkillers'),
(3,3,3,'2026-03-22','Fracture','Surgery'),
(4,1,1,'2026-03-23','Normal','Routine check'),
(5,2,2,'2026-03-24','Headache','Rest');
```

---

## STEP 9: Insert into `prescriptions`

```sql
INSERT INTO prescriptions (record_id, medication_name, dosage, frequency, start_date, end_date) VALUES
(1,'Amlodipine','5mg','Once daily','2026-03-20','2026-04-20'),
(2,'Paracetamol','500mg','Twice daily','2026-03-21','2026-03-25'),
(3,'Calcium','1 tab','Daily','2026-03-22','2026-04-22'),
(4,'Vitamin D','1 tab','Weekly','2026-03-23','2026-05-23'),
(5,'Ibuprofen','400mg','Thrice daily','2026-03-24','2026-03-28');
```

---

## STEP 10: Insert into `billings`

```sql
INSERT INTO billings (appointment_id, patient_id, amount, payment_status) VALUES
(1,1,1500,'paid'),
(2,2,1200,'pending'),
(3,3,5000,'paid'),
(4,4,800,'unpaid'),
(5,5,1000,'paid');
```

---

## STEP 11: Insert into `insurance`

```sql
INSERT INTO insurance (patient_id, provider_name, policy_number, coverage_details, expiry_date) VALUES
(1,'LIC','POL123','Full','2027-01-01'),
(2,'HDFC','POL124','Partial','2026-12-01'),
(3,'ICICI','POL125','Full','2027-06-01'),
(4,'Bajaj','POL126','Partial','2026-09-01'),
(5,'Star Health','POL127','Full','2027-03-01');
```

---

## STEP 12: Insert into `lab_tests`

```sql
INSERT INTO lab_tests (test_name, description, std_range_min, std_range_max) VALUES
('Blood Sugar', 'Measures glucose level', 70, 140),
('Cholesterol', 'Measures cholesterol level', 125, 200),
('Hemoglobin', 'Measures Hb level', 12, 18),
('Thyroid', 'TSH level test', 0.4, 4.0),
('Vitamin D', 'Vitamin D level', 20, 50);
```

---

## STEP 13: Insert into `health_risk_scores`

```sql
INSERT INTO health_risk_scores (patient_id, risk_model, score_value, risk_level) VALUES
(1, 'CardioRiskModel', 0.75, 'High'),
(2, 'NeuroRiskModel', 0.40, 'Medium'),
(3, 'OrthoRiskModel', 0.30, 'Low'),
(4, 'GeneralHealthModel', 0.20, 'Low'),
(5, 'CardioRiskModel', 0.65, 'Medium');
```

---

## STEP 14: Insert into `analytics_logs`

```sql
INSERT INTO analytics_logs (user_id, entity_affected, details) VALUES
(1, 'users', 'Created new doctor account'),
(2, 'appointments', 'Viewed appointment list'),
(3, 'patients', 'Updated patient record'),
(7, 'analytics', 'Generated report'),
(1, 'billings', 'Checked revenue stats');
```

---

## STEP 15: Insert into `audit_logs`

```sql
INSERT INTO audit_logs (user_id, table_name, record_id, action, old_value, new_value) VALUES
(1, 'users', 2, 'UPDATE', 'old email', 'new email'),
(1, 'patients', 3, 'DELETE', 'patient data', 'NULL'),
(1, 'appointments', 4, 'UPDATE', 'scheduled', 'cancelled'),
(1, 'billings', 2, 'UPDATE', 'pending', 'paid'),
(1, 'doctors', 1, 'INSERT', 'NULL', 'new doctor added');
```