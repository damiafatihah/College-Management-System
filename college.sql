-- Table 1 - RESIDENTIAL_MANAGER
CREATE TABLE RESIDENTIAL_MANAGER (
MANAGER_ID VARCHAR2(4) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(100) NOT NULL,
PHONE_NO VARCHAR2(25) NOT NULL,
IC VARCHAR2(12) NOT NULL,
GENDER CHAR(1) NOT NULL,
RACE VARCHAR2(30) NOT NULL,
RELIGION VARCHAR2(30) NOT NULL,
NATIONALITY VARCHAR2(30) NOT NULL,
SALARY FLOAT NOT NULL,
CONSTRAINT RESIDENTIAL_MANAGER_PK PRIMARY KEY(MANAGER_ID)
);

-- Table 2 - ASSISTANT_ RESIDENTIAL_MANAGER
CREATE TABLE ASSISTANT_DOMESTIC_MANAGER(
ASSISTANT_ID VARCHAR2(5) NOT NULL,
MANAGER_ID VARCHAR2(4),
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(100) NOT NULL,
PHONE_NO VARCHAR2(25) NOT NULL,
IC VARCHAR2(12) NOT NULL,
GENDER CHAR(1) NOT NULL,
RACE VARCHAR2(30) NOT NULL,
RELIGION VARCHAR2(30) NOT NULL,
NATIONALITY VARCHAR2(30) NOT NULL,
SALARY FLOAT NOT NULL,
CONSTRAINT ASSISTANT_DOMESTIC_MANAGER_PK PRIMARY KEY (ASSISTANT_ID),
CONSTRAINT ASSISTANT_DOMESTIC_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID)
);

-- Table 3 - OFFICE_STAFF
CREATE TABLE OFFICE_STAFF (
STAFF_ID VARCHAR2(6) NOT NULL,
MANAGER_ID VARCHAR2(4),
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(100) NOT NULL,
PHONE_NO VARCHAR2(25) NOT NULL,
IC VARCHAR2(12) NOT NULL,
GENDER CHAR(1) NOT NULL,
RACE VARCHAR2(30) NOT NULL,
RELIGION VARCHAR2(30) NOT NULL,
NATIONALITY VARCHAR2(30) NOT NULL,
ROLE VARCHAR2(50) NOT NULL,
SALARY FLOAT NOT NULL,
CONSTRAINT OFFICE_STAFF_PK PRIMARY KEY (STAFF_ID),
CONSTRAINT OFFICE_STAFF__MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID)
);

-- Table 4 - CLEANER
CREATE TABLE CLEANER(
CLEANER_ID VARCHAR2(4) NOT NULL,
MANAGER_ID VARCHAR2(4) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(100) NOT NULL,
PHONE_NO VARCHAR2(25) NOT NULL,
IC VARCHAR2(12) NOT NULL,
GENDER CHAR(1) NOT NULL,
RACE VARCHAR2(30) NOT NULL,
RELIGION VARCHAR2(30) NOT NULL,
NATIONALITY VARCHAR2(30) NOT NULL,
SALARY FLOAT NOT NULL,
CONSTRAINT CLEANER_PK PRIMARY KEY (CLEANER_ID),
CONSTRAINT CLEANER_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID),
);

-- Table 5 - GUARDIAN
CREATE TABLE GUARDIAN(
GUARDIAN_ID VARCHAR2(10) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(100) NOT NULL,
PHONE_NO VARCHAR2(25) NOT NULL,
IC VARCHAR2(12) NOT NULL,
GENDER CHAR(1) NOT NULL,
RACE VARCHAR2(30) NOT NULL,
RELIGION VARCHAR2(30) NOT NULL,
NATIONALITY VARCHAR2(30) NOT NULL,
RELATIONSHIP VARCHAR2(30) NOT NULL,
SALARY FLOAT NOT NULL,
CONSTRAINT GUARDIAN_PK PRIMARY KEY (GUARDIAN_ID),
);

-- Table 6 - FACULTY
CREATE TABLE FACULTY(
FACULTY_ID VARCHAR2(2) NOT NULL, 
FACULTY_NAME VARCHAR2(100) NOT NULL, 
CONSTRAINT FACULTY_PK PRIMARY KEY(FACULTY_ID)
);

-- Table 7 - PROGRAM
CREATE TABLE PROGRAM(
PROGRAM_ID VARCHAR2(5) NOT NULL,
FACULTY_ID VARCHAR2(2),
PROGRAM_NAME VARCHAR2(150) NOT NULL,
CONSTRAINT PROGRAM_PK PRIMARY KEY (PROGRAM_ID),
CONSTRAINT PROGRAM_FACULTY_FK FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY (FACULTY_ID)
);

-- Table 8 - STUDENT_LEVEL
CREATE TABLE STUDENT_LEVEL(
LEVEL_ID NUMBER(1) NOT NULL, 
LEVEL_NAME VARCHAR2(30) NOT NULL, 
CONSTRAINT STUDENT_LEVEL_PK PRIMARY KEY(LEVEL_ID)
);

-- Table 9 - BLOCK
CREATE TABLE BLOCK(
BLOCK_ID CHAR(1) NOT NULL,
MANAGER_ID VARCHAR2(4),
BLOCK_LEVEL NUMBER(1) NOT NULL,
BLOCK_GENDER CHAR(1) NOT NULL,
CONSTRAINT CHECK_IN_FORM_PK PRIMARY KEY (BLOCK_ID),
CONSTRAINT BLOCK_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID)
);

-- Table 10 - STUDENT_ROOM
CREATE TABLE STUDENT_ROOM(
STUDENT_ROOM_ID VARCHAR2(4) NOT NULL,
BLOCK_ID CHAR1(1),
STUDENT_ROOM_LEVEL NUMBER(1) NOT NULL,
CAPACITY NUMBER(1) NOT NULL,
CONSTRAINT STUDENT_ROOM_PK PRIMARY KEY (STUDENT_ROOM_ID),
CONSTRAINT STUDENT_ROOM_BLOCK_FK FOREIGN KEY (BLOCK_ID) REFERENCES BLOCK (BLOCK_ID)
);

-- Table 11 - STUDENT
CREATE TABLE STUDENT(
STUDENT_ID VARCHAR2(10) NOT NULL,
GUARDIAN_ID VARCHAR2(10),
STUDENT_ROOM_ID VARCHAR2(4),
MANAGER_ID VARCHAR2(4),
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(100) NOT NULL,
PHONE_NO VARCHAR2(25) NOT NULL,
IC VARCHAR2(12) NOT NULL,
GENDER CHAR(1) NOT NULL,
RACE VARCHAR2(30) NOT NULL,
RELIGION VARCHAR2(30) NOT NULL,
NATIONALITY VARCHAR2(30) NOT NULL,
FACULTY_ID VARCHAR2(2),
PROGRAM_ID VARCHAR2(5),
LEVEL_ID NUMBER(1),
CONSTRAINT STUDENT_PK PRIMARY KEY (STUDENT_ID),
CONSTRAINT STUDENT_GUARDIAN_FK FOREIGN KEY (GUARDIAN_ID) REFERENCES GUARDIAN (GUARDIAN_ID),
CONSTRAINT STUDENT_STUDENT_ROOM_FK FOREIGN KEY (STUDENT_ROOM_ID) REFERENCES STUDENT_ROOM (STUDENT_ROOM_ID),
CONSTRAINT STUDENT_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID),
CONSTRAINT STUDENT_FACULTY_FK FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY (FACULTY_ID),
CONSTRAINT STUDENT_PROGRAM_FK FOREIGN KEY (PROGRAM_ID) REFERENCES PROGRAM (PROGRAM_ID),
CONSTRAINT STUDENT_LEVEL_FK FOREIGN KEY (LEVEL_ID) REFERENCES STUDENT_LEVEL (LEVEL_ID)
);

