

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
    joindate date,
    point integer,
    profile_intro varchar(2000)
);

insert into study_member values ('a@a.com', '1111', 'test1', 'name1','010-0000-0000',null, sysdate,50,null)

---
---태그정보(study_member의 email을 join해서 가져옴)
create table member_tag
(
    email varchar(50) primary key,
    tag  varchar(30)
);
---
