drop table conversation;
--메신저 리스트 

drop table conversation;
drop sequence conversationseq;

create table conversation(
	coversation_no number PRIMARY KEY,
	user_one number not null,
	user_two number not null,
	created date not null,
	updated date,
	
	constraint user_one_fk foreign key(user_one) references member(member_no),
	constraint user_two_fk foreign key(user_two) references member(member_no)
);


--메신저 내용

create table conversation_reply(
	cr_no number PRIMARY KEY,
	reply varchar2(3000),
	user_id number not null,

	status number,
	c_id_fk number

);

--메신저 정보 


create