-- Table 12 - CHECK_IN_FORM
CREATE TABLE CHECK_IN_FORM(
FORM_ID NUMBER(10) NOT NULL,
STUDENT_ID VARCHAR2(10),
STAFF_ID VARCHAR2(6),
STATUS NUMBER(1) NOT NULL,
DATE_TIME TIMESTAMP,
DESCRIPTION LONG NOT NULL,
CONSTRAINT CHECK_IN_FORM_PK PRIMARY KEY (FORM_ID),
CONSTRAINT CIF_STUDENT_ID_FK FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (STUDENT_ID),
CONSTRAINT CIF_STAFF_ID_FK FOREIGN KEY (STAFF_ID) REFERENCES OFFICE_STAFF (STAFF_ID)
);

-- Table 13 - JTK_DEPARTMENT
CREATE TABLE JTK_DEPARTMENT(
DEPARTMENT_ID VARCHAR2(10) NOT NULL,
DEPARTMENT_NAME VARCHAR2(40) NOT NULL,
CONSTRAINT JTK_DEPARTMENT_PK PRIMARY KEY(DEPARTMENT_ID)
);

-- Table 14 - JTK
CREATE TABLE JTK(
JTK_ID VARCHAR2(15) NOT NULL,
STUDENT_ID VARCHAR2(10),
MANAGER_ID VARCHAR2(4),
DEPARTMENT_ID VARCHAR2(10),
POSITION VARCHAR2(50) NOT NULL,
CONSTRAINT JTK_PK PRIMARY KEY (JTK_ID),
CONSTRAINT JTK_STUDENT_FK FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (STUDENT_ID),
CONSTRAINT JTK_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID),
CONSTRAINT JTK_DEPARTMENT_FK FOREIGN KEY (DEPARTMENT_ID) REFERENCES JTK_DEPARTMENT (DEPARTMENT_ID)
);

-- Table 15 - COLLEGE ACTIVITY
CREATE TABLE COLLEGE_ACTIVITY(
ACTIVITY_ID NUMBER(8) NOT NULL,
DEPARTMENT_ID VARCHAR2(10),
MANAGER_ID VARCHAR2(4),
NAME VARCHAR2(50) NOT NULL,
NUMBER_OF_COMMITTEE NUMBER(3) NOT NULL,
START_DATE TIMESTAMP NOT NULL,
END_DATE TIMESTAMP NOT NULL,
EXPENSES FLOAT NOT NULL,
DESCRIPTION LONG NOT NULL,
CONSTRAINT COLLEGE_ACTIVITY_PK PRIMARY KEY (ACTIVITY_ID),
CONSTRAINT COLLEGE_ACTIVITY_DEPARTMENT_FK FOREIGN KEY (DEPARTMENT_ID) REFERENCES JTK_DEPARTMENT (DEPARTMENT_ID),
CONSTRAINT COLLEGE_ACTIVITY_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID)
);

-- Table 16 - COLLEGE_ACTIVITY_ENROLLMENT
CREATE TABLE COLLEGE_ACTIVITY_ENROLLMENT(
ACTIVITY_ID NUMBER(8) NOT NULL,
STUDENT_ID VARCHAR2(10) NOT NULL,
ROLE VARCHAR2(50) NOT NULL,
CONSTRAINT CAE_PK PRIMARY KEY (ACTIVITY_ID, STUDENT_ID),
CONSTRAINT CAE_ACTIVITY_FK FOREIGN KEY (ACTIVITY_ID) REFERENCES COLLEGE_ACTIVITY (ACTIVITY_ID)
CONSTRAINT CAE_STUDENT_FK FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (STUDENT_ID)
);

-- Table 17 - WATER_DISPENSER
CREATE TABLE WATER_DISPENSER(
DISPENSER_ID NUMBER(2) NOT NULL,
BLOCK_ID CHAR(1),
MANAGER_ID VARCHAR(4),
PRICE FLOAT NOT NULL,
CONDITION NUMBER(1) NOT NULL,
CONSTRAINT WATER_DISPENSER_PK PRIMARY KEY (DISPENSER_ID),
CONSTRAINT WATER_DISPERNSER_BLOCK_FK FOREIGN KEY (BLOCK_ID) REFERENCES BLOCK (BLOCK_ID),
CONSTRAINT WATER_DISPENSER_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID)
);

-- Table 18 - VENDING_MACHINE
CREATE TABLE VENDING_MACHINE(
MACHINE_ID NUMBER(5) NOT NULL,
MANAGER_ID VARCHAR2(4),
VENDOR_ID VARCHAR2(4),
PLACEMENT_FEE FLOAT NOT NULL,
CONSTRAINT VENDING_MACHINE_PK PRIMARY KEY (MACHINE_ID),
CONSTRAINT VENDING_MACHINE_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID),
CONSTRAINT VENDING_MACHINE_VENDOR_FK FOREIGN KEY (VENDOR_ID) REFERENCES VENDOR (VENDOR_ID)
);

-- Table 19 - SPECIAL_ROOM
CREATE TABLE SPECIAL_ROOM(
SPECIALROOM_ID VARCHAR2(5) NOT NULL,
SPECIALROOM_NAME VARCHAR2(50) NOT NULL,
SPECIALROOM_DESCRIPTION LONG NOT NULL,
SPECIALROOM_CAPACITY NUMBER(3) NOT NULL,
CONSTRAINT SPECIAL_ROOM_PK PRIMARY KEY(SPECIALROOM_ID)
);

-- Table 20 - VENUE_BOOKING
CREATE TABLE VENUE_BOOKING(
STUDENT_ID VARCHAR2(10) NOT NULL,
SPECIALROOM_ID VARCHAR2(4) NOT NULL,
BOOKING_TIME TIMESTAMP NOT NULL,
MANAGER_ID VARCHAR2(4),
START_DATE_TIME TIMESTAMP NOT NULL,
END_DATE_TIME TIMESTAMP NOT NULL,
NO_OF_PEOPLE NUMBER(3) NOT NULL,
USAGE LONG NOT NULL,
CONSTRAINT VB_PK PRIMARY KEY (STUDENT_ID, SPECIALROOM_ID, BOOKING_TIME),
CONSTRAINT VB_STUDENT_FK FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (STUDENT_ID),
CONSTRAINT VB_SPECIALROOM_FK FOREIGN KEY (SPECIALROOM_ID) REFERENCES SPECIAL_ROOM (SPECIALROOM_ID),
CONSTRAINT VB_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID)
);

-- Table 21 - STOREROOM
CREATE STOREROOM(
STOREROOM_ID VARCHAR2(4 BYTE) NOT NULL,
MANAGER_ID VARCHAR2(4) NOT NULL,
STOREROOM_NAME VARCHAR2(50) NOT NULL,
CAPACITY NUMBER(4) NOT NULL,
CONSTRAINT SHOP_PK PRIMARY KEY (SHOP_ID),
CONSTRAINT STOREROOM_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID),
);

