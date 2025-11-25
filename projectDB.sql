DROP DATABASE IF EXISTS cs122a_hw2;
CREATE DATABASE cs122a_hw2;
USE cs122a_hw2;

-- Define entities and their supporting tables below here

-- Q1: User and Agent Creator/Client (SQL DDL for entity(ies) table(s) only)

-- User Table (10 points)
CREATE TABLE Users (
    uid INT,
    email TEXT NOT NULL,
    username TEXT NOT NULL,
    PRIMARY KEY (uid)
);

-- Agent Creator Table (Delta Table for ISA Relationship) (10 points)
CREATE TABLE AgentCreator (
    uid INT,
    bio TEXT,
    payout TEXT,
    PRIMARY KEY (uid),
    FOREIGN KEY (uid) REFERENCES Users(uid) ON DELETE CASCADE
);

-- Agent Client Table (Delta Table for ISA Relationship)(10 points)
CREATE TABLE AgentClient (
    uid INT,
    interests TEXT NOT NULL,
    cardholder TEXT NOT NULL,
    expire DATE NOT NULL,
    cardno INT NOT NULL,
    cvv INT NOT NULL,
    zip INT NOT NULL,
    PRIMARY KEY (uid),
    FOREIGN KEY (uid) REFERENCES Users(uid) ON DELETE CASCADE
);


-- Q2: Base and Customized Model (SQL DDL for entity(ies) table(s) only)

-- Base Model Table(10 points)
CREATE TABLE BaseModel (
    bmid INT,
    creator_uid INT NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (bmid),
    FOREIGN KEY (creator_uid) REFERENCES AgentCreator(uid) ON DELETE CASCADE
);

-- Customized Model Table (Weak Entity)(10 points)
CREATE TABLE CustomizedModel (
    bmid INT,
    mid INT NOT NULL,
    PRIMARY KEY (bmid, mid),
    FOREIGN KEY (bmid) REFERENCES BaseModel(bmid) ON DELETE CASCADE
);


-- Q3: Configurations (SQL DDL for entity(ies) table(s) only)

-- Configuration Table (10 points)
CREATE TABLE Configuration (
    cid INT,
    client_uid INT NOT NULL,
    content TEXT NOT NULL,
    labels TEXT NOT NULL,
    PRIMARY KEY (cid),
    FOREIGN KEY (client_uid) REFERENCES AgentClient(uid) ON DELETE CASCADE
);


-- Q4: Internet Services: LLM/Data Storage (SQL DDL for entity(ies) table(s) only)

-- Internet Service Table (10 points)
CREATE TABLE InternetService (
    sid INT,
    provider TEXT NOT NULL,
    endpoints TEXT NOT NULL,
    PRIMARY KEY (sid)
);




-- LLM Table (5 points)
CREATE TABLE LLMService (
    sid INT,
    domain TEXT,
    PRIMARY KEY (sid),
    FOREIGN KEY (sid) REFERENCES InternetService(sid) ON DELETE CASCADE
);

-- Data Storage Table (5 points)
CREATE TABLE DataStorage (
    sid INT,
    type TEXT,
    PRIMARY KEY (sid),
    FOREIGN KEY (sid) REFERENCES InternetService(sid) ON DELETE CASCADE
);

-- Q5: Write additional SQL DDL for relationship(s) table(s) below (20 points)

-- Model x Services Table (10 points)
CREATE TABLE ModelServices (
    bmid INT NOT NULL,
    sid INT NOT NULL,
    version INT NOT NULL,
    PRIMARY KEY (bmid, sid),
    FOREIGN KEY (bmid) REFERENCES BaseModel(bmid) ON DELETE CASCADE,
    FOREIGN KEY (sid) REFERENCES InternetService(sid) ON DELETE CASCADE
);

-- Model x Configurations Table (10 points)
CREATE TABLE ModelConfigurations (
    bmid INT NOT NULL,
    mid INT NOT NULL,
    cid INT NOT NULL,
    duration INT NOT NULL,
    PRIMARY KEY (bmid, mid, cid),
    FOREIGN KEY (bmid, mid) REFERENCES CustomizedModel(bmid, mid) ON DELETE CASCADE,
    FOREIGN KEY (cid) REFERENCES Configuration(cid) ON DELETE CASCADE
);
