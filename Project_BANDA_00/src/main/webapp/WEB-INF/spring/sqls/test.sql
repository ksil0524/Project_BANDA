SELECT * FROM ACCOUNT A JOIN FOLLOW F ON  A.ID = F.FR_ID JOIN FEED F2 ON  F.FD_ID = F2.ID WHERE A.ID = 'ADMIN';
SELECT * FROM ACCOUNT A JOIN FOLLOW F ON  A.ID = F.FR_ID JOIN FEED F2 ON  F.FD_ID = F2.ID ORDER BY A.ID;

SELECT * FROM FEED;
SELECT * FROM FOLLOW;

SELECT  ROWNUM, F.* FROM (SELECT * FROM FEED WHERE ID IN('user06', 'bomi', 'kimjm') ORDER BY FEED_REGDATE DESC) F WHERE ROWNUM BETWEEN 1 AND 8;

UPDATE FEED SET FEED_REGDATE = SYSDATE WHERE FEED_NO = 19;

INSERT INTO FOLLOW VALUES('user01' , 'kimjm');
INSERT INTO FOLLOW VALUES('user02' , 'kimjm');

SELECT * FROM FOLLOW WHERE FR_ID = 'user01';

SELECT * FROM FOLLOW WHERE FR_ID = 'user02';

SELECT * FROM FEED WHERE FEED_NO = 3;
SELECT * FROM COMMENTS;
INSERT INTO COMMENTS VALUES(COM_SEQ.NEXTVAL, 'F', 'user01', '집에가고싶어요,,',SYSDATE, 7);

select * from Likes;
SELECT * FROM FOLLOW;
SELECT * FROM ACCOUNT;
SELECT * FROM PET;
SELECT * FROM FEED ORDER BY FEED_NO DESC;
SELECT * FROM COMMENTS WHERE ID = 'juihy1005@naver.com';
SELECT * FROM PET WHERE ID = 'juihy1005@naver.com';
SELECT * FROM BOARD;
SELECT * FROM CHAT;
SELECT * FROM FEED WHERE ID = 'juihy1005@naver.com';
DELETE FROM BOARD;


SELECT * FROM LIKES;
UPDATE ACCOUNT SET PASSWORD = '$2a$10$S7xx6ZFBO1R6sXptlpuEtO6iQNYg61KsD45N.52l.A3RLe7mBFyr6' WHERE ID = 'ADMIN';
UPDATE ACCOUNT SET PASSWORD = '$2a$10$KAsIlvnD9cJaj5BCIyf8YOMNDDPrtZxcwEg88xIYDJ1s1lS9ea63y';

SELECT * FROM ACCOUNT WHERE ID = 'user06';
SELECT * FROM CHAT;


INSERT INTO CHAT VALUES(CHAT_SEQ.NEXTVAL, 'juihy1005@naver.com', 'ADMIN', '일좀 똑바로해','N',SYSDATE);
INSERT INTO CHAT VALUES(CHAT_SEQ.NEXTVAL, 'ADMIN', 'juihy1005@naver.com',  '그래','N',SYSDATE);
INSERT INTO FOLLOW VALUES('ADMIN', 'juihy1005@naver.com');
INSERT INTO FOLLOW VALUES('juihy1005@naver.com', 'ADMIN');
INSERT INTO LIKES VALUES(7, 'juihy1005@naver.com');
INSERT INTO COMMENTS VALUES(COM_SEQ.NEXTVAL, 'F', 'juihy1005@naver.com', '졸려', SYSDATE, 7);

SELECT * FROM ACCOUNT WHERE ID = 'juihy1005@naver.com';
SELECT * FROM BOARD WHERE ID = 'juihy1005@naver.com';
SELECT * FROM PET WHERE ID = 'juihy1005@naver.com';
SELECT * FROM FEED WHERE ID = 'juihy1005@naver.com';

SELECT * FROM CHAT WHERE S_ID = 'juihy1005@naver.com' OR G_ID = 'juihy1005@naver.com';
SELECT * FROM FOLLOW WHERE FR_ID = 'juihy1005@naver.com' OR FD_ID = 'juihy1005@naver.com';
SELECT * FROM LIKES WHERE ID = 'juihy1005@naver.com';
SELECT * FROM COMMENTS WHERE ID = 'juihy1005@naver.com';





