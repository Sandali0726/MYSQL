-- 1
select printf("%-10.10s", name) as name
from instructor 
where dept_name = 'Finance'
order by name asc

-- 2
select printf("%-10.10s", name) as name
from student s 
where not exists ( 
		select  s.ID 
        from takes t 
        where s.ID= t.ID )
        
-- 3
select printf("%-10.10s", name) as name,
       printf("%-10.10s", i_ID) as i_ID

from advisor a
join student s on s.ID=a.s_ID
where s.dept_name = 'Biology'

-- 4
create view student_grades as
 select ID,s.name,course_id,grade
 from takes 
 join student s using(ID);
 
select printf("%-10.10s", name) as name 
 from student_grades
 where grade='A' and course_id = 'BIO-101'
 
 -- 5 
 select title from course
    where course_id in (select prereq_id from prereq
    where course_id in (select course_id from course
    where title="Database System Concepts"));
    
-- 6 
 select printf("%-10d", count(ID)) as 'count(ID)'
from instructor
where dept_name = 'Finance'

-- 7 
select printf("%-10.10s", c.course_id) as course_id,c.title,printf("%-10.10s",  t.year) as  year,printf("%-10.10s",  t.semester) as  semester
from takes t
join course c on c.course_id=t.course_id  -- course_id,title
join student s on t.ID=s.ID -- year
where s.ID=45678
order by c.course_id

-- 8
-- select c.course_id,p.prereq_id
select printf("%-10.10s", c.course_id) as course_id,printf("%-10.10s", p.prereq_id) as prereq_id
from course c
left join prereq p on p.course_id= c.course_id

-- 9
select  printf("%-10.10s", s.name) as name 
from advisor a 
join instructor i  on  a.i_ID=i.ID
join student s on a.s_ID=s.ID 
where i.name =  'Einstein'
order by s.name

-- 10
select c.title
from prereq p 
join course c on c.course_id=p.prereq_id
group by prereq_id
having count(prereq_id) = 
  (select max(pc) 
   from (select count(prereq_id) as pc
         from prereq
         group by prereq_id) as d)

-- 11
select distinct  printf("%-10.10s", name) as name
from takes t
join student s on s.ID=t.ID
join course c on c.course_id=t.course_id
where t.course_id = 'CS-101'
order by s.name asc

-- 12
 select distinct  printf("%-10.10s", i.ID ) as ID
from instructor i 
where not exists ( 
		select  i.ID 
        from teaches t 
        where i.ID= t.ID )
order by i.ID

-- 13
 select distinct  printf("%-10.10s", i.ID ) as ID,  printf("%-10.10s", i.name ) as name
from instructor i 
where not exists ( 
		select  i.ID 
        from teaches t 
        where i.ID= t.ID )
order by i.name asc

-- 14
select printf("%-10d", count(ID)) as 'count(ID)'
from takes t
join course c on c.course_id = t.course_id
where grade = 'A' and c.title = 'Intro. to Computer Science'

-- 15

select   printf("%-24.24s", c.title) as  title,
        printf("%-10.10s", t.year) as  year ,
         printf("%-10.10s", t.semester) as semester,
          printf("%-10.10s", t.grade) as grade
from takes t
join student s on s.ID=t.ID
join course c on c.course_id = t.course_id
where s.name = 'Shankar'
order by c.title asc

-- 16
select  c.title
from course c
where c.course_id like 'CS-1%'
order by c.title desc

-- 17
select  distinct d.dept_name
from instructor i 
join department d using(dept_name)
where 80000>=i.salary and i.salary>=60000 
order by i.dept_name asc

-- 18
select name, printf("%-10.10s", salary ) as salary  
from  instructor 
order by name asc

-- 19
select dept_name,  printf("%-10.10s", avg(salary))  as avg_sal
from instructor
group by dept_name
having avg(salary) >40000 
order by dept_name asc 

-- 20
select distinct printf("%-10.10s",  ID ) as pid
from takes 
join section using(year,course_id,semester)
where building = 'Packard' and ID in (select ID
from takes 
join section using(year,course_id,semester)
where building = 'Watson')
order by ID asc
