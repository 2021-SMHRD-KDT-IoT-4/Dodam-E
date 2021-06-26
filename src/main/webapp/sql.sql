select * from USERS;
select * from users;
select * from FAQ;
select * from NOTICE;
select * from CHILD;
select * from SEND;
select * from ROUTE;

insert into notice values( notice_seq.nextval, 'AA', 'ss', 'BB', sysdate);
desc send;

insert into CHILD values('효진이','10','여','무지개초등학교');

insert into users values('관리자', 'admin', '0000', '062');

insert into child values('my', '선풍기', 'female', '210506', '쿠팡초등학교');

insert into faq VALUES(faq_seq.nextval,'제발','my','탈주각','지금이 기회야');

alter table child add(child_machine varchar2(30));


commit;

insert into notice VALUES(notice_seq.nextval,'준환바보','my','바보가 맞다2',sysdate);

select * from child;

delete from users where users_id = 'oracle';

commit;


create table route (

 route_seq number,
 route_user varchar2(50),
 route_child varchar2(50),
 route varchar2(50),
 checktime date
 );
 
 drop table route;

create table receive_info(
	receive_seq number,
	receive_num number(20),
	receive_loca varchar2(50)
);
 
 select * from ROUTE;
 select * from receive_info
 create sequence receive_seq increment by 1 start with 1;
 create sequence route_seq increment by 1 start with 1;
 drop sequence receive_seq
delete from route;


insert into route values(route_seq.nextval,'route',sysdate)

drop sequence num_board;

select * from receive_info;
select * from route;

insert into app1 values(111,'신호등')
insert into receive_info values(receive_seq.nextval,0001,'학교');
insert into receive_info values(receive_seq.nextval,0002,'신호등');
insert into receive_info values(receive_seq.nextval,0003,'피아노학원');
insert into receive_info values(receive_seq.nextval,0004,'집');
insert into route values(route_seq.nextval,'ss','sss','집',sysdate);


select * from users;
select * from app1;

delete from NOTICE where notice_seq = 167;





