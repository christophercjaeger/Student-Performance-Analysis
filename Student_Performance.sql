Select * 
from student_data2;


Select avg(total_score), school, sex, count(school)
from student_data2
group by school, sex;


Select avg(G1), avg(G2), avg(G3), school
from student_data2
group by school;

Select avg(total_score), age, count(age)
from student_data2
group by age
order by age;


Select address, avg(total_score)
from student_data2
group by address;
select famsize, avg(total_score)
from student_data2
group by famsize;

update student_data2
set famsize = "4+"
where famsize="GT3";

update student_data2
set famsize = "3 or less"
where famsize="LE3";

alter table student_data2
rename column Pstatus to Parent_Status;

update student_data2
set Parent_Status= "Together"
where famsize="T";

update student_data2
set Parent_Status= "Apart"
where famsize="A";

Select Parent_Status, avg(total_score) as avg
from student_data2
group by Parent_Status;

Select reason, avg(total_score) as average_score, count(school), school
from student_data2
group by reason, school
order by average_score desc;

Select avg(total_score), studytime
from student_data2
group by studytime
order by avg(total_score) desc;

Select avg(total_score), traveltime2
from student_data2
group by traveltime2
order by avg(total_score) desc;

Select avg(total_score), schoolsup
from student_data2
group by schoolsup
order by avg(total_score) desc;


Select avg(total_score), famsup
from student_data2
group by famsup
order by avg(total_score) desc;


Select avg(total_score), activities
from student_data2
group by activities
order by avg(total_score);


Select avg(total_score), nursery
from student_data2
group by nursery
order by avg(total_score);

Select avg(total_score), higher, count(higher)
from student_data2
group by higher
order by avg(total_score);

Select avg(total_score), internet, count(internet)
from student_data2
group by internet
order by avg(total_score);

Select avg(total_score), romantic, count(romantic), activities
from student_data2
group by romantic, activities
order by avg(total_score);


Select avg(total_score), famrel, count(famrel)
from student_data2
group by famrel
order by avg(total_score);

Select avg(total_score), freetime, count(freetime), activities
from student_data2
group by freetime, activities
order by avg(total_score);


Select avg(total_score), goout, count(goout)
from student_data2
group by goout
order by avg(total_score);

Select avg(total_score), Dalc, count(Dalc)
from student_data2
group by Dalc
order by avg(total_score);

Select avg(total_score), walc, count(Walc)
from student_data2
group by Walc
order by avg(total_score);

Select avg(total_score), internet, count(internet)
from student_data2
group by internet
order by avg(total_score);

Select avg(total_score), absences
from student_data2
group by absences
order by avg(total_score) desc;

alter table student_data2
add column absences2 varchar(50);

update student_data2
set absences2=
Case
	when absences =0 then '0'
    when absences = 1 then '1'
    when absences =2 or 3 then 'few'
    when absences between 4 and 8 then 'some'
    when absences between 9 and 12 then 'many'
    when absences >=13 then 'sicko'
end;

Select avg(total_score), absences2, count(absences2)
from student_data2
group by absences2
order by avg(total_score) desc;



DESCRIBE student_data2;

UPDATE student_data2
SET absences2 =
  CASE
    WHEN absences = 0 THEN '0'
    WHEN absences = 1 THEN '1'
    WHEN absences IN (2, 3) THEN 'few'
    WHEN absences BETWEEN 4 AND 8 THEN 'some'
    WHEN absences BETWEEN 9 AND 12 THEN 'many'
    WHEN absences >= 13 THEN 'sicko'
    ELSE 'unknown'
  END;


Select *
from student_data2;
