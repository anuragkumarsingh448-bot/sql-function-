create database sql_function;
use sql_function;
create table student_performance
( student_id int primary key,
name varchar (50),
course varchar(30),
score int,
attendance int,
mentor varchar(50),
join_date date,
city varchar (50));

Insert into student_performance
values
(101, "Aarav Mehta", "Data science", 88, 92, "Dr, Sharma", "20230612", "Mumbai");
insert into student_performance
values
(102, "Riya singh", "Data science", 76, 85, "Dr. Sharma", "20230701", "Delhi"),
(103, "Kabir Khanna", "Python", 91, 96, "Ms. Nair", "20230620", "Mumbai"),
(104, "Tanvi Patel", "SQL", 84, 89, "Mr. Iyer", "20230530", "Bengaluru"),
(105, "Ayesha Khan", "python", 67, 81, "Ms. Nair", "20230710", "Hyderabad"),
(106, "Dev Sharma", "SQL", 73, 78, "Mr. Iyer", "20230528", "Pune"),
(107, "Arjun Verma", "Tableau", 95, 98, "Ms. Kapoor", "20230615", "Delhi"),
(108, "Meera Pillai", "Tableau", 82, 87, "Ms. Kapoor", "20230618", "Kochi");
insert into student_performance
values
(109, "Nikhil Rai", "Data Science", 79, 82, "Dr. Sharma", "20230705", "Chennai"),
(110, "Priya Desai", "SQL", 92, 94, "Mr.Iyer", "20230527", "Bengaluru"),
(111, "Siddharth jain", "Python", 85, 90, "Mr. Nair", "20230702", "Mumbai"),
(112, "Sneha Kulkarni", "Tableau", 74, 83, "Ms. Kapoor", "20230610", "Pune"),
(113, "Rohan Gupta", "SQL", 89, 91, "Mr. Iyer", "20230525", "Delhi"),
(114, "Ishita Joshi", "Data Science", 93, 97, "Dr. Sharma", "20230625", "Bengaluru"),
(115, "Yuvraj Rao", "Python", 71, 84, "Ms. Nair", "20230712", "Hyderabad");
select * from student_performance;
### Question no. 1 Create a ranking of students based on score(highest First)?

select rank() over(order by score desc) as ranking, 
student_id, name, course, score, attendance, mentor, join_date, city from student_performance;

### Question no. 2 Show Each student's score and the previous student's score (based on score order)
select *,
 lag(score) over (order by score desc) as lag_score from student_performance;
 
 ### Question no. 3 Convert all student names to uppercase and extract the month name from join_date?
 select upper(name) as name_upper, month(join_date) as month_extractact from student_performance;
 
 ### Question no. 4 Show each student's name and the next student's attendance (ordered by attendance)?
 select name, lead(attendance) over(order by attendance) as lead_attendance from student_performance;
 
 ### Question no. 5 Assign students into 4 performance groups using Ntile()?
 select ntile(4) over(order by score desc), student_id, name, course, score, attendance, mentor, join_date, city  from student_performance;
 
 ### Question no. 6 for each course, assign a row number based on attendance (highest first)?
 select row_number() over(partition by course) as row_num, student_id, name, course, score, attendance, mentor, join_date, city from student_performance
 order by attendance desc;
 
 ### Question no. 7 Calculate the number of days each student has been enrolled(from join_date to today) (Assume current date = '2025-01-01')
 select name, datediff(20250101, join_date) as no_of_days from student_performance;
 
 ### Question no. 8 Format join_date as "month Year" (e.g., "june 2023")?
 select name, date_format(join_date, "%M, %Y") as new_date from student_performance;
 
 ### Question no. 9 Replace the city "Mumbai" with "mum" for display purpose?
 select * from student_performance;
 select name, 
 replace(city, "Mumbai", "mum") as rep_city from student_performance;
 
 ### Question no. 10 For each course, find the highest score using First_Value()
 select name, course, score, first_value(score) over(partition by course order by score desc) as high_score from student_performance;