-- Table 22 - COLLEGE_INVENTORY
CREATE TABLE COLLEGE_INVENTORY(
INVENTORY_ID VARCHAR2(4) NOT NULL,
STAFF_ID VARCHAR2(6),
STOREROOM_ID VARCHAR2(4),
STATUS NUMBER(1) NOT NULL,
CONSTRAINT COLLEGE_INVENTORY_PK PRIMARY KEY (INVENTORY_ID),
CONSTRAINT COLLEGE_INVENTORY_STAFF_FK FOREIGN KEY (STAFF_ID) REFERENCES OFFICE_STAFF (STAFF_ID),
CONSTRAINT COLLEGE_INVENTORY_STOREROOM_FK FOREIGN KEY (STOREROOM_ID) REFERENCES STOREROOM (STOREROOM_ID)
);

-- Table 23 - VENDOR
CREATE TABLE VENDOR(
VENDOR_ID VARCHAR2(4) NOT NULL,
MANAGER_ID VARCHAR2(4) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(100) NOT NULL,
PHONE_NO VARCHAR2(25) NOT NULL,
IC VARCHAR2(12) NOT NULL,
GENDER CHAR(1) NOT NULL,
RACE VARCHAR2(30) NOT NULL,
NATIONALITY VARCHAR2(30) NOT NULL,
CERTIFICATE NUMBER(2) NOT NULL,
TYPE VARCHAR2(20) NOT NULL,
CONSTRAINT VENDOR_PK PRIMARY KEY (VENDOR_ID),
CONSTRAINT VENDOR_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID),
);

-- Table 24 - STALL
CREATE TABLE STALL(
STALL_ID VARCHAR2(6 BYTE) NOT NULL,
MANAGER_ID VARCHAR2(4) NOT NULL,
VENDOR_ID VARCHAR2(4) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
SIZE FLOAT NOT NULL,
TYPE VARCHAR2(20) NOT NULL,
RENTAL_FEE FLOAT NOT NULL,
CONSTRAINT STALL_PK PRIMARY KEY (STALL_ID),
CONSTRAINT STALL_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID),
CONSTRAINT STALL_VENDOR_FK FOREIGN KEY (VENDOR_ID) REFERENCES VENDOR (VENDOR_ID),
);

-- Table 25 - SHOP
CREATE TABLE SHOP(
SHOP_ID VARCHAR2(5 BYTE) NOT NULL,
MANAGER_ID VARCHAR2(4) NOT NULL,
VENDOR_ID VARCHAR2(4) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
DESCRIPTION LONG NOT NULL,
RENTAL_FEE FLOAT NOT NULL,
CONSTRAINT SHOP_PK PRIMARY KEY (SHOP_ID),
CONSTRAINT SHOP_MANAGER_FK FOREIGN KEY (MANAGER_ID) REFERENCES RESIDENTIAL_MANAGER (MANAGER_ID),
CONSTRAINT SHOP_VENDOR_FK FOREIGN KEY (VENDOR_ID) REFERENCES VENDOR (VENDOR_ID),
);

-- Inserting values into tables

-- Table 1 - RESIDENTIAL_MANAGER
INSERT INTO RESIDENTIAL_MANAGER (manager_id, name, email, phone_no, ic, gender, race, religion, nationality, salary) VALUES ('M001', 'Roziana binti Zukmail', 'roziana@um.my', '60124584615', '901211054876', 'F', 'Malay', 'Islam', 'Malaysia', 6000);

-- Table 2 - ASSISTANT_DOMESTIC_MANAGER
INSERT INTO ASSISTANT_DOMESTIC_MANAGER (assistant_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, salary) VALUES ('AM001', 'M001', 'Iifah binti Zakmin', 'iif@um.my', '60145672206', '920506044940', 'F', 'Malay', 'Islam', 'Malaysia', 4000);
INSERT INTO ASSISTANT_DOMESTIC_MANAGER (assistant_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, salary) VALUES ('AM002', 'M001', 'Lim Hong Yu', 'lhy@um.my', '601116842659', '930517054651', 'M', 'Chinese', 'Buddhism', 'Malaysia', 4000);

-- Table 3 - OFFICE_STAFF
INSERT INTO OFFICE_STAFF (staff_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, role, salary) VALUES ('STF001', 'M001', 'Dhashina A?P Kushima', 'dha@hotmail.com', '601846522919', '840417069854', 'F', 'Indian', 'Hinduism', 'Malaysia', 'secretary', 4000);
INSERT INTO OFFICE_STAFF (staff_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, role, salary) VALUES ('STF002', 'M001', 'Kiran bin Zumaid', 'kiran@gmail.com', '60175626413', '881230074863', 'M', 'Malay', 'Islam', 'Malaysia', 'secretary', 4000);
INSERT INTO OFFICE_STAFF (staff_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, role, salary) VALUES ('STF003', 'M001', 'Suzan Lee', 'suzan@gmail.com', '60135264884', '901014068946', 'F', 'Chinese', 'Buddhism', 'Malaysia', 'treasurer', 4000);
INSERT INTO OFFICE_STAFF (staff_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, role, salary) VALUES ('STF004', 'M001', 'Qishiwee A/P Groal', 'qsw@gmail.com', '601149562675', '920607059462', 'F', 'Indian', 'Christianity', 'Malaysia', 'treasure', 4000);
INSERT INTO OFFICE_STAFF (staff_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, role, salary) VALUES ('STF005', 'M001', 'Muaza bin Hamid', 'muaz@gmail.com', '60195946524', '920227046031', 'M', 'Malay', 'Islam', 'Malaysia', 'mail clerk', 3500);
INSERT INTO OFFICE_STAFF (staff_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, role, salary) VALUES ('STF006', 'M001', 'Husnai binti Huam', 'husna@gmail.com', '60184658452', '950420014954', 'F', 'Malay', 'Islam', 'Malaysia', 'civilian staff', 3500);
INSERT INTO OFFICE_STAFF (staff_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, role, salary) VALUES ('STF007', 'M001', 'Ooi Huan', 'huanooi@gmail.com', '60104981646', '890708046594', 'F', 'Chinese', 'Buddhism', 'Malaysia', 'civillian staff', 3500);
INSERT INTO OFFICE_STAFF (staff_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, role, salary) VALUES ('STF008', 'M001', 'Lim Yoong Jin', 'yoongj@gmail.com', '601141481616', '880106059765', 'M', 'Chinese', 'Buddhism', 'Malaysia', 'technician', 3500);
INSERT INTO OFFICE_STAFF (staff_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, role, salary) VALUES ('STF009', 'M001', 'Minah binti Zulmail', 'mmin@gmail.com', '601105481248', '910409125600', 'F', 'Malay', 'Islam', 'Malaysia', 'technician', 3500);
INSERT INTO OFFICE_STAFF (staff_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, role, salary) VALUES ('STF010', 'M001', 'Afiq bin Aqiran', 'afiq@hotmail.com', '60108415448', '940514098469', 'M', 'Malay', 'Islam', 'Malaysia', 'driver', 3000);
INSERT INTO OFFICE_STAFF (staff_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, role, salary) VALUES ('STF011', 'M001', 'Jeetra A/L Yutriyan', 'jee@gmail.com', '60164811545', '950109054961', 'M', 'Indian', 'Christianity', 'Malaysia', 'driver', 3000);

