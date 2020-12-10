drop table member;
drop sequence memberseq;


create sequence memberseq;

create table member(
	member_no number not null,
	member_id varchar2(100) not null,
	member_pw varchar2(100),
	member_name varchar2(40),
	member_email varchar2(100),
	member_phone varchar2(20),
	member_birthday varchar2(20),
	member_zipcode varchar2(20),
	member_firstaddr varchar2(200),
	member_secondaddr varchar2(200),
	member_profile varchar2(1000) default '',
	member_regdate DATE not null,
	member_role varchar2(8),
	member_payment number,
	member_delflag varchar2(2) DEFAULT 'N',

	constraint member_no_pk PRIMARY KEY (member_no) ,
	constraint role_check CHECK(member_role IN('member','admin')),
	constraint delflag_check CHECK(member_delflag IN('Y','N'))
	
	);


insert into member values(memberseq.nextval,'admin','admin1234','관리자','admin@naver.com','010-1234-5678'
,'19931207','15905','서울 강동구','237-76','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.i-boss.co.kr%2Fab-2110-9380&psig=AOvVaw05akYMbTfCj7CognpMpCpn&ust=1607628958985000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIiWhdzSwe0CFQAAAAAdAAAAABAD',sysdate,'admin','','N')

select member_profile from member;
delete from member where member_id ='tlwj321';