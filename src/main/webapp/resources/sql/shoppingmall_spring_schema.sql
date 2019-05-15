drop table t_shopping_member;
drop table t_shopping_goods;
drop table t_goods_detail_image;
drop table t_shopping_order;
drop table t_shopping_cart;


--------------------------------------------------------
--  DDL for Tablble GOODS (상품 테이블)
-- 변경사항 : GOODS_CREDATE -> GOODS_ENTER_DATE로 변경
--------------------------------------------------------

  CREATE TABLE "GOODS" 
   (GOODS_ID NUMBER(20,0) primary key, 
	GOODS_SORT VARCHAR2(50), 
	GOODS_TITLE VARCHAR2(100), 
	GOODS_WRITER VARCHAR2(50), 
	GOODS_PUBLISHER VARCHAR2(50), 
	GOODS_PRICE NUMBER(10,0), 
	GOODS_SALES_PRICE NUMBER(10,0), 
	GOODS_POINT NUMBER(10,0), 
	GOODS_PUBLISHED_DATE DATE, 
	GOODS_TOTAL_PAGE NUMBER(5,0), 
	GOODS_ISBN VARCHAR2(50), 
	GOODS_DELIVERY_PRICE NUMBER(10,0), 
	GOODS_DELIVERY_DATE DATE, 
	GOODS_STATUS VARCHAR2(50), 
	GOODS_INTRO VARCHAR2(2000), 
	GOODS_WRITER_INTRO VARCHAR2(2000), 
	GOODS_PUBLISHER_COMMENT VARCHAR2(2000), 
	GOODS_RECOMMENDATION VARCHAR2(2000), 
	GOODS_CONTENTS_ORDER CLOB, 
	GOODS_ENTER_DATE DATE DEFAULT sysdate
   ) ;
   COMMENT ON COLUMN GOODS.GOODS_ID is '상품번호';
   COMMENT ON COLUMN GOODS.GOODS_SORT is '상품종류';
   COMMENT ON COLUMN GOODS.GOODS_TITLE is '상품제목';
   COMMENT ON COLUMN GOODS.GOODS_WRITER is '저자이름';
   COMMENT ON COLUMN GOODS.GOODS_PUBLISHER is '출판사이름';
   COMMENT ON COLUMN GOODS.GOODS_PRICE is '상품정가';
   COMMENT ON COLUMN GOODS.GOODS_SALES_PRICE is '상품판매가격';
   COMMENT ON COLUMN GOODS.GOODS_POINT is '상품포인트';
   COMMENT ON COLUMN GOODS.GOODS_PUBLISHED_DATE is '상품출판일';
   COMMENT ON COLUMN GOODS.GOODS_TOTAL_PAGE is '상품총페이지수';
   COMMENT ON COLUMN GOODS.GOODS_ISBN is 'isbn번호';
   COMMENT ON COLUMN GOODS.GOODS_DELIVERY_PRICE is '배송비';
   COMMENT ON COLUMN GOODS.GOODS_DELIVERY_DATE is '상품배송일';
   COMMENT ON COLUMN GOODS.GOODS_STATUS is '상품분류';
   COMMENT ON COLUMN GOODS.GOODS_INTRO is '상품소개';
   COMMENT ON COLUMN GOODS.GOODS_WRITER_INTRO is '저자소개';
   COMMENT ON COLUMN GOODS.GOODS_PUBLISHER_COMMENT is '출판사평';
   COMMENT ON COLUMN GOODS.GOODS_RECOMMENDATION is '상품추천사';
   COMMENT ON COLUMN GOODS.GOODS_CONTENTS_ORDER is '상품목차';
   COMMENT ON COLUMN GOODS.GOODS_ENTER_DATE is '상품입고일';
--------------------------------------------------------
--  DDL for Table GOODS_IMAGE  (상품 이미지 테이블)
-- 변경 사항 : CREDATE -> REG_DATE
--------------------------------------------------------

  CREATE TABLE GOODS_IMAGE
   (IMAGE_ID NUMBER(20,0) primary key, 
	GOODS_ID NUMBER(20,0), 
	FILENAME VARCHAR2(50), 
	REG_ID VARCHAR2(20), 
	FILETYPE VARCHAR2(40), 
	REG_DATE DATE DEFAULT sysdate
   );
   COMMENT ON COLUMN GOODS_IMAGE.IMAGE_ID is '이미지번호';
   COMMENT ON COLUMN GOODS_IMAGE.GOODS_ID is '상품번호';
   COMMENT ON COLUMN GOODS_IMAGE.FILENAME is '이미지파일명';
   COMMENT ON COLUMN GOODS_IMAGE.REG_ID is '등록자아이디';
   COMMENT ON COLUMN GOODS_IMAGE.FILETYPE is '이미지파일종류';
   COMMENT ON COLUMN GOODS_IMAGE.REG_DATE is '등록일';
