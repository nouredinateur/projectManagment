-- DROP ALL TABLES
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS documents;
DROP TABLE IF EXISTS phases;
DROP TABLE IF EXISTS deliverables;
DROP TABLE IF EXISTS organisations;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS profiles;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS progress;



-- CREATING TABLES
CREATE TABLE IF NOT EXISTS projects (
    code BIGINT NOT NULL,
    name VARCHAR(100),
    description TEXT,
    startdate DATE,
  	enddate DATE,
    amount FLOAT,
  	progressid BIGINT,
    PRIMARY KEY (code)
);

CREATE TABLE  IF NOT EXISTS documents (
    id BIGINT,
    path VARCHAR(255),
    projectid BIGINT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS phases (
    code BIGINT,
    name VARCHAR(100),
    description TEXT,
    startdate DATE,
    enddate DATE,
    num_employees FLOAT,
    progressid BIGINT,
  	ispayed BOOL,
    PRIMARY KEY (code)
);

CREATE TABLE IF NOT EXISTS progress (
	id BIGINT,
  	state VARCHAR(100),
  	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS deliverables (
    code BIGINT,
    label VARCHAR(255),
    description TEXT,
    docpath VARCHAR(255),
    phaseid BIGINT,
    PRIMARY KEY (code)
);

CREATE TABLE IF NOT EXISTS organisations (
    code BIGINT,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(255),
    contactemail VARCHAR(100),
    contactname VARCHAR(100),
    website VARCHAR(255),
    PRIMARY KEY (code)
);

CREATE TABLE IF NOT EXISTS employees (
    code BIGINT,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
  	address VARCHAR(100),
    phone VARCHAR(255),
    email VARCHAR(100),
    password VARCHAR(255),
    profileid BIGINT,
    PRIMARY KEY (code)
);

CREATE TABLE IF NOT EXISTS profiles (
    id BIGINT,
    label VARCHAR(100),
    PRIMARY KEY (id)
);

-- CREATE FK CONSTRAINTS
ALTER TABLE projects 
ADD CONSTRAINT fk_projects_progress
FOREIGN KEY (progressid)
REFERENCES progress(id);

ALTER TABLE phases 
ADD CONSTRAINT fk_phases_progress
FOREIGN KEY (progressid)
REFERENCES progress(id);

ALTER TABLE deliverables 
ADD CONSTRAINT fk_deliverables_phase
FOREIGN KEY (phaseid)
REFERENCES phases(code);

ALTER TABLE documents 
ADD CONSTRAINT fk_documents_project
FOREIGN KEY (projectid)
REFERENCES projects(code);


ALTER TABLE employees 
ADD CONSTRAINT fk_employees_profile
FOREIGN KEY (profileid)
REFERENCES profiles(id);

