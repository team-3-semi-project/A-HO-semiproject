DROP SEQUENCE SEQ_VIP_CODE;
DROP SEQUENCE SEQ_MANAGER_CODE;
DROP SEQUENCE SEQ_HOTEL_CODE;
DROP SEQUENCE SEQ_ROOM_CODE;
DROP SEQUENCE SEQ_RESERVE_CODE;
DROP SEQUENCE SEQ_USER_CODE;
DROP SEQUENCE SEQ_PET_CODE;
DROP SEQUENCE SEQ_REPORT_CODE;
DROP SEQUENCE SEQ_QUESTION_CODE;
DROP SEQUENCE SEQ_WISH_CODE;
DROP SEQUENCE SEQ_EVENT_CODE;
DROP SEQUENCE SEQ_NOTICE_CODE;
DROP SEQUENCE SEQ_OQ_CODE;

CREATE SEQUENCE SEQ_VIP_CODE;
CREATE SEQUENCE SEQ_MANAGER_CODE;
CREATE SEQUENCE SEQ_HOTEL_CODE;
CREATE SEQUENCE SEQ_ROOM_CODE;
CREATE SEQUENCE SEQ_RESERVE_CODE;
CREATE SEQUENCE SEQ_USER_CODE;
CREATE SEQUENCE SEQ_PET_CODE;
CREATE SEQUENCE SEQ_REPORT_CODE;
CREATE SEQUENCE SEQ_QUESTION_CODE;
CREATE SEQUENCE SEQ_WISH_CODE;
CREATE SEQUENCE SEQ_EVENT_CODE;
CREATE SEQUENCE SEQ_NOTICE_CODE;
CREATE SEQUENCE SEQ_OQ_CODE;

DROP TABLE AHOSTATISTICS;
DROP TABLE OFTEN_QUESTION;
DROP TABLE NOTICE_FILE;
DROP TABLE NOTICE;
DROP TABLE EVENT;
DROP TABLE QUESTION_PHOTO;
DROP TABLE QUESTION;
DROP TABLE WISH;
DROP TABLE AHOREPORT;
DROP TABLE PET;
DROP TABLE REVIEW_PHOTO;
DROP TABLE RESERVE;
DROP TABLE ROOM_PHOTO;
DROP TABLE ROOM;
DROP TABLE HOTEL_PHOTO;
DROP TABLE HOTEL;
DROP TABLE AHOUSER;
DROP TABLE AHOMANAGER;
DROP TABLE VIP;

/* ------------------------------- VIP ------------------------------- */
CREATE TABLE VIP (
   VIP_CODE   NUMBER NOT NULL,
   GRADE   VARCHAR2(100) NOT NULL,
   VIP_SALE   NUMBER NOT NULL,
   GRADE_STANDARD NUMBER NOT NULL,
   CONSTRAINT PK_VIP_CODE PRIMARY KEY(VIP_CODE)
);

COMMENT ON COLUMN VIP.VIP_CODE IS '등급코드';
COMMENT ON COLUMN VIP.GRADE IS '등급명';
COMMENT ON COLUMN VIP.VIP_SALE IS '할인율';
COMMENT ON COLUMN VIP.GRADE_STANDARD IS '등급기준';

INSERT
  INTO VIP
(
  VIP_CODE
, GRADE
, VIP_SALE
, GRADE_STANDARD
)
VALUES
(
  SEQ_VIP_CODE.NEXTVAL
, '브론즈'
, 0
, 0
);

INSERT
  INTO VIP
(
  VIP_CODE
, GRADE
, VIP_SALE
, GRADE_STANDARD
)
VALUES
(
  SEQ_VIP_CODE.NEXTVAL
, '실버'
, 3
, 500000
);

INSERT
  INTO VIP
(
  VIP_CODE
, GRADE
, VIP_SALE
, GRADE_STANDARD
)
VALUES
(
  SEQ_VIP_CODE.NEXTVAL
, '골드'
, 5
, 1500000
);

INSERT
  INTO VIP
(
  VIP_CODE
, GRADE
, VIP_SALE
, GRADE_STANDARD
)
VALUES
(
  SEQ_VIP_CODE.NEXTVAL
, '다이아'
, 10
, 3000000
);

/* ------------------------------- AHOMANAGER ------------------------------- */
CREATE TABLE AHOMANAGER (
   MANAGER_CODE   NUMBER NOT NULL,
   MANAGER_ID   VARCHAR2(100) NOT NULL,
   MANAGER_PW   VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_MANAGER_CODE PRIMARY KEY(MANAGER_CODE),
   CONSTRAINT UK_MANAGER_ID UNIQUE(MANAGER_ID)
);

COMMENT ON COLUMN AHOMANAGER.MANAGER_CODE IS '관리자 코드';
COMMENT ON COLUMN AHOMANAGER.MANAGER_ID IS '아이디';
COMMENT ON COLUMN AHOMANAGER.MANAGER_PW IS '비밀번호';

INSERT
  INTO AHOMANAGER
(
  MANAGER_CODE
, MANAGER_ID
, MANAGER_PW
)
VALUES
(
  SEQ_MANAGER_CODE.NEXTVAL
, 'admin'
, 'admin'
);

