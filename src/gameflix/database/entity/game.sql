CREATE TABLE G_GAME (
	g_name VARCHAR2(30) CONSTRAINT game_pk PRIMARY KEY,
	g_date DATE CONSTRAINT game_date_nn NOT NULL,
	g_cnt NUMBER CONSTRAINT game_cnt_nn NOT NULL,
	g_imgPath VARCHAR2(100) CONSTRAINT game_imgPath_nn NOT NULL,
	g_link VARCHAR2(100) CONSTRAINT game_link_nn NOT NULL
);

INSERT INTO G_GAME VALUES('카드게임',to_date('2020/12/01','YYYY/MM/DD'),29,'img/game/card.png','integrate_Game.jsp');
INSERT INTO G_GAME VALUES('랜덤게임',to_date('2021/02/11','YYYY/MM/DD'),10,'img/game/random.png','random_Game.jsp');
INSERT INTO G_GAME VALUES('1번게임',to_date('2020/05/07','YYYY/MM/DD'),70,'img/game/1game.png','no1_Game.jsp');
INSERT INTO G_GAME VALUES('2번게임',to_date('2019/12/20','YYYY/MM/DD'),22,'img/game/2game.png','no2_Game.jsp');
INSERT INTO G_GAME VALUES('3번게임',to_date('2021/01/07','YYYY/MM/DD'),102,'img/game/3game.png','no3_Game.jsp');
INSERT INTO G_GAME VALUES('4번게임',to_date('2020/08/22','YYYY/MM/DD'),42,'img/game/4game.png','no4_Game.jsp');

SELECT * FROM G_GAME ORDER BY g_date DESC;


-- 전체게임 조회(한 페이지에 3개씩 표시)
------------------------------------------------------------------------------
SELECT * FROM ( 
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY G_DATE DESC
		) s
)
WHERE num BETWEEN 1 AND 3;

-- 뷰 생성
CREATE VIEW GAME_VIEW
AS
SELECT * FROM ( 
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY G_DATE DESC
		) s
);

-- 뷰를 사용한 간단한 조회 가능
SELECT * FROM GAME_VIEW WHERE num BETWEEN 1 AND 3;

------------------------------------------------------------------------------


-- 인기게임 3개 가져오기
------------------------------------------------------------------------------
SELECT * FROM (
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY g_cnt DESC
	) s
)
WHERE NUM IN(1,2,3);

-- 뷰생성
CREATE VIEW HOTGAME
AS
SELECT * FROM (
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY g_cnt DESC
	) s
);
SELECT * FROM HOTGAME WHERE NUM IN(1,2,3);
------------------------------------------------------------------------------


-- 최신등록된 게임 3개 가져오기
------------------------------------------------------------------------------
SELECT * FROM ( 
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY G_DATE DESC
		) s
)
WHERE num IN(1,2,3);

-- 뷰 생성
CREATE VIEW NEWGAME
AS
SELECT * FROM ( 
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY G_DATE DESC
		) s
);

-- 뷰를 사용한 간단한 조회 가능
SELECT * FROM NEWGAME WHERE NUM IN(1,2,3);

------------------------------------------------------------------------------
-- 전체게임갯수
SELECT count(*) cnt FROM G_GAME;

DROP table G_GAME;

------------------------------------------------------------------------------

-- 게임 지우기
DELETE FROM G_BADGE WHERE g_name = '3번게임';
DELETE FROM G_PLAYLOG WHERE g_name = '3번게임';
DELETE FROM G_GAME WHERE g_name = '3번게임';
------------------------------------------------------------------------------

-- insert
INSERT INTO G_GAME VALUES('4번게임',SYSDATE,0,'','');
