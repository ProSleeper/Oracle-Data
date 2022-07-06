CONNECT system/dba

DROP USER kim CASCADE;

ALTER SESSION SET NLS_LANGUAGE = KOREAN;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

CREATE USER kim IDENTIFIED BY bob
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO kim;

CONNECT kim/bob

CREATE TABLE DIVISION
       (DNO NUMBER(2) CONSTRAINT DIVISION_DNO_PK PRIMARY KEY,
	DNAME VARCHAR2(15),
	PHONE VARCHAR2(15),
	POSITION VARCHAR2(10));

INSERT INTO DIVISION VALUES
	(10,'FINANCE','032-277-0411','INCHON');
INSERT INTO DIVISION VALUES 
	(20,'RESEARCH','061-535-1212','BUSAN');
INSERT INTO DIVISION VALUES
	(30,'SALES','02-555-4985','SEOUL');
INSERT INTO DIVISION VALUES
	(40,'MARKETING','031-284-3800','SUWON');
COMMIT;

CREATE TABLE PERSONNEL
       (PNO NUMBER(4) CONSTRAINT PERSONNEL_PNO_PK PRIMARY KEY,
	PNAME VARCHAR2(9),
	JOB VARCHAR2(9),
	MANAGER NUMBER(4),
	STARTDATE DATE,
	PAY NUMBER(6,2),
	BONUS NUMBER(6,2),
	DNO NUMBER(2) CONSTRAINT PERSONNEL_DNO_FK REFERENCES DIVISION (DNO));

INSERT INTO PERSONNEL VALUES
(1111,'SMITH','MANAGER',1001,'1990/12/17',1000,NULL,10);
INSERT INTO PERSONNEL VALUES
(1112,'ALLY','SALESMAN',1116,'1991/02/20',1600,500,30);
INSERT INTO PERSONNEL VALUES
(1113,'WORD','SALESMAN',1116,'1992/02/24',1450,300,30);
INSERT INTO PERSONNEL VALUES
(1114,'JAMES','MANAGER',1001,'1990/04/12',3975,NULL,20);
INSERT INTO PERSONNEL VALUES
(1001,'BILL','PRESIDENT',NULL,'1989/01/10',7000,NULL,10);
INSERT INTO PERSONNEL VALUES
(1116,'JOHNSON','MANAGER',1001,'1991/05/01',3550,NULL,30);
INSERT INTO PERSONNEL VALUES
(1118,'MARTIN','ANALYST',1111,'1991/09/09',3450,NULL,10);
INSERT INTO PERSONNEL VALUES
(1121,'KIM','CLERK',1114,'1990/12/08',4000,NULL,20);
INSERT INTO PERSONNEL VALUES
(1123,'LEE','SALESMAN',1116,'1991/09/23',1200,0,30);
INSERT INTO PERSONNEL VALUES
(1226,'PARK','ANALYST',1111,'1990/01/03',2500,NULL,10);
COMMIT;



CREATE TABLE BONUS
	(
	PNAME VARCHAR2(10),
	JOB VARCHAR2(10),
	PAY NUMBER (8,2),
	BONUS NUMBER(8,2)
	) ;

CREATE TABLE PAYGRADE
      ( GRADE NUMBER,
	LOWPAY NUMBER,
	HIGHPAY NUMBER );

INSERT INTO PAYGRADE VALUES (1,500,1500);
INSERT INTO PAYGRADE VALUES (2,1501,2500);
INSERT INTO PAYGRADE VALUES (3,2501,3500);
INSERT INTO PAYGRADE VALUES (4,3501,4500);
INSERT INTO PAYGRADE VALUES (5,4501,5500);
INSERT INTO PAYGRADE VALUES (6,5501,9999);
COMMIT;



COMMIT;