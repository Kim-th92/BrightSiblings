-------------------------------------------------------------------------채팅방 목록이 될 테이블

drop table chatroom;
drop sequence chatroomseq;


create sequence chatroomseq;
create table chatroom(
	chatroom_no number primary key,
	user_one number not null,
	user_two number not null,
	created date not null,
	
	constraint user_one_fk foreign key (user_one)  references member (member_no),
	constraint user_two_fk foreign key (user_two)  references member (member_no)
);


insert into chatroom values(chatroomseq.nextval,1,8,TO_DATE('2020-12-17 4:51:21', 'YYYY-MM-DD HH24:MI:SS'));

select*from chatroom;
-------------------------------------------------------------------------채팅방 내용 



drop table chatmessage ;
drop sequence chatmessageseq;


create sequence chatmessageseq;
create table chatmessage(
	chatmessage_no number primary key,
	message varchar2(3000) not null,
	member_no number not null,
	sendingtime date not null,
	chatroom_no number not null,
	
	constraint member_no_chat_fk foreign key (member_no) references member (member_no),
	constraint chatroom_no_fk foreign key(chatroom_no) references chatroom(chatroom_no)
);


insert into chatmessage 
values(chatmessageseq.nextval, '테스트 메세지 입니당',1,TO_DATE('2020-12-17 4:55:10', 'YYYY-MM-DD HH24:MI:SS'),1)


select r.user_one,r.user_two,m.message, m.member_no ,m.sendingtime
from chatroom r  join chatmessage m 
on r.chatroom_no = m.chatroom_no
where m.chatroom_no =1

select  m.member_name,m.member_profile,m.member_no ,msg.message,msg.member_no
from member m,chatroom c join chatmessage msg
on c.chatroom_no = msg.chatroom_no
where m.member_no =(select user_one from chatroom where chatroom_no =1 ) or  m.member_no =(select user_two from chatroom where chatroom_no =1 ) ;

-- (1 , 8)
--챗룸 리스트 만들고
--채팅 시작 










