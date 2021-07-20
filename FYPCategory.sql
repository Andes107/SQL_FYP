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