/* ------------------------------- AHOUSER ------------------------------- */
CREATE TABLE AHOUSER (
   USER_CODE   NUMBER NOT NULL,
   VIP_CODE   NUMBER DEFAULT 1 NOT NULL,
   USER_ID   VARCHAR2(100) NOT NULL,
   USER_PW   VARCHAR2(100) NOT NULL,
   USER_NAME   VARCHAR2(100) NOT NULL,
   USER_EMAIL   VARCHAR2(100) NOT NULL,
   USER_PHONE   VARCHAR2(50) NOT NULL,
   BIRTH   DATE NOT NULL,
   GENDER   VARCHAR2(100) NOT NULL,
   POINT   NUMBER   DEFAULT 0   NOT NULL,
   JOIN_DATE   DATE   DEFAULT SYSDATE   NOT NULL,
   OUT_DATE   DATE NULL,
   OUT_YN   VARCHAR2(10)   DEFAULT 'N'   NOT NULL,
   BLACKLIST_YN   VARCHAR2(10)   DEFAULT 'N'   NOT NULL,
   BLACKLIST_REASON   VARCHAR2(500) NULL,
   CONSTRAINT PK_USER_CODE PRIMARY KEY (USER_CODE),
   CONSTRAINT FK_VIP_CODE FOREIGN KEY (VIP_CODE) REFERENCES VIP(VIP_CODE),
   CONSTRAINT UK_USERID UNIQUE (USER_ID),
   CONSTRAINT UK_USER_EMAIL UNIQUE (USER_EMAIL),
   CONSTRAINT UK_USER_PHONE UNIQUE (USER_PHONE),
   CONSTRAINT CK_GENDER CHECK (GENDER IN ('남', '여')),
   CONSTRAINT CK_BLACKLIST_YN CHECK (BLACKLIST_YN IN ('Y', 'N'))
);

COMMENT ON COLUMN AHOUSER.USER_CODE IS '회원코드';
COMMENT ON COLUMN AHOUSER.VIP_CODE IS '등급코드';
COMMENT ON COLUMN AHOUSER.USER_ID IS '아이디';
COMMENT ON COLUMN AHOUSER.USER_PW IS '비밀번호';
COMMENT ON COLUMN AHOUSER.USER_NAME IS '이름';
COMMENT ON COLUMN AHOUSER.USER_EMAIL IS '이메일';
COMMENT ON COLUMN AHOUSER.USER_PHONE IS '핸드폰번호';
COMMENT ON COLUMN AHOUSER.BIRTH IS '생년월일';
COMMENT ON COLUMN AHOUSER.GENDER IS '성별';
COMMENT ON COLUMN AHOUSER.POINT IS '보유포인트';
COMMENT ON COLUMN AHOUSER.JOIN_DATE IS '가입일자';
COMMENT ON COLUMN AHOUSER.OUT_DATE IS '탈퇴일자';
COMMENT ON COLUMN AHOUSER.OUT_YN IS '탈퇴여부';
COMMENT ON COLUMN AHOUSER.BLACKLIST_YN IS '블랙리스트 여부';
COMMENT ON COLUMN AHOUSER.BLACKLIST_REASON IS '블랙리스트 사유';

INSERT
  INTO AHOUSER
(
  USER_CODE
, VIP_CODE
, USER_ID
, USER_PW
, USER_NAME
, USER_EMAIL
, USER_PHONE
, BIRTH
, GENDER
, POINT
, JOIN_DATE
, OUT_DATE
, OUT_YN
, BLACKLIST_YN
, BLACKLIST_REASON
)
VALUES
(
  SEQ_USER_CODE.NEXTVAL
, 1
, 'user01'
, 'user01'
, '홍길동'
, 'user01@naver.com'
, '010-1234-5678'
, sysdate
, '남'
, 10000
, sysdate
, NULL
, 'N'
, 'N'
, null
);

INSERT
  INTO AHOUSER
(
  USER_CODE
, VIP_CODE
, USER_ID
, USER_PW
, USER_NAME
, USER_EMAIL
, USER_PHONE
, BIRTH
, GENDER
, POINT
, JOIN_DATE
, OUT_DATE
, OUT_YN
, BLACKLIST_YN
, BLACKLIST_REASON
)
VALUES
(
  SEQ_USER_CODE.NEXTVAL
, 1
, 'user02'
, 'user02'
, '유관순'
, 'user02@naver.com'
, '010-1234-5679'
, sysdate
, '여'
, 10000
, sysdate
, NULL
, 'N'
, 'N'
, null
);

INSERT
  INTO AHOUSER
(
  USER_CODE
, VIP_CODE
, USER_ID
, USER_PW
, USER_NAME
, USER_EMAIL
, USER_PHONE
, BIRTH
, GENDER
, POINT
, JOIN_DATE
, OUT_DATE
, OUT_YN
, BLACKLIST_YN
, BLACKLIST_REASON
)
VALUES
(
  SEQ_USER_CODE.NEXTVAL
, 1
, 'user03'
, 'user03'
, '이순신'
, 'user03@naver.com'
, '010-1234-5677'
, sysdate
, '남'
, 0
, sysdate
, NULL
, 'N'
, 'N'
, null
);

/* ------------------------------- HOTEL ------------------------------- */
CREATE TABLE HOTEL (
   HOTEL_CODE   NUMBER NOT NULL,
   HOTEL_NAME   VARCHAR2(100) NOT NULL,
   HOTEL_STAR   VARCHAR(20) NOT NULL,
   HOTEL_USER_AVG   NUMBER   DEFAULT 0   NOT NULL,
   HOTEL_PHONE   VARCHAR2(30) NOT NULL,
   HOTEL_ADDRESS   VARCHAR2(500) NOT NULL,
   HOTEL_OPEN   VARCHAR2(100)   DEFAULT 'Y'   NOT NULL,
   CHECK_IN   DATE NOT NULL,
   CHECK_OUT   DATE NOT NULL,
   CONSTRAINT PK_HOTEL_CODE PRIMARY KEY(HOTEL_CODE),
   CONSTRAINT CK_HOTEL_OPEN CHECK(HOTEL_OPEN IN('Y', 'N')),
   CONSTRAINT UK_HOTEL_NAME UNIQUE(HOTEL_NAME)
);
COMMENT ON COLUMN HOTEL.HOTEL_CODE IS '호텔코드';
COMMENT ON COLUMN HOTEL.HOTEL_NAME IS '호텔명';
COMMENT ON COLUMN HOTEL.HOTEL_STAR IS '등급';
COMMENT ON COLUMN HOTEL.HOTEL_USER_AVG IS '고객 평점';
COMMENT ON COLUMN HOTEL.HOTEL_PHONE IS '연락처';
COMMENT ON COLUMN HOTEL.HOTEL_ADDRESS IS '주소';
COMMENT ON COLUMN HOTEL.HOTEL_OPEN IS '운영여부';
COMMENT ON COLUMN HOTEL.CHECK_IN IS '체크인';
COMMENT ON COLUMN HOTEL.CHECK_OUT IS '체크아웃';

