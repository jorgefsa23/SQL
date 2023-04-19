/*
DML stands for Data Manipulation Language

*/
use market;

#some Brazilian states into the first table:

# 1. INSERT to set values into tables:

insert into state (State_Name, Abbreviation) values 
	('Paraná', 'PR'),
    ('Bahia', 'BA'),
    ('São Paulo', 'SP');

select * from state;

insert into city (State_id, CityName, CityCode) values 
	('1', 'Cascavel', '4104808'),
    ('2', 'Ilheus', '2913606'),
    ('3', 'Campinas', '3509502'),
    ('3', 'Americana', '111111');

select * from city;
    
insert into clients (Client_Name, Passport, Cellphone, AddsStreet, AddsNumber, AddsCity, AddsPostal) values 
	('João Costa', '89698598562', '75989652451', 'Rua G', '23', '1', '44050562'),
    ('Maria Rita', '12569854789', '', 'Rua M', '15', '2', ''),
    ('Bruno Martins', '8956325489', '', 'Rua X', '56', '3', '');

select * from clients;

insert into Receivables (Client_ID, BillNumber, DateCreated, DateExpiration, Total, Situation) values 
	('1', '111', '2023-03-15', '2023-04-15', '1000.50', '1'),
    ('2', '222', '2023-03-20', '2023-04-20', '5250.65', '2'),
    ('3', '333', '2023-03-30', '2023-04-30', '1000.50', '3');

select * from Receivables;


# 2. UPDATE

UPDATE city
SET CityName = 'Santos',
    CityCode = 222222
WHERE id = 4;

select * from city;

# 3. DELETE

DELETE FROM city
WHERE id = 4;

select * from city;

