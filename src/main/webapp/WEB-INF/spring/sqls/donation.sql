drop sequence donationseq;
drop table donation;

create sequence donationseq;

create table donation(
	donation_no number not null,
	member_no number not null,
	donation number not null,
	donation_date date not null,
	
	constraint member_no_donation_fk foreign key (member_no) references member(member_no),
	constraint member_no_donation_pk primary key (donation_no)
);

select member_no, donation_no, donation, donation_date
from donation
order by member_no desc;

insert into donation
values(donationseq.nextval, '1', '1', sysdate);

select donation_no, member_name, donation, donation_date
from donation a, member b where a.member_no = b.member_no
order by donation_no desc;