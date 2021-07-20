create table tblFyp(
	PK_tblFyp smallint primary key,
	title varchar(100) not null,
	description varchar(1200) not null,
	category varchar(30) not null,
	constraint FK_tblFyp_tblFypCategories foreign key(category)
        references tblFypCategories(PK_tblFypCategories)
		on delete cascade,
	type varchar(7) not null,
	constraint CHK_Fyp_type check (type in ('project','thesis')),
	otherRequirements varchar(200),
	minStudents smallint not null
	constraint DF_tblFyp_minStudents default 1,
	/*
	1. Default inline constraint
		https://dba.stackexchange.com/a/159361
	2. No comma before default constraint
		https://stackoverflow.com/a/40936738/8953255
	*/
	maxStudents smallint not null
	constraint DF_tblFyp_maxStudents default 1,
	isAvailable bit not null
	constraint DF_tblFyp_isAvailable default 1,
	constraint CHK_Fyp_min_max_Students	check(
		(minStudents between 1 and maxStudents) and
		(maxStudents between minStudents and 4))
);