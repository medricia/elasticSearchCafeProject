create table ProjCafeMember(
	MEMBER_ID			VARCHAR2(50)	primary key,
	MEMBER_NICKNAME		VARCHAR2(20)	Not Null,	--UNIQUE로 DB에서 중복 체크? 아니면 JS에서 중복 체크? 둘 다?	
	MEMBER_PW			VARCHAR2(50)	Not Null,
	MEMBER_NAME			VARCHAR2(20)	Not Null,
	MEMBER_EMAIL		VARCHAR2(50),
	MEMBER_MOBILE		VARCHAR2(13), 	-- 010-1111-1111
	MEMBER_JOIN_DATE	DATE,
	MEMBER_BIRTH		DATE,
	MEMBER_GENDER		VARCHAR2(10)
);

SELECT table_name
FROM all_tables
WHERE table_name LIKE 'PROJ%';


select MEMBER_ID, GiftyCorn_ID, GiftyCorn_CLN, GiftyCorn_Image_Location, TO_CHAR(GiftyCorn_Start_Date, 'hh24:mi:ss'),TO_CHAR(GiftyCorn_Limit_Date, 'hh24:mi:ss'), GiftyCorn_Memo from projgifticorn where GIFTYCORN_ID = 2 order by GIFTYCORN_ID 

delete from ProjCafeMenu where cafe_ID = (select cafe_ID from ProjCafe where cafe_ID = 1)
select * from ProjCafeMenu

select * from ProjCafe;

alter table ProjCafeMember ADD (MEMBER_BIRTH DATE);
alter table ProjCafeMember Add (MEMBER_GENDER VARCHAR2(10));


delete from ProjCafeRImage where cafe_Review_Number = (select cafe_Review_Number from ProjCafeReviewBoard where cafe_ID = (select cafe_ID from ProjCafe where cafe_ID = 1));
delete from ProjCafeRImage where cafe_Review_Number = #{cafe_Review_Number}

delete from ProjCafeReviewBoard where cafe_ID = (select cafe_ID from ProjCafe where cafe_ID = 1)

delete from ProjCafeMenu where cafe_Menu_ID = (select cafe_ID from ProjCafe where cafe_ID = 1);


delete from cafe_Review_Number from ProjCafeReviewBoard where cafe_ID = (select Cafe_ID from ProjCafe where Cafe_ID = 1);

select * from ProjCafeMember;

insert into PROJCAFEMEMBER values('member','member','member','member','member@gmail.com','010-1111-1111',SYSDATE,TO_DATE('1999-12-31','YYYY-MM-DD'),'NONE');

drop table ProjCafe purge;
alter table ProjCafeMember drop constraint Nn;

insert into PROJCAFEMEMBER(MEMBER_ID,MEMBER_NICKNAME,MEMBER_PW,MEMBER_NAME,MEMBER_EMAIL,MEMBER_MOBILE,MEMBER_JOIN_DATE,MEMBER_BIRTH) values('admin','admin','admin','admin','admin@gmail.com','010-1111-1111',SYSDATE,TO_DATE('1999-12-31','YYYY-MM-DD'));

insert into PROJCAFEMEMBER values(1,2,3,4,5,6,SYSDATE);

delete from PROJCAFEMEMBER;


drop table ProjCafeMember purge;

CREATE TABLE PROJCAFE(
	CAFE_ID					NUMBER(10)		PRIMARY KEY,
	CAFE_NAME				VARCHAR2(50),
	CAFE_LOCATION			VARCHAR2(50),
	CAFE_OPERATETIME		VARCHAR2(50), 
	CAFE_PHONENUMBER		Varchar2(13),
	CAFE_SNS				VARCHAR2(2024),
	CAFE_INTRODUCTION 		VARCHAR2(1000),	
	CAFE_IMAGE				VARCHAR2(200),
	CAFE_LAT				VARCHAR2(100),
	CAFE_LONG				VARCHAR2(100)
);
"select * from "+
					"(select rownum rnum, board_num, board_name, board_pass, board_subject, board_content, "+
					"board_file, board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date "+
					"from (select * from board order by board_re_ref desc, board_re_seq asc)) WHERE rnum >= ? and rnum <= ?";
