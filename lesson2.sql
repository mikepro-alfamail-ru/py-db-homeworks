CREATE TABLE Gengres (
id SERIAL NOT NULL,
Name varchar(255)
);

CREATE TABLE Performers (
id SERIAL NOT NULL,
genreid int NOT NULL,
Name varchar(255)
);

CREATE TABLE Albums (
id SERIAL NOT NULL,
performerid int NOT NULL,
Title varchar(255),
Year int
);

CREATE TABLE Tracks (
id SERIAL NOT NULL,
albumid int NOT NULL,
Tite varchar(255),
Duration int
);
