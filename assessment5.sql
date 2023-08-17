-- Create the database
CREATE DATABASE Assesment05Db;

-- Use the created database
USE Assesment05Db;

-- Create the schema
CREATE SCHEMA bank;

-- Create the Customer table
CREATE TABLE bank.Customer (
    Cid INT PRIMARY KEY identity(1000,1),
    CName NVARCHAR(100) NOT NULL,
    CEmail NVARCHAR(100) NOT NULL UNIQUE,
    Contact NVARCHAR(20) NOT NULL UNIQUE,
    CPwd AS RIGHT(CName, 2) + CAST(Cid AS NVARCHAR(10)) + ' ' + LEFT(Contact, 2) PERSISTED
);
insert into bank.Customer(CName,CEmail,Contact) values ('Ravi','rv@gmail.com','1254789331')
insert into bank.Customer(CName,CEmail,Contact) values ('Roshni','roshni@gmail.com','1256478936')
insert into bank.Customer(CName,CEmail,Contact) values ('Disha','disha@gmail.com','7458961254')


select * from bank.Customer

-- Create the Maillnfo table
CREATE TABLE bank.Mailinfo (
    MailTo NVARCHAR(100),
    MailDate DATE,
    MailMessage NVARCHAR(200)
);

-- Create the trigger trgMailToCust
create trigger bank.trgMailToCust
on bank.Customer
after insert
as
begin
    insert into bank.MailInfo (MailTo, MailDate, MailMessage)
    select i.CEmail, GETDATE(), 'Your net banking password is ' + i.CPwd + '. It is valid up to 2 days only. Update it.'
    from inserted i
end

insert into bank.Customer values ('Sande Dawn','dawn@yh.com','7004569872')
insert into bank.Customer values ('proxy wn','dwn@yh.com','70451269872')
insert into bank.Customer values ('roxy Dwn','daw@yh.com','73214569872')


select *from bank.customer
select * from bank.Maillnfo;