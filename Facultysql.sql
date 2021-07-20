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
	(roomNo like('[0-9][0-9][0-9][0-9][A-Z]') or 
	roomNo like('[0-9][0-9][0-9][0-9][A-Z][A-Z]')),

	constraint chk_tblFaculty_facultyCode check
	(facultyCode like('[A-Z][A-Z]'))
);