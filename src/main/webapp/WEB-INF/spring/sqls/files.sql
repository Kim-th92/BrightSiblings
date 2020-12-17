DROP TABLE FILES;
DROP SEQUENCE FILESSEQ;

CREATE SEQUENCE FILESSEQ;
CREATE TABLE FILES(
	FILES_NO NUMBER PRIMARY KEY,
	BOARD_NO NUMBER REFERENCES BOARD(BOARD_NO),
	FILES_URL VARCHAR2(200) NOT NULL,
	FILES_REGDATE DATE NOT NULL
);

SELECT * FROM FILES
ORDER BY FILES_NO DESC;