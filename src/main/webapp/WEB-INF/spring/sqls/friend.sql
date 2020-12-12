
drop table friends; 

create table friends(
	member_no number not null,
	friend_no number not null
);

insert into friends values(1,10);
insert into friends values(1,3);
insert into friends values(1,4);
insert into friends values(1,5);
insert into friends values(1,6);
insert into friends values(1,7);



select m.member_name, m.member_no
from member m left join friends f
on m.member_no = f.member_no
where
m.member_no in(select friend_no from friends where member_no =1);


select * from friends;

select friend_no from friends where member_no =1;