CREATE TABLE DAILYEXERCISERECORD(
	MEMBER_NO NUMBER PRIMARY KEY,
	CALENDAR_DATE DATE,
	EXERCISE_NO NUMBER,
	EXERCISE_NAME VARCHAR2(20),
	BURN_KCAL NUMBER,
	DISTANCE NUMBER,
	CONSTRAINT DAILYEXERCISERECORD_FK FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
)


select * from DAILYEXERCISERECORD
INSERT INTO DAILYEXERCISERECORD(MEMBER_NO, CALENDAR_DATE, BURN_KCAL, DISTANCE)
VALUES(11, SYSDATE, 60.65, 813)
		
select * from MEMBER

delete from DAILYEXERCISERECORD where member_no = 11