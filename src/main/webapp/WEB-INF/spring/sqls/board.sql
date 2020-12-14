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

CREATE TABLE BOARD(
	BOARD_NO NUMBER NOT NULL,
	MEMBER_NO NUMBER,
	BOARD_CONTENT VARCHAR2(500),
	BOARD_FILE VARCHAR2(500),
	BOARD_HASHTAG VARCHAR2(200),
	BOARD_LIKE VARCHAR2(20),
	BOARD_PRIVACY VARCHAR2(2) DEFAULT 'Y',
	BOARD_REGDATE DATE,
	BOARD_UPDATEDATE DATE,
	
	CONSTRAINT BOARD_NO_PK PRIMARY KEY(BOARD_NO),
	CONSTRAINT PRIVACY_CHECK CHECK(BOARD_PRIVACY IN('Y','N'))
)
SELECT * FROM BOARD
ORDER BY BOARD_NO DESC;