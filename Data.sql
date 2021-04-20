insert into Admin values('Mukesh','pbkdf2:sha256:150000$3UlX87RR$e36f3df807efdd01b8c795015b92d8fd2c0f373e7b63a3c51e654a59db674f5e');
insert into Admin values('Ratan','pbkdf2:sha256:150000$HXvW06mk$d5c4a03fb7ab0e10410b2bebf8c03232450fe7ba0b6f13c3d2c22f1697e38663');

insert into Person values('1','Mahesh Bhatt','40','Male','1231231231');
insert into Person values('2','Suresh Bhatt','20','Male','1231231232');
insert into Person values('3','Ramesh Bhatt','15','Male','1231231233');
insert into Person values('4','Heli Bhatt','41','Male','1231231234');
insert into Person values('5','Ram Yadav','35','Male','7897897891');
insert into Person values('6','Shyam Shah','45','Male','4564564561');
insert into Person values('7','Harshita Shah','46','Female','4564564562');
insert into Person values('8','Hetal Shah','21','Female','4564564653');
insert into Person values('9','Rajul Shah','19','Female','4564564564');
insert into Person values('10','Rahul Maheshwari','34','Male','1471471471');
insert into Person values('11','Mimansa Maheshwari','35','Female','1471471472');
insert into Person values('12','Dhairya Chabra','29','Male','2582582581');
insert into Person values('13','Disha Chabra','30','Female','2582582582');
insert into Person values('14','Alay Jain','28','Male','3693693691');
insert into Person values('15','Purva Jain','28','Female','3693693692');
insert into Person values('16','Vatsal Gupta','28','Male','1591591591');
insert into Person values('17','Vanshika Gupta','29','Female','1591591592');
insert into Person values('18','Sandesh Agarwal','35','Male','3573573571');
insert into Person values('19','Vikash Rumalwala','32','Male','8688688681');
insert into Person values('20','Sneha Agarwal','43','Female','2929299921');
insert into Person values('21','Shital Sharma','34','Female','1199119923');

insert into House values('101','pbkdf2:sha256:150000$YMSMt0I1$b414cd2c443db48e94e6038133c36dd64e25ddb4bced1b7ec5056ef1f9be2a33','1');
insert into House values('102','pbkdf2:sha256:150000$YMSMt0I1$b414cd2c443db48e94e6038133c36dd64e25ddb4bced1b7ec5056ef1f9be2a33','6');
insert into House values('201','pbkdf2:sha256:150000$4cMJuAkU$d6d91d8daa19f916cff581b28eb5c444ed12eac7644f8f7bef5571349747c985','10');
insert into House values('202','pbkdf2:sha256:150000$B2bWTsE1$6788cb1eb2906ba6e770d0dde78086ae5c0703a5bfda93d0a8e4c46e2e355533','12');
insert into House values('301','pbkdf2:sha256:150000$LFsUKbsR$1fa44008f89c1fc33352b194ce6c7130507778485f8b35ea1706957cea1ca7ad','14');
insert into House values('302','pbkdf2:sha256:150000$ZTqCArFD$c40f8ba528aae2eb0969e8b53049d228b80ca33205cc9acbb6fae634511d52fe','16');
insert into House values('401','pbkdf2:sha256:150000$WLjcbY47$339b2615a1f6cf2c490808623b39a06a738ce02e61824c2417549b941644ff43','20'); -- greatgambit

insert into Staff values('5','pbkdf2:sha256:150000$PWQ1lrWF$197c7c296b6d225ecdb2d3b387f72557a38ea7ce869b15fc854e738907f15820','15000');
insert into Staff values('18','pbkdf2:sha256:150000$WT9jalhS$5ccea2fe37162cd8d186cf76c8089f74dd20220a2d341fb55ded23cc7e1d83cd','20000');
insert into Staff values('19','pbkdf2:sha256:150000$jgMBHkU5$5f2c0dafd60f1e35b7c31bfdc6805f7d9d7f15ffdba91c7e21a344f84d9e2d62','15000');
insert into Staff values('21','pbkdf2:sha256:150000$75xVl03J$47a020613efd66e4d4bf74dc9d4c84b71829b8393e1fe504d58bb0148f41582a','16000'); -- meandyou

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

insert into Guest values('1','Dev Jariwala','5','101');
insert into Guest values('2','Sia Shah','18','201');
insert into Guest values('3','Labdhi Shah','5','202');
insert into Guest values('4','Raj Jikadra','5','301');
insert into Guest values('5','Muktesharyan Uppala','19','102');

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