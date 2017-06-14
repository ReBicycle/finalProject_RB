drop table rb_review;
drop table rb_report;
drop table donation;
drop table rent;
drop table possible_day;
drop table bicycle_photo;
drop table map;
drop table bicycle;
drop table category;
drop table rb_member;

drop sequence category_seq;
drop sequence bicycle_seq;
drop sequence rent_seq;
drop sequence report_seq;
drop sequence donation_seq;
 
delete from rb_review;
delete from rb_report;
delete from donation;
delete from rent;
delete from possible_day;
delete from bicycle_photo;
delete from map;
delete from bicycle;
delete from category;
delete from rb_member;
delete from RB_BOARDREPLY

create sequence category_seq nocache;
create sequence bicycle_seq nocache;
create sequence rent_seq nocache;
create sequence report_seq nocache;
create sequence donation_seq nocache;

select * from heart;
select * from rb_member;
select * from category order by categoryNo;
select * from bicycle;
select * from map;
select * from bicycle_photo;
select * from possible_day;
select * from rent;
select * from donation;
select * from rb_report;
select * from rb_review;

--테이블 생성
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

create table bicycle(
   bicycleNo number primary key,
   title varchar2(100) not null,
   memberId varchar2(100) not null constraint fk_borrower_id references rb_member(id),
   address varchar2(300) not null,
   title varchar2(100) not null,
   purchasePrice number not null,
   rentPrice number not null,
   detail clob not null,
   categoryNo number not null constraint fk_category_no references category(categoryNo)
)

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

--create table rent(
--   rentNo number primary key,
--  renterId varchar2(100) not null constraint fk_renter_id references rb_member(id),
--   bicycleNo number not null constraint fk_bicycle_no_deal references bicycle(bicycleNo),
--   startDay date not null,
--   endDay date not null,
--   state number not null
--)

create table rent(
   rentNo number primary key,
   renterId varchar2(100) not null constraint fk_renter_id references rb_member(id),
   startDay date not null,
   endDay date not null,
   state number default 0
)



create table rb_review(
	reviewerId varchar2(100) constraint fk_reviewer_idid references rb_member(id),
	rentNo number constraint fk_rentNooo references rent(rentNo),
	star number default 0,
	reviewDate date not null,
	content clob not null,
	constraint pk_rb_review primary key(reviewerId, rentNo)
)

create table rb_report(
	reportNo number primary key,
	reporterId varchar2(100) not null constraint fk_rb_reporterId references rb_member(id),
	blackId varchar2(100) not null constraint fk_rb_blackId references rb_member(id),
	contents clob not null,
	reportDate date not null
)

create table donation(
   donationBicycleNo number primary key,
   donorId varchar2(100) not null constraint fk_donor_id references rb_member(id),
   detail clob not null,
   picture varchar2(300) not null,
   status number default 0,
   address varchar2(300) not null,
   title varchar2(100) not null
)
create table rb_review(
   reviewerId varchar2(100) constraint fk_reviewer_idid references rb_member(id),
   rentNo number constraint fk_rentNooo references rent(rentNo),
   star number default 0,
   reviewDate date not null,
   cotent clob not null,
   constraint pk_rb_review primary key(reviewerId, rentNo)
)

create table heart(
	id varchar2(100) constraint fk_heart_id references rb_member(id),
	bicycleNo  number constraint fk_heart_nol references bicycle(bicycleNo),
	constraint pk_heart primary key(id,bicycleNo)
)

--테이블 수정
alter table rb_member modify address varchar2(300);
alter table bicycle modify address varchar2(300);
alter table bicycle add title varchar2(100) not null;

--카테고리 데이터 삽입
insert into category(categoryNo, categoryName) values(1, 'MTB');
insert into category(categoryNo, categoryName) values(2, '로드');
insert into category(categoryNo, categoryName) values(3, '픽시');
insert into category(categoryNo, categoryName) values(4, '미니벨로');
insert into category(categoryNo, categoryName) values(5, '레코드용');
insert into category(categoryNo, categoryName) values(6, '어린이용');
insert into category(categoryNo, categoryName) values(7, '기타');

-- 위로는 절대 건드리지 말것!!

-----------------rent table 컬럼 수정-----------------------
alter table rent modify(state number default 0);

