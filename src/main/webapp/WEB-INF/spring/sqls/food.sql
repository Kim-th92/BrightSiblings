
drop table foodDB;

create table foodDB(
	food_no number not null,     
	food_name varchar2(100) not null,
	serving_size number not null,
	kcal number not null,
	carbohydrate number not null,
	protein number not null,
	fat number not null,
	sugar number not null,
	sodium number not null,
	
	constraint food_no_pk PRIMARY KEY(food_no)
);