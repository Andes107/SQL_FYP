create table tblTest(
	PK_tblTest smallint primary key
);

select CONSTRAINT_NAME
from information_schema.table_constraints
where table_schema='dbo' and table_name='tblTest';
/*
	1. A way to get your primary key name which was declared with primary key
	https://stackoverflow.com/a/5856345
*/
alter table tblTest
drop constraint PK__tblTest__377B119F1D3E5D1F;
/*
	1. drop primary key if you have primary key constraint name
	https://stackoverflow.com/a/5856345
*/
alter table tblTest
add constraint PK_tblTest primary key (PK_tblTest);
/*
	1. if you don't give a name to primary key constraint, sql server 
	gives one to you, if you want to be in control, try the above syntax.
	as a result, you will have an index and constraint with a controlled
	name. though the constraint appears not in the constraint
	https://www.w3schools.com/sql/sql_primarykey.ASP
*/

drop index PK_tblTest
on tblTest;
/*
	1. Note that this is erroneous, you can't drop a IS-AM on the table
	2. The only way is to drop primary key constraint
	https://blog.sqlauthority.com/2016/08/14/drop-clustered-index-primary-key-column-interview-question-week-084/
	3. There is a need to constantly insert, update and delete indexes
	according to changing needs.
	4. However, the performance itself can be costly.
	5. For clustered index, the table will be physically reordered, just
	imagine you have 10M records. Also, if there are nonclustered indexes,
	all of the pointers to seek clustered index will be turned into RID.
	https://stackoverflow.com/a/55027586
	https://stackoverflow.com/a/47603655
*/

drop table tblTest;