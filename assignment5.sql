create table zipcode102(
	zip number(10) primary key,
	city varchar(10)
);

create table employees102(
	eno number(10) primary key,
	ename varchar2(20),
	zip number(10) references zipcode102(zip),
	hdate date
);


create table parts102(
	pno number(10) primary key,
	pname varchar2(20),
	qoh number(20),
	price number(10),
	lvl number(10)
);

create table customers102(
	cno number(10) primary key,
	cname varchar2(20),
	street varchar2(20),
	zip number(10) references zipcode102(zip),
	phone number(15)
);

create table orders102(
	ono number(10) primary key,
	cno number(10) references customers102(cno),
	eno number(10) references employees102(eno),
	street varchar(20),
	received date,
	shipped date
);

create table odetails102(
	ono number(10),
	pno number(10),
	qty number(10),
	constraint Aab primary key(ono, pno)
);






 
/*INPUTS*/


insert into zipcode102 values (700023, 'Khidirpur');	
insert into zipcode102 values (700024, 'Khidirpu');
insert into zipcode102 values (700025, 'Mumbai');

insert into employees102 values (1, 'Akshay', 700023, '12-Jun-2010');
insert into employees102 values (2, 'Ananya', 700024,'12-Jul-2010');	
insert into employees102 values (3, 'Atif', 700025, '12-Mar-2010');	

insert into parts102 values(1, 'Tyre', 12, 200, 5);
insert into parts102 values(2, 'Tye', 13, 2030, 6);
insert into parts102 values(3, 'Tyr', 11, 2070, 8);
insert into parts102 values(4, 'Ty', 17, 2009, 7);	


insert into customers102 values(1, 'abc', 'kasdj', 700023, 8934);
insert into customers102 values(2, 'abce', 'ksdj', 700024, 8834);
insert into customers102 values(3, 'abec', 'kadj', 700025, 8734);
insert into customers102 values(4, 'aebc', 'kaddj', 700023, 8634);
insert into customers102 values(5, 'eabc', 'kfsdj', 700025, 8534);	


insert into orders102 values(1, 1, 1,'kasdj', '15-Feb-2018', '19-Feb-2018');
insert into orders102 values(2, 2, 2, 'kasdj', '14-Feb-2018', '18-Feb-2018');	
insert into orders102 values(3,3,3, 'kasdj', '13-Feb-2018', '17-Feb-2018');

insert into odetails102 values(1, 1, 2);
insert into odetails102 values(2, 2, 2);
insert into odetails102 values(3, 3, 2);	
	






select pno, pname from parts102 where price < 20;
select pno from odetails102;
select * from customers102 where cname like 'S%';
select cname from customers102 where cno = (select cno from orders102 where shipped = null);
select cname, ename from customers102, employees102, orders102 where customers102.cno=orders102.cno and employees102.eno=orders102.eno;
select * from employees102 where HDATE=(select min(HDATE) from employees102);
select pno, pname, price from parts102 where price >20000 order by price;

