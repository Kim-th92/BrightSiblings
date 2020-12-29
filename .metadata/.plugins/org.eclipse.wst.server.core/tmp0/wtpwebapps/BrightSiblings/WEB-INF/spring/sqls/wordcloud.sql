drop table wordcloud;

create table wordcloud(
	tagname varchar2(30) not null,
	img varchar2(3000) not null,
	title varchar2(3000) not null,
	link varchar2(3000) not null
	
)

https://cphoto.asiae.co.kr/listimglink/6/2018071615433963442_1531723419.jpg

update wordcloud set img ='https://cphoto.asiae.co.kr/listimglink/6/2018071615433963442_1531723419.jpg' where tagname = 'DIET' and img='https://rsvsstsv2fnl-a.akamaihd.net/assets/default-image.jpg'


