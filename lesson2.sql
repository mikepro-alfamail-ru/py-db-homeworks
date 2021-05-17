CREATE TABLE Gengres (
id SERIAL PRIMARY KEY,
Name varchar(255)
);

CREATE TABLE Performers (
id SERIAL PRIMARY KEY,
genreid int NOT NULL,
Name varchar(255)
);

CREATE TABLE Albums (
id SERIAL PRIMARY KEY,
performerid int NOT NULL,
Title varchar(255),
Year int
);

CREATE TABLE Tracks (
id SERIAL PRIMARY KEY,
albumid int NOT NULL,
Tite varchar(255),
Duration int
);
