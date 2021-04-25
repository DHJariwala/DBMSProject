insert into Admin values('Mukesh','pbkdf2:sha256:150000$nG7ZKMgo$aacb97e2d76b07335c2c55ab4b037c39fd825eb3db0635a754b803789aa795b4'); -- adminabcd
insert into Admin values('Ratan','pbkdf2:sha256:150000$7a4hqmD6$2dfb0d7c228ea6ea6ef44b3749aafb407c4b42911c033d7c8436931962bf45dd'); -- admindef

insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('1','Mahesh Bhatt',to_date('1980-12-11','yyyy-mm-dd'),'Male','1231231231');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('2','Suresh Bhatt',to_date('2000-06-16','yyyy-mm-dd'),'Male','1231231232');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('3','Ramesh Bhatt',to_date('2005-04-07','yyyy-mm-dd'),'Male','1231231233');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('4','Heli Bhatt',to_date('1979-05-04','yyyy-mm-dd'),'Male','1231231234');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('5','Ram Yadav',to_date('1985-12-03','yyyy-mm-dd'),'Male','7897897891');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('6','Shyam Shah',to_date('1975-11-23','yyyy-mm-dd'),'Male','4564564561');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('7','Harshita Shah',to_date('1974-10-29','yyyy-mm-dd'),'Female','4564564562');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('8','Hetal Shah',to_date('1999-09-30','yyyy-mm-dd'),'Female','4564564653');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('9','Rajul Shah',to_date('2001-06-01','yyyy-mm-dd'),'Female','4564564564');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('10','Rahul Maheshwari',to_date('1986-06-01','yyyy-mm-dd'),'Male','1471471471');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('11','Mimansa Maheshwari',to_date('1985-08-21','yyyy-mm-dd'),'Female','1471471472');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('12','Dhairya Chabra',to_date('1991-05-26','yyyy-mm-dd'),'Male','2582582581');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('13','Disha Chabra',to_date('1990-04-11','yyyy-mm-dd'),'Female','2582582582');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('14','Alay Jain',to_date('1992-02-18','yyyy-mm-dd'),'Male','3693693691');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('15','Purva Jain',to_date('1992-01-27','yyyy-mm-dd'),'Female','3693693692');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('16','Vatsal Gupta',to_date('1992-01-29','yyyy-mm-dd'),'Male','1591591591');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('17','Vanshika Gupta',to_date('1991-03-21','yyyy-mm-dd'),'Female','1591591592');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('18','Sandesh Agarwal',to_date('1985-08-11','yyyy-mm-dd'),'Male','3573573571');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('19','Vikash Rumalwala',to_date('1987-07-23','yyyy-mm-dd'),'Male','8688688681');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('20','Sneha Agarwal',to_date('1977-11-12','yyyy-mm-dd'),'Female','2929299921');
insert into Person (Person_ID,Name,DOB,Gender,Phone_No) values('21','Shital Sharma',to_date('1984-12-31','yyyy-mm-dd'),'Female','1199119923');

-- insert into Person values('1','Mahesh Bhatt','40','Male','1231231231');
-- insert into Person values('2','Suresh Bhatt','20','Male','1231231232');
-- insert into Person values('3','Ramesh Bhatt','15','Male','1231231233');
-- insert into Person values('4','Heli Bhatt','41','Male','1231231234');
-- insert into Person values('5','Ram Yadav','35','Male','7897897891');
-- insert into Person values('6','Shyam Shah','45','Male','4564564561');
-- insert into Person values('7','Harshita Shah','46','Female','4564564562');
-- insert into Person values('8','Hetal Shah','21','Female','4564564653');
-- insert into Person values('9','Rajul Shah','19','Female','4564564564');
-- insert into Person values('10','Rahul Maheshwari','34','Male','1471471471');
-- insert into Person values('11','Mimansa Maheshwari','35','Female','1471471472');
-- insert into Person values('12','Dhairya Chabra','29','Male','2582582581');
-- insert into Person values('13','Disha Chabra','30','Female','2582582582');
-- insert into Person values('14','Alay Jain','28','Male','3693693691');
-- insert into Person values('15','Purva Jain','28','Female','3693693692');
-- insert into Person values('16','Vatsal Gupta','28','Male','1591591591');
-- insert into Person values('17','Vanshika Gupta','29','Female','1591591592');
-- insert into Person values('18','Sandesh Agarwal','35','Male','3573573571');
-- insert into Person values('19','Vikash Rumalwala','32','Male','8688688681');
-- insert into Person values('20','Sneha Agarwal','43','Female','2929299921');
-- insert into Person values('21','Shital Sharma','34','Female','1199119923');

