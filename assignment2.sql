
create table client_master_new(
	client_no varchar2(6) primary key,
	name varchar2(20) not null,
	city varchar2(15),
	pincode number(8),
	state varchar2(15),
	baldue number(10, 2),
	check (client_no like ('C%'))
);

insert into client_master_new values('&client_no', '&name', '&city', &pincode, '&state', &baldue);

/* --------- INPUT DATA -------

C00001
Ivan Bayross
Mumbai
400054
Maharashtra
15000

C00002
Mamta Mazumdar
Madras
780001
Tamil Nadu
0

C00003
Chhaya Bankar
Mumbai
400057
Maharashtra
5000

C00004
Ashwini Joshi
Bangalore
560001
Karnataka
0

C00005
Hansel Colaco
Mumbai
400060
Maharashtra
2000

C00006
Deepak Sharma
Mangalore
560050
Karanataka
0
*/

create table product_master_new (
	product_no varchar2(6) primary key,
	description varchar2(15) not null,
	profit_percent number(4,2) not null,
	unit_measure varchar2(10) not null,
	qty_on_hand number(8) not null,
	reorder_lvl number(8) not null,
	sell_price number(8,2) not null,
	cost_price number(8,2) not null,
	check (product_no like ('P%')),
	check (sell_price > 0),
	check (cost_price > 0)
);

insert into product_master_new values ('&pr', '&ds', &pro, '&un', &q, &r, &s, &c);

/*

P00001
T-Shirts
5
Piece
200
50
350
250

P0345
Shirts
6
Piece
150
50
500
350

P06734
Cotton Jeans
5
Piece
100
20
600
450

P07865
Jeans
5
Piece
100
20
750
500

P07868
Trousers 
2
Piece
150
50
850
550

P07885
PuMOvers
2.5
Piece
80
30
700
450

P07965
Denim Shirts
4
Piece
100
40
350
250

P07975
Lyers Tops 
5
Piece
70
30
300
175

P08865
Skirts
5
Piece
75
30
450
300

*/

create table salesman_master_new(
	salesman_no varchar2(6) primary key,
	salesman_name varchar2(20) not null,
	address1 varchar2(10) not null,
	address2 varchar2(10),
	city varchar2(10),
	pincode number(7),
	state varchar2(20),
	sal_amt number(8,2) not null,
	tgt_to_get number(6,2) not null,
	ytd_sales number(6,2) not null,
	remarks varchar2(20),
	check (salesman_no like ('S%')),
	check (sal_amt > 0),
	check (tgt_to_get > 0)
);

insert into salesman_master_new values('&s1', '&s2', '&a1', '&a2', '&c', &p, '&s3', &s4, &t, &y, '&r');


/* --------- INPUT VALUES ----

S00001
Aman
A/14
Worli
Mumbai
400002
Maharashtra
3000
100
50
Good


S00002
Omkar
65
Nariman
Mumbai
400001
Maharashtra
3000
200
100
Good


S00003
Raj
P-7
Bandra
Mumbai
400032
Maharashtra
3000
200
100
Good


S00004
Ashish
A/5
Juhu
Mumbai
400044
Maharashtra
3500
200
150
Good


*/

create table sales_order_new(
	order_no varchar2(6) primary key,
	order_date date,
	client_no varchar2(6) references client_master_new(client_no),
	salesman_no varchar2(6) references salesman_master_new(salesman_no),
	dely_type char(1) default 'F',
	billed_yn char(1),
	dely_date date,
	order_status varchar2(10),
	check (dely_type in ('F', 'P')),
	check (order_status in ('in process', 'fulfilled','backorder','cancelled')),
	check (dely_date > order_date)		
);


insert into sales_order_new values(	'&or', 	'&ord',	'&c',	'&s', 	'&de', 	'&b', 	'&dd', 	'&os');

/*	---------- INPUT VALUES ----------

O19001
20-Jul-02
C00001
S00001
F
N
12-Jun-04
in process

O19002
27-Jun-02
C00002
S00002
P
N
25-Jun-04
Cancelled

O46865
20-Feb-02
C00003
S00003
F
Y
18-Feb-04
Fulfilled

O19003
07-Apr02
C00001
S00001
F
Y
03-Apr-04
Fulfilled

O46866
22-May-02
C00004
S00002
P
N
20-May-04
Cancelled

O19008
26-Jul-02
C00005
S00004
F
N
24-May-04
In Process


*/	

create table sales_order_details_new(
	order_no varchar2(6),
	product_no varchar2(6),
	qty_ordered number(8),
	qty_disp number(8),
	product_rate number(10,2),
	constraint Ab primary key(order_no, product_no)
);

insert into sales_order_details_new values ('&on', '&pn', &qo, &qp, &pr);

/*
O19001
P00001
4
4
525

O19001
P07965
2
1
8400

O19001
P07885
2
1
5250

O19002
P00001
10
0
525

O46865
P07868
3
3
3150

O46865
P07885
3
1
5250

O46865
P00001
10
10
525

O46865
P0345
4
4
1050

O19003
P03453
2
2
1050

O19003
P06734
1
1
12000

O46866
P07965
1
0
8400

O46866
P07975
1
0
1050

O19008
P00001
10
5
525

O19008
P07975
5
3
1050
*/	


/*---------  Assignment questions ---------*/
#1
select * from client_master_new where name like ('_a%');
#2
select * from client_master_new where city like ('_a%');
#3
select * from client_master_new where (city like 'Bombay') or (city like 'Delhi');
#4
select * from client_master_new where (baldue > 10000);
#5
select * from sales_order_new where order_date like ('%Jan%');
#6
select * from client_master_new where (client_no like 'C00001' or client_no like 'C00002');
#7
select * from product_master_new where (sell_price >2000 and sell_price <= 5000);
#8
select 0.15*sell_price "new_price" from product_master_new where (sell_price > 1500);
#9
select name, city, state from client_master_new where (state != 'Maharashtra');
#10
select count(*) from sales_order_new;
#11
select avg(product_rate) from sales_order_details_new;
#12
select min(product_rate) "min_price", max(product_rate) "max_price" from sales_order_details_new;
#13
select count(*) from sales_order_details_new where product_rate > 1500;
#14
select count(*) from product_master_new where qty_on_hand < reorder_lvl;
#15
select order_no, to_char(to_date(order_date, 'dd/mm/yyyy'), 'DAY') from sales_order_new;
