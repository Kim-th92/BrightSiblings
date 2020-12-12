
create table addmemberinfo(
	member_no number PRIMARY KEY,
	height number ,
	weight number,
	gender varchar2(2), 
	targetweight number,
	bmi number,
	targetkcal number,
	advisekcal number,
	
	constraint add_member_no_fk FOREIGN KEY (member_no) REFERENCES member(member_no),
	constraint gender CHECK(gender IN('W','M'))
	

)