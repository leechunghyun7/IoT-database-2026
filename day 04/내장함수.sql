/* 내장함수*/

-- 수학함수
-- 절대값
SELECT abs(-78),abs(+78)
FROM DUAL; -- 테이블을 사용하지 않을 때 사용하는 키워드

-- 반올림
SELECT round(3.141592,3);

-- 고객별 평균 주문금액을 백원단위로 반올림하세요
SELECT o.custid "고객번호"
,round(sum(saleprice)/count(*)) AS "평균금액"
FROM Orders o
GROUP BY o.custid;

SELECT ceil(3.14),floor(3.67),power(2,10),log(10);


-- 2. 문자함수
-- 결합함수 파라미터 갯수 제한이 없음!
SELECT concat('성',' ','유고','만쉐이!');


-- 소문자,대문자 변환
SELECT lower('HELLO'),UPPER('hello!'),cap;

-- 자리수채우기
SELECT LPAD('Hello',10,'*'),
RPAD('Hello',10,'@'); -- 주민번호 생년월일 - 성별이후 여섯자리*

-- 문자열 대체
SELECT replace('Hello','Hello','Bye');

-- 문자열 자르기
SELECT substr('Hello World',7,5);

-- 문자열 공백 없애기(중간 공백 제외)
SELECT concat TRIM('|', TRIM('Hello World'),'|') "TRIM",
 concat TRIM('|', LTRIM('Hello World'),'|')"LTRIM",
 concat TRIM('|', RTRIM('Hello World'),'|')"RTIRM";

-- 구분자로 지정하여 문자열 합치기
SELECT concat_ws('_','2026','03','18'),
       concat_ws(' ','hello','world');

-- 알파벳을 아스키코드 변환
SELECT ascii('A');

-- 문자열 길이리턴
SELECT length('안녕하세요')
       char_length('안녕하세요');

-- 3.날짜시간함수

-- 날짜로 작성된 문자열을 날짜형식으로 변환
SELECT str_to_date('2026-03-18','%Y-%m-%d');
-- 날짜 문자열을 날짜 포멧에 맞춰서 변경
SELECT date_format('2026-03-18''%Y-%m-%d')
       date_format('2026-03-18''%m-%d-%Y')
       date_format('Now(),'%m-%d-%Y');

-- 날짜 더하기/빼기

SELECT adddate(NOW(),INTERVAL -10 DAY);
		date(NOW());
-- 날짜간 날짜 차이 수
SELECT datadiff('2026-03-19','2026-03-08');

SELECT sysdate(),now();

-- 날짜 함수 포멧

/*
 * %Y : 네자리 년도 2026
 * %y : 두자리 년도 26
 * %m : 월
 * %M : 월이름
 * %b : 월이름
 * %d : 일
 * %W : 요일
 * %w : 요일숫자
* */

SELECT date_format(now(),'%Y-%m-%d %W'),
	   date_format(now(),'%H:%i:%s');