SELECT * FROM ((select rownum rnum, ANNO_ID, ANNO_TITLE, ANNO_DATE from (select * from PROJCAFE))) WHERE rnum >= #{STARTPAGE} and rnum <= #{ENDPAGE} ORDER BY CAFE_ID desc
SELECT * FROM ((select rownum rnum, cafe_ID, cafe_Name, cafe_Location, cafe_Image from (select * from ProjCafe))) WHERE rnum >= 1 and rnum <= 10 ORDER BY cafe_ID
SELECT * FROM ((select rownum rnum, cafe_ID, cafe_Name, cafe_Location, cafe_Image from (select * from ProjCafe))) WHERE rnum >= 1 and rnum <= 10 ORDER BY cafe_ID
​		
SELECT * FROM ((select rownum rnum, ANNO_ID, ANNO_TITLE, ANNO_DATE from (select * from ProjCafeAnno))) WHERE rnum >= 1 and rnum <= 2 ORDER BY ANNO_ID desc

SELECT * FROM ((select rownum rnum, cafe_ID, cafe_Name, cafe_Location, cafe_Image from (select * from ProjCafe))) WHERE rnum >= #{STARTPAGE} and rnum <= #{ENDPAGE} ORDER BY cafe_ID desc

SELECT * FROM ((select rownum rnum, cafe_ID, cafe_Name, cafe_Location, cafe_Image from (select * from ProjCafe))) WHERE rnum >= 1 and rnum <= 2 ORDER BY cafe_ID desc
	
SELECT * FROM (select rownum rnum, cafe_ID, cafe_Name, cafe_Location, cafe_Image from (select * from ProjCafe)) WHERE rnum >= 1 and rnum <= 30 ORDER BY cafe_ID desc

SELECT * FROM ((select rownum rnum, cafe_id from (select * from projcafe))) WHERE rnum >= 1 and rnum <= 10;
		

### SQL: ​ SELECT * FROM ((select rownum rnum, cafe_ID, cafe_Name, cafe_Location, cafe_Image from (select * from ProjCafe))) WHERE rnum >= 1 and rnum <= 2 ORDER BY cafe_ID desc

insert into ProjCafe values((select nvl(max(Cafe_ID), 0)+1 from ProjCafe), '첫번째 카페','서울시 중구','10:00 ~ 22:00','010-1111-1111','Instagram','카페 소개 정보', 10, 'SaveImageLocation')

ALTER TABLE PROJCAFE MODIFY CAFE_LOCATION VARCHAR2(200);
ALTER TABLE PROJCAFE ADD CAFE_LAT VARCHAR2(100);
ALTER TABLE PROJCAFE ADD CAFE_LONG VARCHAR2(100);

select cafe_ID from ProjCafe, ProjCafeMenu where ProjCafe.cafe_ID=ProjCafeMenu.cafe_ID

alter table projcafe add CAFE_IMAGE Varchar2(200);
alter table PROJCAFE modify(CAFE_PHONENUMBER Varchar2(13));

alter table projcafe drop column cafe_date;
delete from PROJCAFE;

alter table projcafe ADD 
(GiftyCorn_CLN Number(10),
FOREIGN KEY (GiftyCorn_CLN) REFERENCES ProjGiftycornCafeList(GiftyCorn_CLN));

select * from ProjCafe;
select * from ProjGiftycornCafeList;

