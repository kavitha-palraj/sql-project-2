create database project2
use project2


------Role table------------------------------------------------------
CREATE TABLE role 
( id int ,
  role_name  varchar(100)
 constraint role_id_PK primary key (id) );

 ----------user Account-----------------------------------------------
  CREATE TABLE User_account
  (id int ,
  user_name  varchar(100),
  email       varchar(254),
  password    varchar(200),
  password_salt varchar(50) not null,
  password_has_algorithm varchar (50)
  constraint user_account_id_PK PRIMARY KEY(id));

  
----------User has role-----------------------------------------
  CREATE TABLE user_has_role (
 id int,
 role_start_time datetime,
 role_end_time datetime not null,
 user_account_id int,
 role_id int,
constraint user_has_role_PK primary key(id),
constraint user_has_role_user_account_id foreign key(user_account_id) references user_account(id),
constraint user_has_role_role_id foreign key(role_id) references role(id));

------------------status table------------------------------------------------------------------- 
   CREATE TABLE status
   (id int ,
   status_name VARCHAR(100),
   is_user_working bit,
   constraint status_id_pk PRIMARY KEY (id));

  
  --------user_has_status--------------------------------------------------------------
CREATE TABLE user_has_status
(id int,status_start_time datetime,
status_end_time datetime not null,
user_account_id int,
status_id int,
constraint user_has_status_id_PK PRIMARY KEY(id),
constraint user_has_status_user_account_id_FK FOREIGN KEY(user_account_id) references user_account(id), 
constraint user_has_account_status_id_FK FOREIGN KEY(status_id) references status(id));

--1. Insert data into each of the above tables. With at least two rows in each of the tables. Make sure that you have created respective foreign keys----


-----role table--------------------------------------------------
INSERT INTO role VALUES (1, 'Ram'), 
                        (2,'Sham');

select * from role

----Status Table -----

insert into status values(1,'new status1',0),
                         (2,'new status2',1);

select * from status;
  

  ------User Account Table ----

INSERT INTO  user_account values(1,'Ram','ram@gmail.com','zxc','zxcv','zxcvbn'),
                                (2,'Sham','sham@gmail.com','qrs','qrst','qrstiu');
select * from user_account;



----User_has _role -----

insert into user_has_role values(1,'2022-07-03 15:19:54','2024-07-03 12:10:54',1,2)
,(2,'2024-07-03 12:10:54','2025-07-03 12:10:54',1,2);

select * from user_has_role
drop table role


------User_has_status---

insert into user_has_status values(1,'2024-07-03 11:10:54','2026-06-03 11:10:54',1,2),
(2,'2027-7-03 12:10:54','2021-07-03 12:10:54',1,2)

select * from user_has_status


----2. Delete all the data from each of the tables------

-----User _has_status---

alter table user_has_status drop constraint user_has_status_id_PK,user_has_status_user_account_id_FK,
user_has_account_status_id_FK

truncate table user_has_status

select * from user_has_status

----User_has_role -----

alter table user_has_role drop constraint user_has_role_PK,user_has_role_user_account_id,user_has_role_role_id

truncate table user_has_role

select * from user_has_role

----Role ----

alter table role drop constraint role_id_PK

truncate table role

select * from role

-----User Account ----

alter table user_account drop constraint user_account_id_PK

truncate table user_account

select * from user_account

------Status Table -----

alter table  status drop constraint status_id_PK

truncate table status

select * from status















