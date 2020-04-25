create table EMP_CSE01 (  EMPNO 	 number(4) primary key,
					ENAME 	 varchar2(20),
					JOB  	 char(20),
					MGR	 	 number(4),
					HIREDATE date,
					SAL 	 number(4),
					COMM 	 number(4),
					DEPTNO 	 number(2)
				);

insert into EMP_CSE01 values(&empno, '&ename', '&job', &mgr, '&hiredate', &sal, &comm, &deptno);

select * from EMP_CSE01;
select * from EMP_CSE01 where JOB='Manager';
select * from EMP_CSE01 where EMPNO=7369;
select * from EMP_CSE01 where HIREDATE>'1-May-81';
select * from EMP_CSE01 where SAL>1500;
select * from EMP_CSE01 where COMM=0;
select * from EMP_CSE01 where ENAME like 'A%';

alter table EMP_CSE01 
add PHONENO number(10);

alter table EMP_CSE01 
modify JOB varchar2(20);

alter table EMP_CSE01
drop column PHONENO;

/**		INPUT DATA

7369 
Smith 
Clerk 
7902 
17-Dec-80 
800 
null
20

7499
Allen 
Salesman 
7698 
20-Feb-81 
1600 
300 
30

7521 
Ward 
Salesman 
7698 
22-Feb-81 
1250 
500 
30

7566 
Jones 
Manager 
7839 
2-Apr-81 
2975 
null
20

7654 
Martin 
Salesman 
7698 
28-Sep-81 
1250 
1400 
30

7698 
Blake 
Manager 
7839 
1-May-81 
2850 
null
30

7782 
Clark
Manager 
7839 
9-Jun-81 
2450 
null
10

7788 
Scott 
Analyst 
7566 
9-Dec-82 
3000 
null
20

7839 
King 
President 
null
17-Nov-81 
5000 
null
10

7844
Turner 
Salesman 
7698 
8-Sep-81 
1500 
0 
30

7876 
Adams
Clerk 
7788 
12-Jan-83 
1100 
null
20

7900 
James 
Clerk 
7698 
3-Dec-81 
950 
null
30

7902
Ford 
Analyst 
7566 
4-Dec-81 
3000
null 
20

7934 
Miller
Clerk 
7782 
23-Jan-82 
1300
null 
10
*/

/* SECOND TABLE */
create table dept_CSE01(
	DEPTNO number(2),
	DNAME varchar2(20),
	LOC varchar2(20)
);

insert into dept_CSE01 values(&deptno, '&dname', '&loc');

/**		INPUT DATA
10 
Accounting 
New York

20
Research
Dallas

30
Sales 
Chicago

40 
Operations 
Boston
*/