-- Table 4 - CLEANER
INSERT INTO CLEANER (cleaner_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, salary) VALUES ('C001', 'M001', 'Qurina A/P Jutrinah', 'qurina@yahoo.com', '6010751545', '890830048462', 'F', 'Indian', 'Christianity', 'Malaysia', 3000);
INSERT INTO CLEANER (cleaner_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, salary) VALUES ('C002', 'M001', 'Kamiliano binti Haitulniza', 'kamil@gmail.com', '6017448115', '840515040946', 'F', 'Malay', 'Islam', 'Malaysia', 2500);
INSERT INTO CLEANER (cleaner_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, salary) VALUES ('C003', 'M001', 'Yeoh Yin Shan', 'yeohys@yahoo.com', '6013598474', '860323056424', 'F', 'Chinese', 'Christianity', 'Malaysia', 2500);
INSERT INTO CLEANER (cleaner_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, salary) VALUES ('C004', 'M001', 'Sarah binti Muzaki', 'sarah@gmail.com', '60128468264', '870526054950', 'F', 'Malay', 'Islam', 'Malaysia', 2500);
INSERT INTO CLEANER (cleaner_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, salary) VALUES ('C005', 'M001', 'Danial Lim', 'danial@gmail.com', '601148262234', '860419154945', 'M', 'Chinese', 'Buddhism', 'Malaysia', 2500);
INSERT INTO CLEANER (cleaner_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, salary) VALUES ('C006', 'M001', 'Sitruya A/L Gunalingan', 'sitru@gmail.com', '60148532481', '901214054691', 'M', 'Indian', 'Hinduism', 'Malaysia', 2500);
INSERT INTO CLEANER (cleaner_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, salary) VALUES ('C007', 'M001', 'Kumailah bin Turaya', 'kumail@gmail.com', '60179563453', '921111054963', 'M', 'Malay', 'Islam', 'Malaysia', 2500);
INSERT INTO CLEANER (cleaner_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, salary) VALUES ('C008', 'M001', 'Privanin A/L Rujatee', 'privan@gmail.com', '60198635890', '891106074961', 'M', 'Indian', 'Buddhism', 'Malaysia', 2500);

-- Table 5 - GUARDIAN
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (1, 'Ahmad bin Hamad', 'ahmad@gmail.com', '60145563374', '751002020631', 'M', 'Malay', 'Islam', 'Malaysia', 'Father', 8000);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (2, 'Lim Su Lian', 'lim@gmail.com', '60145694328', '716504080024', 'F', 'Chinese', 'Buddhism', 'Malaysia', 'Mother', 0);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (5, 'Lee Tian Huat', 'lee@gmail.com', '601731244556', '530205075699', 'M', 'Chinese', 'Buddhism', 'Malaysia', 'Grandfather', 3000);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (3, 'Raj A/L Jeesha', 'raj@hotmail.com', '601115480546', '780424084627', 'M', 'Indian', 'Hinduism', 'Malaysia', 'Father', 5900);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (23, 'Roslan binti Aiman', 'ros@yahoo.com', '60185691545', '690917070046', 'F', 'Malay', 'Islam', 'Malaysia', 'Mother', 6450);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (4, 'Khoo Xian Ling', 'xlkhoo@gmail.com', '60175222622', '751015024617', 'M', 'Chinese', 'Buddhism', 'Malaysia', 'Father', 7500);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (67, 'Reetha A/L Tirash', 'ree@gmail.com', '60164580126', '770929064153', 'M', 'Indian', 'Christianity', 'Malaysia', 'Father', 3800);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (32, 'Ahmad bin Hairul', 'ahmad74@hotmail.com', '60176268145', '741028094511', 'M', 'Malay', 'Islam', 'Malaysia', 'Father', 4900);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (7, 'Fatimah binti Naraj', 'fatimah03@yahoo.com', '60164852029', '770440507048', 'F', 'Malay', 'Islam', 'Malaysia', 'Mother', 5400);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (34, 'Lim Ying Wah', 'yingw@gmail.com', '60154862614', '740218045164', 'F', 'Chinese', 'Buddhism', 'Malaysia', 'Mother', 5000);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (45, 'Jordan Eglane', 'joradan@gmail.com', '60154561856', '680714094561', 'M', 'Iban', 'Christianity', 'Malaysia', 'Father', 9500);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (12, 'Syarifia binti Zul', 'syar@hotmail.com', '60134859467', '580426054896', 'F', 'Malay', 'Islam', 'Malaysia', 'Grandmother', 0);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (75, 'Tan Kok Hong', 'tkh@yahoo.com', '60185623144', '781218046511', 'M', 'Chinese', 'Buddhism', 'Malaysia', 'Uncle', 4500);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (89, 'Zulamin Krusian', 'zul@gmail.com', '60194816265', '720102116547', 'M', 'Kadazan', 'Christianity', 'Malaysia', 'Uncle', 6800);
INSERT INTO GUARDIAN (guardian_id, name, email, phone_no, ic, gender, race, religion, nationality, relationship, salary) VALUES (52, 'Leo Floranti', 'leo@gmail.com', '60174482966', '730523054658', 'F', 'Iban', 'Christianity', 'Malaysia', 'Mother', 10400);

-- Table 6 - FACULTY
INSERT INTO FACULTY (faculty_id, faculty_name) VALUES ('W', 'Faculty of Computer Science and Information Technology');
INSERT INTO FACULTY (faculty_id, faculty_name) VALUES ('C', 'Faculty of Law');
INSERT INTO FACULTY (faculty_id, faculty_name) VALUES ('H', 'Faculty of Engineering');
INSERT INTO FACULTY (faculty_id, faculty_name) VALUES ('L', 'Faculty of Language and Linguistic');
INSERT INTO FACULTY (faculty_id, faculty_name) VALUES ('E', 'Faculty of Education');
INSERT INTO FACULTY (faculty_id, faculty_name) VALUES ('B', 'Faculty of Business and Economic');
INSERT INTO FACULTY (faculty_id, faculty_name) VALUES ('M', 'Faculty of Medicine');
INSERT INTO FACULTY (faculty_id, faculty_name) VALUES ('A', 'Faculty of Arts and Social Science');
INSERT INTO FACULTY (faculty_id, faculty_name) VALUES ('S', 'Faculty of Sports and Exercise Science');
INSERT INTO FACULTY (faculty_id, faculty_name) VALUES ('D', 'Faculty of Dentistry');

-- Table 7 - PROGRAM
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('WIH', 'W', 'Data Science');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('CAA', 'C', 'Law');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('HET', 'H', 'Civil Engineering');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('LAE', 'L', 'Asian and European Language');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('EEC', 'E', 'Early Childhood Education');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('BACC', 'B', 'Accounting');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('MNS', 'M', 'Nursing Science');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('AGEO', 'A', 'Geography');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('SSM', 'S', 'Sports Management');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('DRD', 'D', 'Restorative Dentistry');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('WIC', 'W', 'Artificial Intelligence');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('HCE', 'H', 'Chemical Engineering');
INSERT INTO PROGRAM (program_id, faculty_id, program_name) VALUES ('BFIN', 'B', 'Finance');

