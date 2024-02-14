-- car dealership data insert

insert into Salesperson (salesperson_id, first_name, last_name)
values (1, 'John', 'Doe');

insert into Salesperson (salesperson_id, first_name, last_name)
values (2, 'Jamie', 'Dice');

insert into Salesperson (salesperson_id, first_name, last_name)
values (3, 'Dave', 'Williams');

insert into Mechanic (mechanic_id, first_name, last_name)
values (6, 'Joey', 'Domino');

insert into Mechanic (mechanic_id, first_name, last_name)
values (8, 'Jason', 'Jackson');

insert into Mechanic (mechanic_id, first_name, last_name)
values (10, 'Jack', 'Ofalltrade');

insert into Car (car_id, serial_number, make, model, color, year)
values(24, 12353254, 'mini', 'cooper', 'red', 2010);

insert into Car (car_id, serial_number, make, model, color, year)
values(67, 59878095, 'toyota', '4 runner', 'white', 2021);

insert into Car (car_id, serial_number, make, model, color, year)
values(32, 890907869, 'corvette', 'stingray', 'red', 1967);

insert into Customer (customer_id, first_name, last_name, phone_number, address, city, state, country, postal_code)
values(1, 'Paul', 'Wynn', '555-555-5555', '444 Tree Lodge Lane', 'Rochester', 'NY', 'USA', 67890);

insert into Customer (customer_id, first_name, last_name, phone_number, address, city, state, country, postal_code)
values(2, 'Heidi', 'Goldsberry', '333-333-3333', '123 Middle of Nowhere', 'Riverside', 'CA', 'USA', 23894);

insert into Customer (customer_id, first_name, last_name, phone_number, address, city, state, country, postal_code)
values(3, 'Betsy', 'Java', '222-222-2222', '1234 Flower st', 'Santa Ana', 'CA', 'USA', 87654);

insert into sales_invoice (invoice_id, invoice_number, date, car_id, customer_id, salesperson_id)
values(67789, 876599, '01/13/23', 873, 1, 3);

insert into sales_invoice (invoice_id, invoice_number, date, car_id, customer_id, salesperson_id)
values(45378, 897231, '05/22/23', 456, 2, 2);

insert into sales_invoice  (invoice_id, invoice_number, date, car_id, customer_id, salesperson_id)
values(234567, 768879, '11/15/23', 9809, 3, 3);

--Stored functions to insert data into the service_ticket table
create or replace function add_service_ticket(_service_ticket_id integer, _car_id integer, _customer_id integer, _date_received varchar(15), _date_returned_to_customer varchar)
returns void 
as $MAIN$
begin     	
     insert into service_ticket (service_ticket_id, car_id, customer_id, date_received, date_returned_to_customer)
     values (_service_ticket_id, _car_id, _customer_id, _date_received, _date_returned_to_customer);
end;
$MAIN$
language plpgsql;

--call of function
select add_service_ticket (3235, 24, 1, '04/14/2023', '04/16/2023');
--verifies addition
select * from service_ticket where car_id = 24;

--call of function
select add_service_ticket (897987, 67, 3, '08/14/2023', '08/17/2023');
--verify addition
select * from service_ticket where car_id = 67;

--call of function
select add_service_ticket (67896, 32, 2, '09/11/2023', '09/14/2023');
--verify addition
select * from service_ticket where car_id = 32;

--Stored functions to insert data into the service_ticket table
create or replace function add_service_mechanic (_service_mechanic_id integer, _service_ticket_id integer, _mechanic_id integer, _hourly_rate decimal)
returns void 
as $MAIN$
begin     	
     insert into service_mechanic (service_mechanic_id, service_ticket_id, mechanic_id, hourly_rate)
     values (_service_mechanic_id, _service_ticket_id, _mechanic_id, _hourly_rate);
end;
$MAIN$
language plpgsql;

--call a function
select add_service_mechanic(6, 3235, 6, 95.00);
--verify addition
select * from service_mechanic where mechanic_id = 6;

--call a function
select add_service_mechanic(8, 897987, 8, 95.00);
--verify addition
select * from service_mechanic where mechanic_id = 8;

--call a function
select add_service_mechanic(10, 67896, 10, 95.00);
--verify addition
select * from service_mechanic where mechanic_id = 10;

insert into parts_used (part_id, service_ticket_id, part_number, price)
values (2345, 3235, 6897554, 140.00);

insert into parts_used (part_id, service_ticket_id, part_number, price)
values (654554, 897987, 86754, 190.00);

insert into parts_used (part_id, service_ticket_id, part_number, price)
values (89897, 67896, 45645, 220.00);

