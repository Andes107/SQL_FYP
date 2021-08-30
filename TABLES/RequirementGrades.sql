create table tblRequirementGrades(
	facultyUsername varchar(15),
	constraint FK_tblRequirementGrades_tblFaculties foreign key(facultyUsername)
		references tblFaculties(PK_tblFaculties),
	studentUsername varchar(15),
	constraint FK_tblRequirementGrades_tblCSEStudents foreign key(studentUsername)
		references tblCSEStudents(PK_tblCSEStudents),
	proposalReport decimal(4,1),
	constraint CHK_tblRequirementGrades_proposalReport check(
		proposalReport between 0 and 100),
	progressReport decimal(4,1),
	constraint CHK_tblRequirementGrades_progressReport check(
		progressReport between 0 and 100),
	finalReport decimal(4,1),
	constraint CHK_tblRequirementGrades_finalReport check(
		finalReport between 0 and 100),
	presentation decimal(4,1),
	constraint CHK_tblRequirementGrades_presentation check(
		presentation between 0 and 100),
	primary key (facultyUsername, studentUsername)
);

--New updates for ETag
alter table tblRequirementGrades
ADD etag varchar(14);

insert into tblRequirementGrades values ('naughton','lesterlo',66,72,75,80);
insert into tblRequirementGrades values ('cafarella','lesterlo',60,70,75,80);
insert into tblRequirementGrades values ('hui','terrytam',75,67,72,77);
insert into tblRequirementGrades values ('naughton','terrytam',70,65,75,80);