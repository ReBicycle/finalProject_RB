drop table rb_member;
drop table category;
drop table bicycle;
drop table map;
drop table bicycle_photo;
drop table possible_day;
drop table rent;
drop table donation;
drop table rb_report;
drop table rb_review;

drop sequence category_seq;
drop sequence bicycle_seq;
drop sequence rent_seq;
drop sequence report_seq;
drop sequence donation_seq;

delete table RB_MEMBER;

==================================================
create table rb_member(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   name varchar2(100) not null,
   phone varchar2(100) not null,
   address varchar2(300) not null,
   email varchar2(100) not null,
   account varchar2(100),
   picture varchar2(300) not null
)

create table category(
   categoryNo number primary key,
   categoryName varchar2(100) not null
)
create sequence category_seq;

create table bicycle(
   bicycleNo number primary key,
   memberId varchar2(100) not null constraint fk_borrower_id references rb_member(id),
   address varchar2(300) not null,
   purchasePrice number not null,
   rentPrice number not null,
   detail clob not null,
   categoryNo number not null constraint fk_category_no references category(categoryNo)
)
create sequence bicycle_seq;

create table bicycle_photo(
   bicycleNo number primary key constraint fk_bicycle_no_pic references bicycle(bicycleNo),
   photo1 varchar2(100) not null,
   photo2 varchar2(100) null,
   photo3 varchar2(100) null
)

create table possible_day(
   bicycleNo number not null constraint fk_bicycle_no_possible_day references bicycle(bicycleNo),
   startDay date not null,
   endDay date not null,
   constraint pk_possible_day primary key(bicycleNo, startDay, endDay)
)

create table map(
   bicycleNo number primary key constraint fk_bicycle_no_map references bicycle(bicycleNo),
   latitude varchar2(100) not null,
   longitude varchar2(100) not null
)


create table rent(
   rentNo number primary key,
   renterId varchar2(100) not null constraint fk_renter_id references rb_member(id),
   bicycleNo number not null constraint fk_bicycle_no_deal references bicycle(bicycleNo),
   startDay date not null,
   endDay date not null,
   state number not null
)
create sequence rent_seq;


create table rb_review(
   rentNo number primary key constraint fk_rentNooo references rent(rentNo),
   star number default 0,
   reviewDate date not null,
   content clob not null
)

create table rb_report(
	reportNo number primary key,
	reporterId varchar2(100) not null constraint fk_rb_reporterId references rb_member(id),
	blackId varchar2(100) not null constraint fk_rb_blackId references rb_member(id),
	contents clob not null,
	reportDate date not null
)
create sequence report_seq;

create table donation(
   donationBicycleNo number primary key,
   donorId varchar2(100) not null constraint fk_donor_id references rb_member(id),
   detail clob not null,
   picture varchar2(300) not null
)
create sequence donation_seq;

------------종봉---------------------------------------------
insert into CATEGORY values(category_seq.nextval,'미니벨로')

select * from bicycle
<<<<<<< HEAD

select * from bicycle

=======

select * from bicycle

>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git
select * from category

select * from BICYCLE
<<<<<<< HEAD

=======

>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git
--자전거 등록
insert into category values(category_seq.nextval,'MTB')
insert into bicycle values(bicycle_seq.nextval,'java','판교',100000,5000,'애끼는자전거',1)
insert into bicycle values(bicycle_seq.nextval,'java','판교',100000,5000,'애끼는자전거2',1)
<<<<<<< HEAD

insert into category values(category_seq.nextval,'MTB')
insert into bicycle values(bicycle_seq.nextval,'java','판교',100000,5000,'애끼는자전거',1)
insert into bicycle values(bicycle_seq.nextval,'java','판교',100000,5000,'애끼는자전거2',1)

=======

insert into category values(category_seq.nextval,'MTB')
insert into bicycle values(bicycle_seq.nextval,'java','판교',100000,5000,'애끼는자전거',1)
insert into bicycle values(bicycle_seq.nextval,'java','판교',100000,5000,'애끼는자전거2',1)

>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git
insert into bicycle values(1,'java','판교',100000,5000,'애끼는자전거',1)
<<<<<<< HEAD

=======

