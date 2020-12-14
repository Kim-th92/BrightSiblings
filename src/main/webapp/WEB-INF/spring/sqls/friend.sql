
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


insert into friends values(1,5, 1,5);
insert into friends values(1,10,1,10);
insert into friends values(1,6,1,6);
insert into friends values(1,4);
insert into friends values(1,5);
insert into friends values(1,6);
insert into friends values(1,7);



select m.member_name, m.member_no
from member m full outer join friends f
on m.member_no = f.member_no
where
m.member_no in(select friend_no from friends where member_no =1);


select * from friends;

select friend_no from friends where member_no =1;