INSERT
  INTO HOTEL
(
  HOTEL_CODE
, HOTEL_NAME
, HOTEL_STAR
, HOTEL_USER_AVG
, HOTEL_PHONE
, HOTEL_ADDRESS
, HOTEL_OPEN
, CHECK_IN
, CHECK_OUT
)
VALUES
(
  SEQ_HOTEL_CODE.NEXTVAL
, 'A-HO호텔 서울지점'
, '5'
, 5
, '010-1123-4456'
, '서울시 강남구'
, 'Y'
, SYSDATE
, SYSDATE
);

INSERT
  INTO HOTEL
(
  HOTEL_CODE
, HOTEL_NAME
, HOTEL_STAR
, HOTEL_USER_AVG
, HOTEL_PHONE
, HOTEL_ADDRESS
, HOTEL_OPEN
, CHECK_IN
, CHECK_OUT
)
VALUES
(
  SEQ_HOTEL_CODE.NEXTVAL
, 'A-HO호텔 부산지점'
, '5'
, 5
, '010-4321-5677'
, '부산 해운대구'
, 'Y'
, SYSDATE
, SYSDATE
);

INSERT
  INTO HOTEL
(
  HOTEL_CODE
, HOTEL_NAME
, HOTEL_STAR
, HOTEL_USER_AVG
, HOTEL_PHONE
, HOTEL_ADDRESS
, HOTEL_OPEN
, CHECK_IN
, CHECK_OUT
)
VALUES
(
  SEQ_HOTEL_CODE.NEXTVAL
, 'A-HO호텔 인천지점'
, '5'
, 5
, '010-7862-4134'
, '인천시 남동구'
, 'Y'
, SYSDATE
, SYSDATE
);

INSERT 
  INTO HOTEL 
( 
  HOTEL_CODE
, HOTEL_NAME
, HOTEL_STAR
, HOTEL_USER_AVG
, HOTEL_PHONE
, HOTEL_ADDRESS
, HOTEL_OPEN
, CHECK_IN
, CHECK_OUT
)

VALUES
(
  SEQ_HOTEL_CODE.NEXTVAL
, 'A-HO호텔 제주지점'
, '5'
, 5
, '010-7862-4134'
, '제주시 서귀포구'
, 'Y'
, SYSDATE
, SYSDATE
);

INSERT 
  INTO HOTEL 
( 
  HOTEL_CODE
, HOTEL_NAME
, HOTEL_STAR
, HOTEL_USER_AVG
, HOTEL_PHONE
, HOTEL_ADDRESS
, HOTEL_OPEN
, CHECK_IN
, CHECK_OUT
)

VALUES
(
  SEQ_HOTEL_CODE.NEXTVAL
, 'A-HO호텔 강원지점'
, '5'
, 5
, '010-3632-4134'
, '강릉시'
, 'Y'
, SYSDATE
, SYSDATE
);

/* ------------------------------- HOTEL_PHOTO ------------------------------- */
CREATE TABLE HOTEL_PHOTO (
   H_PHOTO_CODE   NUMBER NOT NULL,
   HOTEL_CODE   NUMBER NOT NULL,
   H_ORIGINAL_FILE   VARCHAR2(100) NOT NULL,
   H_FILE_NAME   VARCHAR2(100) NOT NULL,
   H_FILE   VARCHAR2(100) NOT NULL,
   H_THUMBNAIL_YN   VARCHAR2(10) NOT NULL,
   CONSTRAINT PK_H_PHOTO_CODE PRIMARY KEY(H_PHOTO_CODE),
   CONSTRAINT FK_HOTEL_CODE FOREIGN KEY(HOTEL_CODE) REFERENCES HOTEL(HOTEL_CODE),
   CONSTRAINT CK_H_THUMBNAIL_YN CHECK (H_THUMBNAIL_YN IN('Y','N'))
);

COMMENT ON COLUMN HOTEL_PHOTO.H_PHOTO_CODE IS '사진코드';
COMMENT ON COLUMN HOTEL_PHOTO.HOTEL_CODE IS '호텔코드';
COMMENT ON COLUMN HOTEL_PHOTO.H_ORIGINAL_FILE IS '원본파일명';
COMMENT ON COLUMN HOTEL_PHOTO.H_FILE_NAME IS '파일명';
COMMENT ON COLUMN HOTEL_PHOTO.H_FILE IS '파일';
COMMENT ON COLUMN HOTEL_PHOTO.H_THUMBNAIL_YN IS '섬네일여부';

/* ------------------------------- ROOM ------------------------------- */
CREATE TABLE ROOM (
   ROOM_CODE   NUMBER NOT NULL,
   HOTEL_CODE   NUMBER NOT NULL,
   ROOM_NAME   VARCHAR2(100) NOT NULL,
   ROOM_PRICE   NUMBER NOT NULL,
   ROOM_COUNT   NUMBER NOT NULL,
   CONSTRAINT PK_ROOM_CODE PRIMARY KEY(ROOM_CODE),
   CONSTRAINT FK_ROOM_HOTEL_CODE FOREIGN KEY(HOTEL_CODE) REFERENCES HOTEL(HOTEL_CODE)
);

COMMENT ON COLUMN ROOM.ROOM_CODE IS '객실코드';
COMMENT ON COLUMN ROOM.HOTEL_CODE IS '호텔코드';
COMMENT ON COLUMN ROOM.ROOM_NAME IS '객실명';
COMMENT ON COLUMN ROOM.ROOM_PRICE IS '객실가격';
COMMENT ON COLUMN ROOM.ROOM_COUNT IS '방 갯수';

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 1
, 'Standard'
, 150000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 1
, 'Delux'
, 180000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 1
, 'Family'
, 230000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 1
, 'Sweet'
, 300000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 1
, 'VIP'
, 500000
, 3
);

