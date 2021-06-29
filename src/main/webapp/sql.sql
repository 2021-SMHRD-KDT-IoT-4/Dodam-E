select * from USERS;
select * from users;
select * from FAQ;
select * from NOTICE;
select * from CHILD;
select * from SEND;
select * from ROUTE;
select * from reply;


insert into notice values( notice_seq.nextval, 'AA', 'ss', 'BB', sysdate);
desc send;

insert into CHILD values('효진이','10','여','무지개초등학교');

insert into users values('관리자', 'admin', '0000', '062');

insert into child values('my', '선풍기', 'female', '210506', '쿠팡초등학교');

insert into faq VALUES(faq_seq.nextval,'제발','my','탈주각','지금이 기회야');

alter table child add(child_machine varchar2(30));

delete from users where users_id = 'admin';


commit;

insert into notice VALUES(notice_seq.nextval,'준환바보','my','바보가 맞다2',sysdate);

select * from child;

delete from users where users_id = 'oracle';

commit;

truncate table route;
truncate table users;
truncate table faq;
truncate table send;
truncate table child;

create table reply(
	reply_seq number,
	users_id varchar2(50),
	notice_seq number,
	reply_content varchar2(80),
	reply_day date
);

create sequence reply_seq increment by 1 start with 1;

truncate table ROUTE;



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


insert into route values(route_seq.nextval,'hyo','김효진','학원',sysdate);

drop sequence num_board;
drop sequence faq_seq;

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

delete from route where route_user ='hyo';

truncate table faq;

insert into faq values(faq_seq.nextval,'회원탈퇴가 되지 않아요!!!','admin','아이를 먼저 삭제하고 회원을 탈퇴해주세요^^',sysdate
);

insert into faq values(faq_seq.nextval,'기기번호 변경은 어떻게 하나요???','admin','관리자에게 문의하세요^^',sysdate
);
insert into faq values(faq_seq.nextval,'아이디 비밀번호를 잊어버렸어요!!!','admin','관리자 선생님을 제외한 아이디는 학교 안심알리미 담당선생님이나 스쿨메신저 관리지 선생님께 비밀번호 초기화 를 요청해주세요.
',sysdate
);

insert into faq values(faq_seq.nextval,'등,하교 정보가 보이지 않아요','admin','학부모님께서 자녀의 책가방에 단말기가 착용되어 있는지 확인해 주세요.',sysdate
);



drop table faq;

create table faq(
faq_seq number,
faq_title varchar2(50),
faq_writer varchar2(50),
faq_content varchar2(200),
faq_day date
);


select faq_seq.currval from dual;
select notice_seq.currval from dual;
select info_seq.currval from dual;
select receive_seq.currval from dual;
select reply_seq.currval from dual;
select route_seq.currval from dual;
select send_seq.currval from dual;

create SEQUENCE faq_seq
INCREMENT by 1
START with 1;

create SEQUENCE notice_seq
INCREMENT by 1
START with 1;

create SEQUENCE info_seq
INCREMENT by 1
START with 1;

create SEQUENCE reply_seq
INCREMENT by 1
START with 1;

create SEQUENCE route_seq
INCREMENT by 1
START with 1;

create SEQUENCE receive_seq
INCREMENT by 1
START with 1;

create SEQUENCE send_seq
INCREMENT by 1
START with 1;
