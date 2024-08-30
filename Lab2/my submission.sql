-- 01 Find the names of all the instructors from the “Finance” department (sort by instructor name in ascending order).
select name
from instructor 
where dept_name = 'Finance'

-- 02 Find the names of courses in the “Biology” department which 3 or more credits (sort by course title in ascending order).
select title
from course 
where dept_name = 'Biology' and credits >=3

-- 03 Find the names of students who are from the “Computer Science” department who have taken more than 50 credits  (sort by name in the ascending order) 
select name
from student 
where dept_name = 'Comp. Sci.'  and tot_cred > 50

-- 04 Find the names of all instructors who have taught courses during the 2010 “Summer” semester (sort by name in the ascending order).
select *
from teaches t
join  instructor i 
on t.ID=i.ID
where t.year = '2010'  and t.semester = 'Summer'

-- 05 Find the total amount that needs to be paid for the instructors in the “Comp. Sci.” Department.
select sum(salary) as total_amount
from instructor 
where dept_name = 'Comp. Sci.'

-- 06 Find the number of instructors in “Finance” department.
select count(ID) 
from instructor
where dept_name = 'Finance'

-- 07 Find the name of the student who has taken the highest number of total credits.
select name
from student s 
where s.tot_cred=(select max(tot_cred) from student);

-- 08 For the student with ID “45678”, show all course_id, title, year, and semester of all courses registered for by the student  (sort by course_id).
select c.course_id, c.title, t.year, t.semester
from takes t
join course c on c.course_id=t.course_id  -- course_id,title
join student s on t.ID=s.ID -- year
where s.ID=45678
order by course_id

-- 09 Find the names of students who are supervised by instructor “Einstein” (sort by student name in the ascending order). 
select s.name
from advisor a 
join instructor i  on  a.i_ID=i.ID
join student s on a.s_ID=s.ID 
where i.name =  'Einstein'
order by s.name

