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