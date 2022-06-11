USE FOODORDERINGONLINE;

#INSERTING VALUES INTO RESTARAUNT TABLE FOR EACH Location
INSERT INTO RESTARAUNT(r_name, r_address, r_city, r_rating, r_phone, r_pin) 
VALUES (
'Chicken Shack',
'123 Chicken St.',
'Wenatchee, WA',
4.5,
'5091231234',
1234);
INSERT INTO RESTARAUNT(r_name, r_address, r_city, r_rating, r_phone, r_pin) 
VALUES (
'Management',
'400 Business St..',
'Seattle, WA',
4.7,
'5093214321',
4321);
INSERT INTO RESTARAUNT(r_name, r_address, r_city, r_rating, r_phone, r_pin) 
VALUES (
'HeadQuarters',
'501 ChickenShack St.',
'Seattle, WA',
5.0,
'5093214321',
3214);

#INSERTING CUSTOMER INFORMATION
INSERT INTO CUSTOMER(c_name, c_address, c_city, c_phone, c_pin, c_email)
VALUES (
'Justin Stewart',
'111 Chicken St.',
'Wenatchee, WA',
'1234567891',
1122,
'Justin.stewart@gmail.com');
INSERT INTO CUSTOMER(c_name, c_address, c_city, c_phone, c_pin, c_email)
VALUES (
'Jeremy Stewart',
'212 Chicken St.',
'Wenatchee, WA',
'98676543212',
2211,
'Jeremy.stewart@gmail.com');

#INSERTING MENU ITEMS FOR THE RESTARAUNT
INSERT INTO MENUITEM(m_item, m_itemdescription, m_price, m_cost)
VALUES (
'Chicken Sandwich',
'A tasty Chicken Sandwich to enjoy.',
10.99,
3.99);
INSERT INTO MENUITEM(m_item, m_itemdescription, m_price, m_cost)
VALUES (
'Chicken Tenders',
'A tasty basket of 6 Chicken Tenders.',
9.99,
2.99);
INSERT INTO MENUITEM(m_item, m_itemdescription, m_price, m_cost)
VALUES (
'Grilled Chicken',
'Freshly grilled chicken with a side of rice.',
12.99,
4.99);

#INSERTING THE DEPARTMENTS FOR THE BUSINESS
INSERT INTO DEPARTMENT 
VALUES (1,
'Retail',
'123 Chicken St.',
 'Patrick Stewart');
INSERT INTO DEPARTMENT 
VALUES (2,
'Management',
'400 Business St.',
 'John Smith');
INSERT INTO DEPARTMENT 
VALUES (3,
'HeadQuarters',
'501 ChickenShack St.',
 'Jane Doe');

#INSERTING EMPLOYEE FOR EACH LOCATION
INSERT INTO EMPLOYEE(e_gender,
e_salary,
e_annualSalary, d_id) VALUES(
'male',
3000,
36000, 1);
INSERT INTO EMPLOYEE(e_gender,
e_salary,
e_annualSalary, d_id) VALUES(
'male',
4000,
48000, 2);
INSERT INTO EMPLOYEE(e_gender,
e_salary,
e_annualSalary, d_id) VALUES(
'female',
5000,
60000, 3);

#INSERTING ORDER INFO FOR EACH CUSTOMER
INSERT INTO ORDERINFO(o_online,o_delivery,o_tax,o_tip,o_totalprice,o_deliverytime)
VALUES (
TRUE,
FALSE,
1.20,
2.00,
13.19,
'.5 hours');
INSERT INTO ORDERINFO(o_online,o_delivery,o_tax,o_tip,o_totalprice,o_deliverytime)
VALUES (
FALSE,
TRUE,
1.20,
2.00,
15.19,
'not online');

#POPULATING FOREIGN KEY VALUES WHERE ORDERINFO = NULL
INSERT INTO ORDERINFO(c_id,r_id,m_id)
SELECT CUSTOMER.c_id, RESTARAUNT.r_id,MENUITEM.m_id FROM CUSTOMER, RESTARAUNT, MENUITEM, ORDERINFO
WHERE ORDERINFO.r_id = NULL;
#DOES NOT DISPLAY VALUES CURRENTLY

#ALTERNATE STATEMENT THAT PRODUCES VALUES ON INCORRECT ROWS.
#INSERT INTO ORDERINFO(c_id,r_id,m_id)
#SELECT c_id, r_id, m_id FROM CUSTOMER, RESTARAUNT, MENUITEM
#WHERE r_id = c_id;