--------------------------------------------------------
--  DDL for Table MEMBER (멤버 테이블)
--  변경사항 : SMSSTS_YN -> SMS_YN, EAMILSTS_YN -> EMAIL_YN, ROADARRDESS -> ROAD_ADDRESS, JIBUNADDRESS -> JIBUN_ADDRESS
-- NAMISJIADDRESS -> DETAIL_ADDRESS, MEMBER_BIRTH_Y -> BIRTH_YEAR, MEMBER_BIRTH_M-> BIRTH_MONTH, MEMBER_BITH_D -> MEMBER_BIRTH_DAY
-- MEMBER_BIRTH_GN 제거
--------------------------------------------------------

  CREATE TABLE MEMBER
   (MEMBER_ID VARCHAR2(20) primary key, 
	MEMBER_PW VARCHAR2(30), 
	MEMBER_NAME VARCHAR2(50), 
	MEMBER_GENDER VARCHAR2(10), 
	TEL1 VARCHAR2(20), 
	TEL2 VARCHAR2(20), 
	TEL3 VARCHAR2(20), 
	HP1 VARCHAR2(20), 
	HP2 VARCHAR2(20), 
	HP3 VARCHAR2(20), 
	SMS_YN VARCHAR2(20), 
	EMAIL1 VARCHAR2(20), 
	EMAIL2 VARCHAR2(20), 
	EMAIL_YN VARCHAR2(20), 
	ZIPCODE VARCHAR2(20), 
	ROAD_ADDRESS VARCHAR2(500), 
	JIBUN_ADDRESS VARCHAR2(500), 
	DETAIL_ADDRESS VARCHAR2(500), 
	BIRTH_YEAR VARCHAR2(20), 
	BIRTH_MONTH VARCHAR2(20), 
	BIRTH_DAY VARCHAR2(20), 
	JOIN_DATE DATE DEFAULT sysdate, 
	DELETE_YN VARCHAR2(20) DEFAULT 'N'
   );
    COMMENT ON COLUMN "SCOTT"."MEMBER"."MEMBER_ID" IS '회원아이디';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."MEMBER_PW" IS '비밀번호';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."MEMBER_NAME" IS '회원이름';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."MEMBER_GENDER" IS '성별';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."TEL1" IS '유선전화번호1';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."TEL2" IS '유선전화번호2';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."TEL3" IS '유선전화버호3';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."HP1" IS '휴대폰번호1';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."HP2" IS '휴대폰번호2';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."HP3" IS '휴대폰번호3';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."SMS_YN" IS 'SMS메시지수신여부';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."EMAIL1" IS '이메일주소1';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."EMAIL2" IS '이메일주소2';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."EMAIL_YN" IS '이메일수신여부';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."ZIPCODE" IS '우편번호';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."ROAD_ADDRESS" IS '도로명주소';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."JIBUN_ADDRESS" IS '지번주소';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."DETAIL_ADDRESS" IS '나머지주소';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."BIRTH_YEAR" IS '생년월일년';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."BIRTH_MONTH" IS '생년월일월';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."BIRTH_DAY" IS '생년월일일';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."JOIN_DATE" IS '회원가입일자';
   COMMENT ON COLUMN "SCOTT"."MEMBER"."DELETE_YN" IS '회원탈퇴유무';
--------------------------------------------------------
--  DDL for Table ORDER
-- 변경 사항 : PAY_ORDERER_HP_NUM => PAY_ORDERER_HP
--------------------------------------------------------

  CREATE TABLE ORDERS
   (ORDER_SEQ_NUM NUMBER(20,0) primary key, 
	ORDER_ID NUMBER(20,0), 
	MEMBER_ID VARCHAR2(20), 
	GOODS_ID NUMBER(20,0), 
	ORDERER_NAME VARCHAR2(50), 
	GOODS_TITLE VARCHAR2(100), 
	ORDER_GOODS_QTY NUMBER(5,0), 
	GOODS_SALES_PRICE NUMBER(5,0), 
	GOODS_FILENAME VARCHAR2(60), 
	RECEIVER_NAME VARCHAR2(50), 
	RECEIVER_HP1 VARCHAR2(20), 
	RECEIVER_HP2 VARCHAR2(20), 
	RECEIVER_HP3 VARCHAR2(20), 
	RECEIVER_TEL1 VARCHAR2(20), 
	RECEIVER_TEL2 VARCHAR2(20), 
	RECEIVER_TEL3 VARCHAR2(20), 
	DELIVERY_ADDRESS VARCHAR2(500), 
	DELIVERY_METHOD VARCHAR2(40), 
	DELIVERY_MESSAGE VARCHAR2(300), 
	GIFT_WRAPPING VARCHAR2(20), 
	PAY_METHOD VARCHAR2(200), 
	CARD_COM_NAME VARCHAR2(50), 
	CARD_PAY_MONTH VARCHAR2(20), 
	PAY_ORDERER_HP VARCHAR2(20), 
	DELIVERY_STATE VARCHAR2(20) DEFAULT 'delivery_prepared', 
	PAY_ORDER_TIME DATE DEFAULT sysdate, 
	ORDERER_HP VARCHAR2(50)
   );
    COMMENT ON COLUMN "SCOTT"."ORDERS"."ORDER_SEQ_NUM" IS '주문상품일련번호';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."ORDER_ID" IS '주문번호';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."MEMBER_ID" IS '주문자아이디';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."GOODS_ID" IS '상품이름';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."ORDERER_NAME" IS '주문수량';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."GOODS_TITLE" IS '상품이름';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."ORDER_GOODS_QTY" IS '주문수량';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."GOODS_SALES_PRICE" IS '상품판매가격';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."GOODS_FILENAME" IS '상품이미지파일이름';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."RECEIVER_NAME" IS '수령자이름';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."RECEIVER_HP1" IS '수령자휴대폰번호1';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."RECEIVER_HP2" IS '수령자휴대폰번호2';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."RECEIVER_HP3" IS '수령자휴대폰번호3';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."RECEIVER_TEL1" IS '수령자유선번호1';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."RECEIVER_TEL2" IS '수령자유선번호2';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."RECEIVER_TEL3" IS '수령자유선번호3';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."DELIVERY_ADDRESS" IS '배송주소';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."DELIVERY_METHOD" IS '배송방법';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."DELIVERY_MESSAGE" IS '부재 시 전달 메시지';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."GIFT_WRAPPING" IS '상품포장여부';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."PAY_METHOD" IS '결제방법';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."CARD_COM_NAME" IS '결제카드회사이름';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."CARD_PAY_MONTH" IS '할부개월수';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."PAY_ORDERER_HP" IS '휴대폰결제번호';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."DELIVERY_STATE" IS '배송상태';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."PAY_ORDER_TIME" IS '결제시간';
   COMMENT ON COLUMN "SCOTT"."ORDERS"."ORDERER_HP" IS '주문자휴대폰번호';
--------------------------------------------------------
--  DDL for Table CART
-- 변경 사항 : del_yn -> delete_yn , credate -> reg_date
--------------------------------------------------------

  CREATE TABLE CART
   (CART_ID NUMBER(10,0) primary key, 
	GOODS_ID NUMBER(20,0), 
	MEMBER_ID VARCHAR2(20 BYTE), 
	DELETE_YN VARCHAR2(20 BYTE) DEFAULT 'N', 
	REG_DATE DATE DEFAULT sysdate, 
	CART_GOODS_QTY NUMBER(4,0) DEFAULT 1
   );
   
   COMMENT ON COLUMN "SCOTT"."CART"."CART_ID" IS '장바구니번호';
   COMMENT ON COLUMN "SCOTT"."CART"."GOODS_ID" IS '상품번호';
   COMMENT ON COLUMN "SCOTT"."CART"."MEMBER_ID" IS '회원아이디';
   COMMENT ON COLUMN "SCOTT"."CART"."DELETE_YN" IS '장바구니삭제여부';
   COMMENT ON COLUMN "SCOTT"."CART"."REG_DATE" IS '생성일자';
   COMMENT ON COLUMN "SCOTT"."CART"."CART_GOODS_QTY" IS '상품수량';

