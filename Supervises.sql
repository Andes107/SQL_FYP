create table tblSupervises(
	username varchar(15),
	constraint FK_tblSupervises_tblFaculties foreign key(username)
		references tblFaculties(PK_tblFaculties),
	fypId smallint,
	constraint FK_tblSupervises_tblFyp foreign key(fypId)
		references tblFyp(PK_tblFyp),
	primary key(username, fypId)
);