--document_details

CREATE TABLE DOCUMENT_DETAILS(
document_id NUMBER(8),
document_name VARCHAR(50)NOT NULL,
document_type VARCHAR(50)NOT NULL,
document BLOB,
CONSTRAINT document_id_pk PRIMARY KEY(document_id)
);

CREATE SEQUENCE document_id_sequence
START WITH 1000 INCREMENT BY 1;

INSERT INTO DOCUMENT_DETAILS VALUES( document_id_sequence.nextVAL,'Resume1','PDF',null);
INSERT INTO DOCUMENT_DETAILS VALUES( document_id_sequence.nextVAL,'Resume2','PDF',null);
INSERT INTO DOCUMENT_DETAILS VALUES( document_id_sequence.nextVAL,'Resume3','Word',null);
INSERT INTO DOCUMENT_DETAILS VALUES( document_id_sequence.nextVAL,'Resume4','PDF',null);


select * from document_details;

commit;



CREATE TABLE APPLICANT_DETAILS(
applicant_id NUMBER(8),
applicant_name VARCHAR(50)NOT NULL,
mail_id VARCHAR(50)NOT NULL,
contact_number VARCHAR(50)NOT NULL,
skill_1 VARCHAR(50)NOT NULL,
skill_2 VARCHAR(50)NOT NULL,
skill_3 VARCHAR(50)NOT NULL,
qualification VARCHAR(50)NOT NULL,
experience VARCHAR(50)NOT NULL,
job_id NUMBER(8),
document_id NUMBER(8),
CONSTRAINT applicant_id_pk PRIMARY KEY(applicant_id),
CONSTRAINT job_id_fk FOREIGN KEY(job_id) REFERENCES JOB_REQUEST(job_id),
CONSTRAINT document_id_fk FOREIGN KEY(document_id) REFERENCES DOCUMENT_DETAILS(document_id)
);



CREATE SEQUENCE applicant_id_sequence
START WITH 1000 INCREMENT BY 1;

INSERT INTO APPLICANT_DETAILS VALUES(applicant_id_sequence.nextVAL,'PRATIK MISHRA','pratikmishra98@gmail.com','4578961237','Python','JAVA','SQL','B.E.','1 Year',1000,1000);
INSERT INTO APPLICANT_DETAILS VALUES(applicant_id_sequence.nextVAL,'Vineet Gauda','vineetkgauda98@gmail.com','4557982132','Python','JAVA','Angular','B.E.','2 Years',1001,1001);
INSERT INTO APPLICANT_DETAILS VALUES(applicant_id_sequence.nextVAL,'Gagan Jandu','gaganjandu99@gmail.com','7894561230','SQL','JAVA','Angular','B.E.','0 Years',1004,1002);
INSERT INTO APPLICANT_DETAILS VALUES(applicant_id_sequence.nextVAL,'Rohit Pandey','rohitpandey94@gmail.com','7458961237','Python','JAVA','SQL','B.E.','1 Year',1005,1003);

select * from applicant_details; 
select * from login_details;
Commit;


CREATE TABLE INTERVIEW_DETAILS(
interview_id NUMBER(8),
applicant_id NUMBER(10),
employee_id NUMBER(10),
feedback VARCHAR(50),
status VARCHAR(50),
CONSTRAINT interview_id_pk PRIMARY KEY(interview_id),
CONSTRAINT applicant_id_fk FOREIGN KEY(applicant_id) REFERENCES APPLICANT_DETAILS(applicant_id),
CONSTRAINT employee_id_fk FOREIGN KEY(employee_id) REFERENCES EMPLOYEE_DETAILS(employee_id)
);

CREATE SEQUENCE interview_id_sequence
START WITH 1000 INCREMENT BY 1;

select * from employee_details;

INSERT INTO INTERVIEW_DETAILS VALUES( interview_id_sequence.nextVAL,1000,1000,'WEAK IN JAVA','Not Selected');
INSERT INTO INTERVIEW_DETAILS VALUES( interview_id_sequence.nextVAL,1001,1001,'GOOD','Selected');
INSERT INTO INTERVIEW_DETAILS VALUES( interview_id_sequence.nextVAL,1002,1002,'WEAK IN JAVA','Not Selected');
INSERT INTO INTERVIEW_DETAILS VALUES( interview_id_sequence.nextVAL,1003,1003,'Excellent','Selected');


select * from interview_details;


commit;


--

select * from login_details;
select * from job_request;
select *from project_details;
select * from employee_details;
select * from document_details;
select * from applicant_details;  

drop table login_details;
drop table project_details;
drop table employee_details;
drop table JOB_REQUEST;

commit;
select j.job_id , j.project_id , j.employee_id , j.skill_1 , j.skill_2 , j.skill_3 , j.count ,j.status,e.employee_id, e.first_name , e.last_name , e.contact, e.designation , e.skill_1 as employee_skill_1 , e.skill_2 as employee_skill_2 , e.skill_3 as employee_skill_3 , e.bench , e.salary , e.address, e.city , e.state, e.pin_code , e.user_id ,e.mgr,p.project_name,p.skill_1 as project_skill_1,p.skill_1 as project_skill_1,p.skill_3 as project_skill_3
from employee_details where user_id=1006;