insert into House values('101','pbkdf2:sha256:150000$WaPJ6r88$fb5b174160e71b6976b4a70769b81c1776dfa621a9a616b4320e7b92705a6324','1'); -- mypassword
insert into House values('102','pbkdf2:sha256:150000$YMSMt0I1$b414cd2c443db48e94e6038133c36dd64e25ddb4bced1b7ec5056ef1f9be2a33','6'); -- password
insert into House values('201','pbkdf2:sha256:150000$4cMJuAkU$d6d91d8daa19f916cff581b28eb5c444ed12eac7644f8f7bef5571349747c985','10'); -- NextGenGame
insert into House values('202','pbkdf2:sha256:150000$p6o0d0RG$b2092ffe6a4906a63c132b6b83784201bb094b8f01b62c6ba8f68c6c78ea2a62','12'); -- hithereman
insert into House values('301','pbkdf2:sha256:150000$LFsUKbsR$1fa44008f89c1fc33352b194ce6c7130507778485f8b35ea1706957cea1ca7ad','14'); -- KittyCat123
insert into House values('302','pbkdf2:sha256:150000$ZTqCArFD$c40f8ba528aae2eb0969e8b53049d228b80ca33205cc9acbb6fae634511d52fe','16'); -- Incorrect101
insert into House values('401','pbkdf2:sha256:150000$WLjcbY47$339b2615a1f6cf2c490808623b39a06a738ce02e61824c2417549b941644ff43','20'); -- greatgambit

insert into Staff values('5','pbkdf2:sha256:150000$JAt6OCNI$86aea87d1fd5a2fb2638407fa256b86937d03fe69fd5c01fb351f8e08c586717','15000'); -- ramukakaop
insert into Staff values('18','pbkdf2:sha256:150000$WT9jalhS$5ccea2fe37162cd8d186cf76c8089f74dd20220a2d341fb55ded23cc7e1d83cd','20000'); -- sandesh101
insert into Staff values('19','pbkdf2:sha256:150000$jX6GO7iH$2ea800a3d07143d1c56570d6217e53295e28bf9790dc3faa5b7d9f2cb084bf14','15000'); -- vikibhai19
insert into Staff values('21','pbkdf2:sha256:150000$RBQ7wZIl$3c586232f11b54c77f434fa1769a9d740fc71c12c0a23eee7a6b261826836547','16000'); -- meandyoulove

insert into Resident values('1','101');
insert into Resident values('2','101');
insert into Resident values('3','101');
insert into Resident values('4','101');
insert into Resident values('6','102');
insert into Resident values('7','102');
insert into Resident values('8','102');
insert into Resident values('9','102');
insert into Resident values('10','201');
insert into Resident values('11','201');
insert into Resident values('12','202');
insert into Resident values('13','202');
insert into Resident values('14','301');
insert into Resident values('15','301');
insert into Resident values('16','302');
insert into Resident values('17','302');

insert into Guest values('1',to_date('2019-06-01','yyyy-mm-dd'),'Dev Jariwala','5','101');
insert into Guest values('2',to_date('2019-06-01','yyyy-mm-dd'),'Sia Shah','18','201');
insert into Guest values('3',to_date('2019-06-01','yyyy-mm-dd'),'Labdhi Shah','5','202');
insert into Guest values('4',to_date('2019-06-01','yyyy-mm-dd'),'Raj Jikadra','5','301');
insert into Guest values('5',to_date('2019-06-01','yyyy-mm-dd'),'Muktesharyan Uppala','19','102');

insert into Notice values(to_date('2019-03-10 12:00','yyyy-mm-dd HH24:mi'),'Mukesh','Holi Party','On 20 March  we have oraganized Holi party and lunch so please come downstairs at 9:00 AM');
insert into Notice values(to_date('2019-06-25 12:00','yyyy-mm-dd HH24:mi'),'Ratan','Building Meeting','On 30 June 10 PM we have oraganized a building meeting to discuss the increase in maintenance fees of our building');
insert into Notice values(to_date('2019-10-20 12:00','yyyy-mm-dd HH24:mi'),'Mukesh','Diwali Party','On 27 October we have organized Diwali party and dinner, so please attend the same at 8:00 PM');
insert into Notice values(to_date('2020-01-04 12:00','yyyy-mm-dd HH24:mi'),'Mukesh','Lunch on Uttarayan','On 14 January we have organized lunch on the occasion of Uttarayan, so please attend the same at 12:30 PM');

insert into Complaint values('1',to_date('2019-03-11 12:00','yyyy-mm-dd HH24:mi'),'Broken tiles','In our parking space, near the main gate, the floor is uneven, so it needs fixing','Resolved','101','18');
insert into Complaint values('2',to_date('2020-06-25 12:00','yyyy-mm-dd HH24:mi'),'Leaking tap','Buildings water tap is broken and needs fixing','Resolved','302','18');
insert into Complaint values('3',to_date('2021-04-15 12:00','yyyy-mm-dd HH24:mi'),'Broken light ',',Lights on the third floor need fixing','Unassigned','302',NULL);

