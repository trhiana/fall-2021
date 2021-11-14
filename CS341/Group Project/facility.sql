drop database if exists facility;

create database facility;
use facility;

-- Structure for Doctors table
create table doctors(
    doctor_id varchar(10) primary key , -- starts with D
    name varchar(50), 
    age int,
    gender enum('Female','Male','Other') default null,
    address varchar(50)
);

-- Structure of Patients table 
create table patients(
    patient_id varchar(10) primary key, -- starts with P
    name varchar(50), 
    age int,
    gender enum('Female','Male','Other') default null,
    address varchar(50),
    disease varchar(50),
    doctor_id varchar(10), -- starts with D
    foreign key (doctor_id) references doctors(doctor_id)
);

-- Structure for Laboratories table
create table laboratories(
    lab_id varchar(10) primary key,
    patient_id varchar(10),
    doctor_id varchar(10),
    date datetime, -- YYYY-MM-DD HH:MM:SS
    amount int,
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);

-- Structure for Rooms table
create table rooms(
    room_no varchar(10) primary key,
    room_type varchar(30),
    status enum('Unoccupied', 'Occupied')
);

-- Structure for In-Patients table
create table in_patient(
    patient_id varchar(10) primary key,
    room_no varchar(10),
    date_of_admission datetime,
    date_of_discharge datetime,
    lab_id varchar(10),
    foreign key (patient_id) references patients(patient_id),
    foreign key (room_no) references rooms(room_no),
    foreign key (lab_id) references laboratories(lab_id)
);

-- Structure for Out-Patients table
create table out_patient(
    patient_id varchar(10) primary key,
    date datetime,
    lab_id varchar(10),
    foreign key (patient_id) references patients(patient_id),
    foreign key (lab_id) references laboratories(lab_id)
);

-- Structure for Bills table
create table bills(
    bill_no int primary key,
    patient_no varchar(10),
    doctor_charge int,
    room_charge int,
    no_of_days int,
    lab_charge int,
    bill int,
    foreign key (patient_no) references patients(patient_id)
);