/* 부산 */ 
INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 2
, 'Standard'
, 90000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 2
, 'Delux'
, 120000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 2
, 'Family'
, 170000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 2
, 'Sweet'
, 240000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 2
, 'VIP'
, 440000
, 3
);

/* 인천 */ 
INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 3
, 'Standard'
, 90000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 3
, 'Delux'
, 120000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 3
, 'Family'
, 170000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 3
, 'Sweet'
, 240000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 3
, 'VIP'
, 440000
, 3
);

/* 제주 */ 
INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 4
, 'Standard'
, 120000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 4
, 'Delux'
, 150000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 4
, 'Family'
, 200000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 4
, 'Sweet'
, 270000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 4
, 'VIP'
, 470000
, 3
);

/* 강원 */ 
INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 5
, 'Standard'
, 90000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 5
, 'Delux'
, 120000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 5
, 'Family'
, 170000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 5
, 'Sweet'
, 240000
, 10
);

INSERT
  INTO ROOM
(
  ROOM_CODE
, HOTEL_CODE
, ROOM_NAME
, ROOM_PRICE
, ROOM_COUNT
)
VALUES
(
  SEQ_ROOM_CODE.NEXTVAL
, 5
, 'VIP'
, 440000
, 3
);

/* ------------------------------- ROOM_PHOTO ------------------------------- */
CREATE TABLE ROOM_PHOTO (
   RO_PHOTO_CODE   NUMBER NOT NULL,
   ROOM_CODE   NUMBER NOT NULL,
   RO_ORIGINAL_FILE   VARCHAR2(100) NOT NULL,
   RO_FILE_NAME   VARCHAR2(100) NOT NULL,
   RO_FILE   VARCHAR2(100) NOT NULL,
   RO_THUMBNAIL_YN   VARCHAR2(10) NOT NULL,
   CONSTRAINT PK_RO_PHOTO_CODE PRIMARY KEY(RO_PHOTO_CODE),
   CONSTRAINT FK_ROOM_PHOTO_ROOM_CODE FOREIGN KEY(ROOM_CODE) REFERENCES ROOM(ROOM_CODE),
   CONSTRAINT CK_RO_THUMBNAIL_YN CHECK (RO_THUMBNAIL_YN IN ('Y','N'))
);
COMMENT ON COLUMN ROOM_PHOTO.RO_PHOTO_CODE IS '사진코드';
COMMENT ON COLUMN ROOM_PHOTO.ROOM_CODE IS '객실코드';
COMMENT ON COLUMN ROOM_PHOTO.RO_ORIGINAL_FILE IS '원본파일명';
COMMENT ON COLUMN ROOM_PHOTO.RO_FILE_NAME IS '파일명';
COMMENT ON COLUMN ROOM_PHOTO.RO_FILE IS '파일';
COMMENT ON COLUMN ROOM_PHOTO.RO_THUMBNAIL_YN IS '섬네일여부';

/* ------------------------------- RESERVE ------------------------------- */
CREATE TABLE RESERVE (
   RESERVE_CODE   NUMBER NOT NULL,
   USER_CODE   NUMBER NOT NULL,
   ROOM_CODE   NUMBER NOT NULL,
   PAYMENT_DATE   DATE   DEFAULT SYSDATE   NOT NULL,
   USE_POINT   NUMBER   DEFAULT 0   NOT NULL,
   PRICE   NUMBER NOT NULL,
   START_DATE   DATE NOT NULL,
   END_DATE   DATE NOT NULL,
   REVIEW   VARCHAR2(500) NULL,
   SCORE   NUMBER NULL,
   REVIEW_DATE   DATE NULL,
   ROOM_OPTION VARCHAR2(10) DEFAULT 'N' NOT NULL,
   CONSTRAINT CK_ROOM_OPTION CHECK (ROOM_OPTION IN ('Y','N')),
   CONSTRAINT PK_RESERVE_CODE PRIMARY KEY(RESERVE_CODE),
   CONSTRAINT FK_RESERVE_USER_CODE FOREIGN KEY(USER_CODE) REFERENCES AHOUSER(USER_CODE),
   CONSTRAINT FK_RESERVE_ROOM_CODE FOREIGN KEY(ROOM_CODE) REFERENCES ROOM(ROOM_CODE)
);

COMMENT ON COLUMN RESERVE.RESERVE_CODE IS '예약코드';
COMMENT ON COLUMN RESERVE.USER_CODE IS '회원코드';
COMMENT ON COLUMN RESERVE.ROOM_CODE IS '객실코드';
COMMENT ON COLUMN RESERVE.PAYMENT_DATE IS '결제일';
COMMENT ON COLUMN RESERVE.USE_POINT IS '사용포인트';
COMMENT ON COLUMN RESERVE.PRICE IS '결제금액';
COMMENT ON COLUMN RESERVE.START_DATE IS '시작일';
COMMENT ON COLUMN RESERVE.END_DATE IS '종료일';
COMMENT ON COLUMN RESERVE.REVIEW IS '후기';
COMMENT ON COLUMN RESERVE.SCORE IS '별점';
COMMENT ON COLUMN RESERVE.REVIEW_DATE IS '후기작성일';
COMMENT ON COLUMN RESERVE.ROOM_OPTION IS '침대 추가';

INSERT
  INTO RESERVE
(
  RESERVE_CODE
, USER_CODE
, ROOM_CODE
, PAYMENT_DATE
, USE_POINT
, PRICE
, START_DATE
, END_DATE
, REVIEW
, SCORE
, REVIEW_DATE
)
VALUES
(
  SEQ_RESERVE_CODE.NEXTVAL
, 1
, 1
, SYSDATE
, 0
, 150000
, SYSDATE
, SYSDATE
, NULL
, NULL
, NULL
);

INSERT
  INTO RESERVE
