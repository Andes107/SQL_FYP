create table tblSupervises(
	username varchar(15),
	constraint FK_tblSupervises_tblFaculties foreign key(username)
		references tblFaculties(PK_tblFaculties),
	fypId smallint,
	constraint FK_tblSupervises_tblFyp foreign key(fypId)
		references tblFyp(PK_tblFyp),
	primary key(username, fypId)
);

insert into tblSupervises values ('cafarella',1);
insert into tblSupervises values ('cafarella',2);
insert into tblSupervises values ('cafarella',11);
insert into tblSupervises values ('cafarella',12);
insert into tblSupervises values ('fan',29);
insert into tblSupervises values ('fan',30);
insert into tblSupervises values ('garcia',17);
insert into tblSupervises values ('garcia',18);
insert into tblSupervises values ('garcia',23);
insert into tblSupervises values ('hui',13);
insert into tblSupervises values ('hui',22);
insert into tblSupervises values ('jag',5);
insert into tblSupervises values ('jag',6);
insert into tblSupervises values ('jag',7);
insert into tblSupervises values ('jag',8);
insert into tblSupervises values ('jag',9);
insert into tblSupervises values ('jag',24);
insert into tblSupervises values ('jag',26);
insert into tblSupervises values ('naughton',3);
insert into tblSupervises values ('naughton',4);
insert into tblSupervises values ('naughton',5);
insert into tblSupervises values ('naughton',7);
insert into tblSupervises values ('naughton',19);
insert into tblSupervises values ('pantel',8);
insert into tblSupervises values ('pantel',9);
insert into tblSupervises values ('pantel',12);
insert into tblSupervises values ('pantel',13);
insert into tblSupervises values ('pantel',21);
insert into tblSupervises values ('parames',15);
insert into tblSupervises values ('parames',16);
insert into tblSupervises values ('parames',18);
insert into tblSupervises values ('parames',20);
insert into tblSupervises values ('ray',10);
insert into tblSupervises values ('ruden',14);
insert into tblSupervises values ('ruden',28);
insert into tblSupervises values ('soliman',21);
insert into tblSupervises values ('soliman',25);
insert into tblSupervises values ('soliman',27);