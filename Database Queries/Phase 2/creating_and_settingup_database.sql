--Step 1:- Creating and Using the database
--Creating Database
CREATE DATABASE healthcare_analytics;
--Using the created database
USE healthcare_analytics;

-- ======================================================================================================

--Step 2:- Core Tables
--users
CREATE TABLE users (
    user_id    INT AUTO_INCREMENT PRIMARY KEY,               
    username   VARCHAR(100) UNIQUE NOT NULL,                 
    password   VARCHAR(255) NOT NULL,                        
    email      VARCHAR(255) UNIQUE NOT NULL,                 
    role       ENUM('admin', 'doctor', 'patient', 'analyst') NOT NULL,  
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP            
);

--hospitals
CREATE TABLE hospitals (
    hospital_id  INT AUTO_INCREMENT PRIMARY KEY,            
    name         VARCHAR(255) NOT NULL,                  
    location     VARCHAR(255),                              
    contact_info VARCHAR(255) 
);

-- ======================================================================================================

--Step 3:- User Related Tables
--user_profiles
CREATE TABLE user_profiles (
    profile_id     INT AUTO_INCREMENT PRIMARY KEY,         
    user_id        INT NOT NULL,                             
    first_name     VARCHAR(100),                             
    last_name      VARCHAR(100),                       
    date_of_birth  DATE,                                  
    contact_number VARCHAR(20),                             
    address        TEXT,                                     
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE                              
);

--patients
CREATE TABLE patients (
    patient_id        INT AUTO_INCREMENT PRIMARY KEY,        
    user_id           INT NOT NULL,                         
    gender            VARCHAR(10),                           
    blood_group       VARCHAR(10),                           
    emergency_contact VARCHAR(20),                          
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE                                  
);

--doctors
CREATE TABLE doctors (
    doctor_id      INT AUTO_INCREMENT PRIMARY KEY,       
    user_id        INT NOT NULL,                             
    hospital_id    INT,                                     
    specialization VARCHAR(100),                          
    license_number VARCHAR(50) UNIQUE,                      
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE,                                  
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id) 
);

-- ======================================================================================================

--Step 4:- Appointments Module
--appointments
CREATE TABLE appointments (
    appointment_id   INT AUTO_INCREMENT PRIMARY KEY,       
    patient_id       INT NOT NULL,                          
    doctor_id        INT NOT NULL,                           
    hospital_id      INT,                                    
    appointment_date DATE,                                 
    status           ENUM('scheduled', 'completed', 'cancelled'),
    reason           TEXT,                                  
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),    
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),        
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
);

-- ======================================================================================================

--Step 5:- Medical Data Tables
--patient_vitals
CREATE TABLE patient_vitals (
    vital_id         INT AUTO_INCREMENT PRIMARY KEY,         
    patient_id       INT NOT NULL,                           
    recorded_at      DATETIME DEFAULT CURRENT_TIMESTAMP,     
    heart_rate       INT,                                    
    bp_systolic      INT,                                   
    bp_diastolic     INT,                                   
    temperature      FLOAT,                                 
    respiratory_rate INT,                                
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

--medical_records
CREATE TABLE medical_records (
    record_id      INT AUTO_INCREMENT PRIMARY KEY,         
    patient_id     INT NOT NULL,                             
    doctor_id      INT NOT NULL,                             
    hospital_id    INT,                                      
    visit_date     DATE,                                  
    diagnosis      TEXT,                                 
    treatment_plan TEXT,                                 
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
);

--prescriptions
CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,         
    record_id       INT NOT NULL,                          
    medication_name VARCHAR(255),                           
    dosage          VARCHAR(100),                            
    frequency       VARCHAR(100),                            
    start_date      DATE,                                   
    end_date        DATE,                                   
    FOREIGN KEY (record_id) REFERENCES medical_records(record_id)
        ON DELETE CASCADE                                  
);

-- ======================================================================================================

--Step 6:- Lab Tests
--lab_tests
CREATE TABLE lab_tests (
    test_id       INT AUTO_INCREMENT PRIMARY KEY,            
    test_name     VARCHAR(255) NOT NULL,                    
    description   TEXT,                                     
    std_range_min FLOAT,                                    
    std_range_max FLOAT                                    
);

-- ======================================================================================================

--Step 7:- Billing and Insurence
--billings
CREATE TABLE billings (
    bill_id        INT AUTO_INCREMENT PRIMARY KEY,          
    appointment_id INT NOT NULL,                         
    patient_id     INT NOT NULL,                            
    amount         FLOAT,                                
    payment_status ENUM('paid', 'unpaid', 'pending'),    
    generated_at   DATETIME DEFAULT CURRENT_TIMESTAMP,      
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

--insurance
CREATE TABLE insurance (
    insurance_id     INT AUTO_INCREMENT PRIMARY KEY,        
    patient_id       INT NOT NULL,                           
    provider_name    VARCHAR(255),                         
    policy_number    VARCHAR(100),                           
    coverage_details TEXT,                                  
    expiry_date      DATE,                                   
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) 
);

-- ======================================================================================================

--Step 8:- Analytics & AI Tables
--health_risk_scores
CREATE TABLE health_risk_scores (
    score_id      INT AUTO_INCREMENT PRIMARY KEY,    
    patient_id    INT NOT NULL,                          
    calculated_at DATETIME DEFAULT CURRENT_TIMESTAMP,      
    risk_model    VARCHAR(255),                             
    score_value   FLOAT,                                    
    risk_level    VARCHAR(50),                             
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) 
);

--analytics_logs
CREATE TABLE analytics_logs (
    log_id          INT AUTO_INCREMENT PRIMARY KEY,        
    user_id         INT NOT NULL,                            
    entity_affected VARCHAR(255),                            
    timestamp       DATETIME DEFAULT CURRENT_TIMESTAMP,     
    details         TEXT,                                   
    FOREIGN KEY (user_id) REFERENCES users(user_id)        
);

-- ======================================================================================================

--Step 9:- Audit Logs (ADMIN ONLY)
--audit_logs
CREATE TABLE audit_logs (
    audit_id    INT AUTO_INCREMENT PRIMARY KEY,          
    user_id     INT NOT NULL,                             
    table_name  VARCHAR(100),                               
    record_id   INT,                                        
    action      VARCHAR(255),                              
    old_value   TEXT,                                  
    new_value   TEXT,                                     
    timestamp   DATETIME DEFAULT CURRENT_TIMESTAMP,      
    FOREIGN KEY (user_id) REFERENCES users(user_id)    
);

-- ======================================================================================================

--Step 10:- Final Verification
--To show all the tables created in the healthcare_analytics database
SHOW TABLES;