-- Table 8 - STUDENT_LEVEL
INSERT INTO STUDENT_LEVEL (level_id, level_name) VALUES ('3', 'Undergraduate-Year3');
INSERT INTO STUDENT_LEVEL (level_id, level_name) VALUES ('2', 'Undergraduate-Year2');
INSERT INTO STUDENT_LEVEL (level_id, level_name) VALUES ('1', 'Undergraduate-Year1');
INSERT INTO STUDENT_LEVEL (level_id, level_name) VALUES ('4', 'Undergraduate-Year4');

-- Table 9 - BLOCK
INSERT INTO BLOCK(block_id, manager_id, block_level, block_gender) VALUES ('A', 'M001', 7, 'M');
INSERT INTO BLOCK(block_id, manager_id, block_level, block_gender) VALUES ('B', 'M001', 7, 'M');
INSERT INTO BLOCK(block_id, manager_id, block_level, block_gender) VALUES ('C', 'M001', 9, 'F');
INSERT INTO BLOCK(block_id, manager_id, block_level, block_gender) VALUES ('D', 'M001', 9, 'F');

-- Table 10 - STUDENT_ROOM
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('A102', 'A', 1, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('A112', 'B', 2, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('A210', 'C', 5, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('A702', 'D', 7, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('B101', 'C', 2, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('B216', 'B', 4, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('B407', 'D', 8, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('C203', 'A', 7, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('C212', 'A', 7, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('C212', 'D', 9, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('C512', 'D', 3, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('D303', 'A', 2, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('D702', 'B', 1, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('D715', 'C', 2, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('D804', 'D', 7, 2);
INSERT INTO STUDENT_ROOM(student_room_id, block_id, student_room_level, capacity) VALUES ('D903', 'A', 1, 2);

-- Table 11 - STUDENT
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2012734', 1, 'A102', 'M001', 'Ali bin Ahmad', 'ali@gmail.com', 60126663374, 010101020101, 'M', 'Malay', 'Islam', 'Malaysian', 'W', 'WIH', 3);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2101833', 2, 'B216', 'M001', 'Yoon Jeong Han', 'yoonjh@gmail.com', 60175691388, 021004081003, 'M', 'Chinese', 'Buddhism', 'Malaysian', 'C', 'CAA', 2);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2220009', 5, 'C512', 'M001', 'Susan Lee Ai', 'sus@gmail.com', 601113234526, 031110075544, 'F', 'Chinese', 'Christianity', 'Malaysian', 'H', 'HET', 1);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2102822', 3, 'D715', 'M001', 'Keeshave A/P Raj', 'kshav@hotmali.com', 60105644812, 010114055524, 'F', 'Indian', 'Hinduism', 'Malaysian', 'L', 'LAE', 2);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2234103', 23, 'C212', 'M001', 'Nurin Farah binti Roslan', 'farah@yahoo.com', 60124558361, 030305070056, 'F', 'Malay', 'Islam', 'Malaysian', 'E', 'EEC', 1);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2230592', 4, 'B407', 'M001', 'Khoo Ming Hao', 'khmhao@gmail.com', 60132548923, 030824025567, 'M', 'Chinese', 'Buddhism', 'Malaysian', 'B', 'BACC', 1);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2203233', 34, 'D804', 'M001', 'Botiza Aniston', 'botizanavau@hotmail.com', 60151548266, 011015089916, 'F', 'Kadazan', 'Islam', 'Malaysian', 'B', 'BFIN', 1);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('S2204569', 67, 'A702', 'M001', 'Kathri A/L Reetha', 'kathri1111@gmail.com', 60145631956, 030929067819, 'M', 'Indian', 'Christianity', 'Malaysian', 'M', 'MNS', 1);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U1905434', 32, 'D903', 'M001', 'Nur Aisya binti Ahmad', 'nuraisyalove@hotmail.com', 60174522273, 001205094516, 'F', 'Malay', 'Islam', 'Malaysian', 'A', 'AGEO', 4);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2205393', 23, 'C212', 'M001', 'Nurin Farhanah binti Roslan', 'farhanah03@yahoo.com', 60124759374, 030305070054, 'F', 'Malay', 'Islam', 'Malaysian', 'S', 'SSM', 1);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2105343', 7, 'D303', 'M001', 'Wong Ying Ying', 'wyy0804@gmail.com', 601128364422, 020804110546, 'F', 'Chinese', 'Buddhism', 'Malaysian', 'D', 'DRD', 2);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('S2023021', 45, 'A210', 'M001', 'Jokerson Jembu', 'jokerjembu@yahoo.com', 60125484623, 010604084621, 'M', 'Iban', 'Christianity', 'Malaysian', 'W', 'WIC', 3);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2204325', 12, 'B101', 'M001', 'Amir bin Zakir', 'amir@hotmail.com', 601114566287, 030530046567, 'M', 'Malay', 'Islam', 'Malaysian', 'H', 'HCE', 2);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('S2203194', 75, 'C203', 'M001', 'Liew Xiao Yan', 'xiaoy@gmail.com', 601115846336, 030127065846, 'F', 'Chinese', 'Buddhism', 'Malaysian', 'C', 'CAA', 1);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2284201', 89, 'D702', 'M001', 'Imulok Justin', 'imulok333@yahoo.com', 60194658126, 020430084600, 'F', 'Kadazan', 'Christianity', 'Malaysian', 'W', 'WIC', 1);
INSERT INTO STUDENT(student_id, guardian_id, student_room_id, manager_id, name, email, phone_no, ic, gender, race, religion, nationality, faculty_id, program_id, level_id) VALUES ('U2239430', 52, 'A112', 'M001', 'Edward Jelani', 'edward.j@gmail.com', 60135496485, 031208040016, 'M', 'Iban', 'Christianity', 'Malaysian', 'H', 'HET', 1);

-- Table 12 - CHECK_IN_FORM
INSERT INTO CHECK_IN_FORM(form_id, student_id, staff_id, status, date_time, description) VALUES (0001, 'U2012734', 'STF005', 1, '12-OCT-2022 08:21:59', 'None');
INSERT INTO CHECK_IN_FORM(form_id, student_id, staff_id, status, date_time, description) VALUES (0045, 'U2101833', 'STF005', 1, '12-OCT-2022 12:04:34', 'None');
INSERT INTO CHECK_IN_FORM(form_id, student_id, staff_id, status, date_time, description) VALUES (0023, 'S2204569', 'STF005', 1, '12-OCT-2022 09:04:51', 'None');
INSERT INTO CHECK_IN_FORM(form_id, student_id, staff_id, status, date_time, description) VALUES (0423, 'U2012734', 'STF005', 0, '23-DEC-2022 08:45:17', 'Luggage in room');
INSERT INTO CHECK_IN_FORM(form_id, student_id, staff_id, status, date_time, description) VALUES (0333, 'U2203233', 'STF005', 1, '01-DEC-2022 14:27:48', 'None');
INSERT INTO CHECK_IN_FORM(form_id, student_id, staff_id, status, date_time, description) VALUES (0098, 'S2204569', 'STF005', 1, '25-OCT-2022 15:37:15', 'None');
INSERT INTO CHECK_IN_FORM(form_id, student_id, staff_id, status, date_time, description) VALUES (0065, 'U2203233', 'STF005', 0, '20-OCT-2022 16:17:45', 'Luggage in room');
INSERT INTO CHECK_IN_FORM(form_id, student_id, staff_id, status, date_time, description) VALUES (0156, 'U2203233', 'STF005', 1, '03-NOV-2022 10:41:35', 'None');
INSERT INTO CHECK_IN_FORM(form_id, student_id, staff_id, status, date_time, description) VALUES (0241, 'S2204569', 'STF005', 0, '24-NOV-2022 17:41:46', 'Luggage in room');
INSERT INTO CHECK_IN_FORM(form_id, student_id, staff_id, status, date_time, description) VALUES (0197, 'U2204325', 'STF005', 1, '18-NOV-2022 15:01:29', 'None');

-- Table 13 - JTK_DEPARTMENT
INSERT INTO JTK_DEPARTMENT (department_id, department_name) VALUES ('KEP', 'Kerohanian dan Perpaduan');
INSERT INTO JTK_DEPARTMENT (department_id, department_name) VALUES ('ADIN', 'Akademik dan Intelektual');
INSERT INTO JTK_DEPARTMENT (department_id, department_name) VALUES ('SENI', 'Kesenian dan Kreativiti');
INSERT INTO JTK_DEPARTMENT (department_id, department_name) VALUES ('KEJARI', 'Keusahawanan dan Jaringan Industri');
INSERT INTO JTK_DEPARTMENT (department_id, department_name) VALUES ('SELASIH', 'Keselamatan dan Kesihatan');
INSERT INTO JTK_DEPARTMENT (department_id, department_name) VALUES ('KEMAS', 'Kebajikan dan Kemasyarakatan');
INSERT INTO JTK_DEPARTMENT (department_id, department_name) VALUES ('SUKREA', 'Sukan dan Rekreasi');
INSERT INTO JTK_DEPARTMENT (department_id, department_name) VALUES ('MEDIA', 'Multimedia');
INSERT INTO JTK_DEPARTMENT (department_id, department_name) VALUES ('SUKSIS', 'Sukarelawan Polis Siswa Siswi');
INSERT INTO JTK_DEPARTMENT (department_id, department_name) VALUES ('JTK', 'High Committee');

-- Table 14 - JTK
INSERT INTO JTK (jtk_id, student_id, manager_id, department_id, position) VALUES ('KEP001', 'U2012734', 'M001', 'KEP', 'Head of Department');
INSERT INTO JTK (jtk_id, student_id, manager_id, department_id, position) VALUES ('KEJARI001', 'U2101833', 'M001', 'KEJARI', 'Head of Department');
INSERT INTO JTK (jtk_id, student_id, manager_id, department_id, position) VALUES ('SUKSI003', 'U2234103', 'M001', 'SUKSIS', 'Treasurer');
INSERT INTO JTK (jtk_id, student_id, manager_id, department_id, position) VALUES ('KEMAS003', 'U2230592', 'M001', 'KEMAS', 'Secretary');
INSERT INTO JTK (jtk_id, student_id, manager_id, department_id, position) VALUES ('JTK001', 'U2203233', 'M001', 'JTK', 'President');
INSERT INTO JTK (jtk_id, student_id, manager_id, department_id, position) VALUES ('KEP010', 'U2205393', 'M001', 'KEP', 'Member');
INSERT INTO JTK (jtk_id, student_id, manager_id, department_id, position) VALUES ('JTK004', 'S2023021', 'M001', 'JTK', 'Secretary');
INSERT INTO JTK (jtk_id, student_id, manager_id, department_id, position) VALUES ('SUKREA002', 'S2203194', 'M001', 'SUKREA', 'Head of Department');
INSERT INTO JTK (jtk_id, student_id, manager_id, department_id, position) VALUES ('KEP005', 'U2284201', 'M001', 'KEP', 'Treasurer');

-- Table 15 - COLLEGE_ACTIVITY
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220201, 'JTK', 'M001', 'Introduction Day', 30, '30-OCT-2022', '12-OCT-2022', 50, 'introduction within jtk high commitees');
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220202, 'KEP', 'M001', 'Festival Kesenian dan Kebudayaan', 40, '29-JAN-2022', '29-JAN-2022', 80, 'chinese cultural festival');
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220203, 'ADIN', 'M001', 'Fun Reading Day', 10, '21-FEB-2022', '21-FEB-2022', 20, 'book donation and book sharing activity');
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220204, 'SENI', 'M001', 'Tarian Kreatif', 20, '31-AUG-2022', '31-AUG-2022', 50, 'traditional dance competition');
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220205, 'KEJARI', 'M001', 'Entrepreneurship Sharing Session', 30, '15-JUN-2022', '15-JUN-2022', 100, 'entrepreneurship sharing session with Mr. Shahidan about online and offline marketing in this digital era');
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220206, 'SELASIH', 'M001', 'School Safety Seminar', 10, '05-MAC-2022', '05-MAR-2022', 25, 'talks about dangers of socials media');
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220207, 'KEMAS', 'M001', 'Local Soup Kitchen Day', 30, '30-JUL-2022', '30-JUL-2022', 50, 'cook a meal at a local soup kitchen');
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220208, 'SUKREA', 'M001', 'Gemilang Games Royal', 20, '08-JUN-2022', '08-JUN-2022', 20, 'mobile games competition');
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220209, 'SUKREA', 'M001', 'Royal Mini Sukmum XII', 40, '25-SEP-2022', '25-SEP-2022', 50, 'sports competition');
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220210, 'SUKREA', 'M001', 'Bengkel Royal Media', 20, '05-OCT-2022', '05-OCT-2022', 50, 'graphic editing from basic to advance levels workshop');
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220211, 'SUKSIS', 'M001', 'Webinar Kebangsaan Suksis Prihatin', 20, '04-JAN-2022', '04-JAN-2022', 20, 'the role of students towards society in a pandemic situation covid-19');
INSERT INTO COLLEGE_ACTIVITY(activity_id, department_id, manager_id, name, number_of_committee, start_date, end_date, expenses, description) VALUES (20220212, 'JTK', 'M001', 'Gemilang Exhibition', 10, '04-JAN-2022', '04-JAN-2022', 30, 'know about projects available under 12th Residential College');

