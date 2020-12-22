
drop table foodDB;

create table fooddb(
	food_no number not null,     
	food_name varchar2(100) not null,
	serving_size number ,
	kcal number ,
	carbohydrate number,
	protein number ,
	fat number ,
	sugar number ,
	sodium number ,
	
	constraint food_no_pk PRIMARY KEY(food_no)
);

select *  from fooddb

insert  into fooddb (food_no,food_name,serving_size,kcal,carbohydrate,protein,fat,sugar,sodium)
select 1,'안녕',2,3,4,5,6,7,8 from dual union all
select 2,'안녕',2,3,4,5,6,7,8  from dual union all
select 3,'안녕',2,3,4,5,6,7,8 from dual;
