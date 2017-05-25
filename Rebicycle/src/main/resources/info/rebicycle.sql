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

insert into RB_MEMBER values('java','1234','임소영','01023991943','봉담','ter1943@naver.com', '110201759649', 'null')
select * from rb_member

select id,password,name,phone,address,email,account from rb_member		
where id='java' and password='1234'

create table rb_member(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   name varchar2(100) not null,
   phone varchar2(100) not null,
   address varchar2(100) not null,
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
   address varchar2(100) not null,
   purchasePrice number not null,
   rentPrice number not null,
   detail clob not null,
   categoryNo number not null constraint fk_category_no references category(categoryNo)
)
create sequence bicycle_seq;

create table map(
   bicycleNo number primary key constraint fk_bicycle_no_map references bicycle(bicycleNo),
   latitude varchar2(100) not null,
   longitude varchar2(100) not null
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

create table rent(
   rentNo number primary key,
   renterId varchar2(100) not null constraint fk_renter_id references rb_member(id),
   bicycleNo number not null constraint fk_bicycle_no_deal references bicycle(bicycleNo),
   startDay date not null,
   endDay date not null,
   state number not null
)
create sequence rent_seq;
 
 
create sequence report_seq;

create table donation(
   donationBicycleNo number primary key,
   donorId varchar2(100) not null constraint fk_donor_id references rb_member(id),
   detail clob not null,
   picture varchar2(300) not null
)
create sequence donation_seq;


create table rb_report(
	reportNo number primary key,
	reporterId varchar2(100) not null constraint fk_rb_reporterId references rb_member(id),
	blackId varchar2(100) not null constraint fk_rb_blackId references rb_member(id),
	contents clob not null,
	reportDate date not null
)

create table rb_review(
	reviewerId varchar2(100) constraint fk_reviewer_idid references rb_member(id),
	rentNo number constraint fk_rentNooo references rent(rentNo),
	star number default 0,
	reviewDate date not null,
	constraint pkpk_review primary key(reviewerId, rentNo)
)
---------------------------------------------------------------
------------종봉---------------------------------------------
insert into CATEGORY values(category_seq.nextval,'미니벨로')
select * from category

insert into bicycle values(bicycle_seq.nextval,'java','판교',100000,5000,'애끼는자전거',1)

------------종봉----------------------------------------------
alter table );