(
  RESERVE_CODE
, USER_CODE
, ROOM_CODE
, PAYMENT_DATE
, USE_POINT
, PRICE
, START_DATE
, END_DATE
, REVIEW
, SCORE
, REVIEW_DATE
)
VALUES
(
  SEQ_RESERVE_CODE.NEXTVAL
, 2
, 1
, SYSDATE
, 0
, 150000
, SYSDATE
, SYSDATE
, NULL
, NULL
, NULL
);

INSERT
  INTO RESERVE
(
  RESERVE_CODE
, USER_CODE
, ROOM_CODE
, PAYMENT_DATE
, USE_POINT
, PRICE
, START_DATE
, END_DATE
, REVIEW
, SCORE
, REVIEW_DATE
)
VALUES
(
  SEQ_RESERVE_CODE.NEXTVAL
, 3
, 1
, SYSDATE
, 0
, 150000
, SYSDATE
, SYSDATE
, '너무 좋았어요'
, 5
, SYSDATE
);

/* ------------------------------- REVIEW_PHOTO ------------------------------- */
CREATE TABLE REVIEW_PHOTO (
   RE_PHOTO_CODE   NUMBER NOT NULL,
   RESERVE_CODE   NUMBER NOT NULL,
   RE_ORIGINAL_FILE   VARCHAR2(100) NOT NULL,
   RE_FILE_NAME   VARCHAR2(100) NOT NULL,
   RE_FILE   VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_RE_PHOTO_CODE PRIMARY KEY(RE_PHOTO_CODE),
   CONSTRAINT FK_RESERVE_CODE FOREIGN KEY(RESERVE_CODE) REFERENCES RESERVE(RESERVE_CODE)
);

COMMENT ON COLUMN REVIEW_PHOTO.RE_PHOTO_CODE IS '사진코드';
COMMENT ON COLUMN REVIEW_PHOTO.RESERVE_CODE IS '예약코드';
COMMENT ON COLUMN REVIEW_PHOTO.RE_ORIGINAL_FILE IS '원본파일명';
COMMENT ON COLUMN REVIEW_PHOTO.RE_FILE_NAME IS '파일명';
COMMENT ON COLUMN REVIEW_PHOTO.RE_FILE IS '파일';

/* ------------------------------- PET ------------------------------- */
CREATE TABLE PET (
   PET_CODE   NUMBER NOT NULL,
   RESERVE_CODE   NUMBER NOT NULL,
   PET_KINDS   VARCHAR2(100) NOT NULL,
   PET_SIZE   VARCHAR2(50) NOT NULL,
   PET_ISSUE   VARCHAR2(1500) NULL,
   CONSTRAINT PK_PET_RESERVE_CODE PRIMARY KEY(PET_CODE, RESERVE_CODE),
   CONSTRAINT FK_PET_RESERVE_CODE FOREIGN KEY(RESERVE_CODE) REFERENCES RESERVE(RESERVE_CODE)
);

COMMENT ON COLUMN PET.PET_CODE IS '반려동물 번호';
COMMENT ON COLUMN PET.RESERVE_CODE IS '예약코드';
COMMENT ON COLUMN PET.PET_KINDS IS '반려동물 종류';
COMMENT ON COLUMN PET.PET_SIZE IS '반려동물 크기(대/중/소)';
COMMENT ON COLUMN PET.PET_ISSUE IS '반려동물 특이사항(아픈곳 등)';

INSERT
  INTO PET
(
  PET_CODE
, RESERVE_CODE
, PET_KINDS
, PET_SIZE
, PET_ISSUE
)
VALUES
(
  SEQ_PET_CODE.NEXTVAL
, 1
, '강아지'
, '대'
, '간식을 많이 가려요'
);

INSERT
  INTO PET
(
  PET_CODE
, RESERVE_CODE
, PET_KINDS
, PET_SIZE
, PET_ISSUE
)
VALUES
(
  SEQ_PET_CODE.NEXTVAL
, 2
, '고양이'
, '소'
, '할퀴면 아파요'
);

INSERT
  INTO PET
(
  PET_CODE
, RESERVE_CODE
, PET_KINDS
, PET_SIZE
, PET_ISSUE
)
VALUES
(
  SEQ_PET_CODE.NEXTVAL
, 3
, '강아지'
, '소'
, '승질이 개같아요'
);

/* ------------------------------- AHOREPORT ------------------------------- */
CREATE TABLE AHOREPORT (
   REPORT_CODE   NUMBER NOT NULL,
   USER_CODE   NUMBER NOT NULL,
   RESERVE_CODE   NUMBER NOT NULL,
   RESERVE_REASON   VARCHAR2(500) NOT NULL,
   CONSTRAINT PK_REPORT_CODE PRIMARY KEY(REPORT_CODE),
   CONSTRAINT FK_AHOREPORT_USER_CODE FOREIGN KEY(USER_CODE) REFERENCES AHOUSER(USER_CODE),
   CONSTRAINT FK_AHOREPORT_RESERVE_CODE FOREIGN KEY(RESERVE_CODE) REFERENCES RESERVE(RESERVE_CODE)
);

COMMENT ON COLUMN AHOREPORT.REPORT_CODE IS '신고코드';
COMMENT ON COLUMN AHOREPORT.USER_CODE IS '신고한 회원코드';
COMMENT ON COLUMN AHOREPORT.RESERVE_CODE IS '예약코드';
COMMENT ON COLUMN AHOREPORT.RESERVE_REASON IS '신고사유';

INSERT
  INTO AHOREPORT
(
  REPORT_CODE
, USER_CODE
, RESERVE_CODE
, RESERVE_REASON
)
VALUES
(
  SEQ_REPORT_CODE.NEXTVAL
, 1
, 1
, '욕설글'
);

INSERT
  INTO AHOREPORT
(
  REPORT_CODE
, USER_CODE
, RESERVE_CODE
, RESERVE_REASON
)
VALUES
(
  SEQ_REPORT_CODE.NEXTVAL
, 2
, 2
, '광고글'
);
INSERT
  INTO AHOREPORT
