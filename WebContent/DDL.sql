

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
    joindate    date,
    point       integer,
    profile_intro varchar(2000)
);

insert into study_member values ('a@a.com', '1111', 'test1', 'name1','010-0000-0000',null, sysdate,50,null)

---
---태그정보(study_member의 email을 join해서 가져옴)
create table member_tag
(
    num --pk 시퀀스
    EMAIL VARCHAR2(50) not null,
    TAG   VARCHAR2(30) not null
);
---

--- community 테이블 

create table community
 (
	num 	    number 		    primary key,
	subject	    varchar(100)	not null,
	content	    varchar(4000),
	tag	        varchar(100),
	likes	    number,
	boardid	    varchar(1),
	regdate	    date,
	ip	        varchar(20),
	readcnt	    number(10),
	ref  	    number,
	reflevel	number(3),
	refstep	    number(5),
	nickname    varchar(10)
);

create sequence comboard_seq;


---

--- study_menu table 테스트용(수정예정)

create table study_menu
(
--종류, 작성자
    num --primary key 시퀀스
	subject varchar(100) ,
	free number(1),
	pernum number(30),
	region varchar(30),
	menuid varchar(1)
	
);

---


create table study_menu
(
	numnumber primary key,
	--owner
	subject varchar(100),
	langue number(10),
	free number(10),
	--pernum number(30),
	region varchar(30),
	content varchar(4000),
	menuid varchar(30),
	regdate date,
	ip varchar(20),
	readcnt number(10),
	ref number,
	reflevel number(3),
	refstep number(5)
	
);

---댓글 테이블
--보드 넘버(numnumber)
--작성자
--내용
--날짜
 
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
create table studycheck
( id  varchar (50),
day  date
);