>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git
insert into bicycle(bicycleNo, memberId ,address ,purchasePrice ,rentPrice , detail ,categoryNo) values(bicycle_seq.nextval,'java','판교',100000,5000,'애끼는자전거2',1)
--대여가능일 등록
insert into POSSIBLE_DAY(bicycleNo,startDay, endDay) values(1,to_date('2017-05-25','yyyy/mm/dd'),to_date('2017-05-26','yyyy/mm/dd'));
insert into POSSIBLE_DAY(bicycleNo,startDay, endDay) values(1,to_date('2017-05-28','yyyy/mm/dd'),to_date('2017-05-30','yyyy/mm/dd'));
insert into POSSIBLE_DAY(bicycleNo,startDay, endDay) values(2,to_date('2017-05-25','yyyy/mm/dd'),to_date('2017-05-26','yyyy/mm/dd'));
--사진등록
insert into bicycle_photo values(1,'bicycle/photo1.jpg','bicycle/photo2.jpg','bicycle/photo3.jpg')
--위도경도 등록
insert into 
--대여가능일 조회
select bicycleNo,to_char(startDay) from POSSIBLE_DAY;
delete from possible_day where bicycleNo=1;
select * from possible_day where to_date('2017-05-28')>=startDay and to_date('2017-05-29')<=endDay ;
--주소와 날짜로 자전거 검색
select * from bicycle where address='판교';
select * from bicycle b, possible_day p where address like '%'||'판교'||'%' and b.bicycleNo=p.bicycleNo and to_date('2017-05-28')>=p.startDay and to_date('2017-05-29')<=p.endDay;
select b.bicycleNo, b.memberId ,b.address ,b.purchasePrice ,b.rentPrice , b.detail ,b.categoryNo,p.startDay,p.endDay from bicycle b, possible_day p where address like '%'||'판'||'%' and b.bicycleNo=p.bicycleNo and to_date('2017-05-28')>=p.startDay and to_date('2017-05-29')<=p.endDay;
--사진까지 조회
select b.bicycleNo, b.memberId ,b.address ,b.purchasePrice ,b.rentPrice , b.detail ,b.categoryNo,p.startDay,p.endDay ,bp.photo1,bp.photo2,bp.photo3
from bicycle b, possible_day p, bicycle_photo bp 
where b.address like '%'||'판'||'%' and b.bicycleNo=p.bicycleNo and to_date('2017-05-26')>=p.startDay and to_date('2017-05-26')<=p.endDay and b.bicycleNo=bp.bicycleNo;
select * from category
select * from POSSIBLE_DAY;
select * from bicycle
select * from bicycle_photo
insert into bicycle_photo values(2,'bicycle/64_Chrysanthemum.jpg','bicycle/64_Desert.jpg','bicycle/64_Hydrangeas.jpg')
delete from bicycle_photo where bicycleNo=2;

--map에 좌표 등록
insert into map values(1,'33.450701','126.570667');
insert into map values(2,'33.450701','126.570667');

--좌표까지 조회

------------종봉----------------------------------------------

-----------------------------석희---------------------------------
select * from rb_report;

create table rb_report(
	reportNo number primary key,
	reporterId varchar2(100) not null constraint fk_rb_reporterId references rb_member(id),
	blackId varchar2(100) not null constraint fk_rb_blackId references rb_member(id),
	contents clob not null,
	reportDate date not null
)

select * from rb_report

SELECT r.reportNo,r.reportDate,r.reporterId,r.blackId,r.contents FROM(
		SELECT row_number() over(order by reportNo desc) as rnum,reportNo,reporterId,blackId,contents,
		to_char(reportDate,'YYYY.MM.DD') as reportDate
		FROM rb_report
		) r, rb_report order by reportNo desc
		
insert into rb_report(reportNo,reporterId,blackId,contents,reportDate)
 		values(1,'java','java','hhhhh',sysdate)
-----------------------------석희---------------------------------


-----------------------태형--------------------------------
insert into category(categoryNo, categoryName) values(1, 'MTB');
insert into category(categoryNo, categoryName) values(2, '로드');
insert into category(categoryNo, categoryName) values(3, '픽시');
insert into category(categoryNo, categoryName) values(4, '레코드용');
insert into category(categoryNo, categoryName) values(5, '어린이용');

insert into category(categoryNo, categoryName) values(6, '기타');

select * from bicycle;
select min(rentPrice) from bicycle;
select round(avg(rentPrice), 1) from bicycle;
select * from possible_day;

alter table rb_member modify address varchar2(300);
alter table bicycle modify address varchar2(300);

-----------------------태형-----------------------------------------
select b.bicycleNo,b.memberId,b.address,b.purchasePrice,b.rentPrice,b.detail,b.categoryNo,m.phone,m.address 
from bicycle b,rb_member m 
where bicycleNo=1 and b.memberId=m.id



 id varchar2(100) primary key,
   password varchar2(100) not null,
   name varchar2(100) not null,
   phone varchar2(100) not null,
   address varchar2(100) not null,
   email varchar2(100) not null,
   account varchar2(100),
   picture varchar2(300) not null









select * from possible_day
insert into possible_day values(1,'2017-05-27','2017-05-29')

-----------------------소영------------------------------------------
select * from CATEGORY;
insert into RB_MEMBER values('java','1234','임소영','01023991943','봉담','ter1943@naver.com', '110201759649', 'null');
select * from rb_member

select id,password,name,phone,address,email,account,picture from rb_member		
where id='java' and password='1234'



select b.bicycleNo,b.memberId,b.address,b.purchasePrice,b.rentPrice,b.detail,b.categoryNo,c.categoryName
from bicycle b, category c
where b.categoryNo = c.categoryNo and memberId='java'

select bicycleNo,memberId,address,purchasePrice,rentPrice,detail,categoryNo
from bicycle
where memberId='java'
<<<<<<< HEAD

=======

>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git
-----------------------소영------------------------------------------