-- Table 16 - COLLEGE_ACTIVITY_ENROLLMENT
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220201, 'U2220009', 'committee');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220211, 'U2205393', 'participant');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220201, 'U2203233', 'committee');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220209, 'U2220009', 'participant');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220209, 'U2205393', 'committee');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220209, 'U2203233', 'participant');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220209, 'S2203194', 'participant');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220209, 'U2284201', 'committee');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220205, 'U2220009', 'participant');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220210, 'U2220009', 'participant');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220203, 'U2205393', 'participant');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220205, 'U1905434', 'committee');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220204, 'U2105343', 'committee');
INSERT INTO COLLEGE_ACTIVITY_ENROLLMENT(activity_id, student_id, role) VALUES (20220211, 'S2203194', 'committee');

-- Table 17 - WATER_DISPENSER
INSERT INTO WATER_DISPENSER(dispenser_id, block_id, manager_id, price, condition) VALUES (1, 'A', 'M001', 3250, 1);
INSERT INTO WATER_DISPENSER(dispenser_id, block_id, manager_id, price, condition) VALUES (2, 'B', 'M001', 3599, 1);
INSERT INTO WATER_DISPENSER(dispenser_id, block_id, manager_id, price, condition) VALUES (3, 'C', 'M001', 2880, 1);
INSERT INTO WATER_DISPENSER(dispenser_id, block_id, manager_id, price, condition) VALUES (4, 'D', 'M001', 3250, 1);
INSERT INTO WATER_DISPENSER(dispenser_id, block_id, manager_id, price, condition) VALUES (5, 'A', 'M001', 3599, 1);
INSERT INTO WATER_DISPENSER(dispenser_id, block_id, manager_id, price, condition) VALUES (6, 'B', 'M001', 2880, 1);
INSERT INTO WATER_DISPENSER(dispenser_id, block_id, manager_id, price, condition) VALUES (7, 'C', 'M001', 3599, 0);
INSERT INTO WATER_DISPENSER(dispenser_id, block_id, manager_id, price, condition) VALUES (8, 'D', 'M001', 3599, 1);