(
  REPORT_CODE
, USER_CODE
, RESERVE_CODE
, RESERVE_REASON
)
VALUES
(
  SEQ_REPORT_CODE.NEXTVAL
, 3
, 3
, '도배'
);

/* ------------------------------- WISH ------------------------------- */
CREATE TABLE WISH (
   WISH_CODE   NUMBER NOT NULL,
   USER_CODE   NUMBER NOT NULL,
   ROOM_CODE   NUMBER NOT NULL,
   CONSTRAINT PK_WISH_CODE_USER_CODE PRIMARY KEY (WISH_CODE, USER_CODE),
   CONSTRAINT FK_WISH_USER_CODE FOREIGN KEY (USER_CODE) REFERENCES AHOUSER(USER_CODE),
   CONSTRAINT FK_WISH_ROOM_CODE FOREIGN KEY (ROOM_CODE) REFERENCES ROOM(ROOM_CODE)
);

COMMENT ON COLUMN WISH.WISH_CODE IS '찜코드';
COMMENT ON COLUMN WISH.USER_CODE IS '회원코드';
COMMENT ON COLUMN WISH.ROOM_CODE IS '객실코드';

INSERT 
  INTO WISH 
(
  WISH_CODE, USER_CODE, ROOM_CODE
)
VALUES 
(
  SEQ_WISH_CODE.NEXTVAL
  , 1
  , 4
);
INSERT 
  INTO WISH 
(
  WISH_CODE, USER_CODE, ROOM_CODE
)
VALUES 
(
  SEQ_WISH_CODE.NEXTVAL
  , 1
  , 7
);
INSERT 
  INTO WISH 
(
  WISH_CODE, USER_CODE, ROOM_CODE
)
VALUES 
(
  SEQ_WISH_CODE.NEXTVAL
  , 2
  , 12
);

/* ------------------------------- QUESTION ------------------------------- */
CREATE TABLE QUESTION (
   QUESTION_CODE   NUMBER NOT NULL,
   USER_CODE   NUMBER NOT NULL,
   QUESTION_TITLE   VARCHAR2(100) NOT NULL,
   QUESTION_CONTENT   VARCHAR2(1000) NOT NULL,
   QUESTION_ANSWER   VARCHAR2(1000),
   QUESTION_DATE  DATE DEFAULT SYSDATE NOT NULL,
   QUESTION_CATEGORY   VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_QUESTION_CODE PRIMARY KEY(QUESTION_CODE),
   CONSTRAINT FK_QUESTION_USER_CODE FOREIGN KEY(USER_CODE) REFERENCES AHOUSER(USER_CODE)
);

COMMENT ON COLUMN QUESTION.QUESTION_CATEGORY IS '카테고리';
COMMENT ON COLUMN QUESTION.QUESTION_DATE IS '작성일';
COMMENT ON COLUMN QUESTION.QUESTION_CODE IS '문의코드';
COMMENT ON COLUMN QUESTION.USER_CODE IS '회원코드';
COMMENT ON COLUMN QUESTION.QUESTION_TITLE IS '제목';
COMMENT ON COLUMN QUESTION.QUESTION_CONTENT IS '내용';
COMMENT ON COLUMN QUESTION.QUESTION_ANSWER IS '답변';

INSERT 
  INTO QUESTION 
(
  QUESTION_CODE, USER_CODE, QUESTION_TITLE, QUESTION_CATEGORY
, QUESTION_CONTENT, QUESTION_ANSWER, QUESTION_DATE
)
VALUES 
(
  SEQ_QUESTION_CODE.NEXTVAL
  , 1
  , '탈퇴하고 싶어요.'
  , '개인정보'
  , '탈퇴하고 싶은데 어디서 탈퇴해야 하나요?'
  , '[마이페이지 > 내정보수정 > 탈퇴하기] 로 탈퇴를 진행하시면 됩니다.'
  , SYSDATE
);

INSERT 
  INTO QUESTION 
(
  QUESTION_CODE, USER_CODE, QUESTION_TITLE, QUESTION_CATEGORY
, QUESTION_CONTENT, QUESTION_ANSWER, QUESTION_DATE
)
VALUES 
(
  SEQ_QUESTION_CODE.NEXTVAL
  , 2
  , '예약취소를 했는데 환불이 안돼요'
  , '환불'
  , '예약 취소를 완료했는데 금액 환불이 안돼요.'
  , '환불 관련 부분은 해당 카드사에 문의 부탁드립니다.'
  , SYSDATE
);
INSERT 
  INTO QUESTION 
(
  QUESTION_CODE, USER_CODE, QUESTION_TITLE, QUESTION_CATEGORY
, QUESTION_CONTENT, QUESTION_ANSWER, QUESTION_DATE
)
VALUES 
(
  SEQ_QUESTION_CODE.NEXTVAL
  , 3
  , '회원 등급 기준을 알고싶어요'
  , '기타'
  , '회원등급 기준이 어떻게 되나요?'
  , NULL
  , SYSDATE
);

/* ------------------------------- QUESTION_PHOTO ------------------------------- */
CREATE TABLE QUESTION_PHOTO (
   Q_PHOTO_CODE   NUMBER NOT NULL,
   QUESTION_CODE   NUMBER NOT NULL,
   Q_ORIGINAL_FILE   VARCHAR2(100) NOT NULL,
   Q_FILE_NAME   VARCHAR2(100) NOT NULL,
   Q_FILE   VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_Q_PHOTO_CODE PRIMARY KEY(Q_PHOTO_CODE),
   CONSTRAINT FK_QUESTION_CODE FOREIGN KEY(QUESTION_CODE) REFERENCES QUESTION(QUESTION_CODE)
);

