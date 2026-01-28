create database if not EXISTS academy_prep;
use academy_prep;

--------------------------------------------------------
--  DROP Tables
--------------------------------------------------------
DROP TABLE if exists ACTIVITY;
DROP TABLE if exists VOLUNTEER_WORK;
DROP TABLE if exists STUDENT_GUARDIAN;
DROP TABLE if exists STUDENT_EXAM;
DROP TABLE if exists STUDENT;
DROP TABLE if exists SCHOOL_ATTEND;
DROP TABLE if exists SCHOOL_APPLY;
DROP TABLE if exists GUARDIAN;
DROP TABLE if exists SCHOOL;
DROP TABLE if exists EXAM;

-- DDL for Table ACTIVITY
CREATE TABLE IF NOT EXISTS ACTIVITY (
  STUDENT_ID int NOT NULL,
  ACTIVITY_ID int NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  START_DATE date DEFAULT NULL,
  END_DATE date DEFAULT NULL,
  COMMENTS varchar(255) DEFAULT NULL,
  constraint pk_student primary key (student_id, activity_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DDL for Table EXAM  
CREATE TABLE IF NOT EXISTS EXAM (
  EXAM_ID int NOT NULL,
  NAME varchar(50) DEFAULT NULL,
  ABBR varchar(10) DEFAULT NULL,
  EXAM_LEVEL char(1) DEFAULT NULL,
  constraint pk_exam primary key (exam_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DDL for Table GUARDIAN
CREATE TABLE IF NOT EXISTS GUARDIAN (
  GUARDIAN_ID int NOT NULL,
  FIRST_NAME varchar(255) DEFAULT NULL,
  LAST_NAME varchar(255) DEFAULT NULL,
  STREET_ADDR varchar(255) DEFAULT NULL,
  STREET_ADDR2 varchar(255) DEFAULT NULL,
  CITY varchar(255) DEFAULT NULL,
  STATE char(2) DEFAULT NULL,
  ZIP char(5) DEFAULT NULL,
  PHONE char(10) DEFAULT NULL,
  constraint pk_guardian primary key (guardian_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DDL for Table SCHOOL  
CREATE TABLE IF NOT EXISTS SCHOOL (
  SCHOOL_ID int NOT NULL,
  NAME varchar(255) DEFAULT NULL,
  CITY varchar(255) DEFAULT NULL,
  STATE char(2) DEFAULT NULL,
  TYPE char(1) DEFAULT NULL,
  constraint pk_school primary key (school_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DDL for Table SCHOOL_APPLY
CREATE TABLE IF NOT EXISTS SCHOOL_APPLY (
  STUDENT_ID int NOT NULL,
  SCHOOL_ID int NOT NULL,
  DECISION varchar(255) DEFAULT NULL,
  constraint pk_school_apply primary key (student_id,school_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DDL for Table SCHOOL_ATTEND
CREATE TABLE IF NOT EXISTS SCHOOL_ATTEND (
  STUDENT_ID int NOT NULL,
  SCHOOL_ID int NOT NULL,
  ENROLL_DATE date DEFAULT NULL,
  END_DATE date DEFAULT NULL,
  END_REASON varchar(255) DEFAULT NULL,
  constraint pk_school_attend primary key (student_id,school_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DDL for Table STUDENT
CREATE TABLE IF NOT EXISTS STUDENT (
  STUDENT_ID int NOT NULL,
  FIRST_NAME varchar(255) DEFAULT NULL,
  LAST_NAME varchar(255) DEFAULT NULL,
  SSN char(9) DEFAULT NULL,
  GENDER char(1) DEFAULT NULL,
  STREET_ADDR varchar(255) DEFAULT NULL,
  STREET_ADDR2 varchar(255) DEFAULT NULL,
  CITY varchar(255) DEFAULT NULL,
  STATE char(2) DEFAULT NULL,
  ZIP char(5) DEFAULT NULL,
  PHONE char(10) DEFAULT NULL,
  GRADE_LEVEL int DEFAULT NULL,
  ENROLL_DATE date DEFAULT NULL,
  END_DATE date DEFAULT NULL,
  END_REASON varchar(255) DEFAULT NULL,
  COMMENTS varchar(255) DEFAULT NULL,
  constraint pk_student primary key (student_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DDL for Table STUDENT_EXAM
CREATE TABLE IF NOT EXISTS STUDENT_EXAM (
  STUDENT_ID int NOT NULL,
  EXAM_ID int NOT NULL,
  TEST_DATE date NOT NULL,
  SCORE int DEFAULT NULL,
  constraint pk_student_exam primary key (student_id,exam_id,test_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DDL for Table STUDENT_GUARDIAN
CREATE TABLE IF NOT EXISTS STUDENT_GUARDIAN (
  STUDENT_ID int NOT NULL,
  GUARDIAN_ID int NOT NULL,
  RELATION varchar(255) DEFAULT NULL,
  constraint pk_student_guardian primary key (student_id,guardian_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;  

-- DDL for Table VOLUNTEER_WORK
CREATE TABLE IF NOT EXISTS VOLUNTEER_WORK (
  STUDENT_ID int NOT NULL,
  VOLUNTEER_WORK_ID int NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  START_DATE date DEFAULT NULL,
  END_DATE date DEFAULT NULL, 
  ASSIGNED_BY varchar(255) DEFAULT NULL,
  COMMENTS text,
  constraint pk_volunteer_work primary key (student_id,volunteer_work_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