delete from rent
select * from rent
insert into rent values(rent_seq.nextval,'java',3,'2017-05-11','2017-05-12',1);
insert into rent(rentNo,renterId,bicycleNo,startDay,endDay) values(rent_seq.nextval,'java2',4,'2017-06-27','2017-06-27');
select rent_seq.nextval from dual
select bicycle_seq.nextval from dual



select * from BICYCLE
------------------------------------donation 테이블 수정---
delete from donation
alter table donation
add (address varchar2(300) not null)
alter table donation
add (title varchar2(100) not null)
alter table donation
modify (status number default 0)
select * from donation
select d.donationbicycleno,d.donorId,d.address, d.detail,d.picture,d.rnum 
from (select donationbicycleno,donorId,address,detail,picture,
 row_number() over(order by donationbicycleno desc) rnum from donation where status=0) D
 where rnum between 1 and 1
select count(*)from donation

insert into donation (donationBicycleNo,donorId,detail,picture,address,title)
values(donation_seq.nextval,'spring','아끼는 건데 너 줄게 ','1_photo1.jpg','판교역주변','안쓰는 자전거 나눔해요~!')
-------------------------------------------------------------


select count(*)
   		from heart
   		where id='java1' and bicycleNo=14

   donationBicycleNo number primary key,
   donorId varchar2(100) not null constraint fk_donor_id references rb_member(id),
   detail clob not null,
   picture varchar2(300) not null,
   status number default 0,
   address varchar2(300) not null




==================================================


------------종봉---------------------------------------------
insert into CATEGORY values(category_seq.nextval,'미니벨로')
update category set CATEGORYNAME='MTB' where CATEGORYNO=1;

select * from category

select * from bicycle

select * from bicycle


select * from category

select * from BICYCLE

--자전거 등록
insert into category values(category_seq.nextval,'MTB')
insert into bicycle values(bicycle_seq.nextval,'java','판교',100000,5000,'애끼는자전거',1)
insert into bicycle values(bicycle_seq.nextval,'java','판교',100000,5000,'애끼는자전거2',1)
<<<<<<< HEAD

=======
--자전거 삭제
delete from bicycle where bicycleNo=1 cascade;

>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git
insert into bicycle values(1,'java','판교',100000,5000,'애끼는자전거',1)

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
alter table bicycle modify address varchar2(300)
--좌표까지 조회
select * from rb_member

------------종봉----------------------------------------------

-----------------------------석희---------------------------------
select * from rb_report;
alter table rb_report
add reportTitle varchar2(100) not null

create table rb_report(
	reportNo number primary key,
	reportTitle varchar2(100) not null,
	reporterId varchar2(100) not null constraint fk_rb_reporterId references rb_member(id),
	blackId varchar2(100) not null constraint fk_rb_blackId references rb_member(id),
	contents clob not null,
	reportDate date not null
)

CREATE TABLE rb_boardreply (
      brdno number default 0,
      reno number primary key,
      retitle varchar(100) not null,
      rewriter varchar(10) not null constraint fk_rb_rewriter references rb_member(id),
      rememo varchar(500) not null,
      redate date not null
)



select * from rb_report
================================= 등록 테스트 =================================

SELECT r.reportNo,r.reportDate,r.reporterId,r.blackId,r.contents FROM(
		SELECT row_number() over(order by reportNo desc) as rnum,reportNo,reporterId,blackId,contents,
		to_char(reportDate,'YYYY.MM.DD') as reportDate
		FROM rb_report
		) r, rb_report order by reportNo desc		
		
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
 		values(1,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate)

--------------------------------- 성공 -----------------------------------------------------
			SELECT r.reportNo,r.reportTitle,r.reportDate,r.reporterId,r.blackId,r.contents FROM(
			SELECT row_number() over(order by reportNo desc) as rnum,reportNo,reportTitle,reporterId,blackId,contents,
			to_char(reportDate,'YYYY.MM.DD') as reportDate 
			FROM rb_report
			) r where rnum between 1 and 5 order by reportNo desc;
