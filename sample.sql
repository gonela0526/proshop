-- Optional: create a dedicated schema
-- CREATE SCHEMA IF NOT EXISTS exchange_app;
-- SET search_path TO exchange_app;

-- 1) Table: exchange_process
CREATE TABLE exchange_process (
    processid      VARCHAR(50)  PRIMARY KEY,
    startdate      DATE,
    starttime      VARCHAR(50),
    customername   VARCHAR(50),
    projectname    VARCHAR(100),
    processname    VARCHAR(50),
    total          VARCHAR(50),
    satisfied      INTEGER,
    updated        INTEGER,
    created        INTEGER,
    failed         INTEGER,
    endtime        VARCHAR(50),
    overallstatus  VARCHAR(25)
);

-- 2) Table: exchange_description
CREATE TABLE exchange_description (
    descriptionid    VARCHAR(50)  PRIMARY KEY,
    status           VARCHAR(50),
    sourcewiid       VARCHAR(30),
    destinationwiid  VARCHAR(30),
    description      VARCHAR(500),
    processid        VARCHAR(50),
    CONSTRAINT fk_exchange_description_process
        FOREIGN KEY (processid)
        REFERENCES exchange_process (processid)
);