-- Table 18 - VENDING_MACHINE
INSERT INTO VENDING_MACHINE(machine_id, manager_id, vendor_id, placement_fee) VALUES ('VM002', 'M001', 'V018', 300);
INSERT INTO VENDING_MACHINE(machine_id, manager_id, vendor_id, placement_fee) VALUES ('VM003', 'M001', 'V001', 300);
INSERT INTO VENDING_MACHINE(machine_id, manager_id, vendor_id, placement_fee) VALUES ('VM004', 'M001', 'V017', 300);
INSERT INTO VENDING_MACHINE(machine_id, manager_id, vendor_id, placement_fee) VALUES ('VM005', 'M001', 'V003', 300);
INSERT INTO VENDING_MACHINE(machine_id, manager_id, vendor_id, placement_fee) VALUES ('VM006', 'M001', 'V001', 280);
INSERT INTO VENDING_MACHINE(machine_id, manager_id, vendor_id, placement_fee) VALUES ('VM008', 'M001', 'V003', 280);
INSERT INTO VENDING_MACHINE(machine_id, manager_id, vendor_id, placement_fee) VALUES ('VM001', 'M001', 'V014', 280);
INSERT INTO VENDING_MACHINE(machine_id, manager_id, vendor_id, placement_fee) VALUES ('VM007', 'M001', 'V017', 280);

-- Table 19 - SPECIAL_ROOM
INSERT INTO SPECIAL_ROOM(specialroom_id, specialroom_name, specialroom_description, specialroom_capacity) VALUES ('S021', 'Bilik Penyelia', 'None', 40);
INSERT INTO SPECIAL_ROOM(specialroom_id, specialroom_name, specialroom_description, specialroom_capacity) VALUES ('S002', 'Dewan Gemilang', 'None', 100);
INSERT INTO SPECIAL_ROOM(specialroom_id, specialroom_name, specialroom_description, specialroom_capacity) VALUES ('S013', 'The Cube', '8 tables, 30 chairs', 50);
INSERT INTO SPECIAL_ROOM(specialroom_id, specialroom_name, specialroom_description, specialroom_capacity) VALUES ('S003', 'Meeting Room 1', '1 whiteboard', 60);
INSERT INTO SPECIAL_ROOM(specialroom_id, specialroom_name, specialroom_description, specialroom_capacity) VALUES ('S008', 'Bilik Gerakan', '20 chairs', 50);
INSERT INTO SPECIAL_ROOM(specialroom_id, specialroom_name, specialroom_description, specialroom_capacity) VALUES ('S010', 'Bilik Tari', 'None', 40);
INSERT INTO SPECIAL_ROOM(specialroom_id, specialroom_name, specialroom_description, specialroom_capacity) VALUES ('S015', 'Meeting Room 2', '1 whiteboard', 60);
INSERT INTO SPECIAL_ROOM(specialroom_id, specialroom_name, specialroom_description, specialroom_capacity) VALUES ('S007', 'Meeting Room 3', '1 whiteboard', 60);

-- Table 20 - VENUE_BOOKING
INSERT INTO VENUE_BOOKING(student_id, specialroom_id, booking_time, manager_id, start_date_time, end_date_time, no_of_people, usage) VALUES ('U1905434', 'S008', '30-MAY-2022 14:05:31', 'M001', '15-JUN-2022 10:00:00', '15-JUN-2022 12:00:00', 40, 'Entrepreneurship Sharing Session');
INSERT INTO VENUE_BOOKING(student_id, specialroom_id, booking_time, manager_id, start_date_time, end_date_time, no_of_people, usage) VALUES ('U2105343', 'S010', '20-JUL-2022 11:25:37', 'M001', '31-AUG-2022 08:30:00', '31-AUG-2022 11:30:00', 30, 'Tarian Kreatif');
INSERT INTO VENUE_BOOKING(student_id, specialroom_id, booking_time, manager_id, start_date_time, end_date_time, no_of_people, usage) VALUES ('U2205393', 'S007', '17-AUG-2022 10:29:31', 'M001', '09-OCT-2022 16:00:00', '09-OCT-2022 18:00:00', 30, 'meeting');
INSERT INTO VENUE_BOOKING(student_id, specialroom_id, booking_time, manager_id, start_date_time, end_date_time, no_of_people, usage) VALUES ('U2203233', 'S021', '18-OCT-2022 15:20:49', 'M001', '25-OCT-2022 08:00:00', '25-OCT-2022 10:00:00', 30, 'meeting');
INSERT INTO VENUE_BOOKING(student_id, specialroom_id, booking_time, manager_id, start_date_time, end_date_time, no_of_people, usage) VALUES ('U2203233', 'S002', '20-OCT-2022 17:21:59', 'M001', '30-OCT-2022 08:00:00', '30-OCT-2022 17:00:00', 30, 'Introduction Day');
INSERT INTO VENUE_BOOKING(student_id, specialroom_id, booking_time, manager_id, start_date_time, end_date_time, no_of_people, usage) VALUES ('S2023021', 'S013', '20-OCT-2022 17:30:00', 'M001', '31-OCT-2022 14:00:00', '31-OCT-2022 16:00:00', 30, 'meeting');
INSERT INTO VENUE_BOOKING(student_id, specialroom_id, booking_time, manager_id, start_date_time, end_date_time, no_of_people, usage) VALUES ('U2204325', 'S003', '20-NOV-2022 13:42:33', 'M001', '26-NOV-2022 13:00:00', '26-NOV-2022 15:30:00', 40, 'meeting');
INSERT INTO VENUE_BOOKING(student_id, specialroom_id, booking_time, manager_id, start_date_time, end_date_time, no_of_people, usage) VALUES ('U2220009', 'S015', '20-NOV-2022 14:05:30', 'M001', '28-NOV-2022 15:30:00', '28-NOV-2022 17:00:00', 30, 'meeting');

