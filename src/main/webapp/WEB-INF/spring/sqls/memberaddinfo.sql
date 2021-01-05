
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

SELECT *
FROM addmemberinfo
WHERE MEMBER_NO = '14'

INSERT INTO ADDMEMBERINFO
VALUES(14,180,53,'M',60,20,2000,2000)

SELECT * FROM MEMBER

UPDATE ADDMEMBERINFO SET
GENDER = 'W',
TARGETWEIGHT = NULL,
BMI = null
WHERE MEMBER_NO = '14'

DELETE FROM ADDMEMBERINFO
WHERE MEMBER_NO = '14';