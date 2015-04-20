-- select our best customers
select c.name, count(o.id) as numOrders
from customer c
inner join "ORDER" o
  on c.id = o.customer_id
inner join supplier s
  on o.supplier_id = s.id
inner join design d
  on s.design_id = d.id
inner join artist a
  on d.artist_id = a.id
group by c.name
having count(o.id) >= 3
order by c.name;

Output:
1) Alice	9
2) Bob		3



-- find the total sales for orders that contain design materials on special
select o.id, sum(o.amount * o.quantity) as totalSales, d.material
from "ORDER" o
inner join supplier s
  on o.supplier_id = s.id
inner join design d
  on s.design_id = d.id
where d.material in
  (select material
   from special)
group by o.id, d.material
order by o.id;

Output:
01)1	51.2	wood
02)3	6.4		wood
03)4	9.6		wood
04)6	16		wood
05)7	19.2	plastic
06)8	22.4	stone
07)9	25.6	wood
08)11	32		wood
09)12	35.2	plastic
10)13	38.4	cotton
11)14	41.6	plastic
12)15	44.8	plastic
13)16	48		plastic

-- trigger:  an order must be associated with a customer
CREATE OR REPLACE TRIGGER BI_ORDER
    BEFORE INSERT ON "ORDER"
FOR EACH ROW
BEGIN
INSERT INTO CUSTOMER(id, name, email)
  VALUES(:NEW.customer_id, 'sample name', 'myEmail@test.com');
END;
ALTER TRIGGER BI_ORDER ENABLE;

insert into "ORDER" (id, customer_id, supplier_id)
values (20,20,5);
commit;

-- select our favorite artist by quantity of order
select name as fav_artist, quantity from
	(select a.name, sum(o.quantity) as quantity
	from "ORDER" o
	inner join supplier s
	  on o.supplier_id = s.id
	inner join design d
	  on s.design_id = d.id
	inner join artist a
	  on d.artist_id = a.id
	group by a.name
	order by quantity desc)
	where rownum <= 1;

Output:
01)Mary Maryson		64

-- a customer wants their order history for a given time period
select o.id
, o.amount
, o.quantity
, o.confirmation_number
, c. name
, c.email
, c.phone
from "ORDER" o
inner join customer c
  on o.customer_id = c.id
where o.date_created < sysdate AND o.date_created >= sysdate - 5 -- five day history
  AND c.name = 'Bob';
  
Output:
01)2	3.2	1	2	Bob	bloo@test.com	8435551234
02)3	3.2	2	3	Bob	bloo@test.com	8435551234
03)5	3.2	4	5	Bob	bloo@test.com	8435551234
04)30	4.5	20	17	Bob	bloo@test.com	8435551234