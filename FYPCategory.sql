create table tblFypCategories(
	PK_tblFypCategories varchar(30) primary key,
	constraint chk_FypCategories_PK CHECK (PK_tblFypCategories IN (
	'Artificial Intelligence', 
    'Computer Games', 'Computer Security', 'Database', 
	'Embedded Systems and Software', 'Human Language Technology', 
	'Miscellaneous', 'Mobile and Wireless Computing', 
    'Mobile Applications', 'Mobile Gaming', 'Networking', 
	'Operating Systems', 'Software Technology', 'Theory', 
	'Vision and Graphics'))
);

insert into tblFypCategories values ('Artificial Intelligence');
insert into tblFypCategories values ('Computer Games');
insert into tblFypCategories values ('Computer Security');
insert into tblFypCategories values ('Database');
insert into tblFypCategories values ('Embedded Systems and Software');
insert into tblFypCategories values ('Human Language Technology');
insert into tblFypCategories values ('Miscellaneous');
insert into tblFypCategories values ('Mobile and Wireless Computing');
insert into tblFypCategories values ('Mobile Applications');
insert into tblFypCategories values ('Mobile Gaming');
insert into tblFypCategories values ('Networking');
insert into tblFypCategories values ('Operating Systems');
insert into tblFypCategories values ('Software Technology');
insert into tblFypCategories values ('Theory');
insert into tblFypCategories values ('Vision and Graphics');