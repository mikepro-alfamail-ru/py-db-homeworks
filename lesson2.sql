CREATE TABLE Gengres (
id SERIAL PRIMARY KEY,
Name varchar(50)
);

CREATE TABLE Performers (
id SERIAL PRIMARY KEY,
genreid integer REFERENCES Gengres(id),
Name varchar(100)
);

CREATE TABLE Albums (
id SERIAL PRIMARY KEY,
performerid integer REFERENCES Performers(id),
Title varchar(255),
Year int
);

CREATE TABLE Tracks (
id SERIAL PRIMARY KEY,
albumid integer REFERENCES Albums(id),
Tite varchar(255),
Duration integer
);
