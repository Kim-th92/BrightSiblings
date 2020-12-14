DROP TABLE FILES;
DROP SEQUENCE FILESEQ;

CREATE SEQUENCE FILESEQ;
CREATE TABLE FILES(
	FILE_NO NUMBER PRIMARY KEY,
	BOARD_NO NUMBER REFERENCES BOARD(BOARD_NO),
	FILE_URL VARCHAR2(200) NOT NULL,
	FILE_REGDATE DATE NOT NULL
);