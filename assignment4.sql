create table teacher_tab(
	Tid number(10) primary key,
	Name varchar2(20), 
	Dept varchar2(10)
);

create table subject_tab(
	Subno number(10) primary key,
	Subtitle varchar2(20)
);

create table taught_by(
	Tid number(10) references teacher_tab(Tid),
	Subno number(10) references subject_tab(Subno)
);

create table student_tab(
	rollno number(10) primary key,
	sname varchar2(20),
	city varchar2(20)
);

insert into teacher_tab values(01, 'SSK', 'CSE');
insert into teacher_tab values(02, 'Akshay', 'Physics');

insert into subject_tab values(71, 'Mechanics');
insert into subject_tab values(72, 'DBMS');
insert into subject_tab values(73, 'Thermodynamics');

insert into taught_by values(02, 71);
insert into taught_by values(01, 72);
insert into taught_by values(02, 73);	


insert into student_tab values (01, 'Ak', 'Kolkata');

select * from teacher_tab where Dept='Physics' and Tid= (select Tid from taught_by where Subno=(select Subno from subject_tab where Subtitle='Thermodynamics'));	

UPDATE subject_tab
SET Subtitle = 'RDBMS'
WHERE Subtitle = 'DBMS';

select * from student_tab where (city='Kolkata' and (rollno >=20 and rollno <=25));
select * from student_tab where city='Kolkata' order by rollno; 


create table sailors_tab(
	s_id number(10) primary key,
	s_name varchar2(20),
	rating number(10),
	age number(3)
);

create table boats_tab(
	b_id number(10) primary key,
	b_name varchar2(20),
	colour varchar2(20)
);

create table reserves_tab(
	s_id number(10) references sailors_tab(s_id),
	b_id number(10) references boats_tab(b_id),
	day date
);

insert into sailors_tab values(10, 'Tarun', 5, 25);

insert into boats_tab values(12, 'Titanic', 'White');

insert into reserves_tab values(10, 12, '12-Jan-2018');

select colour from boats_tab where b_id= (select b_id from reserves_tab where s_id=(select s_id from sailors_tab where s_name='Tarun')) ;

select * from sailors_tab where s_id=(select s_id from reserves_tab where to_char(to_date(day, 'dd/mm/yyyy'), 'DAY') = 'Monday');

select * from boats_tab where (colour = 'Red' or colour = 'Green');
delete from reserves_tab where s_id = (select s_id from sailors_tab where age>60);
delete from sailors_tab where age>60;