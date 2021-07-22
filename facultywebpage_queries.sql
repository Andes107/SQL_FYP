drop proc if exists sp1;

/*
TODO 01: Used in Faculty\DisplayFYPs
Construct the SQL SELECT statement to retrieve the fyp id, title, category, type, 
minimum students and maximum students of the FYPs supervised by a faculty identified
by his/her username. Order the result by title ascending.
*/
create proc sp1
@username varchar(15)
as
begin
	select F.PK_tblFyp, F.title, F.category, F.type, F.minStudents, F.maxStudents
	from tblFyp F join tblSupervises S
	on F.PK_tblFyp = S.fypId
	where S.username = @username
	order by F.title; 
end;

alter table tblSupervises
drop constraint PK_tblSupervises;
alter table tblSupervises
add constraint PK_tblSupervises primary key(username, fypId);

create nonclustered index IX_tblFyp_title
on tblFyp(title)
include(PK_tblFyp,category,type,minStudents,maxStudents);

exec sp1 'fan';