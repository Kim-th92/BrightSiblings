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


insert into chatroom values(chatroomseq.nextval,1,7,TO_DATE('2020-12-18 6:51:21', 'YYYY-MM-DD HH24:MI:SS'));

select*from chatroom;
select * from member;
-------------------------------------------------------------------------채팅방 내용 

select chatroom_no from chatroom where (user_one =1 and user_two=7) or(user_one =7 and user_two =1)


drop table chatmsg ;
drop sequence chatmsgseq;


create sequence chatmsgseq;
create table chatmsg(
	chatmessage_no number primary key,
	message varchar2(3000) not null,
	member_no number not null,
	sendingtime date not null,
	chatroom_no number not null,
	
	constraint member_no_chat_fk foreign key (member_no) references member (member_no),
	constraint chatroom_no_fk foreign key(chatroom_no) references chatroom(chatroom_no)
);


insert into chatmsg
values(chatmsgseq.nextval, '하하하제발되라 메세지 입니당',1,TO_DATE('2020-12-18 8:55:10', 'YYYY-MM-DD HH24:MI:SS'),4)

delete from chatmsg where chatroom_no=3

select * from chatroom where user_one = 1 or user_two=1



SELECT  Message
FROM(
    SELECT *
    FROM chatmsg where chatroom_no =3
    ORDER BY sendingtime desc)
WHERE ROWNUM = 1

select *from chatroom where user_one =1 or user_two =1

select * from chatmsg

select member_name,member_profile from member where member_no =(select user_one from chatroom where chatroom_no=1) or member_no = (select user_two from chatroom where chatroom_no=1);

select r.user_one,r.user_two,m.message, m.member_no ,m.sendingtime
from chatroom r  join chatmsg m 
on r.chatroom_no = m.chatroom_no
where m.chatroom_no =1

--채팅창에 보여지게될 내용 
select  m.member_name,m.member_profile,m.member_no ,msg.message,msg. member_no as sender 
from member m,chatroom c join chatmsg msg
on c.chatroom_no = msg.chatroom_no
where  msg.member_no = m.member_no and( m.member_no =(select user_one from chatroom where chatroom_no =1 )
or  m.member_no =(select user_two from chatroom where chatroom_no =1 ) )



select m.member_profile,m.member_name ,
(SELECT message FROM( SELECT *  FROM chatmsg where chatroom_no =3   ORDER BY sendingtime desc) WHERE ROWNUM = 1) as message,
(SELECT sendingtime FROM( SELECT *  FROM chatmsg where chatroom_no =3   ORDER BY sendingtime desc) WHERE ROWNUM = 1) as last_update
,c.chatroom_no
from member m  ,chatmsg msg, chatroom c
where m.member_no = msg.member_no and c.chatroom_no = msg.chatroom_no and m.member_no <>1 
and( m.member_no = (select user_two from chatroom where user_one =1 or user_two=1) 
or  m.member_no = (select user_one from chatroom where user_one =1 or user_two=1))

-- (1 , 8)
--챗룸 리스트 만들고
--채팅 시작 


select
		m.member_name,m.member_profile,m.member_no , msg.message , msg.member_no as sender, msg.sendingtime
		from member m,chatroom c join chatmsg msg
		on c.chatroom_no = msg.chatroom_no
		where msg.member_no = m.member_no and( m.member_no =(select user_one from
		chatroom where chatroom_no =4 )
		or m.member_no =(select user_two from chatroom where chatroom_no =4) )
		ORDER BY msg.sendingtime 





