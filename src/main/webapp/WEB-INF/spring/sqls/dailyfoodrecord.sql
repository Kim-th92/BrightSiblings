
DROP TABLE DAILYFOODRECORD;

CREATE TABLE DAILYFOODRECORD(
	MEMBER_NO NUMBER,
	CALENDAR_DATE DATE,
	FOOD_NO NUMBER,
	TAKE_SIZE NUMBER,
	INTAKE_KCAL NUMBER,
	CONSTRAINT DAILYFOODRECORD_MEMBER_NO_FK FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
	CONSTRAINT DAILYFOODRECORD_FOOD_NO_FK FOREIGN KEY (FOOD_NO) REFERENCES FOODDB(FOOD_NO)
)


select NVL(sum(intake_kcal) ,0)from DAILYFOODRECORD where member_no = 1 and TO_CHAR(CALENDAR_DATE,'YYYYMMDD') =20210101 ;

select f.food_name  as food_name, d.take_size as intake_size, d.intake_kcal as intake_kcal from fooddb f join dailyfoodrecord d using (food_no) 
where d.member_no = 1 and TO_CHAR(CALENDAR_DATE,'YYYYMMDD') =20210102 