DROP TABLE BOARD;
DROP SEQUENCE BOARDSEQ;

CREATE SEQUENCE BOARDSEQ;

CREATE TABLE BOARD(
	BOARD_NO NUMBER NOT NULL,
	MEMBER_NO NUMBER,
	BOARD_CONTENT VARCHAR2(500),
	BOARD_HASHTAG VARCHAR2(200),
	BOARD_LIKE VARCHAR2(20),
	BOARD_PRIVACY VARCHAR2(2) DEFAULT 'Y',
	BOARD_REGDATE DATE,
	BOARD_UPDATEDATE DATE,
	
	CONSTRAINT BOARD_NO_PK PRIMARY KEY(BOARD_NO),
	CONSTRAINT PRIVACY_CHECK CHECK(BOARD_PRIVACY IN('Y','N'))
)
--4

SELECT * FROM BOARD
ORDER BY BOARD_NO DESC;


select m.member_no, m.member_name,m.member_profile , b.board_no, b.board_content,b.board_regdate,f.files_no ,f.FILES_URL 
	from member m join board  b on m.member_no = b.member_no right join files f on b.board_no = f.board_no
	where b.board_no = 1
	
	SELECT *
	FROM board b LEFT JOIN member m ON m.board_no = b.board_no LEFT JOIN files f ON b.board_no = f.board_no


!-- 입력된 board_no 작성자의 회원 정보
SELECT m.member_no, m.member_name, m.member_profile
FROM member m
WHERE m.member_no = (
				SELECT member_no
				FROM board
				WHERE board_no = 2
)


SELECT m.member_no, m.member_name, m.member_profile, b.board_no, b.board_content, b.board_regdate, f.files_no, f.files_url, f.board_no
FROM member m, board b, files f
WHERE m.member_no = (
				SELECT member_no
				FROM board
				WHERE board_no = 2
)
AND b.board_no = 2
AND f.board_no = 2



SELECT m.member_no, m.member_name,m.member_profile , b.board_no, b.board_content, b.board_regdate
FROM member m join board b on m.member_no = b.board_no
WHERE 


SELECT member_no
FROM board
where board_no = #{board_no}
!-- 해당 게시글을 쓴 회원의 회원 번호



select m.member_name,m.member_profile,m.member_no ,b.board_content,b.board_regdate,f.files_no ,f.FILES_URL 
from member m join board  b on m.member_no = b.member_no  join files f on b.board_no = f.board_no
where b.board_no =1

select *
from board
where member_no = 21
order by board_no desc;

select *
from files
where board_no = 13;