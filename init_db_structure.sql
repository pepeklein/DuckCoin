CREATE DATABASE duckcoin;

USE duckcoin;

CREATE TABLE USER
    (
        ID INT AUTO_INCREMENT NOT NULL,
        NAME VARCHAR(50) NOT NULL,
        EMAIL VARCHAR(50) UNIQUE NOT NULL,
        PASSWORD VARCHAR(100) NOT NULL,
        CREATED_AT DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
        LAST_LOGIN DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,

        PRIMARY KEY (ID)
    );

CREATE TABLE CRYPTO_ASSET
    (
        ID INT AUTO_INCREMENT NOT NULL,
        NAME VARCHAR(50) NOT NULL,
        SYMBOL VARCHAR(10) UNIQUE NOT NULL,
        DESCRIPTION VARCHAR(255) NOT NULL,

        PRIMARY KEY (ID)
    );

CREATE TABLE COMPANY
    (
        ID INT AUTO_INCREMENT NOT NULL,
        USER_ID INT NOT NULL,
        NAME VARCHAR(50) NOT NULL,
        BANK_DETAILS VARCHAR(50) NOT NULL,

        PRIMARY KEY (ID),
        FOREIGN KEY (USER_ID) REFERENCES USER(ID)
    );

CREATE TABLE REPORT
    (
        ID INT AUTO_INCREMENT NOT NULL,
        USER_ID NOT NULL,
        REPORT_DATE DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
        CONTEXT VARCHAR(255) NOT NULL,

        PRIMARY KEY (ID),
        FOREIGN KEY (USER_ID) REFERENCES USER(ID)
    );

CREATE TABLE INVESTMENT
    (
        ID INT AUTO_INCREMENT NOT NULL,
        USER_ID INT NOT NULL,
        CRYPTO_ASSET_ID INT NOT NULL,
        COMPANY_ID INT NOT NULL,
        QUANTITY DECIMAL(10,2) NOT NULL,
        INVESTMENT_VALUE DECIMAL(10,2) NOT NULL,
        INVESTMENT_DATE DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
        STATUS VARCHAR(15) NOT NULL,

        PRIMARY KEY (ID),
        FOREIGN KEY (USER_ID) REFERENCES USER(ID),
        FOREIGN KEY (CRYPTO_ASSET_ID) REFERENCES CRYPTO_ASSET(ID),
        FOREIGN KEY (COMPANY_ID) REFERENCES COMPANY(ID)
    );

CREATE TABLE TRANSACTION
    (
        ID INT AUTO_INCREMENT NOT NULL,
        INVESTMENT_ID INT NOT NULL,
        TRANSACTION_VALUE DECIMAL(10,2) NOT NULL,
        TRANSACTION_DATE DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
        TYPE VARCHAR(15) NOT NULL,
        DETAILS VARCHAR(255),

        PRIMARY KEY (ID),
        FOREIGN KEY (INVESTMENT_ID) REFERENCES INVESTMENT(ID)
    );