insert into Maintenance_Fee values('101',to_date('2019-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('102',to_date('2019-06-01','yyyy-mm-dd'),'11000','0','Paid');
insert into Maintenance_Fee values('201',to_date('2019-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('202',to_date('2019-06-01','yyyy-mm-dd'),'12000','0','Paid');
insert into Maintenance_Fee values('301',to_date('2019-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('302',to_date('2019-06-01','yyyy-mm-dd'),'12000','0','Paid');
insert into Maintenance_Fee values('101',to_date('2020-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('102',to_date('2020-06-01','yyyy-mm-dd'),'11000','0','Paid');
insert into Maintenance_Fee values('201',to_date('2020-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('202',to_date('2020-06-01','yyyy-mm-dd'),'12000','0','Paid');
insert into Maintenance_Fee values('301',to_date('2020-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('302',to_date('2020-06-01','yyyy-mm-dd'),'12000','0','Paid');
insert into Maintenance_Fee values('101',to_date('2021-01-01','yyyy-mm-dd'),'10000','0','Due');
insert into Maintenance_Fee values('102',to_date('2020-01-01','yyyy-mm-dd'),'11000','0','Due');
insert into Maintenance_Fee values('201',to_date('2021-01-01','yyyy-mm-dd'),'10000','0','Due');
insert into Maintenance_Fee values('202',to_date('2020-01-01','yyyy-mm-dd'),'11000','0','Due');
insert into Maintenance_Fee values('301',to_date('2021-01-01','yyyy-mm-dd'),'10000','0','Due');
insert into Maintenance_Fee values('302',to_date('2020-01-01','yyyy-mm-dd'),'11000','0','Due');

insert into House values('101','pbkdf2:sha256:150000$WaPJ6r88$fb5b174160e71b6976b4a70769b81c1776dfa621a9a616b4320e7b92705a6324','1'); -- mypassword
insert into House values('102','pbkdf2:sha256:150000$YMSMt0I1$b414cd2c443db48e94e6038133c36dd64e25ddb4bced1b7ec5056ef1f9be2a33','6'); -- password
insert into House values('201','pbkdf2:sha256:150000$4cMJuAkU$d6d91d8daa19f916cff581b28eb5c444ed12eac7644f8f7bef5571349747c985','10'); -- NextGenGame
insert into House values('202','pbkdf2:sha256:150000$p6o0d0RG$b2092ffe6a4906a63c132b6b83784201bb094b8f01b62c6ba8f68c6c78ea2a62','12'); -- hithereman
insert into House values('301','pbkdf2:sha256:150000$LFsUKbsR$1fa44008f89c1fc33352b194ce6c7130507778485f8b35ea1706957cea1ca7ad','14'); -- KittyCat123
insert into House values('302','pbkdf2:sha256:150000$ZTqCArFD$c40f8ba528aae2eb0969e8b53049d228b80ca33205cc9acbb6fae634511d52fe','16'); -- Incorrect102
insert into House values('401','pbkdf2:sha256:150000$WLjcbY47$339b2615a1f6cf2c490808623b39a06a738ce02e61824c2417549b941644ff43','20'); -- greatgambit

insert into Staff values('5','pbkdf2:sha256:150000$JAt6OCNI$86aea87d1fd5a2fb2638407fa256b86937d03fe69fd5c01fb351f8e08c586717','15000'); -- ramukakaop
insert into Staff values('18','pbkdf2:sha256:150000$WT9jalhS$5ccea2fe37162cd8d186cf76c8089f74dd20220a2d341fb55ded23cc7e1d83cd','20000'); -- sandesh101
insert into Staff values('19','pbkdf2:sha256:150000$jX6GO7iH$2ea800a3d07143d1c56570d6217e53295e28bf9790dc3faa5b7d9f2cb084bf14','15000'); -- vikibhai19
insert into Staff values('21','pbkdf2:sha256:150000$RBQ7wZIl$3c586232f11b54c77f434fa1769a9d740fc71c12c0a23eee7a6b261826836547','16000'); -- meandyoulove

insert into Resident values('1','101');
insert into Resident values('2','101');
insert into Resident values('3','101');
insert into Resident values('4','101');
insert into Resident values('6','102');
insert into Resident values('7','102');
insert into Resident values('8','102');
insert into Resident values('9','102');
insert into Resident values('10','201');
insert into Resident values('11','201');
insert into Resident values('12','202');
insert into Resident values('13','202');
insert into Resident values('14','301');
insert into Resident values('15','301');
insert into Resident values('16','302');
insert into Resident values('17','302');

insert into Guest values('1',to_date('2019-06-01','yyyy-mm-dd'),'Dev Jariwala','5','101');
insert into Guest values('2',to_date('2019-06-01','yyyy-mm-dd'),'Sia Shah','18','201');
insert into Guest values('3',to_date('2019-06-01','yyyy-mm-dd'),'Labdhi Shah','5','202');
insert into Guest values('4',to_date('2019-06-01','yyyy-mm-dd'),'Raj Jikadra','5','301');
insert into Guest values('5',to_date('2019-06-01','yyyy-mm-dd'),'Muktesharyan Uppala','19','102');

insert into Notice values(to_date('2019-03-10 12:00','yyyy-mm-dd HH24:mi'),'Mukesh','Holi Party','On 20 March  we have oraganized Holi party and lunch so please come downstairs at 9:00 AM');
insert into Notice values(to_date('2019-06-25 12:00','yyyy-mm-dd HH24:mi'),'Ratan','Building Meeting','On 30 June 10 PM we have oraganized a building meeting to discuss the increase in maintenance fees of our building');
insert into Notice values(to_date('2019-10-20 12:00','yyyy-mm-dd HH24:mi'),'Mukesh','Diwali Party','On 27 October we have organized Diwali party and dinner, so please attend the same at 8:00 PM');
insert into Notice values(to_date('2020-01-04 12:00','yyyy-mm-dd HH24:mi'),'Mukesh','Lunch on Uttarayan','On 14 January we have organized lunch on the occasion of Uttarayan, so please attend the same at 12:30 PM');

insert into Complaint values('1',to_date('2019-03-11 12:00','yyyy-mm-dd HH24:mi'),'Broken tiles','In our parking space, near the main gate, the floor is uneven, so it needs fixing','Resolved','101','18');
insert into Complaint values('2',to_date('2020-06-25 12:00','yyyy-mm-dd HH24:mi'),'Leaking tap','Buildings water tap is broken and needs fixing','Resolved','302','18');
insert into Complaint values('3',to_date('2021-04-15 12:00','yyyy-mm-dd HH24:mi'),'Broken light ',',Lights on the third floor need fixing','Unassigned','302',NULL);

insert into Maintenance_Fee values('101',to_date('2019-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('102',to_date('2019-06-01','yyyy-mm-dd'),'11000','0','Paid');
insert into Maintenance_Fee values('201',to_date('2019-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('202',to_date('2019-06-01','yyyy-mm-dd'),'12000','0','Paid');
insert into Maintenance_Fee values('301',to_date('2019-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('302',to_date('2019-06-01','yyyy-mm-dd'),'12000','0','Paid');
insert into Maintenance_Fee values('101',to_date('2020-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('102',to_date('2020-06-01','yyyy-mm-dd'),'11000','0','Paid');
insert into Maintenance_Fee values('201',to_date('2020-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('202',to_date('2020-06-01','yyyy-mm-dd'),'12000','0','Paid');
insert into Maintenance_Fee values('301',to_date('2020-06-01','yyyy-mm-dd'),'10000','0','Paid');
insert into Maintenance_Fee values('302',to_date('2020-06-01','yyyy-mm-dd'),'12000','0','Paid');
insert into Maintenance_Fee values('101',to_date('2021-01-01','yyyy-mm-dd'),'10000','0','Due');
insert into Maintenance_Fee values('102',to_date('2020-01-01','yyyy-mm-dd'),'11000','0','Due');
insert into Maintenance_Fee values('201',to_date('2021-01-01','yyyy-mm-dd'),'10000','0','Due');
insert into Maintenance_Fee values('202',to_date('2020-01-01','yyyy-mm-dd'),'11000','0','Due');
insert into Maintenance_Fee values('301',to_date('2021-01-01','yyyy-mm-dd'),'10000','0','Due');
insert into Maintenance_Fee values('302',to_date('2020-01-01','yyyy-mm-dd'),'11000','0','Due');

insert into Notification values('101','You have a guest Dev Jariwala',to_date('2019-06-01','yyyy-mm-dd'));
insert into Notification values('201','You have a guest Sia Shah',to_date('2019-06-01','yyyy-mm-dd'));
insert into Notification values('302','test minutes',TO_TIMESTAMP('2021-04-25 14:30','yyyy-mm-dd HH24:MI'));
insert into Notification values('302','test hours',TO_TIMESTAMP('2021-04-25 12:30','yyyy-mm-dd HH24:MI'));
insert into Notification values('302','test yesterday',TO_TIMESTAMP('2021-04-24','yyyy-mm-dd'));
insert into Notification values('302','test normal',TO_TIMESTAMP('2019-06-01','yyyy-mm-dd'));