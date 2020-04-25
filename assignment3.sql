ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY MM DD';
select sysdate from dual;

ALTER SESSION SET NLS_DATE_FORMAT = 'HH24:MI:SS';
select sysdate from dual;

select 2*2 from dual;

select abs(-15) from dual;

select sqrt(5) from dual;

select round(15.19, 1) from dual;

select upper('Ivan Bayross') as UPPER from dual;

select lower('Ivan Bayross') as LOWER from dual;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD MM YYYY';
select sysdate + interval '5' month from dual;

SELECT MONTHS_BETWEEN (DATE '2001-07-02', DATE '2001-01-02') FROM dual;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD MM YYYY';
select sysdate from dual;



create table EMP_303(
	EMPNO number(4) primary key,
	ENAME varchar2(20),
	MGR number(4),
	COMM number(4) default 0,
	DEPT_NAME varchar2(10),
	HIREDATE date,
	SAL number(10),
	JOB varchar2(10),
	check (EMPNO >= 7000 and EMPNO <=8000),
	check (LENGTH(ENAME) < 10),
	check (COMM < 1500)
);

insert into EMP_303 values(7487, 'Akshay', 7400, 1200, 'Sales', '12-JAN-2017', 50000, 'Salesman');

insert into EMP_303 values(7687, 'Ainanya', 7400, 1200, 'Sales', '12-JAN-1970', 500000, 'Manager');
insert into EMP_303 values(7787, 'Turner', 7400, 1200, 'Sales', '12-JAN-1970', 400000, 'Clerk');
select * from EMP_303 where ENAME like '_i%';	
select * from EMP_303 where (JOB != 'Manager');

select count(*) from EMP_303 where JOB = 'Manager' ;
select MAX(EMPNO) as MAX, MIN(EMPNO) as MIN, SUM(EMPNO) as SUM, AVG(EMPNO) as AVG from EMP_303 ;
select MAX(EMPNO) as MAX, MIN(EMPNO) as MIN, SUM(EMPNO) as SUM, AVG(EMPNO) as AVG from EMP_303 group by JOB;
select count(*) "NUMBER OF MANAGERS" from EMP_303 where JOB = 'Manager';
select * from EMP_303 where HIREDATE > '01-JAN-1980';
select ename from emp where sal=(select max(sal) from emp where job='salesman' group by job );
select MIN(SAL) from EMP_303 where JOB = 'Clerk';

select * from EMP_303 where SAL > (select SAL from EMP_303 where ENAME like 'Turner');
select DEPT_NAME from (select * from EMP_303 where ENAME like 'Turner');
select DEPT_NAME from EMP_303 where SAL  = (select MIN(SAL) from EMP_303);

