create table Departments(
	id serial primary key,
	Name varchar(40),
	location varchar(40)
);

create table Positions(
	id serial primary key,
	Name varchar(40)
);

create table Employees(
	id serial primary key,
	FirstName varchar(40),
	LastName varchar(40),
	Phone varchar(20),
	DepartmentID integer references Departments,
	PositionID integer references Positions,
	Supervisor integer 	references Employees
);