COMMENT ON COLUMN QUESTION_PHOTO.Q_PHOTO_CODE IS '사진코드';
COMMENT ON COLUMN QUESTION_PHOTO.QUESTION_CODE IS '문의코드';
COMMENT ON COLUMN QUESTION_PHOTO.Q_ORIGINAL_FILE IS '원본파일명';
COMMENT ON COLUMN QUESTION_PHOTO.Q_FILE_NAME IS '파일명';
COMMENT ON COLUMN QUESTION_PHOTO.Q_FILE IS '파일';

/* ------------------------------- EVENT ------------------------------- */
CREATE TABLE EVENT (
   EVENT_CODE   NUMBER NOT NULL,
   ROOM_CODE   NUMBER NOT NULL,
   EVENT_SALE   NUMBER NOT NULL,
   EVENT_START   DATE NOT NULL,
   EVENT_END   DATE NOT NULL,
   CONSTRAINT PK_EVENT_CODE PRIMARY KEY(EVENT_CODE),
   CONSTRAINT FK_EVENT_ROOM_CODE FOREIGN KEY (ROOM_CODE) REFERENCES ROOM(ROOM_CODE)
);

COMMENT ON COLUMN EVENT.EVENT_CODE IS '특가코드';
COMMENT ON COLUMN EVENT.ROOM_CODE IS '객실코드';
COMMENT ON COLUMN EVENT.EVENT_SALE IS '할인률';
COMMENT ON COLUMN EVENT.EVENT_START IS '시작일시간';
COMMENT ON COLUMN EVENT.EVENT_END IS '종료일시간';

INSERT
  INTO EVENT
(
  EVENT_CODE
, ROOM_CODE
, EVENT_SALE
, EVENT_START
, EVENT_END
)
VALUES
(
  SEQ_EVENT_CODE.NEXTVAL
, 1
, 30
, SYSDATE
, SYSDATE
);

INSERT
  INTO EVENT
(
  EVENT_CODE
, ROOM_CODE
, EVENT_SALE
, EVENT_START
, EVENT_END
)
VALUES
(
  SEQ_EVENT_CODE.NEXTVAL
, 7
, 20
, SYSDATE
, SYSDATE + 1
);

INSERT
  INTO EVENT
(
  EVENT_CODE
, ROOM_CODE
, EVENT_SALE
, EVENT_START
, EVENT_END
)
VALUES
(
  SEQ_EVENT_CODE.NEXTVAL
, 11
, 30
, SYSDATE
, SYSDATE + 1
);

/* ------------------------------- NOTICE ------------------------------- */
CREATE TABLE NOTICE (
   NOTICE_CODE   NUMBER NOT NULL,
   NOTICE_TITLE   VARCHAR2(100) NOT NULL,
   NOTICE_CONTENT   VARCHAR2(1500) NOT NULL,
   NOTICE_DATE  DATE DEFAULT SYSDATE NOT NULL,
   NOTICE_COUNT  NUMBER DEFAULT 0 NOT NULL,
   CONSTRAINT PK_NOTICE_CODE PRIMARY KEY(NOTICE_CODE)
);

COMMENT ON COLUMN NOTICE.NOTICE_CODE IS '공지코드';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '내용';
COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '작성일';
COMMENT ON COLUMN NOTICE.NOTICE_COUNT IS '조회수';

INSERT 
  INTO NOTICE 
( NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT )
VALUES 
( SEQ_NOTICE_CODE.NEXTVAL , 'test1제목' , 'test1내용' , SYSDATE , 0 );
INSERT 
  INTO NOTICE 
( NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT )
VALUES 
( SEQ_NOTICE_CODE.NEXTVAL , 'test2제목' , 'test2내용' , SYSDATE , 0 );
INSERT 
  INTO NOTICE 
( NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT )
VALUES 
( SEQ_NOTICE_CODE.NEXTVAL , 'test3제목' , 'test3내용' , SYSDATE , 0 );
INSERT 
  INTO NOTICE 
( NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT )
VALUES 
( SEQ_NOTICE_CODE.NEXTVAL , 'test4제목' , 'test4내용' , SYSDATE , 0 );
INSERT 
  INTO NOTICE 
( NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT )
VALUES 
( SEQ_NOTICE_CODE.NEXTVAL , 'test5제목' , 'test5내용' , SYSDATE , 0 );
INSERT 
  INTO NOTICE 
( NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT )
VALUES 
( SEQ_NOTICE_CODE.NEXTVAL , 'test6제목' , 'test6내용' , SYSDATE , 0 );
INSERT 
  INTO NOTICE 
( NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT )
VALUES 
( SEQ_NOTICE_CODE.NEXTVAL , 'test7제목' , 'test7내용' , SYSDATE , 0 );
INSERT 
  INTO NOTICE 
( NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT )
VALUES 
( SEQ_NOTICE_CODE.NEXTVAL , 'test8제목' , 'test8내용' , SYSDATE , 0 );
INSERT 
  INTO NOTICE 
( NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT )
VALUES 
( SEQ_NOTICE_CODE.NEXTVAL , 'test9제목' , 'test9내용' , SYSDATE , 0 );
INSERT 
  INTO NOTICE 
( NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT )
VALUES 
( SEQ_NOTICE_CODE.NEXTVAL , 'test10제목' , 'test10내용' , SYSDATE , 0 );
INSERT 
  INTO NOTICE 
(
  NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT
)
VALUES 
(
  SEQ_NOTICE_CODE.NEXTVAL
  , 'A-HO 서비스 정기점검 안내 (10/10일 A.M. 01:00 ~ 05:00)'
  , '안녕하세요. A-HO호텔 입니다.
더욱 안정적인 서비스 제공을 위해 사이트 정기점검을 10월 10일 오전 01:00부터 05:00(예정)까지 점기점검을 실시할 예정입니다.
서비스 이용에 불편을 드려 죄송합니다.
빠른 점검과 안정된 서비스로 찾아뵙겠습니다.

감사합니다.
'
 , SYSDATE
 , 0
);

INSERT 
  INTO NOTICE 
