

--- study_member 테이블

drop table study_member;

create table study_member
(
    email      varchar(50) primary key,
    password   varchar(30) not null,
    nickname  varchar(30) not null unique,
    name  varchar(30) not null ,
    tel  varchar(15),
    picture    varchar(200),
    joindate date
);

insert into study_member values ('a@a.com', '1111', 'test1', 'name1','010-0000-0000',null, sysdate)

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
	refstep	    number(5)
);

create sequence comboard_seq;

commit;

-----------
