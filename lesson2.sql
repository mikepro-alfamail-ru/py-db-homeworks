CREATE TABLE Gengres (
id SERIAL PRIMARY KEY,
Name varchar(255)
);

CREATE TABLE Performers (
id SERIAL PRIMARY KEY,
genreid int REFERENCES Gengres(id),
Name varchar(255)
);

CREATE TABLE Albums (
id SERIAL PRIMARY KEY,
performerid int REFERENCES Performers(id),
Title varchar(255),
Year int
);

CREATE TABLE Tracks (
id SERIAL PRIMARY KEY,
albumid int REFERENCES Albums(id),
Tite varchar(255),
Duration int
);
