--MEMBER userid, userpw, username

DROP TABLE MEMBER;
-- sequence 만들어서 자동으로 증가하게 만들어 보기
CREATE SEQUENCE member_seq 
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       nocycle
       cache 20;

DROP TABLE "MEMBER" ;


CREATE TABLE member(
	NO        number(7),
	userid    varchar2(30) PRIMARY key,
	userpw    varchar2(100) NOT NULL,
	username  varchar2(30) NOT NULL,
	email     varchar2(100) NOT NULL unique,
	postcode  number(5) NOT NULL ,
	address   varchar2(200) NOT NULL,
	address_detail   varchar2(200),
	grade     varchar2(30) NOT NULL,
	birth     DATE,
	originalprofile   varchar2(200),
	renameprofile    varchar2(200)
);
INSERT INTO "MEMBER" values(member_seq.nextval,'jjang051','$2a$10$5x1x3QS/whMHmVnLgwaijuSPlNm9H/WpExvVyuMke8YiXmpYlWVAm','장성호','jjang051@hanmail.net',12345,'abcd','','member',sysdate);
INSERT INTO "MEMBER" values(member_seq.nextval,'jjang052','$2a$10$5x1x3QS/whMHmVnLgwaijuSPlNm9H/WpExvVyuMke8YiXmpYlWVAm','장성호','jjang052@hanmail.net',12345,'abcd','','member',sysdate);
INSERT INTO "MEMBER" values(member_seq.nextval,'jjang053','$2a$10$5x1x3QS/whMHmVnLgwaijuSPlNm9H/WpExvVyuMke8YiXmpYlWVAm','장성호','jjang053@hanmail.net',12345,'abcd','','member',sysdate);
COMMIT;
SELECT * FROM MEMBER ;
select count(*) AS count from member where userID = 'jjang051';
rollback;

UPDATE MEMBER SET userpw = '123456' 
	WHERE email = 'jjang051@hanmail.net';
DELETE FROM MEMBER;
COMMIT;

DROP TABLE board; 



CREATE SEQUENCE board_seq 
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999999
       nocycle
       cache 20;
DELETE FROM board WHERE NO = 10;     

INSERT INTO board values(board_seq.nextval,'제목01','글쓰기를 하고 있습니다.','jjang051','장성호','1234',1,sysdate);
INSERT INTO board values(board_seq.nextval,'제목02','글쓰기를 하고 있습니다.','jjang051','장성호','1234',1,sysdate);
INSERT INTO board values(board_seq.nextval,'제목03','글쓰기를 하고 있습니다.','jjang051','장성호','1234',1,sysdate);
COMMIT;
SELECT * FROM board;
select * from board order by regdate DESC;
DROP TABLE board;      
CREATE TABLE board(
   NO       number(10) PRIMARY key,
   subject  varchar2(50) NOT NULL,
   content  varchar2(4000) NOT NULL,
   userid   varchar2(30) NOT NULL,
   username varchar2(30) NOT NULL,
   password varchar2(100) NOT NULL,
   hit      number(10),
   regdate  date
);

-- subject,content,no (primary key), 
-- userid, username,regdate sysdate,password, hit
-- table 만들어 보세요, 만든 다음 board query 주세요...


DROP TABLE board;


SELECT * FROM board;



ALTER TABLE board MODIFY (subject VARCHAR2(1000));

CREATE TABLE board(
   NO        number(10) PRIMARY key,
   subject   varchar2(50) NOT NULL,
   content   varchar2(4000) NOT NULL,
   userid    varchar2(30) NOT NULL,
   username  varchar2(30) NOT NULL,
   password  varchar2(100) NOT NULL,
   regroup   number(5) NOT null,
   relevel   number(5) NOT null,
   restep    number(5) NOT NULL,   
   hit       number(10),
   regdate   DATE,
   available number(2)
);
COMMIT;

DELETE FROM board;

ALTER TABLE BOARD ADD available number(2); 

SELECT * FROM board;

DELETE FROM board WHERE NO=262;
COMMIT;
SELECT * FROM board;

UPDATE board SET available = 1;


select * from board where available = 1 order by regroup desc, relevel ASC;

SELECT * FROM board;

SELECT count(*) AS total FROM board;

SELECT * FROM board ORDER BY NO DESC;

SELECT * FROM 
(SELECT rownum AS num, b01.* FROM 
	(SELECT * FROM board ORDER BY NO DESC) b01) 
WHERE num >=121 AND num<=130;

SELECT * FROM 
(SELECT rownum AS num, b01.* from
	(SELECT * FROM board ORDER BY NO DESC) b01) 
WHERE num >= 1 AND num <= 10;

SELECT * FROM 
(SELECT rownum AS num, b01.* from
	(SELECT * FROM board ORDER BY NO DESC) b01) 
WHERE num BETWEEN 1 AND 10;



--pl sql  
--procedure language 절차적 언어
BEGIN
	FOR i IN 1..125
	LOOP
		INSERT INTO BOARD VALUES
		(
			board_seq.nextval,
			'제목'||i,
			'글쓰기를 하고 있습니다.'||i,
			'jjang051',
			'장성호'||i,
			'1234',
			 i,
			 1,
			 1,
			 1,
			 sysdate,
			 1
			 
		);
	END LOOP;
END;
SELECT count(*) AS total FROM board;
SELECT * FROM board;
DELETE FROM board WHERE reGROUP=3;
COMMIT;

SELECT * FROM board;

DELETE FROM board;

SELECT * FROM BOARD WHERE NO = 241;

SELECT * FROM ALL_SEQUENCES ;

select nvl(max(regroup),0) as max from board;

UPDATE board SET relevel = relevel + 1 
WHERE regroup = 3 AND relevel > 1;

ROLLBACK;

SELECT * FROM board ORDER BY regroup DESC, relevel asc;

-- 