(
  NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT
)
VALUES 
(
  SEQ_NOTICE_CODE.NEXTVAL
  , '레스토랑 및 일부 부대시설 운영변경 안내'
  , '정부의 사회적 거리두기 지침 변경에 따라 일부 레스토랑 및 부대시설 운영이 변경 되었습니다.
고객의 안전을 위해 최선을 다하겠으며, 자세한 사항은 각 지점별 호텔 상세정보를 참조 부탁드리겠습니다.

감사합니다.
'
 , SYSDATE
 , 0
);

INSERT 
  INTO NOTICE 
(
  NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_COUNT
)
VALUES 
(
  SEQ_NOTICE_CODE.NEXTVAL
  , '조식 레스토랑 영업 안내'
  , '정부의 사회적 거리두기 지침에 따라 조식 뷔페 레스토랑이 아래와 같이 유동적으로 운영 됩니다.
코로나19 확산 방지를 위한 불가피한 조치로 양해 부탁드리며, 고객의 안전을 위해 최선을 다하겠습니다.
자세한 사항은 각 지점별 호텔 상세정보 페이지를 참조 부탁드리겠습니다.

감사합니다.

[사회적 거리두기에 따른 조식 뷔페 서비스 변경 ]

▶ 사회적 거리두기 1단계
조식 뷔페 운영

▶ 사회적 거리두기 2단계
조식 뷔페를 단품메뉴로 대체

▶ 사회적 거리두기 3단계
조식 뷔페를 단품메뉴로 대체

※ 상황에 따라 서비스 운영시간 및 기간은 사전 고지 없이 변동될 수 있습니다.
'
 , SYSDATE
 , 0
);

/* ------------------------------- NOTICE_FILE ------------------------------- */
CREATE TABLE NOTICE_FILE (
   N_FILE_CODE   NUMBER NOT NULL,
   NOTICE_CODE   NUMBER NOT NULL,
   N_ORIGINAL_FILE   VARCHAR2(100) NOT NULL,
   N_FILE_NAME   VARCHAR2(100) NOT NULL,
   N_FILE   VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_N_FILE_CODE PRIMARY KEY(N_FILE_CODE),
   CONSTRAINT FK_NOTICE_CODE FOREIGN KEY (NOTICE_CODE) REFERENCES NOTICE(NOTICE_CODE)
);

COMMENT ON COLUMN NOTICE_FILE.N_FILE_CODE IS '파일코드';
COMMENT ON COLUMN NOTICE_FILE.NOTICE_CODE IS '공지코드';
COMMENT ON COLUMN NOTICE_FILE.N_ORIGINAL_FILE IS '원본파일명';
COMMENT ON COLUMN NOTICE_FILE.N_FILE_NAME IS '파일명';
COMMENT ON COLUMN NOTICE_FILE.N_FILE IS '파일';

/* ------------------------------- OFTEN_QUESTION ------------------------------- */
CREATE TABLE OFTEN_QUESTION (
   OQ_CODE   NUMBER NOT NULL,
   OQ_TITLE   VARCHAR2(100) NOT NULL,
   OQ_CONTENT   VARCHAR2(1500) NOT NULL,
   CONSTRAINT PK_OQ_CODE PRIMARY KEY(OQ_CODE)
);

COMMENT ON COLUMN OFTEN_QUESTION.OQ_CODE IS '질문코드';
COMMENT ON COLUMN OFTEN_QUESTION.OQ_TITLE IS '제목';
COMMENT ON COLUMN OFTEN_QUESTION.OQ_CONTENT IS '내용';

INSERT
  INTO OFTEN_QUESTION
(
  OQ_CODE
, OQ_TITLE
, OQ_CONTENT
)
VALUES
(
  SEQ_OQ_CODE.NEXTVAL
, '예약이 안됩니다.'
, '예약은 호텔페이지에서 원하시는 객실을 선택 후 예약버튼을 누르시고 결제를 완료하시면 예약이 됩니다.'
);

INSERT
  INTO OFTEN_QUESTION
(
  OQ_CODE
, OQ_TITLE
, OQ_CONTENT
)
VALUES
(
  SEQ_OQ_CODE.NEXTVAL
, '로그인이 안됩니다.'
, '로그인의 경우 비밀번호가 틀렸을 경우가 높습니다. 비밀번호 찾기를 통해 비밀번호를 찾으시면 됩니다.'
);

INSERT
  INTO OFTEN_QUESTION
(
  OQ_CODE
, OQ_TITLE
, OQ_CONTENT
)
VALUES
(
  SEQ_OQ_CODE.NEXTVAL
, '예약 취소하고싶어요'
, '예약 취소의 경우 마이페이지를 들어가서 예약내역에 들어가시면 취소버튼이 있습니다.'
);

/* ------------------------------- AHOSTATISTICS ------------------------------- */
CREATE TABLE AHOSTATISTICS (
   Key   VARCHAR(255) NOT NULL,
   AVERAE_AGE   VARCHAR(255) NULL,
   VISIT_COUNT   VARCHAR(255) NULL,
   RESERVE_COUNT   VARCHAR(255) NULL,
   PEAK_YN   VARCHAR(255) NULL,
   RESERVE_RATE   VARCHAR(255) NULL,
   POPULAR_HOTEL   VARCHAR(255) NULL,
   REVENUE   VARCHAR(255) NULL
);

COMMENT ON COLUMN AHOSTATISTICS.AVERAE_AGE IS '평균연령';
COMMENT ON COLUMN AHOSTATISTICS.VISIT_COUNT IS '방문횟수';
COMMENT ON COLUMN AHOSTATISTICS.RESERVE_COUNT IS '예약수';
COMMENT ON COLUMN AHOSTATISTICS.PEAK_YN IS '성비';
COMMENT ON COLUMN AHOSTATISTICS.RESERVE_RATE IS '지역별 호텔예약률';
COMMENT ON COLUMN AHOSTATISTICS.POPULAR_HOTEL IS '최대예약호텔';
COMMENT ON COLUMN AHOSTATISTICS.REVENUE IS '매출액';

COMMIT;