--------------------------------------------------
-- GOODS 테이블 데이터

Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (394,'컴퓨터와 인터넷','무작정 따라가기 홍콩 마카오','김수정, 김승남','인포북스',30000,27000,1000,to_date('15/10/16','RR/MM/DD'),1000,'121212',2000,to_date('18/10/18','RR/MM/DD'),'bestseller','이 책을 읽고 나면 프로그래머는 새로운 객체를 찾아서 만들게 될 것이고, 그것을 프로그래밍화 하는 것이 진정한 객체 지향 프로그래밍이라는 사실을 깨닫게 될 것이다.

객체 지향 프로그래밍이란 사람을 ‘주체(subject)’라 하고, 주체가 바라본 대상(사람, 사물, 객체)을 ‘객체(object)’라고 한다. 사람이 일상적으로 보고, 느끼고, 생각하는 관점에서 프로그래밍을 하는 방식이다.

자바를 처음 접하는 사람은 다소 생소한 개념이 나오지만 반복해서 학습을 하다 보면 어느새 프로그래밍에 입문할 수 있다는 사실을 깨닫게 될 것이다. 각 장의 끝에는 연습문제를 두어 독학하기에 적합하다. 또한 저자의 카페(http://cafe.naver.com/standardjava)에서는 이 책의 내용이 담긴 동영상 강좌를 무료로 제공한다.','저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.

- 전자공학과 졸업
- 벤처 기업에서 다양한 소프트웨어 개발 참여
- 대기업의 시스템 통합 작업에 관련된 소프트웨어 개발 참여
- IT프로그래밍 학원에서 강의

※저자카페 : http://cafe.naver.com/standardjava','이 책의 삼 단계 학습 방법

첫 번째 단계는 프로그래밍 기초 과정이다.
: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.

두 번째 단계는 자바의 객체 지향 개념에 대해 배운다.
: C언어는 컴퓨터의 수행 과정을 흉내 낸 절차적 언어이다. 이러한 절차적 언어를 하는데 있어 여러 가지 단점들이 나타났다. 대표적으로는 소스 코드의 재사용이다. 지금의 응용 프로그램은 초기에 비해 규모도 커지고 개발 기간도 많이 소모된다. 자바는 기존 기능의 재사용성, 설계의 용이성, 관리의 편리성 등의 이유로 많이 찾고 있다. 이 단계의 핵심은 재사용성 및 프로그래밍 설계와 관련된 객체 지향 개념에 대해 학습한다.

세 번째 단계는 API의 기능을 각 장별로 학습한다.
: 자바는 약 20년이 넘었기 때문에 이전에 자바로 프로그래밍을 하면서 다른 프로그램에서 많이 사용하는 기능을 미리 자바에서 클래스로 만들어서 제공한다. 이를 API(Application Program Interface)라고 하며, 이 단계의 과정은 사실 다른 언어에서도 지원한다. 그러나 자바는 앞에서 말한 바와 같이 객체 지향 언어이므로 이 모든 API 기능이 객체 지향 개념을 적용하여 제공되고 있다. 따라서 자바의 API를 잘 사용하려면 앞의 객체 지향 개념을 잘 숙지해야 한다.','이 책의 삼 단계 학습 방법

첫 번째 단계는 프로그래밍 기초 과정이다.
: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.

두 번째 단계는 자바의 객체 지향 개념에 대해 배운다.
: C언어는 컴퓨터의 수행 과정을 흉내 낸 절차적 언어이다. 이러한 절차적 언어를 하는데 있어 여러 가지 단점들이 나타났다. 대표적으로는 소스 코드의 재사용이다. 지금의 응용 프로그램은 초기에 비해 규모도 커지고 개발 기간도 많이 소모된다. 자바는 기존 기능의 재사용성, 설계의 용이성, 관리의 편리성 등의 이유로 많이 찾고 있다. 이 단계의 핵심은 재사용성 및 프로그래밍 설계와 관련된 객체 지향 개념에 대해 학습한다.

세 번째 단계는 API의 기능을 각 장별로 학습한다.
: 자바는 약 20년이 넘었기 때문에 이전에 자바로 프로그래밍을 하면서 다른 프로그램에서 많이 사용하는 기능을 미리 자바에서 클래스로 만들어서 제공한다. 이를 API(Application Program Interface)라고 하며, 이 단계의 과정은 사실 다른 언어에서도 지원한다. 그러나 자바는 앞에서 말한 바와 같이 객체 지향 언어이므로 이 모든 API 기능이 객체 지향 개념을 적용하여 제공되고 있다. 따라서 자바의 API를 잘 사용하려면 앞의 객체 지향 개념을 잘 숙지해야 한다.',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (395,'컴퓨터와 인터넷','모두의 파이썬','이승찬','길벗',12000,10800,1000,to_date('16/05/09','RR/MM/DD'),200,'9791186978894',2000,to_date('18/10/18','RR/MM/DD'),'bestseller','프로그래밍을 한 번도 해본 적이 없어도 괜찮다. 파이썬이 무엇인지 몰라도 상관 없다. 《모두의 파이썬》은 어려운 개념과 복잡한 이론 설명은 최대한 줄이고, 초보자가 프로그래밍을 쉽게 배울 수 있도록 짧고 간단한 예제로 내용을 구성했다. 처음부터 모든 것을 다 이해하지 못해도 괜찮다. 프로그램을 따라서 입력하고, 실행 결과를 확인하며, 책에서 알려주는 대로 에러를 수정해 보자. 어느새 파이썬 프로그램으로 멋진 그림을 그리고, 계산을 하고, 간단한 게임을 만들고, 수학 문제를 푸는 자신을 발견하게 될 것이다. 《모두의 파이썬》으로 남녀노소 누구나 즐겁게 프로그래밍을 시작해 보자!

누구나 20일이면 파이썬 프로그램을 만들 수 있다!

1~13일: 파이썬 언어 기초 배우기

초보자도 배우기 쉬운 언어인 파이썬의 기초 문법을 예제로 배운다. 입력 → 결과 확인 → 에러 해결 → 해설 → 응용, ‘5단계 트레이닝’으로 짧은 프로그램을 직접 입력하고 고쳐 보면서 자연스럽게 프로그램을 작성하는 방법을 익힌다.

14~18일: 간단한 게임 만들기

앞에서 학습한 파이썬 기능을 이용하여 5가지 게임 프로젝트를 실습한다. 계산 맞히기 게임, 타자 게임, 거북이 대포 게임, 터틀런 1, 2를 만들고 실제로 게임을 플레이해 본다.

19~20일: 파이썬으로 수학 문제 풀어 보기

중학교 수준의 간단한 수학 문제를 파이썬 프로그램으로 만들어서 풀어 본다. 수학과 프로그래밍의 연관 관계를 배울 수 있으며 파이썬이 어떻게 활용되는지 알 수 있다.

 만든 이 코멘트','서울대학교에서 컴퓨터공학을 전공하고 게임 개발자로 일하며 메이플스토리 등의 히트 게임을 만들었습니다. 15년간 일한 게임 업계를 떠나 University of Washington에서 경영학 석사 학위를 받았습니다. 현재 로봇 개발/생산 업체 메타로보틱스에서 최신 소프트웨어 기술을 농업 현장에 적용하기 위해 노력하고 있습니다.','프로그래밍을 한 번도 해본 적이 없어도 괜찮다. 파이썬이 무엇인지 몰라도 상관 없다. 《모두의 파이썬》은 어려운 개념과 복잡한 이론 설명은 최대한 줄이고, 초보자가 프로그래밍을 쉽게 배울 수 있도록 짧고 간단한 예제로 내용을 구성했다. 처음부터 모든 것을 다 이해하지 못해도 괜찮다. 프로그램을 따라서 입력하고, 실행 결과를 확인하며, 책에서 알려주는 대로 에러를 수정해 보자. 어느새 파이썬 프로그램으로 멋진 그림을 그리고, 계산을 하고, 간단한 게임을 만들고, 수학 문제를 푸는 자신을 발견하게 될 것이다. 《모두의 파이썬》으로 남녀노소 누구나 즐겁게 프로그래밍을 시작해 보자!

누구나 20일이면 파이썬 프로그램을 만들 수 있다!

1~13일: 파이썬 언어 기초 배우기

초보자도 배우기 쉬운 언어인 파이썬의 기초 문법을 예제로 배운다. 입력 → 결과 확인 → 에러 해결 → 해설 → 응용, ‘5단계 트레이닝’으로 짧은 프로그램을 직접 입력하고 고쳐 보면서 자연스럽게 프로그램을 작성하는 방법을 익힌다.

14~18일: 간단한 게임 만들기

앞에서 학습한 파이썬 기능을 이용하여 5가지 게임 프로젝트를 실습한다. 계산 맞히기 게임, 타자 게임, 거북이 대포 게임, 터틀런 1, 2를 만들고 실제로 게임을 플레이해 본다.

19~20일: 파이썬으로 수학 문제 풀어 보기

중학교 수준의 간단한 수학 문제를 파이썬 프로그램으로 만들어서 풀어 본다. 수학과 프로그래밍의 연관 관계를 배울 수 있으며 파이썬이 어떻게 활용되는지 알 수 있다.

 만든 이 코멘트','프로그래밍을 한 번도 해본 적이 없어도 괜찮다. 파이썬이 무엇인지 몰라도 상관 없다. 《모두의 파이썬》은 어려운 개념과 복잡한 이론 설명은 최대한 줄이고, 초보자가 프로그래밍을 쉽게 배울 수 있도록 짧고 간단한 예제로 내용을 구성했다. 처음부터 모든 것을 다 이해하지 못해도 괜찮다. 프로그램을 따라서 입력하고, 실행 결과를 확인하며, 책에서 알려주는 대로 에러를 수정해 보자. 어느새 파이썬 프로그램으로 멋진 그림을 그리고, 계산을 하고, 간단한 게임을 만들고, 수학 문제를 푸는 자신을 발견하게 될 것이다. 《모두의 파이썬》으로 남녀노소 누구나 즐겁게 프로그래밍을 시작해 보자!

누구나 20일이면 파이썬 프로그램을 만들 수 있다!

1~13일: 파이썬 언어 기초 배우기

초보자도 배우기 쉬운 언어인 파이썬의 기초 문법을 예제로 배운다. 입력 → 결과 확인 → 에러 해결 → 해설 → 응용, ‘5단계 트레이닝’으로 짧은 프로그램을 직접 입력하고 고쳐 보면서 자연스럽게 프로그램을 작성하는 방법을 익힌다.

14~18일: 간단한 게임 만들기

앞에서 학습한 파이썬 기능을 이용하여 5가지 게임 프로젝트를 실습한다. 계산 맞히기 게임, 타자 게임, 거북이 대포 게임, 터틀런 1, 2를 만들고 실제로 게임을 플레이해 본다.

19~20일: 파이썬으로 수학 문제 풀어 보기

중학교 수준의 간단한 수학 문제를 파이썬 프로그램으로 만들어서 풀어 본다. 수학과 프로그래밍의 연관 관계를 배울 수 있으며 파이썬이 어떻게 활용되는지 알 수 있다.

 만든 이 코멘트',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (397,'컴퓨터와 인터넷','리액트를 다루는 기술','김민준','길벗',32000,32000,1000,to_date('18/08/01','RR/MM/DD'),688,'9791160505238',2000,to_date('18/10/17','RR/MM/DD'),'bestseller','리액트에 대한 기본 지식이 없는 상태에서도 쉽게 이해할 수 있도록 꼼꼼하게 설명되어 있습니다. 또한, 실제 실무에서 어떻게 사용되는지 상세히 알려줍니다.


','애니메이션 스트리밍 서비스를 제공하는 라프텔(laftel.net)에서 프런트엔드 엔지니어로 일하고 있고, 패스트캠퍼스의 리액트로 구현하는 웹 애플리케이션 제작 캠프에서 강의를 하고 있다. 리액트의 빅 팬이고, velopert.com 블로그를 운영하고 있으며, 유튜브에서 매일 밤 라이브 코딩(velopert의 코딩 이야기)을 하고 있다','리액트에 대한 기본 지식이 없는 상태에서도 쉽게 이해할 수 있도록 꼼꼼하게 설명되어 있습니다. 또한, 실제 실무에서 어떻게 사용되는지 상세히 알려줍니다.
김범준_라프텔(연세대학교) 개발자

리액트뿐만 아니라 다양한 라이브러리를 필요한 곳에 같이 사용하여 쉽게 배울 수 있었습니다. 
정지훈_IOS 앱 개발

실무에서 약간 응용하여 사용할 수 있는 좋은 예제가 많다. 참고하지 않은 부분이 없을 정도로 내용이 매우 실무적이다.
조용진_스타트업 모두의 캠퍼스 개발자

문법적인 설명뿐만 아니라 사용하는 개념과 왜 그 개념이 도입될 수밖에 없는지를 이해하는 것이 중요하다고 생각합니다. 이 책은 그 점이 좋았습니다. 
신형진_연세대학교 대학원생','리액트에 대한 기본 지식이 없는 상태에서도 쉽게 이해할 수 있도록 꼼꼼하게 설명되어 있습니다. 또한, 실제 실무에서 어떻게 사용되는지 상세히 알려줍니다.
김범준_라프텔(연세대학교) 개발자

리액트뿐만 아니라 다양한 라이브러리를 필요한 곳에 같이 사용하여 쉽게 배울 수 있었습니다. 
정지훈_IOS 앱 개발

실무에서 약간 응용하여 사용할 수 있는 좋은 예제가 많다. 참고하지 않은 부분이 없을 정도로 내용이 매우 실무적이다.
조용진_스타트업 모두의 캠퍼스 개발자

문법적인 설명뿐만 아니라 사용하는 개념과 왜 그 개념이 도입될 수밖에 없는지를 이해하는 것이 중요하다고 생각합니다. 이 책은 그 점이 좋았습니다. 
신형진_연세대학교 대학원생',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (398,'컴퓨터와 인터넷','Try! helloworld 자바스크립트','김용록','길벗',22000,19800,1000,to_date('18/05/22','RR/MM/DD'),336,'9791160504736',2000,to_date('18/10/17','RR/MM/DD'),'bestseller','자바스크립트는 문법이 간결하고 프로그램 설치가 간편하여 첫 프로그래밍 언어로 인기가 높다. 또한, 웹 프로그래밍부터 응용 프로그램 개발까지 활용 범위도 넓다. 이 책은 무료 학습 서비스(동영상+온라인 실습)를 제공하는 프로그래머스(programmers.co.kr) 사이트의 인기 강좌 ‘자바스크립트 기초’와 ‘웹 프런트엔드 기초’를 책으로 엮은 것이다. 책의 설명만으로도 학습하는 데 무리가 없지만, 저자 동영상 강의를 함께 보면 학습 효율이 더욱 높아질 것이다. 또한, 배운 내용을 바로 온라인 사이트에서 실습할 수 있다. 하루 한 강, 매일 15분이면 어느새 자바스크립트 프로그래밍에 익숙해진 자신을 발견하게 될 것이다.','구글코리아에서 소프트웨어 엔지니어로 재직 중이다. 더 좋은 소프트웨어 엔지니어가 되기를 갈망하지만 일과 삶의 균형이 더 중요하다. 겨울에는 주로 스키를 즐긴다.','언어는 말을 하면서 배워야 빠르고 정확하게 배울 수 있습니다. 프로그래밍 언어도 마찬가지입니다. 실습을 하면서 배워야 빠르고 정확하게 배울 수 있고 비로서 자기 것으로 만들 수 있습니다. 프로그래머스 사이트에서 제공하는 강의와 실습 문제는 자바스크립트를 이해하고 자기 것으로 만드는 데 큰 도움을 줄 것입니다. 기회가 된다면 작은 문제나 원하는 프로젝트를 직접 만들면서 해결해 나가길 권합니다. 프로그래머로 더욱 빠르게 성장할 수 있을 것입니다.--- 「머리말」 중에서','혼자서 공부하는 
자바스크립트 + 웹 프런트엔드

# 하루 15분! 자바스크립트 기초부터 웹 프런트엔드까지!
짧은 강의와 실습을 통해 하루 15분이면 누구나 자바스크립트 프로그래밍을 배울 수 있게 구성하였다. 기초 문법을 익힌 후에는 HTML, CSS와 함께 자바스크립트를 활용해 웹 페이지의 다양한 기능을 구현해본다.

# 5분 동영상, 53개 강의
지하철 안에서, 생활 속 자투리 시간에 틈틈이, 짬짬이 볼 수 있는 동영상 강의 53개를 제공한다(본문에 QR 코드 수록). 초보자도 차근차근 학습할 수 있도록 동영상 강의에서 미처 다루지 못한 내용을 책에 보완하고 실전에 필요한 팁을 추가했다.

# 코딩 실습 22개 + 정답 수록
배운 내용을 바로 확인하고 점검할 수 있는 실습 문제와 정답을 수록했다. 프로그래머스 사이트(http://programmers.co.kr)에서 직접 코드를 입력하고 실행해보면서 배운 내용을 훈련할 수 있다.',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (334,'컴퓨터와 인터넷','포토샵 무작정 따라하기','민지영, 문수민, 이상호, 앤미디어','길벗',34000,30000,1000,to_date('18/10/02','RR/MM/DD'),1111,'12122222',2000,to_date('18/10/17','RR/MM/DD'),'bestseller','구글코리아에서 소프트웨어 엔지니어로 재직 중이다. 더 좋은 소프트웨어 엔지니어가 되기를 갈망하지만 일과 삶의 균형이 더 중요하다. 겨울에는 주로 스키를 즐긴다.','구글코리아에서 소프트웨어 엔지니어로 재직 중이다. 더 좋은 소프트웨어 엔지니어가 되기를 갈망하지만 일과 삶의 균형이 더 중요하다. 겨울에는 주로 스키를 즐긴다.','구글코리아에서 소프트웨어 엔지니어로 재직 중이다. 더 좋은 소프트웨어 엔지니어가 되기를 갈망하지만 일과 삶의 균형이 더 중요하다. 겨울에는 주로 스키를 즐긴다.','구글코리아에서 소프트웨어 엔지니어로 재직 중이다. 더 좋은 소프트웨어 엔지니어가 되기를 갈망하지만 일과 삶의 균형이 더 중요하다. 겨울에는 주로 스키를 즐긴다.',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (335,'컴퓨터와 인터넷','무작정 따라하기 차트분석','윤재수','미래 출판사',1212,30000,121,to_date('18/10/02','RR/MM/DD'),12,'1212',2000,to_date('18/10/24','RR/MM/DD'),'bestseller','1212','1212','1212','1212',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (336,'컴퓨터와 인터넷','짠테크 가계부','짠돌이 카페','길벗',30000,30000,1212,to_date('18/10/02','RR/MM/DD'),1212,'1212',1212,to_date('18/10/18','RR/MM/DD'),'bestseller','1212','1212','121','1212',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (337,'컴퓨터와 인터넷','케라스로 배우는 딥러닝','프랑소와 숄레','국민출판사',30000,30000,1212,to_date('18/10/02','RR/MM/DD'),1212,'1212',1212,to_date('18/10/19','RR/MM/DD'),'bestseller','1212','1221','1212','1212',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (338,'컴퓨터와 인터넷','컴퓨터 활용능려 2급 실기','이병승','길벗',25000,25000,1212,to_date('18/08/08','RR/MM/DD'),1212,'1212',1212,to_date('18/10/26','RR/MM/DD'),'bestseller','1212','1212','1212','1212',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (339,'컴퓨터와 인터넷','시나공 워드 프로세서 실기','길벗 알엔디','국민 출판사',25000,25000,1212,to_date('18/10/29','RR/MM/DD'),1212,'1212',1212,to_date('18/10/25','RR/MM/DD'),'bestseller','1212','1212','1212','121',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (340,'컴퓨터와 인터넷','직장인을 위한 엑셀 실무','홍길동','서울출판사',25000,25000,1212,to_date('18/10/17','RR/MM/DD'),1212,'1212',1212,to_date('18/10/25','RR/MM/DD'),'bestseller','1212','1212','1212','1212',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (341,'컴퓨터와 인터넷','자바스크립트 배우기','2222','서울 출판사',25000,25000,2222,to_date('18/10/18','RR/MM/DD'),2222,'2222',2222,to_date('18/10/18','RR/MM/DD'),'bestseller','5656','56566','5656','5656',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (342,'컴퓨터와 인터넷','부동산 상식 사전','백영록','길벗',20000,20000,5555,to_date('18/10/04','RR/MM/DD'),555,'555',555,to_date('18/10/11','RR/MM/DD'),'bestseller','555','555','555','555',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (343,'컴퓨터와 인터넷','기적의 계산법','이순신','국민 출판사',30000,30000,777,to_date('18/10/04','RR/MM/DD'),990,'777',2000,to_date('18/11/22','RR/MM/DD'),'steadyseller','777','7777','777','777',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (344,'컴퓨터와 인터넷','초보자를 위한 자바 프로그래밍','이병승','인포북',30000,27000,2000,to_date('18/10/02','RR/MM/DD'),996,'2323454566778',2000,to_date('18/10/18','RR/MM/DD'),'newbook','7777','77777','7777','7777',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (345,'컴퓨터와 인터넷','리액트를 다루는 기술','이순신','민국 출판사',30000,30000,888,to_date('18/10/12','RR/MM/DD'),888,'8888',888,to_date('18/10/18','RR/MM/DD'),'newbook','88','888888','888','888',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (346,'컴퓨터와 인터넷','여행 일본어','이길동','국민 출판사',30000,30000,898,to_date('18/10/23','RR/MM/DD'),8989,'8989',8989,to_date('18/10/18','RR/MM/DD'),'on_sale','8989','8989','8989','8989',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (347,'컴퓨터와 인터넷','가장 빨리 만나는 자바9','카이 호스트만','길벗',30000,32400,2000,to_date('18/10/17','RR/MM/DD'),1111,'1212121',2000,to_date('18/10/22','RR/MM/DD'),'steadyseller','첫 번째 단계는 프로그래밍 기초 과정이다.
: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.',null,'첫 번째 단계는 프로그래밍 기초 과정이다.
: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.','첫 번째 단계는 프로그래밍 기초 과정이다.
: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.',to_date('18/10/20','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (348,'컴퓨터와 인터넷','자바 EE 디자인 패턴','무라트예네르, 알렉스 시돔','길벗',34000,30000,1000,to_date('18/10/18','RR/MM/DD'),1212,'12122222',2000,to_date('18/10/24','RR/MM/DD'),'on_sale','첫 번째 단계는 프로그래밍 기초 과정이다.
: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.','첫 번째 단계는 프로그래밍 기초 과정이다.
: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.','첫 번째 단계는 프로그래밍 기초 과정이다.
: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.','첫 번째 단계는 프로그래밍 기초 과정이다.
: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.',to_date('18/10/20','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (349,'컴퓨터와 인터넷','자바로 배우는 리팩토링','유키히로시','길벗',34000,30000,1000,to_date('18/10/02','RR/MM/DD'),1111,'12122222',2000,to_date('18/10/25','RR/MM/DD'),'on_sale','저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.','저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.','저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.','저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.',to_date('18/10/20','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (350,'컴퓨터와 인터넷','유지 보수가 가능한 코딩의 기술-자바편','주스트 뷔서','한국 출판사',35000,32000,2000,to_date('18/10/20','RR/MM/DD'),1000,'2323222323',2000,to_date('18/10/22','RR/MM/DD'),'steadyseller','이 책을 읽고 나면 프로그래머는 새로운 객체를 찾아서 만들게 될 것이고, 그것을 프로그래밍화 하는 것이 진정한 객체 지향 프로그래밍이라는 사실을 깨닫게 될 것이다.','저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.

- 전자공학과 졸업
- 벤처 기업에서 다양한 소프트웨어 개발 참여
- 대기업의 시스템 통합 작업에 관련된 소프트웨어 개발 참여
- IT프로그래밍 학원에서 강의','이 책을 읽고 나면 프로그래머는 새로운 객체를 찾아서 만들게 될 것이고, 그것을 프로그래밍화 하는 것이 진정한 객체 지향 프로그래밍이라는 사실을 깨닫게 될 것이다.','이 책을 읽고 나면 프로그래머는 새로운 객체를 찾아서 만들게 될 것이고, 그것을 프로그래밍화 하는 것이 진정한 객체 지향 프로그래밍이라는 사실을 깨닫게 될 것이다.',to_date('18/10/20','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (354,'컴퓨터와 인터넷','모두의 딥러닝','조태호','길벗',24000,21600,1000,to_date('18/10/02','RR/MM/DD'),300,'2112121',3000,to_date('18/10/04','RR/MM/DD'),'bestseller','딥러닝을 전혀 모르는 사람이 봐도 술술 읽을 수 있게 쉽게 설명한다. 또한, 딥러닝의 원리를 잘 보여주는 예제를 엄선하여 직관적인 몇 줄의 코드로 강력한 딥러닝을 구현해볼 수 있다. 다양하고 실질적인 예제를 통해 재미있게 학습할 수 있으며, 모든 예제는 가상 머신을 설치할 필요 없이 윈도 10에서 손쉽게 실행할 수 있어 편리하다. 복잡한 수식은 최대한 줄이고 고급 기술은 심화 학습에서 추가로 학습할 수 있게 단계별로 구성하였다. ‘이론 없는 실습’, ‘실습 없는 이론’이 아닌 이론과 실습 두 날개의 균형을 잡음으로써, 배운 내용을 올바로 이해하고 실전에서 제대로 써먹을 수 있도록 안내한다. 이 책을 읽고 나면 ‘나의 사례’에 적합한 딥러닝 모델을 구현할 수 있을 것이다.','딥러닝을 전혀 모르는 사람이 봐도 술술 읽을 수 있게 쉽게 설명한다. 또한, 딥러닝의 원리를 잘 보여주는 예제를 엄선하여 직관적인 몇 줄의 코드로 강력한 딥러닝을 구현해볼 수 있다. 다양하고 실질적인 예제를 통해 재미있게 학습할 수 있으며, 모든 예제는 가상 머신을 설치할 필요 없이 윈도 10에서 손쉽게 실행할 수 있어 편리하다. 복잡한 수식은 최대한 줄이고 고급 기술은 심화 학습에서 추가로 학습할 수 있게 단계별로 구성하였다. ‘이론 없는 실습’, ‘실습 없는 이론’이 아닌 이론과 실습 두 날개의 균형을 잡음으로써, 배운 내용을 올바로 이해하고 실전에서 제대로 써먹을 수 있도록 안내한다. 이 책을 읽고 나면 ‘나의 사례’에 적합한 딥러닝 모델을 구현할 수 있을 것이다.','딥러닝을 전혀 모르는 사람이 봐도 술술 읽을 수 있게 쉽게 설명한다. 또한, 딥러닝의 원리를 잘 보여주는 예제를 엄선하여 직관적인 몇 줄의 코드로 강력한 딥러닝을 구현해볼 수 있다. 다양하고 실질적인 예제를 통해 재미있게 학습할 수 있으며, 모든 예제는 가상 머신을 설치할 필요 없이 윈도 10에서 손쉽게 실행할 수 있어 편리하다. 복잡한 수식은 최대한 줄이고 고급 기술은 심화 학습에서 추가로 학습할 수 있게 단계별로 구성하였다. ‘이론 없는 실습’, ‘실습 없는 이론’이 아닌 이론과 실습 두 날개의 균형을 잡음으로써, 배운 내용을 올바로 이해하고 실전에서 제대로 써먹을 수 있도록 안내한다. 이 책을 읽고 나면 ‘나의 사례’에 적합한 딥러닝 모델을 구현할 수 있을 것이다.','딥러닝을 전혀 모르는 사람이 봐도 술술 읽을 수 있게 쉽게 설명한다. 또한, 딥러닝의 원리를 잘 보여주는 예제를 엄선하여 직관적인 몇 줄의 코드로 강력한 딥러닝을 구현해볼 수 있다. 다양하고 실질적인 예제를 통해 재미있게 학습할 수 있으며, 모든 예제는 가상 머신을 설치할 필요 없이 윈도 10에서 손쉽게 실행할 수 있어 편리하다. 복잡한 수식은 최대한 줄이고 고급 기술은 심화 학습에서 추가로 학습할 수 있게 단계별로 구성하였다. ‘이론 없는 실습’, ‘실습 없는 이론’이 아닌 이론과 실습 두 날개의 균형을 잡음으로써, 배운 내용을 올바로 이해하고 실전에서 제대로 써먹을 수 있도록 안내한다. 이 책을 읽고 나면 ‘나의 사례’에 적합한 딥러닝 모델을 구현할 수 있을 것이다.',to_date('18/10/23','RR/MM/DD'));
Insert into GOODS (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_STATUS,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_ENTER_DATE) values (356,'컴퓨터와 인터넷','마인크래프트 무작정 따라하기','신윤철,이상민','길벗',14000,12000,1000,to_date('18/10/02','RR/MM/DD'),245,'12122222',2000,to_date('18/10/10','RR/MM/DD'),'bestseller','마인크래프트를 이용해 코딩을 배울 수 있다는 이야기를 들어 본 적 있나요? 
마이크로소프트(Microsoft)에서 만든 블록형 코딩 도구인 메이크코드(MakeCode)를 마인크래프트와 연결해 보세요. 메이크코드에서 만든 코드를 마인크래프트 월드에 적용할 수 있습니다. 또한, 장애물 파괴나 벽돌 쌓기 등 건축물을 지을 때 피할 수 없었던 반복 작업도, 메이크코드의 명령 블록을 이용하면 한번에 뚝딱 자동화할 수 있습니다. 
《마인크래프트 게임 제작 무작정 따라하기》는 아이들이 좋아하는 마인크래프트를 활용해 코딩을 쉽고 재미있게 익힐 수 있게 차근차근 도와주는 책입니다. 미래의 게임 프로그래머 또는 공학도를 꿈꾸는 아이라면 《마인크래프트 게임 제작 무작정 따라하기》와 함께 컴퓨팅 사고력, 창의성, 도전 정신을 키워 보세요!','마인크래프트를 이용해 코딩을 배울 수 있다는 이야기를 들어 본 적 있나요? 
마이크로소프트(Microsoft)에서 만든 블록형 코딩 도구인 메이크코드(MakeCode)를 마인크래프트와 연결해 보세요. 메이크코드에서 만든 코드를 마인크래프트 월드에 적용할 수 있습니다. 또한, 장애물 파괴나 벽돌 쌓기 등 건축물을 지을 때 피할 수 없었던 반복 작업도, 메이크코드의 명령 블록을 이용하면 한번에 뚝딱 자동화할 수 있습니다. 
《마인크래프트 게임 제작 무작정 따라하기》는 아이들이 좋아하는 마인크래프트를 활용해 코딩을 쉽고 재미있게 익힐 수 있게 차근차근 도와주는 책입니다. 미래의 게임 프로그래머 또는 공학도를 꿈꾸는 아이라면 《마인크래프트 게임 제작 무작정 따라하기》와 함께 컴퓨팅 사고력, 창의성, 도전 정신을 키워 보세요!','마인크래프트를 이용해 코딩을 배울 수 있다는 이야기를 들어 본 적 있나요? 
마이크로소프트(Microsoft)에서 만든 블록형 코딩 도구인 메이크코드(MakeCode)를 마인크래프트와 연결해 보세요. 메이크코드에서 만든 코드를 마인크래프트 월드에 적용할 수 있습니다. 또한, 장애물 파괴나 벽돌 쌓기 등 건축물을 지을 때 피할 수 없었던 반복 작업도, 메이크코드의 명령 블록을 이용하면 한번에 뚝딱 자동화할 수 있습니다. 
《마인크래프트 게임 제작 무작정 따라하기》는 아이들이 좋아하는 마인크래프트를 활용해 코딩을 쉽고 재미있게 익힐 수 있게 차근차근 도와주는 책입니다. 미래의 게임 프로그래머 또는 공학도를 꿈꾸는 아이라면 《마인크래프트 게임 제작 무작정 따라하기》와 함께 컴퓨팅 사고력, 창의성, 도전 정신을 키워 보세요!','마인크래프트를 이용해 코딩을 배울 수 있다는 이야기를 들어 본 적 있나요? 
마이크로소프트(Microsoft)에서 만든 블록형 코딩 도구인 메이크코드(MakeCode)를 마인크래프트와 연결해 보세요. 메이크코드에서 만든 코드를 마인크래프트 월드에 적용할 수 있습니다. 또한, 장애물 파괴나 벽돌 쌓기 등 건축물을 지을 때 피할 수 없었던 반복 작업도, 메이크코드의 명령 블록을 이용하면 한번에 뚝딱 자동화할 수 있습니다. 
《마인크래프트 게임 제작 무작정 따라하기》는 아이들이 좋아하는 마인크래프트를 활용해 코딩을 쉽고 재미있게 익힐 수 있게 차근차근 도와주는 책입니다. 미래의 게임 프로그래머 또는 공학도를 꿈꾸는 아이라면 《마인크래프트 게임 제작 무작정 따라하기》와 함께 컴퓨팅 사고력, 창의성, 도전 정신을 키워 보세요!',to_date('18/10/20','RR/MM/DD'));

-----------------------------------------------------
-- GOODS_IMAGE 데이터

Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (346,394,'무작정 따라가기 홍콩 마카오.jpg','admin','main_image',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (347,394,'무작정 따라가기 홍콩 마카오_상세.jpg','admin','detail_image1',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (348,394,'detail2.jpg','admin','detail_image2',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (349,395,'image2.jpg','admin','main_image',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (350,395,'모두의 파이선상세이미지1.jpg','admin','detail_image1',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (351,397,'main_react.jpg','admin','main_image',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (352,397,'react_detail1.jpg','admin','detail_image1',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (353,398,'헬로자바스크립트_메인.jpg','admin','main_image',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (354,398,'헬로자바스크립트_상세1.jpg','admin','detail_image1',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (299,334,'포토샵 무작정 따라하기_메인.jpg','admin','main_image',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (300,334,'포토샵 무작정 따라하기_상세1.jpg','admin','detail_image1',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (301,335,'차트분석 무작정 따라하기_메인.jpg','admin','main_image',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (302,335,'차트분석 무작정 따라하기_상세1.jpg','admin','detail_image1',to_date('18/10/16','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (303,336,'짠테그 가계부_메인.jpg','admin','main_image',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (304,336,'짠테그 가계부_상세1.jpg','admin','detail_image1',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (305,337,'케라시_메인.jpg','admin','main_image',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (306,337,'케라시_상세1.jpg','admin','detail_image1',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (307,338,'컴퓨터 활용능력 2급 실기_메인.jpg','admin','main_image',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (308,338,'컴퓨터 활용능력 2급 실기_상세1.jpg','admin','detail_image1',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (309,339,'시나공 워드프로세서 실기_메인.jpg','admin','main_image',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (310,339,'시나공 워드프로세서 실기_상세1.jpg','admin','detail_image1',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (311,340,'엑셀실무_메인.pg.jpg','admin','main_image',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (312,340,'엑셀실무_상세1.jpg','admin','detail_image1',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (313,341,'헬로자바스크립트_메인.jpg','admin','main_image',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (314,341,'모두의 파이선상세이미지1.jpg','admin','detail_image1',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (315,342,'부동상 상식사전_메인.jpg','admin','main_image',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (316,342,'부동상 상식사전_상세1.jpg','admin','detail_image1',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (317,343,'기적적 계산법_메인.jpg','admin','main_image',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (339,343,'good1_detail_image3.jpg','admin','uploadFile',to_date('18/10/21','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (319,344,'image1.jpg','admin','main_image',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (320,344,'react_detail1.jpg','admin','detail_image1',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (321,345,'main_react.jpg','admin','main_image',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (322,345,'detail3.jpg','admin','detail_image1',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (323,346,'여행 일본어_메인.jpg','admin','main_image',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (324,346,'여행 일본어_상세.jpg','admin','detail_image1',to_date('18/10/17','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (325,347,'가장 빨리 만나는 자바_메인.jpg','admin','main_image',to_date('18/10/20','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (326,347,'가장 빨리 만나는 자바_상세1.jpg','admin','detail_image1',to_date('18/10/20','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (327,348,'Java EE 디자이 패턴_메인.jpg','admin','main_image',to_date('18/10/20','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (328,348,'Java EE 디자이 패턴_상세1.jpg','admin','detail_image1',to_date('18/10/20','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (330,349,'자바 리팩토링_메인.jpg','admin','main_image',to_date('18/10/20','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (331,349,'자바 리팩토링_상세1.jpg','admin','detail_image1',to_date('18/10/20','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (334,350,'유지보수자바_메인.jpg','admin','main_image',to_date('18/10/20','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (341,350,'유지보수자바_상세1.jpg','admin','uploadFile',to_date('18/10/21','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (337,343,'기적적 계산법_상세1.jpg','admin','uploadFile',to_date('18/10/21','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (338,343,'good1_detail_image2.jpg','admin','uploadFile',to_date('18/10/21','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (342,354,'모두의 딥러닝_메인.jpg','admin','main_image',to_date('18/10/23','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (343,354,'모두의 딥러닝_상세.jpg','admin','detail_image1',to_date('18/10/23','RR/MM/DD'));
Insert into GOODS_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,REG_DATE) values (345,356,'마인_메인.jpg','admin','main_image',to_date('18/10/23','RR/MM/DD'));

