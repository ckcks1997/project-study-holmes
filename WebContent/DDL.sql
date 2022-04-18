

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

insert into study_member values ('a@a.com', '1111', 'test1', 'name1','010-0000-0000',null, sysdate,50,null);
insert into study_member values ('admin@a.com','1234','관리자','admin','010-1111-1111',null,sysdate,1000,null);

commit;
---
---태그정보(study_member의 email을 join해서 가져옴)

create sequence tag_num_seq;

create table MEMBER_TAG
(
    TAG_NUM NUMBER       not null  primary key,
    EMAIL   VARCHAR2(50) not null,
    TAG     VARCHAR2(30) not null
);

---
---NOTICE (알림)테이블
create sequence NOTICE_SEQ;

create table NOTICE
(
    NOTICE_NUM    NUMBER       not null
        primary key,
    NICKNAME_TO   VARCHAR2(30) not null,
    NICKNAME_FROM VARCHAR2(30) not null,
    INFO          VARCHAR2(1000),
    INFO2         VARCHAR2(200),
    ISREAD        NUMBER,
    REGDATE       DATE
);

 
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
	readcnt	    number,
	nickname    varchar(10),
	replycnt    number
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
	menuid varchar2(2),
	regdate date,
	latitude number,
	longitude number
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

 
-----group table
create SEQUENCE GROUP_MEMBER_SEQ;
drop table GROUP_MEMBER;

create table GROUP_MEMBER
(
    GROUP_NUMBER NUMBER       not null
        primary key,
    BOARDNUM     NUMBER,
    REPRESENT     NUMBER,
    NICKNAME     VARCHAR2(30) not null,
    REGDATE      DATE
);

------group_board 테이블
DROP TABLE GROUP_BOARD;
CREATE TABLE GROUP_BOARD
(
    BOARD_NUM NUMBER  NOT NULL
        PRIMARY KEY,
    S_BOARD_NUM NUMBER   NOT NULL ,
    TITLE     VARCHAR2(100) NOT NULL,
    CONTENT   VARCHAR2(4000),
    REPLYCNT  NUMBER,
    BOARDID   VARCHAR2(1),
    REGDATE   DATE,
    FILE1     VARCHAR2(200),
    READCNT   NUMBER,
    NICKNAME  VARCHAR2(30)
);

--------studychk 테이블

create table attend
( id  varchar (50),
 gift varchar (200)	
);



----채팅 테이블
create sequence chatseq2;
create table WEBCHAT2
(
    NUM      NUMBER not null
        primary key,
    boardnum VARCHAR2(30),
    memberNickname  VARCHAR2(30),
    MESSAGE  VARCHAR2(3000),
    file varchar2(1000)
);

--평가기록 테이블
create sequence reputation_seq;
create table reputation_estimate
(
    NUM      NUMBER not null
        primary key,
    group_num number,
    nickname_to  VARCHAR2(30),
    nickname_from  VARCHAR2(30),
    score number,
     info  VARCHAR2(1000),
    regdate date
);


-----------신고 테이블 
create SEQUENCE report_seq;
create table report 
(
report_num  number  not null primary key,
nickname varchar2(30) not null, 
report_reason varchar2(300) not null, 
board_num  number not null,
writer_nickname varchar2(30) not null,
board_num_title varchar2(100) not null,
board_num_regdate date not null
);


