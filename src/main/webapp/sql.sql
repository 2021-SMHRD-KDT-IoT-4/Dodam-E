select * from USERS;
select * from users;
select * from FAQ;
select * from NOTICE;
select * from CHILD;
select * from SEND;



insert into CHILD values('ȿ����','10','��','�������ʵ��б�');

insert into users values('������', 'admin', '0000', '062');

insert into child values('my', '��ǳ��', 'female', '210506', '�����ʵ��б�');

insert into faq VALUES(faq_seq.nextval,'����','my','Ż�ְ�','������ ��ȸ��');

alter table child add(child_machine varchar2(30));


commit;

insert into notice VALUES(notice_seq.nextval,'��ȯ�ٺ�','ȿ����','�ٺ��� �´�2',sysdate);

select * from child;

delete from users where users_id = 'oracle';

commit;


create table route (

 route_seq number,
 route varchar2(50),
 checktime date
 );
 
 drop table route;

create table receive_info(
	receive_seq number,
	receive_num number(20),
	receive_loca varchar2(50)
);
 
 select * from ROUTE
 select * from receive_info
 create sequence receive_seq increment by 1 start with 1;
 create sequence route_seq increment by 1 start with 1;
 drop sequence receive_seq
delete from route;

insert into route values(num_message.nextval,'route',sysdate)

drop sequence num_board;

select * from receive_info;
select * from route;

insert into app1 values(111,'��ȣ��')