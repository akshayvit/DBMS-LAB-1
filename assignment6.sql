create table customers(customerID number,
						customerName varchar2(40),
						contactName varchar2(40),
						address varchar2(60),
						city varchar2(20),
						postalCode number,
						country varchar2(20));
insert into customers values(1,'Alfreds Futterd','Maria Anders','Obere Str.57','Berlin',12209,'Germany');
insert into customers values(2,'Ana Helados','Ana Trujillo','Avda. Construction 2222','Mexico D.F.',05021,'Mexico');
insert into customers values(1,'Alfreds Futter','Maria Anders','Obere Str.57','Berlin',12209,'Germany');

create table suppliers(supplierID number,
						supplierName varchar2(40),
						contactName varchar2(40),
						address varchar2(60),
						city varchar2(20),
						postalCode number,
						country varchar2(20));
insert into suppliers values(1,'Exotic Liquid','Charlotte Cooper','49 gilbert St.','Berlin',12209,'Germany');
insert into suppliers values(2,'New Orleans Cajun Delights','Shelley Burke','P.O.Box 78934','Mexico D.f.',05023,'Mexico');
insert into suppliers values(3,'Grandma Kelly''s Homestead','Regina Murphy','707 Oxford St.','Ann Arbor',48104,'USA');

select city from customers UNION select city from suppliers;
select city from customers UNION ALL select city from suppliers;
select city from customers where country like 'Germany' UNION select city from suppliers where country like 'Germany';
select customers.customerName, suppliers.supplierName from customers, suppliers where customers.city = suppliers.city;
select country from suppliers MINUS select distinct country from customers;