-- Table 21 - STOREROOM
INSERT INTO STOREROOM(storeroom_id, manager_id, storeroom_name, storeroom_capacity) VALUES ('R002', 'M001', 'Sport Room', 40);
INSERT INTO STOREROOM(storeroom_id, manager_id, storeroom_name, storeroom_capacity) VALUES ('R003', 'M001', 'Art Sport Room', 40);
INSERT INTO STOREROOM(storeroom_id, manager_id, storeroom_name, storeroom_capacity) VALUES ('R009', 'M001', 'Music Supply Room', 40);
INSERT INTO STOREROOM(storeroom_id, manager_id, storeroom_name, storeroom_capacity) VALUES ('R004', 'M001', 'Logistic Room', 40);
INSERT INTO STOREROOM(storeroom_id, manager_id, storeroom_name, storeroom_capacity) VALUES ('R005', 'M001', 'Food Service Room', 40);
INSERT INTO STOREROOM(storeroom_id, manager_id, storeroom_name, storeroom_capacity) VALUES ('R006', 'M001', 'Furniture Room', 40);
INSERT INTO STOREROOM(storeroom_id, manager_id, storeroom_name, storeroom_capacity) VALUES ('R007', 'M001', 'Office Supply Room', 40);
INSERT INTO STOREROOM(storeroom_id, manager_id, storeroom_name, storeroom_capacity) VALUES ('R008', 'M001', 'Medical Supply Room', 40);

-- Table 22 - COLLEGE_INVENTORY
INSERT INTO COLLEGE_INVENTORY(inventory_id, staff_id, storeroom_id, status) VALUES ('I012', 'STF001', 'R002', 1);
INSERT INTO COLLEGE_INVENTORY(inventory_id, staff_id, storeroom_id, status) VALUES ('I001', 'STF002', 'R003', 1);
INSERT INTO COLLEGE_INVENTORY(inventory_id, staff_id, storeroom_id, status) VALUES ('I002', 'STF003', 'R004', 1);
INSERT INTO COLLEGE_INVENTORY(inventory_id, staff_id, storeroom_id, status) VALUES ('I011', 'STF004', 'R005', 1);
INSERT INTO COLLEGE_INVENTORY(inventory_id, staff_id, storeroom_id, status) VALUES ('I003', 'STF005', 'R006', 1);
INSERT INTO COLLEGE_INVENTORY(inventory_id, staff_id, storeroom_id, status) VALUES ('I004', 'STF006', 'R007', 1);
INSERT INTO COLLEGE_INVENTORY(inventory_id, staff_id, storeroom_id, status) VALUES ('I005', 'STF007', 'R008', 1);
INSERT INTO COLLEGE_INVENTORY(inventory_id, staff_id, storeroom_id, status) VALUES ('I006', 'STF008', 'R009', 1);

-- Table 23 - VENDOR
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V001', 'M001', 'Fatimah binti Roslan', 'fatimah@gmail.com', 60126321575, 771112043204, 'F', 'Malay', 'Malaysia', 1, 'stall');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V002', 'M001', 'Daisy Lee Mei', 'lm@gmail.com', 60135442344, 820524051004, 'F', 'Chinese', 'Malaysia', 2, 'stall');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V003', 'M001', 'Pravin Raj A/L Aakash', 'pvr123@gmail.com', 60171242297, 800406082345, 'M', 'Indian', 'Malaysia', 3, 'stall');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V005', 'M001', 'Abu bin Upin', 'abupin@gmail.com', 601177728212, 800412070117, 'M', 'Malay', 'Malaysia', 1, 'stall');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V007', 'M001', 'Muhammad Aryan bin Ahmad', 'aryanlove@hotmail.com', 60125563843, 810108080007, 'M', 'Malay', 'Malaysia', 1, 'shop');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V010', 'M001', 'Abdullah Asif bin Rahman', 'abd.asif@gmail.com', 60172833268, 900203081191, 'M', 'Malay', 'Malaysia', 2, 'vending machine');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V013', 'M001', 'Aadarshini A/P Pravin', 'darshini@gmail.com', 60146782181, 930808070128, 'M', 'Indian', 'Malaysia', 1, 'stall');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V014', 'M001', 'Chew Sim Ying', 'chewschew@hotmail.com', 601188263927, 951004070118, 'F', 'Chinese', 'Malaysia', 2, 'stall');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V015', 'M001', 'Nur Damia binti Abu Bakar', 'damia727@gmail.com', 60196364727, 921030080046, 'F', 'Malay', 'Malaysia', 1, 'stall');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V017', 'M001', 'Ishaan A/L Hredhaan', 'ishaan___@gmail.com', 60172536727, 800506070125, 'M', 'Indian', 'Malaysia', 2, 'vending machine');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V018', 'M001', 'Boon Jun Hui', 'junhui0605@gmail.com', 601134547892, 960605080123, 'M', 'Chinese', 'Malaysia', 2, 'vending machine');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V019', 'M001', 'Nur Fateha binti Zikri', 'fatehahaha@gmail.com', 601172899327, 890904070112, 'F', 'Malay', 'Malaysia', 3, 'vending machine');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V020', 'M001', 'Ooi Xiao Ying', 'ying.ying@hotmail.com', 60195672562, 901011080098, 'F', 'Chinese', 'Malaysia', 2, 'vending machine');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V021', 'M001', 'Muhyiddin Amirul bin Abdul Raman', 'amirul1230@hotmail.com', 60125563843, 811230080187, 'M', 'Malay', 'Malaysia', 2, 'shop');
INSERT INTO VENDOR(vendor_id, manager_id, name, email, phone_no, ic, gender, race, nationality, certificate, type) VALUES ('V012', 'M001', 'Ramli bin Abdul Bakar', 'ranmliii@yahoo.com', 601173829876, 790812051723, 'M', 'Malay', 'Malaysia', 3, 'stall');

-- Table 24 - STALL
INSERT INTO STALL(stall_id, manager_id, vendor_id, name, stall_size, type, rental_fee) VALUES ('ST002', 'M001', 'V021', 'Daisys Drinks', 25, 'beverage', 250);
INSERT INTO STALL(stall_id, manager_id, vendor_id, name, stall_size, type, rental_fee) VALUES ('ST003', 'M001', 'V005', 'Nasi Fatimah', 35, 'malay food', 350);
INSERT INTO STALL(stall_id, manager_id, vendor_id, name, stall_size, type, rental_fee) VALUES ('ST005', 'M001', 'V002', 'Roti Roti Happy', 25, 'roti canai', 250);
INSERT INTO STALL(stall_id, manager_id, vendor_id, name, stall_size, type, rental_fee) VALUES ('ST007', 'M001', 'V013', 'Makan Sama2', 35, 'malay food', 350);
INSERT INTO STALL(stall_id, manager_id, vendor_id, name, stall_size, type, rental_fee) VALUES ('ST008', 'M001', 'V020', 'Chew's Chew', 35, 'western food', 350);
INSERT INTO STALL(stall_id, manager_id, vendor_id, name, stall_size, type, rental_fee) VALUES ('ST010', 'M001', 'V010', 'Healthy Fruits', 20, 'fruits', 200);
INSERT INTO STALL(stall_id, manager_id, vendor_id, name, stall_size, type, rental_fee) VALUES ('ST011', 'M001', 'V007', 'Ramli's Shawarma', 25, 'shawarma', 250);
INSERT INTO STALL(stall_id, manager_id, vendor_id, name, stall_size, type, rental_fee) VALUES ('ST012', 'M001', 'V019', 'AAA Dessert', 20, 'dessert', 200);

-- Table 25 - SHOP
INSERT INTO SHOP(stall_id, manager_id, vendor_id, name, description, rental_fee) VALUES ('SH001', 'M001', 'V012', 'Wonderful Mart', 'Convenience Store', 1200);
INSERT INTO SHOP(stall_id, manager_id, vendor_id, name, description, rental_fee) VALUES ('SH002', 'M001', 'V015', 'He & She Cafe', 'Coffee Shop', 1050);
