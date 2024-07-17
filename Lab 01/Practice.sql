
-- (01)Find the name/s of all the instructor/s from the Biology department.
select printf("%-10.10s", name) as name
from instructor 
where dept_name = 'Physics'
order by name asc


-- (02) Find the names of courses in the Physics department that have 3 credits.
select  title 
from course 
where dept_name= 'Physics' and credits=3

-- (03)Find the names of instructors from the Physics department whose salary is above 50,000.
select printf("%-10.10s", name) AS name 
from instructor
where dept_name='Physics' and salary> 50000

-- (04)Find the names of students who have a total credits equal or above to 100. (sort by total credit in descending order)
select printf("%-10.10s", name) AS name 
from student 
where tot_cred>=100 
order by  tot_cred  desc

-- (05)Find building where the instructor "Mozart" has his office.
select building 
from department,instructor 
where department.dept_name = instructor.dept_name  and  name = 'Mozart' 

-- (06)List all the course titles that were offered during Summer 2009 (sort by course_id)
select  title 
from course  
natural join section 
where section.year=2009  and section.semester='Summer'
order by course.course_id;

-- (07)Find the lecture time  (dates and start times) when the course "Genetics" was offered in 2010.
select  -- distinct day, start_hr,start_min
	printf('%-10.10s', day) AS day,
		printf('%-10.10s', start_hr) AS start_hr,
		 printf('%-10.10s', start_min) AS start_min
from time_slot 
natural join course
natural join section
where course.title='Genetics' and section.year=2010 

-- (08)For the student with ID 12345, show all course_id and title of all courses registered for by the student. (sort by course_id)
select  printf('%-10.10s', course_id) as course_id , printf('%-10.10s', title) as title
from course 
natural join takes
where ID=12345
order by  course_id

-- ? (09)What is the title of the course/s that is a prerequisite for the "Robotics" course.
-- select title 
-- from course 
-- natural join prereq  
-- where  title='Robotics' and prereq_id=course_id
select prereq_course.title 
from course as main_course
join prereq on main_course.course_id = prereq.course_id
join course as prereq_course on prereq.prereq_id = prereq_course.course_id
where main_course.title = 'Robotics';

-- (10)Find the names of all students who have taken any Comp. Sci. course ever (there should be no duplicate names)
select distinct  printf("%-10.10s", name) AS name 
from student s
join takes t on t.ID=s.ID
join course c on c.course_id=t.course_id
where c.dept_name='Comp. Sci.'
order by name asc

-- Provide the SQL statements to the following two queries in this order (you may enter one query after the other separated by a semi-colon and a new line).
-- Create a table named "scholarship" with the fields school_id(primary key), student_id( referencing ID in students table) and
-- amount (numeric value with precision of 8 and scale of 2). Use appropriate data types.
-- Insert the scholarship amount of 40000 given to student "00128" with school_id "00001"

CREATE TABLE `scholarship` (
  `school_id` VARCHAR(15),
  `student_id` VARCHAR(7),
  `amount` NUMERIC(8,0),
  PRIMARY KEY (`school_id`)
);

INSERT INTO `scholarship` VALUES ('00001', '00128', 40000);









