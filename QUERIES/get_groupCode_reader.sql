use FYP;
go
alter table tblProjectGroups
drop constraint CHK_tblProjectGroups_groupCode;
/*
	1. Originally, I put a unique constraint for groupCode
	2. I want to add additional columns to the unique NCI associated with unique constraint
	3. No, you can't.
		a. First you can't add columns to index like tables
		b. So you must drop it and recreate, but unique NCI associated with constraint
			can't be ditched like nothing.
			https://stackoverflow.com/a/55101140
	4. You can only drop constraint.
*/
go
create unique nonclustered index IX_tblProjectGroups_groupCode
on tblProjectGroups(groupCode asc) include(assignedFYP, reader)
where groupCode is not null;
/*
	1. Instead of creating a new unique constraint with remarks on that index
	2. I created the unique NCI directly, why?
		a. It enforces uniqueness as though unique constraint
		b. If you want to modify it next time, you can use drop_exist=on
			This tells SQL server that there is a new index coming to replace the old
			In turn, it saves fragmentation cost.
			https://stackoverflow.com/a/29943120
	3. What special about this index?
		a. It is a filtered index since we only need not null groupCode
		b. It includes reader and assignedFYP, both are needed for joining
		c. If I include them here, I save the key look up cost
		d. It is sorted on groupCode ascending, this saves sorting cost!
*/
go
select grps.groupCode, fyp.title, profs.name
from tblProjectGroups as grps inner join tblFyp as fyp on grps.assignedFYP = fyp.PK_tblFyp
left outer join tblFaculties as profs on grps.reader = profs.PK_tblFaculties
where grps.groupCode is not null
order by grps.groupCode asc;
/*
For each project group that has been assigned to an FYP, find the group code, the title 
of the FYP and the name of the reader for the project group, if any. Order the result by 
group code ascending

Performance:
	1. After the tuning, the cost has been cut from 0.03 to 0.16 seconds. 
*/
go