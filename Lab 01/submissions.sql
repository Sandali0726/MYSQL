-- 01
select  printf("%-10.10s", name) as name 
from instructor 
where dept_name = 'Physics'
order by name asc

-- 02
select  title 
from course 
where dept_name= 'Comp. Sci.' and credits=3
order by title asc

-- 03
select printf("%-10.10s", name) as name 
from instructor
where dept_name='Comp. Sci.' and salary> 75000
order by salary desc

-- 04
select printf("%-10.10s", name) as name 
from student 
where tot_cred>=100 
order by  tot_cred  desc

-- 05
create table  `scholarship` (
  `school_id` varchar(15) primary key,
  `student_id` varchar(15) references students(ID),
  `amount` varchar(8,2)
  
);

insert into `scholarship` values ('00001     ', '00128     ', '40000     ');

-- 06
select  title 
from course  
natural join section 
where section.year=2009  and section.semester='Summer'
order by course.course_id;

-- 07
select printf('%-10.10s', day) as day,
	   printf('%-10.10s', start_hr) as start_hr,
	   printf('%-10.10s', start_min) as start_min
from time_slot 
natural join course
natural join section
where course.title='Genetics' and section.year=2010 

-- 08
select printf('%-10.10s', course_id) as course_id , title
from course 
natural join takes
where ID=12345
order by  course_id

-- 09
select prereq_course.title 
from course as main
join prereq on main.course_id = prereq.course_id
join course as prereq_course on prereq.prereq_id = prereq_course.course_id
where main.title = 'Robotics';

-- 10
select distinct  printf("%-10.10s", name) as name 
from student s
join takes t on t.ID=s.ID
join course c on c.course_id=t.course_id
where c.dept_name='Comp. Sci.'
order by name asc