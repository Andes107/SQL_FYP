create table tblProjectGroups(
	PK_tblProjectGroups smallint primary key,
	groupCode varchar(5),
	constraint CHK_tblProjectGroups_groupCode check(
		groupCode like('[A-Z][A-Z][1-4]') or
		groupCode like('[A-Z][A-Z][A-Z][1-4]') or
		groupCode like('[A-Z][A-Z][A-Z][A-Z][1-4]')),
	assignedFYP smallint,
	constraint FK_tblProjectGroups_tblFyp foreign key(assignedFYP)
        references tblFyp(PK_tblFyp)
		on delete set null,
	/*
	1. Refresh cache hot key ctrl shift r
	https://docs.microsoft.com/en-us/sql/ssms/scripting/troubleshooting-intellisense?view=sql-server-ver15
	*/
	reader varchar(15),
	constraint FK_tblProjectGroups_tblFaculties foreign key (reader)
		references tblFaculties(PK_tblFaculties)
		on delete set null
);

--New updates for ETag
alter table tblProjectGroups
ADD etag varchar(14);
--No index because it is assumed that primary key will follow

create unique nonclustered index IX_tblProjectGroups_groupCode
ON tblProjectGroups(groupCode)
where groupCode is not null;
/*
1. Unique index does not accept multiple null values
	Replace it with filtered index instead to enforce uniqueness
	https://stackoverflow.com/a/767702/8953255
*/

insert into tblProjectGroups values (1,null,null,null);
insert into tblProjectGroups values (2,null,null,null);
insert into tblProjectGroups values (3,null,null,null);
insert into tblProjectGroups values (4,null,null,null);
insert into tblProjectGroups values (5,null,null,null);
insert into tblProjectGroups values (6,null,null,null);
insert into tblProjectGroups values (7,null,null,null);
insert into tblProjectGroups values (8,null,null,null);
insert into tblProjectGroups values (9,null,null,null);
insert into tblProjectGroups values (10,null,null,null);
insert into tblProjectGroups values (11,null,null,null);
insert into tblProjectGroups values (12,null,null,null);
insert into tblProjectGroups values (13,null,null,null);
insert into tblProjectGroups values (14,null,null,null);
insert into tblProjectGroups values (15,null,null,null);
insert into tblProjectGroups values (16,null,null,null);

update tblProjectGroups set groupCode='MC1',assignedFYP=2,reader='ray' where PK_tblProjectGroups=1;
update tblProjectGroups set groupCode='MC2',assignedFYP=11,reader='ray' where PK_tblProjectGroups=2;
update tblProjectGroups set groupCode='JNHJ1',assignedFYP=5 where PK_tblProjectGroups=3;
update tblProjectGroups set groupCode='JNHJ2',assignedFYP=5,reader='cafarella' where PK_tblProjectGroups=4;
update tblProjectGroups set groupCode='JNHJ3',assignedFYP=5 where PK_tblProjectGroups=5;
update tblProjectGroups set groupCode='HJ1',assignedFYP=26,reader='ruden' where PK_tblProjectGroups=6;
update tblProjectGroups set groupCode='JF1',assignedFYP=30,reader='naughton' where PK_tblProjectGroups=7;
update tblProjectGroups set groupCode='JN1',assignedFYP=4,reader='fan' where PK_tblProjectGroups=8;
update tblProjectGroups set groupCode='NH1',assignedFYP=13,reader='naughton' where PK_tblProjectGroups=9;