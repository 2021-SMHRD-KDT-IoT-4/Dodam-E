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

insert into CHILD values('ȿ����','10','��','�������ʵ��б�');

insert into users values('������', 'admin', '0000', '062');

insert into child values('my', '��ǳ��', 'female', '210506', '�����ʵ��б�');

insert into faq VALUES(faq_seq.nextval,'����','my','Ż�ְ�','������ ��ȸ��');

alter table child add(child_machine varchar2(30));


commit;

insert into notice VALUES(notice_seq.nextval,'��ȯ�ٺ�','my','�ٺ��� �´�2',sysdate);

select * from child;

delete from users where users_id = 'oracle';

commit;

truncate table route;

create table reply(
	reply_seq number,
	users_id varchar2(50),
	notice_seq number,
	reply_content varchar2(80),
	reply_day date
);

create sequence reply_seq increment by 1 start with 1;





create table route (

 route_seq number,
 route_user varchar2(50),
 route_child varchar2(50),
 route varchar2(50),
 route_la number,
 route_ha number,
 checktime date
 );
 
 drop table route;
 drop table receive_info;

create table receive_info(
	receive_seq number,
	receive_num number(20),
	receive_loca varchar2(50),
	receive_la number,
	receive_ha number
);
 
 select * from ROUTE;
 select * from receive_info
 create sequence receive_seq increment by 1 start with 1;
 create sequence route_seq increment by 1 start with 1;
 drop sequence receive_seq
delete from route;


insert into route values(route_seq.nextval,'hyo','��ȿ��','�п�',sysdate);
insert into route values(route_seq.nextval,'hyo','��ȿ��','�п�','35.112171','126.873735',sysdate);

drop sequence num_board;

select * from receive_info;
select * from route;


insert into app1 values(111,'��ȣ��')
insert into receive_info values(receive_seq.nextval,0001,'�б�',35.112171,126.873735);
insert into receive_info values(receive_seq.nextval,0002,'��ȣ��',35.111548,126.876066);
insert into receive_info values(receive_seq.nextval,0003,'�ǾƳ��п�',35.112445,126.875642);
insert into receive_info values(receive_seq.nextval,0004,'��',35.110974,126.877459);

insert into route values(route_seq.nextval,'ss','sss','��',sysdate);


select * from users;
select * from app1;

delete from NOTICE where notice_seq = 167;

delete from route where route_user ='hyo';



