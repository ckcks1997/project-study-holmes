

--- study_member 테이블

drop table study_member;

create table study_member
(
    email      varchar(50) primary key,
    password   varchar(30) not null,
    nickname   varchar(30) not null unique,
    name        varchar(30) not null ,
    tel         varchar(15),
    picture     varchar(200),
    regdate    date,
    point       integer,
    profile_intro varchar(2000)
);

insert into study_member values ('a@a.com', '1111', 'test1', 'name1','010-0000-0000',null, sysdate,50,null)

---
---태그정보(study_member의 email을 join해서 가져옴)

create sequence tag_num_seq;

create table MEMBER_TAG
(
    TAG_NUM NUMBER       not null  primary key,
    EMAIL   VARCHAR2(50) not null,
    TAG     VARCHAR2(30) not null

)

---
---alert (알림)테이블
create sequence alert_seq;

create table notice(
    alert_num number primary key,
    nickname_to varchar2(30) not null,
    nickname_from varchar2(30) not null,
    info varchar2(1000) not null,
    isread number,
    regdate date
);

insert into notice values (alert_seq.nextval, 'qqq', '11111', 'test123한글', 0, sysdate);

--- community 테이블 
drop table community;

create table community
 (
	board_num 	    number 		    primary key,
	title	    varchar2(100)	not null,
	content	    varchar2(4000),
	likes	    number,
	boardid	    varchar2(1),
	regdate	    date,
	ip	        varchar(20),
	readcnt	    number(10),
	nickname    varchar(10)
);

create sequence board_seq;


--- study_menu 테이블

drop table study_menu;

create table study_menu
(
	board_num number primary key,
	nickname varchar2(30) not null,
	title varchar2(100),
	subject varchar2(50),
	price varchar2(50),
	pernum number(10),
	region varchar2(30),
	content varchar2(4000),
	menuid varchar2(1),
	regdate date,
	map varchar2(1000)
);

---댓글 테이블
create table reply (
	reply_num number primary key,
	board_num number,
	nickname varchar2(30) not null,
	regdate date,
	content varchar2(4000)
);

create sequence reply_seq;

 
-----join table
--전체인원(최대)
--study (numnumber)
--email (회원)

--채팅 테이블
--numnumber(스터디넘버)
--회원(멤버이메일)
--채팅내용(문자)
--파일이름(첨부파일) -->이것으로 첨부파일만 보이는 페이지 만들어서 자료실 만들기



--------studychk 테이블

create table attend
( id  varchar (50),
day  date
);

