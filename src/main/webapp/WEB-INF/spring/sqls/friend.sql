
drop table friends; 

create table friends(
	member_no number not null,
	friend_no number not null,
	status number not null,
	action_member number not null,
	
	constraint status_check CHECK (status IN(0,1,2,3)),
	constraint friend_uq UNIQUE (member_no,friend_no)
	
);


--status 0,1,2,3 pending accepted decined blocked --
--action_member는 친추한 사람 --


insert into friends values(1,5, 0,5);
insert into friends values(1,10,0,10);
insert into friends values(1,7,1,7);

insert into friends values(8,1,0,1);

select m.member_name, m.member_no,m.member_profile
		from member m  join friends f
		on m.member_no = f.friend_no
		where
		m.member_no in (select friend_no from friends where member_no =1 or friend_no =1)  and status =1;

		select m.member_name, m.member_no,m.member_profile
		from member m  left join friends f
		on m.member_no = f.member_no
		where
		m.member_no in (select member_no  from friends where friend_no =1) and status =0;

		
select m.member_name,m.member_profile
from member m join friends f
on m.member_no = f.friend_no
where
m.member_no in(select friend_no from friends where member_no =1) and status =0;


update friends set status =1 where member_no =1 and friend_no = 5;
select * from friends;

select friend_no from friends where member_no =1;