select b.bicycleNo,b.memberId,b.address,b.purchasePrice,b.rentPrice,b.detail,b.categoryNo,c.categoryName
from bicycle b, category c
where b.categoryNo = c.categoryNo and memberId='java'

select bicycleNo,memberId,address,purchasePrice,rentPrice,detail,categoryNo
from bicycle
<<<<<<< HEAD
where memberId='java'








=======
where memberId='java'



--==============서경=======================================================

insert into RB_MEMBER values('java','1234','배서경','010','경기도 수원시 영통구 웰빙타운로 70','@','632','null');
insert into RB_MEMBER values('java2','1234','임소영','010','경기도 수원시 영통구 웰빙타운로 20','@','632','null');
insert into RB_MEMBER values('java3','1234','정태형','010','경기도 성남시 분당구 판교역로 160','@','632','null');
insert into RB_MEMBER values('java4','1234','이현근','010','경기도 성남시 분당구 판교역로 8','@','632','null');

select * from RB_MEMBER

-------------------------------------------------------------
--배서경이 등록한 자전거2개
insert into bicycle values(bicycle_seq.nextval,'java','경기도 성남시 분당구 판교역로 160',100000,5000,'애끼는자전거',1);
insert into bicycle values(bicycle_seq.nextval,'java','경기도 성남시 분당구 대왕판교로606번길 45',100000,5000,'자전거체고시다',1);
--임소영이 등록한 자전거2개
insert into bicycle values(bicycle_seq.nextval,'java2','	경기도 성남시 분당구 판교역로146번길 20',10000,5000,'최애자전거',1);
insert into bicycle values(bicycle_seq.nextval,'java2','	경기도 성남시 분당구 대왕판교로 670',100000,5000,'자전자전하지',1);

select * from BICYCLE;
-----------------------------------------------------------------
--사진 등록
insert into bicycle_photo values(1,'1_photo1.jpg','1_photo2.jpg','1_photo3.jpg');
insert into bicycle_photo values(2,'2_photo1.jpg','2_photo2.jpg','2_photo3.jpg');
insert into bicycle_photo values(3,'3_photo1.jpg','3_photo2.jpg','3_photo3.jpg');
insert into bicycle_photo values(4,'4_photo1.jpg','4_photo2.jpg','4_photo3.jpg');

---------------------------------------------------------------------
--자전거 대여가능일 등록
--1,3 자전거 : 10~21
--2,4 자전거 : 10~12, 15~21
insert into possible_day values(1,to_date('2017-06-10','yyyy/mm/dd'),to_date('2017-06-21','yyyy/mm/dd'));
insert into possible_day values(2,to_date('2017-06-10','yyyy/mm/dd'),to_date('2017-06-12','yyyy/mm/dd'));
insert into possible_day values(2,to_date('2017-06-15','yyyy/mm/dd'),to_date('2017-06-21','yyyy/mm/dd'));
insert into possible_day values(3,to_date('2017-06-10','yyyy/mm/dd'),to_date('2017-06-21','yyyy/mm/dd'));
insert into possible_day values(4,to_date('2017-06-10','yyyy/mm/dd'),to_date('2017-06-12','yyyy/mm/dd'));
insert into possible_day values(4,to_date('2017-06-15','yyyy/mm/dd'),to_date('2017-06-21','yyyy/mm/dd'));

select * from possible_day;
---------------------------------------------------------------------
--map 위도경도 등록
insert into map values(1, '37.394879','127.11123799999996');
insert into map values(2, '37.3964436','127.11170119999997');
insert into map values(3, '37.3925707','127.11199599999998');
insert into map values(4, '37.40164300000001','127.10709300000008');

select * from map;
-------------------------------------------------
--대여성사됨 등록
--1.정태형이 배서경자전거1 빌림 : 11~12일
insert into rent values(rent_seq.nextval,'java3',1,to_date('2017-06-11','yyyy/mm/dd'),to_date('2017-06-12','yyyy/mm/dd'),1);
--2.정태형이 임소영자전거4 빌림 : 15~17일
insert into rent values(rent_seq.nextval,'java3',4,to_date('2017-06-15','yyyy/mm/dd'),to_date('2017-06-17','yyyy/mm/dd'),1);
--3.이현근이 배서경자전거1 빌림 : 13일
insert into rent values(rent_seq.nextval,'java4',1,to_date('2017-06-13','yyyy/mm/dd'),to_date('2017-06-13','yyyy/mm/dd'),1);
--4.임소영이 배서경자전거1 빌림 : 14일
insert into rent values(rent_seq.nextval,'java2',1,to_date('2017-06-14','yyyy/mm/dd'),to_date('2017-06-14','yyyy/mm/dd'),1);

select * from rent;
------------------------------------------------

insert into rb_review values(1,4,sysdate,'좋아요');
insert into rb_review values(2,4,sysdate,'임쏘자전거좋아요');
insert into rb_review values(3,5,sysdate,'좋아요3');
insert into rb_review values(4,3,sysdate,'좋아요4');


--==============서경==============================================================


>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git
