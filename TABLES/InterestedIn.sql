create table tblInterestedIn(
	fypId smallint,
	constraint FK_tblInterestedIn_tblFyp foreign key (fypId)
		references tblFyp(PK_tblFyp),
	groupId smallint,
	constraint FK_tblInterestedIn_tblProjectGroups foreign key (groupId)
		references tblProjectGroups(PK_tblProjectGroups),
	primary key(fypId, groupId),
	priority smallint not null,
	constraint CHK_tblInterestedIn_priority check(
		priority in (1,2,3,4,5))
);

--New updates for ETag
alter table tblInterestedIn
ADD etag varchar(14);
update tblInterestedIn
set etag = '202012'
where fypId = 1;
--The point of this test is that sql optimizer is smart
--etag is indeed not in the primary index
--but if you have the primary key, you can go for the primary index
--then retrieve what you want
--locally speaking, this is optimized
select etag
from tblInterestedIn
where fypId = 1 and groupId = 6 and etag = '202012';
update tblInterestedIn
set etag = null
where fypId = 1;

insert into tblInterestedIn values (1,6,1);
insert into tblInterestedIn values (1,11,1);
insert into tblInterestedIn values (2,1,2);
insert into tblInterestedIn values (2,2,1);
insert into tblInterestedIn values (2,3,1);
insert into tblInterestedIn values (3,3,5);
insert into tblInterestedIn values (3,10,2);
insert into tblInterestedIn values (4,8,1);
insert into tblInterestedIn values (5,3,4);
insert into tblInterestedIn values (5,4,1);
insert into tblInterestedIn values (5,5,1);
insert into tblInterestedIn values (5,11,2);
insert into tblInterestedIn values (7,9,3);
insert into tblInterestedIn values (8,12,1);
insert into tblInterestedIn values (8,7,3);
insert into tblInterestedIn values (10,8,3);
insert into tblInterestedIn values (10,14,3);
insert into tblInterestedIn values (11,1,1);
insert into tblInterestedIn values (11,2,2);
insert into tblInterestedIn values (11,3,3);
insert into tblInterestedIn values (12,7,2);
insert into tblInterestedIn values (13,9,5);
insert into tblInterestedIn values (16,12,2);
insert into tblInterestedIn values (16,13,1);
insert into tblInterestedIn values (17,14,4);
insert into tblInterestedIn values (18,3,3);
insert into tblInterestedIn values (18,5,2);
insert into tblInterestedIn values (18,10,1);
insert into tblInterestedIn values (18,7,4);
insert into tblInterestedIn values (19,12,3);
insert into tblInterestedIn values (20,10,3);
insert into tblInterestedIn values (20,12,4);
insert into tblInterestedIn values (20,13,2);
insert into tblInterestedIn values (21,14,2);
insert into tblInterestedIn values (23,9,1);
insert into tblInterestedIn values (24,8,2);
insert into tblInterestedIn values (25,12,5);
insert into tblInterestedIn values (26,6,1);
insert into tblInterestedIn values (26,10,1);
insert into tblInterestedIn values (26,14,1);
insert into tblInterestedIn values (29,8,4);
insert into tblInterestedIn values (30,6,2);
insert into tblInterestedIn values (30,7,1);