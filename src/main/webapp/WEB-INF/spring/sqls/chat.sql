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
	constraint user_two_fk foreign key (user_two)  references member (member_no),
	CONSTRAINT member_unigue UNIQUE (user_one,user_two)
);

insert into chatroom values(chatroomseq.nextval,1,3,TO_DATE('2020-12-18 6:51:21', 'YYYY-MM-DD HH24:MI:SS'));
insert into chatroom values(chatroomseq.nextval,1,7,TO_DATE('2020-12-18 6:51:21', 'YYYY-MM-DD HH24:MI:SS'));
delete from chatroom where chatroom_no = 4;
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

select * from chatmsg
insert into chatmsg
values(chatmsgseq.nextval, '하하하제발되라 메세지 입니당',5,TO_DATE('2020-12-22 18:55:10', 'YYYY-MM-DD HH24:MI:SS'),1)

delete from chatmsg where chatroom_no=3

select * from chatroom where user_one = 1 or user_two=1


select nvl(count(*),0) from chatroom where chatroom_no=2
SELECT  Message ,sendingtime
FROM(
    SELECT *
    FROM chatmsg where chatroom_no =3
    ORDER BY sendingtime desc)
WHERE ROWNUM = 1

select *from chatroom where user_one =1 or user_two =1
 
select * from chatmsg where chatroom_no =3

select member_name,member_profile from member where member_no =(select user_one from chatroom where chatroom_no=1) or member_no = (select user_two from chatroom where chatroom_no=1);


select c.chatroom_no,c.user_one,c.user_two ,max(msg.sendingtime) as sendingtime
from chatroom c join chatmsg msg on c.chatroom_no = msg.chatroom_no
join member m on msg.member_no = m.member_no
having c.user_one  = 7 or c.user_two =7
group by c.chatroom_no,c.user_one,c.user_two





select r.user_one,r.user_two,m.message, m.member_no ,m.sendingtime
from chatroom r  join chatmsg m 
on r.chatroom_no = m.chatroom_no
where m.chatroom_no =1

select * from chatroom c join chatmsg msg on c.chatroom_no = msg.chatroom_no

--채팅창에 보여지게될 내용 
select  m.member_name,m.member_profile,m.member_no ,msg.message,msg.member_no as sender  ,msg.sendingtime,c.chatroom_no
from member m,chatroom c  join chatmsg msg
on c.chatroom_no = msg.chatroom_no
where  msg.member_no = m.member_no and msg.chatroom_no =3
and( m.member_no =(select user_one from chatroom where chatroom_no =3 ) or  m.member_no =(select user_two from chatroom where chatroom_no =3 ) )
order by sendingtime 






-- (1 , 8)
--챗룸 리스트 만들고
--채팅 시작 



