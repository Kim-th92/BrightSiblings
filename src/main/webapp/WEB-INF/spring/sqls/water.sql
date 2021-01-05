drop table water;
drop sequence waterseq;

create sequence waterseq;
create table water(
	water_no number primary key,
	watercount number,
	member_no number ,
	water_date date,
		constraint member_water_fk foreign key (member_no) references member(member_no)
);


insert into water 
values(waterseq.nextval, 1, 1,sysdate);

select * from water where TO_CHAR(water_date, 'YYYYMMDD')  = '20201231'