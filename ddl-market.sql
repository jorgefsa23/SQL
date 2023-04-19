# 1. CREATE: 

/*create a new database called "market" (IF NOT EXISTS avoid error if there is already a database with the same name):
The charset (character set) and collation are optional, and depends on the DB purpose*/
CREATE SCHEMA IF NOT EXISTS market
	DEFAULT CHARSET = utf8
    DEFAULT COLLATE = utf8_general_ci;

# 2. USE
# To "enter" into DB. From now on, the next commands will afect it:
USE market;

# now we will create a set of tables into market DB:

create table State (
	Id int auto_increment,
    State_Name varchar(50) not null,
    Abbreviation char(2) not null,
    primary key (Id)
);

create table City (
	Id int auto_increment,
    State_id int not null,
    CityName varchar(80) not null,
    CityCode int not null,
    primary key (Id),
    foreign key (State_id) references State(Id)
);

create table Clients (
	Id int auto_increment,
    Client_Name varchar(80) not null,
	Passport char(11) not null,
    Cellphone char(11),
    AddsStreet varchar(100) not null,
    AddsNumber varchar(10) not null,
    AddsCity int not null,
    AddsPostal int,
    primary key (Id),
    foreign key (AddsCity) references City(Id)
);

create table Receivables (
	Id int auto_increment,
    Client_ID int not null,
    BillNumber int,
    DateCreated date not null,
    DateExpiration date not null,
    Total decimal (18,2) not null,
    Situation enum('1','2','3') not null, -- 1–registered, 2 cancelled, 3-paid
    primary key (Id),
    foreign key (Client_ID) references Clients(Id)
);

#to see DB structure:
SHOW TABLES;
#To see a table structure:
DESC state;


# 3. ALTER
# ex. to modify DB charset:
ALTER DATABASE market  CHARSET = latin1;

# ex. to add a column into table name:
ALTER TABLE state
  ADD last_name varchar(40) NOT NULL
    AFTER State_Name;
    
    
# ex. to modify column name:
ALTER TABLE state
  MODIFY last_name varchar(60) NOT NULL;
  
# ex. to DROP column:
ALTER TABLE state
  DROP COLUMN last_name;
