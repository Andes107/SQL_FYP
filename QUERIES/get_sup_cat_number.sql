use FYP;
go
select fac.name, count(sup.fypId), count(distinct fyp.category)
from tblSupervises as sup inner join tblFyp as fyp on sup.fypId = fyp.PK_tblFyp
right outer join tblFaculties as fac on sup.username = fac.PK_tblFaculties
group by fac.PK_tblFaculties, fac.name
order by fac.name;