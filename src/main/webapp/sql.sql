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

delete from users where users_id = 'admin';


commit;

insert into notice VALUES(notice_seq.nextval,'��ȯ�ٺ�','my','�ٺ��� �´�2',sysdate);

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


insert into route values(route_seq.nextval,'hyo','��ȿ��','�п�',sysdate);

drop sequence num_board;
drop sequence faq_seq;

select * from receive_info;
select * from route;

insert into app1 values(111,'��ȣ��')
insert into receive_info values(receive_seq.nextval,0001,'�б�');
insert into receive_info values(receive_seq.nextval,0002,'��ȣ��');
insert into receive_info values(receive_seq.nextval,0003,'�ǾƳ��п�');
insert into receive_info values(receive_seq.nextval,0004,'��');
insert into route values(route_seq.nextval,'ss','sss','��',sysdate);


select * from users;
select * from app1;

delete from NOTICE where notice_seq = 167;

delete from route where route_user ='hyo';

truncate table faq;

insert into faq values(faq_seq.nextval,'ȸ��Ż�� ���� �ʾƿ�!!!','admin','���̸� ���� �����ϰ� ȸ���� Ż�����ּ���^^',sysdate
);

insert into faq values(faq_seq.nextval,'����ȣ ������ ��� �ϳ���???','admin','�����ڿ��� �����ϼ���^^',sysdate
);
insert into faq values(faq_seq.nextval,'���̵� ��й�ȣ�� �ؾ���Ⱦ��!!!','admin','������ �������� ������ ���̵�� �б� �Ƚɾ˸��� ��缱�����̳� ����޽��� ������ �����Բ� ��й�ȣ �ʱ�ȭ �� ��û���ּ���.
',sysdate
);

insert into faq values(faq_seq.nextval,'��,�ϱ� ������ ������ �ʾƿ�','admin','�кθ�Բ��� �ڳ��� å���濡 �ܸ��Ⱑ ����Ǿ� �ִ��� Ȯ���� �ּ���.',sysdate
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