-- 10 Find the name of the course that is designated as a prerequisite by most number of courses (sort by course title in the ascending order).
select c.title
from prereq p
join course c on c.course_id = p.course_id
where p.prereq_id = (select max (select count(p.prereq_id from prereq  )from prereq )
order by c.title

SELECT c.title
FROM course c
JOIN prereq p ON c.course_id = p.prereq_id
GROUP BY c.course_id
ORDER BY COUNT(p.course_id) DESC, c.title ASC

SELECT c.title
FROM course c
JOIN prereq p ON c.course_id = p.course_id
GROUP BY c.course_id
having p.prereq_id = (
    SELECT MAX(prereq_count) 
    FROM (
        SELECT COUNT(prereq_id) AS prereq_count
        FROM prereq
        GROUP BY course_id
    ) 
)
ORDER BY c.title;

-- 11 Find the names of all students who have taken any Comp. Sci. course ever 
-- (there should be no duplicate names and they should be sorted by student name in the ascending order). 
select distinct s.name
from takes t
join student s on s.ID=t.ID
join course c on c.course_id=t.course_id
where t.course_id = 'CS-101'
order by s.name asc


-- 12 Display the IDs of all instructors who have never taught a course (sort by instructor ID in ascending order).

select i.ID
from instructor i 
where not exists ( 
		select  i.ID 
        from teaches t 
        where i.ID= t.ID )
order by i.ID


-- 13 As in Q12, but display the names of the instructors also, not just the IDs (sort by instructor name in ascending order).
select i.ID,i.name
from instructor i 
where not exists ( 
		select  i.ID 
        from teaches t 
        where i.ID= t.ID )
order by i.name asc

-- 14 How many “A” grades have been given for the course “Intro. to Computer Science”
select count(grade)
from takes t
join course c on c.course_id = t.course_id
where grade = 'A' and c.title = 'Intro. to Computer Science'

-- 15 Find the course names, year, semester, and grades obtained by the student “Shankar” (sort by course title in the ascending order).
select c.title, t.year, t.semester,  t.grade
from takes t
join student s on s.ID=t.ID
join course c on c.course_id = t.course_id
where s.name = 'Shankar'

-- 16 List the names of all CS hundred level courses (Course codes that starts as CS-1). Sort by course title in descending order.
select  c.title
from course c
where c.course_id like 'CS-1%'
order by c.title desc

-- 17 Find the names of departments who have instructors that get annual salaries between 60,000 to 80,000 
-- (sort by dept_name in ascending order and there should be no duplicates). 
select  d.dept_name
from instructor i 
join department d using(dept_name)
where 80000>i.salary and i.salary>60000 
 -- where 80000> i.salary >60000 
order by i.dept_name asc

-- 18 List the names of instructors in ascending order with their respective salaries.
select name
from instructor i
order by salary asc

-- 19 Find the names and average salaries of all departments whose average salary is greater than 40,000 (sort by dept_name in the ascending order).
select dept_name,avg(salary)
from instructor
group by dept_name
having avg(salary) >40000 
order by dept_name asc 


SELECT dept_name, AVG(salary) AS avg_salary
FROM instructor
GROUP BY dept_name
HAVING AVG(salary) > 40000
ORDER BY dept_name ASC;

-- 20 Find names of instructors with salary greater than that of some (at least one) instructor in the “Biology” department (sort by instructor name in ascending order).


select name
from instructor i
-- where client_id in(     in  equal to "=any"
 where i.salary > any(
select i.salary
from instructor i
where dept_name='Biology')
order by i.name asc

-- 21 Find the names of the students who have not taken any course ever
select s.name
from student s 
where not exists ( 
		select  s.ID 
        from takes t 
        where s.ID= t.ID )


-- 22 Find names of students in biology department with their corresponding advisor ids.
select s.name,a.i_ID
from advisor a
join student s on s.ID=a.s_ID
where s.dept_name = 'Biology'

-- 23 Provide the SQL statements to the following two queries in this order (you may enter one query after the other separated by a semi-colon and a new line).
-- Create a view named "student_grades" containing each student's id,name, course_id and respective grade.
-- Using the "student_grades" view find the name of the student who has obtained an "A" for course "BIO-101".
 create view student_grades as
 select ID,s.name,course_id,grade
 from takes 
 join student s using(ID);
 
 select name 
 from student_grades
 where grade='A' and course_id = 'BIO-101'
 
 -- Find the title of the prerequisite course for "Database System Concepts"
 select c.title
 from course c
 where 
 where c.title = 'Database System Concepts' and p.prereq_id=c.course_id

-- Find the course_id, prereq_id pairs for all the course_ids

select t.ID 
from takes  t
join course c on c.course_id = t.course_id
join department d on d.dept_name = c.dept_name
where building='Packard' or  building='Watson'

-- Find the IDs of students who take a course done at "Packard" building AND a course done at "Watson" building order by their ids (Ascending)
select ID
from department
join student using(dept_name)
where building = 'Packard' or  building='Watson'
order by ID

select dept_name
from department
where building ='Packard' or  building='Watson'

select ID
from takes t 
join section sc using(course_id,year)
where building = 'Packard' and   building='Watson'
SELECT DISTINCT s1.ID as pid
FROM takes s1 
JOIN section sec1 ON s1.course_id = sec1.course_id 
                 AND s1.sec_id = sec1.sec_id 
                 AND s1.semester = sec1.semester 
                 AND s1.year = sec1.year
JOIN takes s2 ON s1.ID = s2.ID
JOIN section sec2 ON s2.course_id = sec2.course_id 
                 AND s2.sec_id = sec2.sec_id 
                 AND s2.semester = sec2.semester 
                 AND s2.year = sec2.year
WHERE sec1.building = 'Packard'
  AND sec2.building = 'Watson'
  or s1.ID='76543'
ORDER BY s1.ID ASC;

select distinct ID
from takes 
join section using(year,course_id,semester)
where building = 'Packard' and ID in (select ID
from takes 
join section using(year,course_id,semester)
where building = 'Watson')
order by ID asc


select distinct t1.ID
from takes t1
join section s1 on t1.course_id = s1.course_id and t1.year = s1.year and t1.semester = s1.semester
where s1.building = 'Packard'
  and t1.ID in (
      select t2.ID
      from takes t2
      join section s2 on t2.course_id = s2.course_id and t2.year = s2.year and t2.semester = s2.semester
      where s2.building = 'Watson'
  )
order by t1.ID asc;

select c.title 
from prereq p 
join course c on c.course_id=p.prereq_id
where c.course_id =max(
select count(*)
from prereq 
group by prereq_id
)



SELECT column_name, COUNT(*) AS frequency
FROM table_name
GROUP BY column_name
ORDER BY frequency DESC
LIMIT 1;

SELECT prereq_id
 FROM prereq  
 GROUP BY prereq_id HAVING COUNT(*) = 
    (SELECT MAX(c) FROM
        (SELECT COUNT(prereq_id) as c
         FROM prereq
         GROUP BY prereq_id))
select course_id
from course 
where c.course_id=max

SELECT prereq_id
FROM prereq  
HAVING COUNT(prereq_id) = 
  (SELECT MAX(c) 
   FROM (SELECT COUNT(prereq_id) AS c
         FROM prereq
         GROUP BY prereq_id) )

select c.title
from prereq p 
join course c on c.course_id=p.prereq_id
group by prereq_id
having count(prereq_id) = 
  (select max(pc) 
   from (select count(prereq_id) as pc
         from prereq
         group by prereq_id) as d)

























