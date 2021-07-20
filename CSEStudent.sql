create table tblCSEStudents(
	PK_tblCSEStudents varchar(15) primary key,
	constraint CHK_tblCSEStudents_PK check(
		PK_tblCSEStudents not like('%[^a-z]%') and 
		len(PK_tblCSEStudents)>2),
	name varchar(30) not null,
	groupId smallint,
	constraint FK_tblCSEStudents_tblProjectGroups foreign key (groupId)
		references tblProjectGroups(PK_tblProjectGroups)
);

insert into tblCSEStudents values ('brunoho','Bruno Ho',1);
insert into tblCSEStudents values ('daisyyeung','Daisy Yeung',2);
insert into tblCSEStudents values ('adamau','Adam Au',3);
insert into tblCSEStudents values ('lesterlo','Lester Lo',4);
insert into tblCSEStudents values ('shirleysit','Shirley Sit',5);
insert into tblCSEStudents values ('frankfung','Frank Fung',6);
insert into tblCSEStudents values ('larrylai','Larry Lai',6);
insert into tblCSEStudents values ('fredfan','Fred Fan',7);
insert into tblCSEStudents values ('jennyjones','Jenny Jones',7);
insert into tblCSEStudents values ('timothytu','Timothy Tu',7);
insert into tblCSEStudents values ('brianma','Brian Ma',8);
insert into tblCSEStudents values ('kathyko','Kathy Ko',8);
insert into tblCSEStudents values ('monicama','Monica Ma',8);
insert into tblCSEStudents values ('susansze','Susan Sze',8);
insert into tblCSEStudents values ('terrytam','Terry Tam',9);
insert into tblCSEStudents values ('sharonsu','Sharon Su',10);
insert into tblCSEStudents values ('wendywong','Wendy Wong',11);
insert into tblCSEStudents values ('ireneip','Irene Ip',12);
insert into tblCSEStudents values ('peterpoon','Peter Poon',12);
insert into tblCSEStudents values ('tiffanytan','Tiffany Tan',13);
insert into tblCSEStudents values ('victoriayu','Victoria Yu',13);
insert into tblCSEStudents values ('dannydoan','Danny Doan',13);
insert into tblCSEStudents values ('carolchen','Carol Chen',14);
insert into tblCSEStudents values ('cindychan','Cindy Chan',14);
insert into tblCSEStudents values ('tracytse','Tracy Tse',14);
insert into tblCSEStudents values ('yvonneyu','Yvonne Yu',14);
insert into tblCSEStudents values ('clintchu','Clint Chu',15);
insert into tblCSEStudents values ('amandahui','Amanda Hui',15);
insert into tblCSEStudents values ('henryho','Henry Ho',16);
insert into tblCSEStudents values ('tonytong','Tony Tong',16);
insert into tblCSEStudents values ('walterwu','Walter Wu',16);
insert into tblCSEStudents values ('xavierxie','Xavier Xie',16);
insert into tblCSEStudents values ('steviesu','Stevie Su',null);
insert into tblCSEStudents values ('rezanlim','Rezan Lim',null);
insert into tblCSEStudents values ('bradybond','Brady Bond',null);
insert into tblCSEStudents values ('vivianso','Vivian So',null);
insert into tblCSEStudents values ('alanseto','Alan Seto',null);
insert into tblCSEStudents values ('lucylam','Lucy Lam',null);
insert into tblCSEStudents values ('hughhawes','Hugh Hawes',null);
insert into tblCSEStudents values ('carlchan','Carl Chan',null);