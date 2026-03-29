# Database Verification Queries

This document contains SQL queries to verify that all tables in the Healthcare Database Management System have been populated correctly.

---

## Core User Tables

### 1. Users Table
```sql
SELECT * FROM users;
```

### 2. User Profiles Table
```sql
SELECT * FROM user_profiles;
```

---

## Hospital & Staff Tables

### 3. Hospitals Table
```sql
SELECT * FROM hospitals;
```

### 4. Doctors Table
```sql
SELECT * FROM doctors;
```

### 5. Patients Table
```sql
SELECT * FROM patients;
```

---

## Clinical Records

### 6. Appointments Table
```sql
SELECT * FROM appointments;
```

### 7. Patient Vitals Table
```sql
SELECT * FROM patient_vitals;
```

### 8. Medical Records Table
```sql
SELECT * FROM medical_records;
```

### 9. Prescriptions Table
```sql
SELECT * FROM prescriptions;
```

### 10. Lab Tests Table
```sql
SELECT * FROM lab_tests;
```

---

## Financial & Insurance

### 11. Billings Table
```sql
SELECT * FROM billings;
```

### 12. Insurance Table
```sql
SELECT * FROM insurance;
```

---

## Analytics & Audit

### 13. Health Risk Scores Table
```sql
SELECT * FROM health_risk_scores;
```

### 14. Analytics Logs Table
```sql
SELECT * FROM analytics_logs;
```

### 15. Audit Logs Table
```sql
SELECT * FROM audit_logs;
```

---

> **Note:** Run these queries after executing the insert scripts to verify data has been loaded correctly.