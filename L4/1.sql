CREATE TABLE Collections (
id SERIAL PRIMARY KEY,
Title varchar(255),
Year integer
);

CREATE TABLE Gengres (
id SERIAL PRIMARY KEY,
Name varchar(50)
);

CREATE TABLE Performers (
id SERIAL PRIMARY KEY,
Name varchar(100)
);

CREATE TABLE Albums (
id SERIAL PRIMARY KEY,
Title varchar(255),
Year integer
);

CREATE TABLE Tracks (
id SERIAL PRIMARY KEY,
albumid integer REFERENCES Albums(id),
Title varchar(255),
Duration integer
);

CREATE TABLE PerformersGengres (
GengreID integer REFERENCES Gengres(id),
performerID integer REFERENCES Performers(id),
constraint pkPerformersGengres primary key (GengreID, performerID)
);

CREATE TABLE PerformersAlbums (
performerID integer REFERENCES Performers(id),
albumID integer REFERENCES Albums(id),
constraint pkPerformersAlbums primary key (performerID, albumID)
);

CREATE TABLE CollectionsTracks (
CollectionID integer REFERENCES Collections(id),
TrackID integer REFERENCES Tracks(id),
constraint pkCollectionsTracks primary key (CollectionID, TrackID)
);