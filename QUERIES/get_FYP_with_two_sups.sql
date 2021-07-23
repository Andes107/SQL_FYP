use FYP;
go
/*
	1. To get rid of the annoying message window, press ctrl+R!
	https://stackoverflow.com/a/39975977
	2. create index syntax:
		create unique clustered index PK_tbltest_IX
		on tbltest(PK_tbltest)
		include(name);
	3. drop index syntax:
		drop index tbltest.PK_tbltest_IX;
*/
create nonclustered index IX_tblFyp_cat_title
on tblFyp(category)
include(title);
go
drop index tblFyp.IX_tblFyp_cat_title;
go
select fyp.title, fyp.category, fac.name
from tblSupervises as sup inner join tblFaculties as fac on sup.username = fac.PK_tblFaculties
inner join tblFyp as fyp on sup.fypId = fyp.PK_tblFyp
where fyp.PK_tblFyp in (select fypId
						from tblSupervises
						group by fypId
						having count(fypId)=2)
order by fyp.category, fyp.title, fac.name;