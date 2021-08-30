create table tblFaculties(
	PK_tblFaculties varchar(15) primary key,
	name varchar(30) not null,
	roomNo varchar(5) not null,
	facultyCode varchar(2) unique not null,
	
	constraint chk_tblFaculty_PK check 
	(PK_tblFaculties not like('%[^a-z]%') and len(PK_tblFaculties)>2),
	/*
	1. Like argument
		https://docs.microsoft.com/en-us/sql/t-sql/language-elements/like-transact-sql?view=sql-server-ver15#arguments
	2. Like regex for only alphabets
		https://blog.sqlauthority.com/2013/12/09/sql-server-how-to-allow-only-alphabets-in-column-create-check-constraint-to-insert-only-alphabets/
	3. length check
		https://social.msdn.microsoft.com/Forums/sqlserver/en-US/2e6fb2f4-359d-4097-b2c2-59e3c3709ba1/varchar-minimum-length-check?forum=sqlgetstarted
	*/
	constraint chk_tblFaculty_roomNo check
	(roomNo like('[0-9][0-9][0-9][0-9]') or 
	roomNo like('[0-9][0-9][0-9][0-9][A-Z]')),

	constraint chk_tblFaculty_facultyCode check
	(facultyCode like('[A-Z][A-Z]'))
);

--New updates for ETag
alter table tblFaculties
ADD etag varchar(14);

insert into tblFaculties values ('cafarella','Michelle Cafarella','3702','MC');
insert into tblFaculties values ('fan','Jim Fan','3372','JF');
insert into tblFaculties values ('garcia','Holly Garcia','3068','HG');
insert into tblFaculties values ('hui','Nancy Hui','3556','NH');
insert into tblFaculties values ('jag','Hector Jag','3923','HJ');
insert into tblFaculties values ('larson','Pauline Larson','3588','PL');
insert into tblFaculties values ('naughton','Jack Naughton','2628','JN');
insert into tblFaculties values ('pantel','Patty Pantel','2345','PP');
insert into tblFaculties values ('parames','Agnes Parames','3776','AP');
insert into tblFaculties values ('ray','Nelson Ray','4178','NR');
insert into tblFaculties values ('ruden','Elke Ruden','3158','ER');
insert into tblFaculties values ('soliman','Mary Soliman','4116','MS');
insert into tblFaculties values ('swart','Gerry Swart','3522','GS');
insert into tblFaculties values ('thorn','Martin Thorn','3538','MT');
insert into tblFaculties values ('lock','Karl Lock','3532','KL');
insert into tblFaculties values ('zhang','Vincent Zhang','3408','VZ');