insert into ProjCafe(cafe_ID, cafe_Name, cafe_Location, cafe_OperateTime, cafe_PhoneNumber, cafe_SNS, cafe_Introduction,cafe_Image) 
		values((select nvl(max(seq), 0)+1 from ProjCafe),#{cafe_Name},#{cafe_Location},#{cafe_OperateTime},#{cafe_PhoneNumber},#{cafe_SNS},#{cafe_Introduction},#{cafe_Image})
	
update projCafe set cafe_Name = 1, CAFE_LOCATION = 1, CAFE_OPERATETIME = 1, CAFE_PHONENUMBER = (TO_NUMBER(REPLACE(010,1111,1111, ',', '')), CAFE_SNS = 'sns', CAFE_INTRODUCTION = 'in'  WHERE CAFE_ID = #{CAFE_ID}

		
		
insert into ProjCafe(cafeID,cafeName,cafeLocation,cafeOperateTime, cafePhoneNumber, cafeSNS, cafeIntroduction,cafedate)
values((select nvl(max(cafeID), 0)+1 from Cafe), '첫번째 카페','서울시 중구','10:00 ~ 22:00','010-1111-1111','Instagram','테이블 임시 테스트', to_char(sysdate,'yyyy.mm.dd'))

insert into ProjCafe(cafeID,cafeName,cafeLocation,cafeOperateTime, cafePhoneNumber, cafeSNS, cafeIntroduction,cafedate)
values((select nvl(max(cafeID), 0)+1 from Cafe), ?,?,?,?,?,?, to_char(sysdate,'yyyy.mm.dd'))


drop table ProjCafe purge;

create table ProjCafeMenu(
	cafe_Menu_ID		number(10)		primary key,
	cafe_ID				number(10),
	cafe_Menu			varchar2(50),
	cafe_Menu_Price		varchar2(50), 
	
	FOREIGN KEY (cafe_ID) REFERENCES ProjCafe(cafe_ID)
);

select * from ProjCafeMenu;

insert into ProjCAFEMenu(cafeMenuID, cafeID, cafeMenu, cafeMenuPrice) values ((select nvl(max(cafeMenuID), 0)+1 from CafeMenu), (select cafeID from Cafe where cafeName = '첫번째 카페'), '아메리카노', '10000원')
update ProjCAFEMenu set cafeMenu = '네번째 게시글 입니다', cafeMenuPrice = '' where cafeMenuID = '';
DELETE FROM ProjCAFEMenu WHERE cafeMenuID = ?;

drop table ProjCafeMenu purge;


create table ProjGiftycornCafeList(
	GiftyCorn_CLN		number(10)	primary key, --Giftycorn_Cafe_List_Number
	GiftyCorn_Cafe_Name				varchar2(50)
)

insert into ProjGiftycornCafeList values (10, '스타벅스');
insert into ProjGiftycornCafeList values ((select nvl(max(GiftyCorn_CLN), 0)+10 from ProjGiftycornCafeList), '이디야');
insert into ProjGiftycornCafeList values (30, '카페​베네');
insert into ProjGiftycornCafeList values (40, '할리스');
insert into ProjGiftycornCafeList values (50, '빽다방');
insert into ProjGiftycornCafeList values (60, '더벤티');
insert into Projgiftycorncafelist values (70,'a');

select * from ProjgiftycornCafeList order by GiftyCorn_CLN;

update PROJGIFTYCORNCAFELIST set giftycorn_cafe_name = '수정' where giftycorn_cafe_list_number = 70

delete from PROJGIFTYCORNCAFELIST where giftycorn_cafe_list_number = 2;

drop table ProjGiftycornCafeList purge;

create table ProjGifticorn(
	MEMBER_ID					VARCHAR2(50),
	GiftyCorn_ID				number(10)		primary key,
	GiftyCorn_CLN				number(10),
	GiftyCorn_Image_Location	varchar2(200),
	GiftyCorn_Start_Date		date,	-- yyyy-MM-dd 형식
	GiftyCorn_Limit_Date		date,
	GiftyCorn_Memo				varchar2(100),
		
	FOREIGN KEY (MEMBER_ID)	REFERENCES ProjCafeMember(MEMBER_ID),
	FOREIGN KEY (GiftyCorn_CLN) REFERENCES ProjGiftycornCafeList(GiftyCorn_CLN)

)

update projgifticorn set GiftyCorn_Memo = '1', GiftyCorn_Limit_Date = TO_DATE('11,11','MM,DD') where GiftyCorn_ID = 1;


update projgifticorn set GiftyCorn_Memo = #{GIFTYCORN_MEMO}, GiftyCorn_Limit_Date = #{GiftyCorn_Limit_Date} where GiftyCorn_ID = #{GiftyCorn_ID}


select * from ProjGifticorn

insert into projgifticorn values('admin',(select nvl(max(GiftyCorn_ID), 0)+1 from projgifticorn),10,'기프티콘 이미지 저장 경로',TO_DATE('12,10','hh24,mi'),TO_DATE('12,10','hh24,mi'),'기프티콘 메모')
--admin은 member 테이블의 member_ID fk 입니다.


ALTER TABLE ProjGifticorn MODIFY(GiftyCorn_Start_Date Date);
ALTER TABLE ProjGifticorn MODIFY(GiftyCorn_Limit_Date Date);

select MEMBER_ID, GiftyCorn_ID, GiftyCorn_CLN, GiftyCorn_Image_Location, 
		TO_CHAR(GiftyCorn_Start_Date, 'hh24:mi:ss'),TO_CHAR(GiftyCorn_Limit_Date, 'hh24:mi:ss'),GiftyCorn_Memo 
		from projgifticorn 
		order by GIFTYCORN_ID
insert into projgifticorn values('admin', 2,10,3,TO_DATE('10-59-31','hh24:mi:ss'),TO_DATE('01-12-59','hh24:mi:ss'),6)

update projgifticorn set GiftyCorn_Memo = '수정' where MEMBER_ID = 'admin';

delete from projgifticorn where GiftyCorn_ID = 2;

insert into projgifticorn 
values(
#{MEMBER_ID},
(select nvl(max(seq), 0)+1 from projgifticorn),
#{GIFTYCORN_CLN},
#{GIFTYCORN_IMAGE_LOCATION},
TO_DATE(#{GIFTYCORN_START_DATE},'hh24,mi,ss'),
TO_DATE(#{GIFTYCORN_LIMIT_DATE},'hh24,mi,ss'),
#{GIFTYCORN_MEMO});


insert into projgifticorn 
values(
'admin',
(select nvl(max(GiftyCorn_ID), 0)+1 from projgifticorn),
10,
'위치',
TO_DATE('11,11,11','hh24,mi,ss'),
TO_DATE('11,11,11','hh24,mi,ss'),
'간단한 메모');



select MEMBER_ID, GiftyCorn_ID, GiftyCorn_CLN, GiftyCorn_Image_Location, TO_CHAR(GiftyCorn_Start_Date, 'hh24:mi:ss'),TO_CHAR(GiftyCorn_Limit_Date, 'hh24:mi:ss'),GiftyCorn_Memo from projgifticorn;

select * from projgifticorn;

drop table ProjGifticon purge;


CREATE TABLE PROJCAFEBOOKMARK(
	CAFE_ID				NUMBER(10),
	MEMBER_ID			VARCHAR2(50),
	CAFE_BOOKMARK_MEMO	VARCHAR2(100),
	CAFE_PAGE_PLUS_DATE	DATE,
	
	FOREIGN KEY (MEMBER_ID)	REFERENCES PROJCAFEMEMBER(MEMBER_ID),
	FOREIGN KEY (CAFE_ID) REFERENCES PROJCAFE(CAFE_ID)
)


select * from PROJCAFEBOOKMARK where MEMBER_ID = 'admin' order by CAFE_ID asc ;

select * from PROJCAFEBOOKMARK where CAFE_ID = 


drop table ProjCafeBookmark purge;

create table ProjCafeReviewBoard(
	cafe_Review_Number	NUmber(10)		primary key,
	cafe_ID				number(10),
	MEMBER_ID			VARCHAR2(50),
	cafe_Review_Title	VARCHAR2(50),
	cafe_Review_Content	VARCHAR2(500),
	
	FOREIGN KEY (MEMBER_ID)	REFERENCES ProjCafeMember(MEMBER_ID),
	FOREIGN KEY (cafe_ID) REFERENCES ProjCafe(cafe_ID)
)

insert into ProjCafeReviewBoard
		values(1, 798,'admin','리뷰 제목','리뷰 내용',null)

select * from ProjCafeReviewBoard;
select * from ProjCafeRImage where cafe_Review_Number = (select cafe_Review_Number from ProjCafeReviewBoard where MEMBER_ID = (select MEMBER_ID from ProjCafeMember where MEMBER_ID = 'test'));

alter table ProjCafeReviewBoard drop column cafe_Image_Location;

drop table ProjCafeReviewBoard purge;

create table ProjCafeRImage(
	cafe_Review_Number	NUmber(10),
	REVIEW_IMAGE		VARCHAR2(200),
	
FOREIGN KEY (cafe_Review_Number) REFERENCES ProjCafeReviewBoard(cafe_Review_Number)
)

drop table ProjCafeRImage purge;

insert into ProjCafeReviewBoard(cafe_Review_Number, cafe_ID, MEMBER_ID, cafe_Review_Title,cafe_Review_Content) 
		values((select nvl(max(cafe_Review_Number), 0)+1 from ProjCafeReviewBoard), 1,	'admin','title','review')

select * from ProjCafeRImage;

insert into ProjCafeRImage values((select Max(cafe_Review_Number) from ProjCafeReviewBoard), 'imageLocation')

select * from ProjCafeRImage;

SELECT * FROM ProjCafeReviewBoard A INNER JOIN ProjCafeRImage I ON A.cafe_Review_Number = I.cafe_Review_Number

delete FROM ProjCafeReviewBoard A INNER JOIN ProjCafeRImage I ON A.cafe_Review_Number = I.cafe_Review_Number where A.cafe_Review_Number = 1;

SELECT * FROM ProjCafeReviewBoard A INNER JOIN ProjCafeRImage I ON A.cafe_Review_Number = I.cafe_Review_Number where A.cafe_Review_Number=5;


delete from ProjCafeReviewBoard where cafe_Review_Number = #{cafe_Review_Number}

select * from ProjCafeRImage where #{cafe_Review_Number};


create table ProjCafeAnno(
	ANNO_ID				NUMBER(10)	PRIMARY KEY,
	ANNO_TITLE			VARCHAR2(50),
	ANNO_DATE			date
)
select * from ProjCafeAnno;
insert into ProjCafeAnno values(12,'title','context',null,Sysdate);

insert into projgifticorn(MEMBER_ID, GiftyCorn_ID, GIFTYCORN_CLN, GIFTYCORN_IMAGE_LOCATION, GIFTYCORN_START_DATE, GIFTYCORN_LIMIT_DATE, GIFTYCORN_MEMO) values(#{MEMBER_ID},(select nvl(max(GiftyCorn_ID), 0)+1 from projgifticorn),#{GIFTYCORN_CLN},#{GIFTYCORN_IMAGE_LOCATION},TO_DATE(#{GIFTYCORN_START_DATE},'YYYY,MM,DD'),TO_DATE(#{GIFTYCORN_LIMIT_DATE},'YYYY,MM,DD'),#{GIFTYCORN_MEMO})
		
insert into projgifticorn(MEMBER_ID, GiftyCorn_ID, GIFTYCORN_CLN, GIFTYCORN_IMAGE_LOCATION, GIFTYCORN_START_DATE, GIFTYCORN_LIMIT_DATE, GIFTYCORN_MEMO) values('admin',(select nvl(max(GiftyCorn_ID), 0)+1 from projgifticorn),10,'Image',TO_DATE('1111,11,11','YYYY,MM,DD'),TO_DATE('1111,11,11','YYYY,MM,DD'),'메모')
	
select * from projgifticorn
select * from projgiftycorncafelist;

create table ProjCafeAContext(
	anno_ID			Number(10),
	ANNO_CONTEXT	VARCHAR2(4000),
	
FOREIGN KEY (anno_ID)	REFERENCES ProjCafeAnno(anno_ID)
)
SELECT * FROM ((select rownum rnum, ANNO_ID, ANNO_TITLE, ANNO_DATE from (select * from ProjCafeAnno))) WHERE rnum >= 1 and rnum <= 10 ORDER BY ANNO_ID
		
drop table ProjCafeAImage purge;
drop table ProjCafeAContext purge;

insert into ProjCafeAContext values(1,'context1','context2','context3','context4','context5','context6')

create table ProjCafeAImage(
	ANNO_ID			NUMBER(10),
	ANNO_IMAGE		VARCHAR2(200),
	
FOREIGN KEY (anno_ID)	REFERENCES ProjCafeAnno(anno_ID)
)

select * from ProjCafeAImage;
SELECT * FROM ProjCafeAnno A INNER JOIN ProjCafeAContext C ON A.anno_ID = C.anno_ID INNER JOIN ProjCafeAImage I ON C.anno_ID = I.anno_ID

delete from ProjCafeAnno;
delete from ProjCafeAContext;
delete from ProjCafeAImage;

insert into ProjCafeAImage values(1,'anno_Image1','anno_Image2','anno_Image3','anno_Image4','anno_Image5')


select * from 

select * from ProjCafeAnno;
select * from ProjCafeAContext;

insert into ProjCafeAnno values('1','title','content',1,2,3,4,5,6,7,8,9,10,sysdate);
update ProjCafeAnno set anno_TITLE = '수정', anno_CONTENT = '수정' where anno_ID = 1;

delete from ProjCafeAnno where anno_ID = 1;

drop table ProjCafeAnno purge;

ALTER TABLE ProjCafeAnno add(anno_Date Date);


--공지사항 최대 10장까지

insert into ProjCafeMenu values((select nvl(max(cafe_Menu_ID), 0)+1 from ProjCafeMenu),1,'메뉴','10000')
select * from ProjCafeMenu;





--카페 리뷰 게시글 insert
insert into ProjCafeReviewBoard
		values((select nvl(max(cafe_Review_Number), 0)+1 from ProjCafeReviewBoard), 1,	'admin','리뷰 타이틀','리뷰 본문')

--카페 리뷰 이미지 insert
insert into ProjCafeRImage values((select Max(cafe_Review_Number) from ProjCafeReviewBoard), #{REVIEW_IMAGE})
