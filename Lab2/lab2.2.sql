-- 01 Create a view named faculty so that the information about lecturers in all departments can be shown
 -- without showing / giving access to the salary details and show all the records of the resulting view.
 
create view faculty as
 select ID, name, dept_name 
 from instructor
 select ID, name, dept_name from faculty
 
 -- 02  Create a view named faculty so that the information about lecturers in all departments can be shown
 -- without showing / giving access to the salary details. Show all the instructors from the Biology department.
 create view faculty as
 select ID, name, dept_name 
 from instructor
 select name from faculty where dept_name = 'Biology'
 
-- 03 Create a view named department_info so that the information about departments for all
 -- departments can be shown without showing / giving access to the budget details and show all the
 -- records of the resulting view.  
 create view department_info as
 select dept_name,building 
 from department
 select *  from department_info;
 
 -- 04  Create a view named instructor_loc using two views (faculty, department_info) created in the
 -- previous cases, so that we can display/give access to information about the building locations for all
 -- instructors and show all the records of the resulting view.
 
 create view instructor_loc as
 select *
 from faculty 
 inner join department_info  using(dept_name)
select name,dept_name,building from instructor_loc

CREATE VIEW instructor_loc AS SELECT * FROM faculty INNER JOIN department_info USING(dept_name)
 SELECT name,dept_name, building FROM instructor_loc;
 
 -- 05 You are required to add images of instructors to the database. Write a query as to how you would
 -- modify the database/ instructor table to complete the requirement. Then show the updated structure
 -- of the instructor table. (Use 'Image' as the new attribute name. In MySQL, you can use 
-- DESCRIBE command to show table structure. In SQLite, you can use the 
-- PRAGMA command to show table structure) 


-- 09  Insert the record ('CS-101','2','Spring','2010','Packard','101','E') to the section relation. Insert the record
 -- ('10101','CS-101','1','Spring','2010') to the teaches relation. 
 
 -- Then display the list of all course sections offered
 -- in Spring 2010, along with the names of the instructors teaching the section. If a section has more than
 -- one instructor, it should appear as many times in the result as it has instructors. If it does not have any
 -- instructor, it should still appear in the result with the instructor name set to null. (Order the results by
 -- the course_id, then by the sec_id and then by the instructor name in the ascending order)
 insert into `section` values ('CS-101','2','Spring','2010','Packard','101','E');
 insert into `teaches` values ('10101','CS-101','1','Spring','2010');
 
 select course_id,sec_id,semester,year,building,room_number,time_slot_id,name
 from section s
 join course c on s.course_id=c.course_id
 join instructor i  on i.dept_name=c.dept_name
 where s.semester = 'spring' and s.year='2010'
 order by course_id,sec_id,i.name asc 
 
 SELECT s.course_id, s.sec_id, s.semester, s.year, s.building, s.room_number, s.time_slot_id, i.name
FROM section s
LEFT JOIN teaches t ON s.course_id = t.course_id AND s.sec_id = t.sec_id AND s.semester = t.semester AND s.year = t.year
LEFT JOIN instructor i ON t.id = i.id
WHERE s.semester = 'Spring' AND s.year = '2010'
ORDER BY s.course_id, s.sec_id, i.name ASC;

 
 
--  10 Insert a record with values ('Mechanical', 'Watson', 90000) to the Department relation. Then display the
 -- list of all departments, with the total number of instructors in each department, using OUTER/INNER
 -- JOIN operations. Make sure to correctly handle departments with no instructors. (Order the results by
 -- the department name in the ascending order) 
 insert into `department` values ('Mechanical', 'Watson', '90000');
  SELECT dept_name, count(id) FROM department LEFT OUTER JOIN instructor USING(dept_name)
  GROUP BY dept_name
  order by dept_name
 
 
 
 
 
 
 
 
 
 
 
 