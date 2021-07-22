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
/*
	1. The original table tblSupervises has set primary key as fypId and username
	2. Since the join attribute is on username and order matters
	3. A new primary key and subsequent clustered index are created
	4. It is not feasible if there are a lot of records because
		a. Dropping primary key will drop the clustered index if it exists
		b. The table will be reorganized into a heap
		c. all NCIs leaf node will rebuild into RID
		d. after adding new primary key, all NCIs leaf node will rebuild back to clustered key
	5. Is there a solution? no, so if shit hits the fan, please refer to the following
		https://dba.stackexchange.com/a/172104
*/

create nonclustered index IX_tblFyp_title
on tblFyp(title)
include(PK_tblFyp,category,type,minStudents,maxStudents);

exec sp1 'fan';