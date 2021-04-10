BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "employee" (
	"ssn"	bigint NOT NULL,
	"name"	varchar(100),
	"fname"	varchar(100) NOT NULL,
	"minit"	varchar(100) DEFAULT '',
	"lname"	varchar(100) NOT NULL,
	"bdate"	date DEFAULT NULL,
	"address"	text,
	"salary"	float DEFAULT NULL,
	"super_ssn"	bigint DEFAULT NULL,
	"dno"	int DEFAULT NULL,
	PRIMARY KEY("ssn"),
	FOREIGN KEY("super_ssn") REFERENCES "employee"("ssn"),
	FOREIGN KEY("dno") REFERENCES "department"("dnumber")
);
CREATE TABLE IF NOT EXISTS "department" (
	"dname"	varchar(100),
	"dnumber"	int NOT NULL,
	"mgr_ssn"	bigint NOT NULL UNIQUE,
	"mgr_start_date"	date NOT NULL,
	FOREIGN KEY("mgr_ssn") REFERENCES "employee"("ssn"),
	PRIMARY KEY("dnumber")
);
CREATE TABLE IF NOT EXISTS "dependent" (
	"essn"	bigint DEFAULT NULL,
	"name"	varchar(100) DEFAULT NULL,
	"bdate"	date DEFAULT NULL,
	"relationship"	varchar(100) DEFAULT NULL,
	FOREIGN KEY("essn") REFERENCES "employee"("ssn")
);
CREATE TABLE IF NOT EXISTS "dept_locations" (
	"dnum"	int NOT NULL,
	"dlocation"	text,
	FOREIGN KEY("dnum") REFERENCES "department"("dnumber")
);
CREATE TABLE IF NOT EXISTS "works_on" (
	"essn"	bigint DEFAULT NULL,
	"pno"	int DEFAULT NULL,
	"hours"	float DEFAULT NULL,
	FOREIGN KEY("pno") REFERENCES "project"("pnumber"),
	FOREIGN KEY("essn") REFERENCES "employee"("ssn")
);
CREATE TABLE IF NOT EXISTS "project" (
	"pnumber"	int NOT NULL,
	"pname"	varchar(100) NOT NULL,
	"plocation"	text NOT NULL,
	"dnum"	int NOT NULL,
	FOREIGN KEY("dnum") REFERENCES "department"("dnumber"),
	PRIMARY KEY("pnumber")
);
INSERT INTO "employee" VALUES (123456789,'John B Smith','John','B','Smith','1965-01-09','731 Fondren, Houston, TX',30000.0,333445555,5);
INSERT INTO "employee" VALUES (333445555,'Franklin T Wong','Franklin','T','Wong','1955-12-08','638 Voss, Houston, TX',40000.0,888665555,5);
INSERT INTO "employee" VALUES (453453453,'Joyce A English','Joyce','A','English','1972-07-31','5631 Rice, Houston, TX',25000.0,333445555,5);
INSERT INTO "employee" VALUES (666884444,'Ramesh K Narayan','Ramesh','K','Narayan','1962-09-15','975 Fire Oak, Humble, TX',38000.0,333445555,5);
INSERT INTO "employee" VALUES (888665555,'James E Borg','James','E','Borg','1937-11-10','450 Stone, Houston, TX',55000.0,7786101712,1);
INSERT INTO "employee" VALUES (987654321,'Jennifer S Wallace','Jennifer','S','Wallace','1941-06-20','291 Berry, Bellaire, TX',43000.0,888665555,4);
INSERT INTO "employee" VALUES (987987987,'Ahmad V Jabbar','Ahmad','V','Jabbar','1969-03-29','980 Dallas, Houston, TX',25000.0,987654321,4);
INSERT INTO "employee" VALUES (999887777,'Alicia J Zelaya','Alicia','J','Zelaya','1968-01-19','3321 Castle, Spring, TX',25000.0,987654321,4);
INSERT INTO "employee" VALUES (7786101712,'Shmasul  Arefin','Shmasul','','Arefin','1993-12-01','Building No- B-69/F-9, Motijheel Govt. Colony, Post Office: G.P.O, Post Code: 1000, Thana: Motijheel, District: Dhaka',NULL,7786101712,NULL);
INSERT INTO "department" VALUES ('Headquarters',1,888665555,'1981-06-19');
INSERT INTO "department" VALUES ('Administration',4,987654321,'1995-01-01');
INSERT INTO "department" VALUES ('Research',5,333445555,'1988-05-22');
INSERT INTO "dependent" VALUES (333445555,'Alice','1986-04-05','Daughter');
INSERT INTO "dependent" VALUES (333445555,'Theodore','1983-10-25','Son');
INSERT INTO "dependent" VALUES (333445555,'Joy','1958-05-03','Spouse');
INSERT INTO "dependent" VALUES (987654321,'Abner','1942-02-28','Spouse');
INSERT INTO "dependent" VALUES (123456789,'Michael','1988-01-04','Son');
INSERT INTO "dependent" VALUES (123456789,'Alice','1988-12-30','Daughter');
INSERT INTO "dependent" VALUES (123456789,'Elizabeth','1967-05-05','Spouse');
INSERT INTO "dept_locations" VALUES (1,'Houston');
INSERT INTO "dept_locations" VALUES (4,'Stafford');
INSERT INTO "dept_locations" VALUES (5,'Bellaire');
INSERT INTO "dept_locations" VALUES (5,'Sugarland');
INSERT INTO "dept_locations" VALUES (5,'Houston');
INSERT INTO "works_on" VALUES (123456789,1,32.5);
INSERT INTO "works_on" VALUES (123456789,2,7.5);
INSERT INTO "works_on" VALUES (666884444,3,40.0);
INSERT INTO "works_on" VALUES (453453453,1,20.0);
INSERT INTO "works_on" VALUES (453453453,2,20.0);
INSERT INTO "works_on" VALUES (333445555,2,10.0);
INSERT INTO "works_on" VALUES (333445555,3,10.0);
INSERT INTO "works_on" VALUES (333445555,10,10.0);
INSERT INTO "works_on" VALUES (333445555,20,10.0);
INSERT INTO "works_on" VALUES (999887777,30,30.0);
INSERT INTO "works_on" VALUES (999887777,10,10.0);
INSERT INTO "works_on" VALUES (987987987,10,35.0);
INSERT INTO "works_on" VALUES (987987987,30,5.0);
INSERT INTO "works_on" VALUES (987654321,30,20.0);
INSERT INTO "works_on" VALUES (987654321,20,15.0);
INSERT INTO "works_on" VALUES (888665555,20,7.0);
INSERT INTO "project" VALUES (1,'ProductX','Bellaire',5);
INSERT INTO "project" VALUES (2,'ProductY','Sugarland',5);
INSERT INTO "project" VALUES (3,'ProductZ','Houston',5);
INSERT INTO "project" VALUES (10,'Computerization','Stafford',4);
INSERT INTO "project" VALUES (20,'Reorganization','Houston',1);
INSERT INTO "project" VALUES (30,'Newbenefits','Stafford',4);
COMMIT;
