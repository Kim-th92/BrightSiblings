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

select a.donation_no, b.member_no, b.member_name, a.donation, a.donation_date
from donation a, member b where a.member_no = b.member_no
order by donation_no DESC

select a.donation_no, b.member_no, a.donation, a.donation_date
from donation a join member b on (a.member_no = b.member_no)
where a.member_no = #{member_no}
order by donation_no DESC

select sum(a.donation)
from donation a join member b on (a.member_no = b.member_no) 
having a.member_no = 11
group by a.member_no

select sum(a.donation)
from donation a join member b on (a.member_no = b.member_no) 