============================================================================================
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(50,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(51,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(52,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(53,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(54,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(55,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(56,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(57,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(58,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(59,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(60,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(61,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(62,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(63,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(64,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(65,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(66,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(67,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(68,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(69,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(70,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
insert into rb_report(reportNo,reportTitle,reporterId,blackId,contents,reportDate)
values(71,'응가 자전거','java','jobman','거대한 응가 자전거',sysdate);
--------------------------------- 성공 -----------------------------------------------------
			SELECT r.reportNo,r.reportTitle,r.reportDate,r.reporterId,r.blackId,r.contents FROM(
			SELECT row_number() over(order by reportNo desc) as rnum,reportNo,reportTitle,reporterId,blackId,contents,
			to_char(reportDate,'YYYY.MM.DD') as reportDate 
			FROM rb_report
			) r where rnum between 1 and 5 order by reportNo desc;
============================================================================================

insert into rb_report(reportNo,reporterId,blackId,contents,reportDate)
 		values(1,'java','java','hhhhh',sysdate)
 		
insert into RB_MEMBER values('jobman','1234','정석희','01040051481','수내','anjemo1481@gmail.com', '1002132258973', 'null');

create sequence report_seq;
-------------------------- board_detail select --------------------------------
select
b.reportNo,b.reportTitle,b.reporterId,b.blackId,to_char(b.reportDate,'YYYY.MM.DD HH:mm:ss') as 
reportDate,b.contents from rb_report 
b where reportNo=26
---------------------------대댓글 구간-------------------------------------
--대댓글 테이블--
CREATE TABLE rb_boardreply (
      brdno number default 0,
      reno number primary key,
      rewriter varchar(10) not null constraint fk_rb_rewriter references rb_member(id),
      rememo varchar(500) not null,
      redate date not null
)
--brdno(게시판 넘버)를 rb_report를 fk로 뒀을때 댓글이 달려있는 게시물이 삭제 안됨--
CREATE TABLE rb_boardreply (
      brdno number default 0 constraint fk_rb_brdno references rb_report(reportNo),
      reno number primary key,
      retitle varchar(100) not null,
      rewriter varchar(10) not null constraint fk_rb_rewriter references rb_member(id),
      rememo varchar(500) not null,
      redate date not null
)
select * from rb_boardreply
select * from rb_report where reportNo=90


insert into rb_boardreply(brdno,reno,rewriter,rememo,redate)
 		values(90,1,'jobman','크로캉~ 부슈우~~~~',sysdate)

create sequence rb_boardreply_seq;
select * from rb_boardreply;

select
c.brdno,c.reno,c.rewriter,c.rememo,to_char(c.redate,'YYYY.MM.DD HH:mm:ss') as 
redate from rb_boardreply 
c where brdno=90

select * from rb_boardreply

drop table rb_boardreply;
drop sequence rb_boardreply_seq;
-----------------------------석희---------------------------------



-----------------------태형--------------------------------

alter table rb_member modify address varchar2(300);
alter table bicycle modify address varchar2(300);

delete from possible_day;
delete from bicycle_photo;
delete from map;
delete from category;
delete from bicycle;
alter table bicycle add title varchar2(100) not null;

select * from possible_day
select address from rb_member where id='java';
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

select




select * from possible_day



select * from possible_day where bicycleNo=2
insert into possible_day values(2,'2017-05-27','2017-05-29')
insert into possible_day values(2,'2017-05-13','2017-05-17')

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

-----------------------소영------------------------------------------



--==============서경=======================================================

insert into RB_MEMBER values('java','1234','배서경','010','경기도 수원시 영통구 웰빙타운로 70','@','632','null');
insert into RB_MEMBER values('java2','1234','임소영','010','경기도 수원시 영통구 웰빙타운로 20','@','632','null');
insert into RB_MEMBER values('java3','1234','정태형','010','경기도 성남시 분당구 판교역로 160','@','632','null');
insert into RB_MEMBER values('java4','1234','이현근','010','경기도 성남시 분당구 판교역로 8','@','632','null');

select * from RB_MEMBER

-------------------------------------------------------------
select *from bicycle
--배서경이 등록한 자전거2개
insert into bicycle values(bicycle_seq.nextval,'java','경기도 성남시 분당구 판교역로 160',100000,5000,'애끼는자전거',1 , '자전거 타이틀 추가');
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
insert into bicycle_photo values(44,'44_photo1.jpg','44_photo2.jpg','44_photo3.jpg');

---------------------------------------------------------------------
--자전거 대여가능일 등록
--1,3 자전거 : 10~21
--2,4 자전거 : 10~12, 15~21
insert into possible_day values(1,to_date('2017-06-10','yyyy/mm/dd'),to_date('2017-06-21','yyyy/mm/dd'));
insert into possible_day values(2,to_date('2017-06-10','yyyy/mm/dd'),to_date('2017-06-12','yyyy/mm/dd'));
insert into possible_day values(2,to_date('2017-06-15','yyyy/mm/dd'),to_date('2017-06-21','yyyy/mm/dd'));
insert into possible_day values(3,to_date('2017-06-10','yyyy/mm/dd'),to_date('2017-06-21','yyyy/mm/dd'));
insert into possible_day values(4,to_date('2017-06-10','yyyy/mm/dd'),to_date('2017-06-12','yyyy/mm/dd'));
insert into possible_day values(44,to_date('2017-06-15','yyyy/mm/dd'),to_date('2017-06-21','yyyy/mm/dd'));

select * from possible_day;
---------------------------------------------------------------------
--map 위도경도 등록
insert into map values(1, '37.394879','127.11123799999996');
insert into map values(2, '37.3964436','127.11170119999997');
insert into map values(3, '37.3925707','127.11199599999998');
insert into map values(44, '37.40164300000001','127.10709300000008');

select * from map;
-------------------------------------------------
--대여성사됨 등록
--1.정태형이 배서경자전거1 빌림 : 11~12일
insert into rent values(rent_seq.nextval,'java',33,to_date('2017-06-11','yyyy/mm/dd'),to_date('2017-06-12','yyyy/mm/dd'));
--2.정태형이 임소영자전거4 빌림 : 15~17일
insert into rent values(rent_seq.nextval,'java3',4,to_date('2017-06-15','yyyy/mm/dd'),to_date('2017-06-17','yyyy/mm/dd'),1);
--3.이현근이 배서경자전거1 빌림 : 13일
insert into rent values(rent_seq.nextval,'java4',1,to_date('2017-06-13','yyyy/mm/dd'),to_date('2017-06-13','yyyy/mm/dd'),1);
--4.임소영이 배서경자전거1 빌림 : 14일
insert into rent values(rent_seq.nextval,'java2',1,to_date('2017-06-14','yyyy/mm/dd'),to_date('2017-06-14','yyyy/mm/dd'),1);

insert into rent values(rent_seq.nextval,'java2',4,to_date('2017-06-08','yyyy/mm/dd'),to_date('2017-06-09','yyyy/mm/dd'),1);
insert into rent values(rent_seq.nextval,'java3',4,to_date('2017-06-10','yyyy/mm/dd'),to_date('2017-06-11','yyyy/mm/dd'),1);
insert into rent values(rent_seq.nextval,'java4',4,to_date('2017-06-12','yyyy/mm/dd'),to_date('2017-06-15','yyyy/mm/dd'),1);
insert into rent values(rent_seq.nextval,'java2',4,to_date('2017-06-16','yyyy/mm/dd'),to_date('2017-06-17','yyyy/mm/dd'),1);
select * from rent;

select rentNo from rent
		where renterId='java2' and bicycleNo=4 and state=1
------------------------------------------------
select * from RB_REVIEW;


insert into rb_review values('java2',22,4,sysdate,'리뷰 첫번째');

--==============서경==============================================================
update rb_report set reportTitle='test',blackId='java',contents='test',reportDate=sysdate where reportNo=26


-----------------------현근------------------------------------------
   
delete from possible_day;
delete from bicycle_photo;
delete from bicycle;
alter table bicycle add title varchar2(100) not null;

delete from bicycle;
delete from rb_member;
delete from rb_review;
delete from rb_report;
delete from donation;
delete from rent;
delete from possible_day;
delete from bicycle_photo;
delete from map;
delete from bicycle;
delete from category;
   
select * from bicycle
select * from rb_member
select * from category

drop sequence category_seq;
drop sequence bicycle_seq;
drop sequence rent_seq;
drop sequence report_seq;
drop sequence donation_seq;

alter table rb_member modify address varchar2(300);
alter table bicycle modify address varchar2(300);
alter table bicycle add title varchar2(100) not null;

create sequence category_seq nocache;
create sequence bicycle_seq nocache;
create sequence rent_seq nocache;
create sequence report_seq nocache;
create sequence donation_seq nocache;

insert into category(categoryNo, categoryName) values(1, 'MTB');
insert into category(categoryNo, categoryName) values(2, '로드');
insert into category(categoryNo, categoryName) values(3, '픽시');
insert into category(categoryNo, categoryName) values(4, '미니벨로');
insert into category(categoryNo, categoryName) values(5, '레코드용');
insert into category(categoryNo, categoryName) values(6, '어린이용');
insert into category(categoryNo, categoryName) values(7, '기타');

select * from rb_member;
select * from category order by categoryNo;
select * from bicycle;
select * from map;
select * from bicycle_photo;
select * from possible_day;
select * from rent;
select * from donation;
select * from rb_report;
select * from rb_review;

drop table rb_review

create table rb_review(
   reviewerId varchar2(100) constraint fk_reviewer_idid references rb_member(id),
   rentNo number constraint fk_rentNooo references rent(rentNo),
   star number default 0,
   reviewDate date not null,
   cotent clob not null,
   constraint pk_rb_review primary key(reviewerId, rentNo)
)

drop table rent
delete table rent
alter table rent 
add constraint fk_bicycle_no_deal references bicycle(bicycleNo)
create table rent(
   rentNo number primary key,
   renterId varchar2(100) not null constraint fk_renter_id references rb_member(id),
   bicycleNo number not null constraint fk_bicycle_no_deal references bicycle(bicycleNo),
   startDay date not null,
   endDay date not null,
   state number default 0
)

select * from POSSIBLE_DAY

--mypage 요청 리스트
select r.*, b.*
from rent r, bicycle b
where r.bicycleNo = b.bicycleNo and b.memberId = 'java' and r.state = 0


select r.*, b.bicycleNo, b.memberId, b.title
from rent r, bicycle b
where r.bicycleNo = b.bicycleNo and b.memberId = 'java' and r.state = 0


select distinct bicycleNo, title
		from bicycle
		where memberId='java'

		-- 직접 테이블 만들어서 테스트 해본다 
create table date_test2(
	id varchar2(50) primary key,
	mydate date not null
)
-- id java , mydate는 현재시간으로 insert 해본다 
insert into date_test2(id,mydate) values('java',sysdate);
select * from date_test2;
-- id가 java인 대상의 mydate를 년 월 일 시 분 초까지 조회한다
-- to_char 함수를 이용한다 
select to_char(mydate,'YYYY/MM/DD HH24:MI:SS') from date_test
where id='java';

-- 특정 시간을 insert 해본다 
-- 문자열 형식의 날짜 정보를 date 타입으로 insert 하기 위해 
-- to_date(시간정보,시간포맷) 함수를 이용 
insert into date_test(id,mydate) 
values('spring',to_date('2017/1/1 9:00:10','YYYY/MM/DD HH24:MI:SS'));

select * from date_test;
-- 시간 연산이 가능하다 
select id,sysdate-mydate from date_test;\

select * from rent
DELETE FROM RENT
select r.*, p.*
from rent r, possible_day p
where r.bicycleNo = p.bicycleNo and r.bicycleNo = 12


select DATEDIFF(day ,to_date('2017/1/1 9:00:10') ,to_date('2017/1/1 9:00:10')+1)
from dual
==> 1 일 (1일)

select  r.rentNo, m.id, b.memberId
from rent r , bicycle b, rb_member m
where  r.bicycleNo = b.bicycleNo and b.memberId=m.id and r.state>0 and b.memberId = 'java'

select  r.rentNo,r.renterId,r.startDay,r.endDay, m.id, b.memberId
		from rent r , bicycle b, rb_member m
		where  r.bicycleNo = b.bicycleNo and b.memberId=m.id 
		and state >  0 and b.memberId =  'java'
select * from bicycle where memberId='java'

select * from rent
select * from bicycle


select r.*, b.bicycleNo, b.memberId, b.title
from rent r, bicycle b
where r.bicycleNo = b.bicycleNo and b.memberId = 'java' and (r.state = 0 or r.state = 2)


select r.*, b.bicycleNo, b.memberId, b.title,m.id
from rent r, bicycle b,rb_member m
where r.bicycleNo = b.bicycleNo and b.memberId = 'ter1943' and b.memberId = m.id  and r.state = 0 or r.state = 2 order by r.rentNo desc

commit

