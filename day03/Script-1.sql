
SELECT BOOKNAME
	  ,price
  FROM Book;

SELECT price
	  ,bookname
	  ,publisher 
	  ,price
  FROM Book;


SELECT publisher
FROM   Book;

SELECT DISTINCT publisher//중복을 제거함
FROM Book;

SELECT ALL PUBLISHER
      FROM Book;
-- where 절
-- 가격이 10000이상 20000 이하인 도서 조회하세요
 
SELECT *
	FROM Book
WHERE price BETWEEN 10000 AND 20000;


--beetween 은 and로 변경 가능

SELECT *
	FROM Book
	WHERE price >=10000
	AND price <= 20000;

-- 출판사가 굿스포츠, 대한미디어인 도서를 조회하시오
SELECT *
  FROM Book
WHERE publisher IN ('굿스포츠','대한미디어');

-- OR 와 동일. 단, 값이 너무 많으면 IN절이 훨씬 효율적
SELECT *
  FROM Book
 WHERE publisher IN ('굿스포츠','대한미디어')
    OR publisher = '대한미디어';

-- 출판사가 굿스포츠, 대한미디어인 도서를 조회하시오
SELECT *
  FROM Book
 WHERE publisher NOT IN ('굿스포츠','대한미디어');


-- 축구의 역사 출간한 출판사를 조회하시오
SELECT bookname, publisher
	FROM Book
	WHERE bookname = '축구의 역사';

SELECT bookname, publisher
	FROM Book
	WHERE bookname = LIKE '축구의 역사';

-- 책 제목이 축구로 끝나는 책을 출판한 출판사를 조회하시오

SELECT bookname, publisher
FROM Book
WHERE bookname LIKE '축구%';

-- 책 제목이 축구로 시작하고 총제목 길이가 8자리
SELECT bookname, publisher
FROM Book
WHERE bookname LIKE '축구________';

SELECT *
FROM Book
WHERE bookname LIKE '_구%';

-- 축구에 관한 도서중 가격이 20000 원 이상인 도서가 조회하시오

SELECT *
FROM Book
WHERE bookname LIKE '%축구'
AND price >=20000;

SELECT *
  FROM Book
 ORDER BY bookname ASC;
-- 도서를 가격순으로 조회하고, 가격이 같으면 이름 순으로 조회하시오
SELECT *
  FROM Book
 ORDER BY price DESC,bookname ASC;


-- 집계한수 SUM
-- 2번 김연아 고객이 주문한 도서의 총 판매액을 조회하시오
SELECT custid
	FROM Customer
	WHERE name = '김연아';

SELECT sum(saleprice) AS "총매출"
FROM Orders
WHERE custid =2;

-- Alias
SELECT b.bookid AS "책순번"
,b.bookname AS "책제목"
,b.price AS "정가"
FROM Book AS b;

-- 고객이 주문한 도서의 총 판매액, 평균, 최저, 최고가 조회하시오

SELECT   sum(saleprice) "Total"
		,avg(saleprice) "Average"
		,min(saleprice) "Minimum"
		,max(saleprice) "Maximum"
	FROM Orders o;
-- 마당서점의 총 도서 판매수를 조회하시오
SELECT*
FROM Orders o;

-- 마당서점의 총 도서 판매수를 조회하시오
SELECT count(*)
,count(o.orderid) -- 아래와 개수 차이가 날 수 있음
FROM Orders o;

-- GROUP BY 어느 고객이 얼마나 주문했는지 알고 싶음
-- 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.

SELECT o.custid
, count(*) AS "판매 수량"
, sum(o.saleprice)
FROM Orders o
GROUP BY o.custid;


-- 가격이 8000원 이상인 도서를 구매한 고객에 고객별 주문도서, 총 수량
-- 조회하시오, 단 두 권 이상 구매한 고객만 조회합니다.

SELECT DISTINCT custid
FROM Orders

SELECT count(*) "도서수량"
FROM Orders o
WHERE .Saleprice>-8000
GROUP BY o.custid
HAVING count(*)>=
AND count(*)>=2;


-- 가장 비싼 도서 이름을 조회하세요
SELECT b.bookname
FROM Book b
WHERE b.price >=(SELECT max(price)
				FROM Book);

-- 대한 미디어에서 출판한 도서를 구매한 고객의 정보르 보이시오
-- 고객테이블 컬럼만 사용가능
SELECT*
FROM Customer c
WHERE c.custid IN (SELECT custid
FROM Orders o
WHERE bookid IN ()
SELECT bookid
FROM Book
WHERE publisher = '대한미디어'));


-- 조인으로 변경
SELECT *
FROM Customer c, Orders o,Book b
WHERE c.custid =o.custid 
AND b.bookid =o.bookid 
AND b.publisher ='대한미디어';

-- 도서 전체 평균값 보다 저렴한 책들을 조회하시오
SELECT *
FROM Book b 
WHERE b.price<=(SELECT avg(price)
FROM Book);

-- 출판사별 가장 비싼 도서
-- 서브쿼리로 두 컬럼을 비교가능
SELECT *
FROM Book b
WHERE(publisher, price) IN(
SELECT publisher,max(price)
FROM Book
GROUP BY publisher);

SELECT  avg(price)
	FROM Book
-- 출판사별 가장비싼 책과 가격이 하나라도 더 비싼 책정보를 조회하라
-- 출판사별 가장비싼 책들과 가격이 모두 조건에 일치하는 책정보를 조회하라
	
-- 서브쿼리 결과가 아무것도 없으면 메인쿼리는 조회안됨
-- 서브쿼리 결과가 뭐라고 있으면 메인쿼리 조회가능
-- EXIST BOOL이랑 같은 건가
SELECT *
FROM Book b
WHERE EXISTS (SELECT max(price)
FROM Book
GROUP BY publisher
HAVING max(price)>40000);

-- 상관서브쿼리(Correlated subquery)
-- 메인쿼리의 컬럼이 서브쿼리의 조건에 포함될 때 
-- 서브쿼리 따로 실행 불가능
-- 출판사별 출판사 평균 도서가격보다 비싼 도서를 조회하세요

-- 상관 서브쿼리는 안쪽 서브쿼리만 따로 실행불가. 코디 이해가 쉽지 않음
-- 많이 안쓰는 걸 권장
SELECT *
FROM Book b1
WHERE b1.price IN (SELECT avg(b2.price)
FROM Book b2
where b2.publisher =b1.publisher);
)

/*FROM절 서브쿼리*/

-- 서브쿼리로 만들어진 가상테이블을 진짜 테이블처럼 FROM 절에 사용ㅎ나늑 ㅓㅅ
-- 구매 고객별 합계 중에서 총 금액이 35000 이상인 구매건의 고객번호와 금액을 조회하세요
SELECT t.custid,t.Totalprice
FROM(SELECT custid, SUM(saleprice) AS "Totalprice"
	FROM Orders 
	GROUP BY custid) t
WHERE t.Totalprice>=32000
ORDER BY t.Totalprice DESC;

SELECT *
FROM(
SELECT custid, count(*) AS "Order_cnt"
FROM Orders
GROUP BY custid) t
WHERE t.Order_cnt>=3;


/*SELECT절 서브쿼리 */

SELECT o.orderid
      ,o,custid
      ,o.bookid
      ,o.saleprice
      ,o.orderdate
    FROM Orders o,Customer c,Book b
    WHERE o.custid = c.custid
    AND o.ordered <= 5;
    WHERE o,orderid <=5;

SELECT o.orderid
      ,o.custid
      ,(SELECT name FROM Customer WHERE custid = o.custid)"고객명"
      ,o.bookid
      ,(SELECT bookname FROM Book WHERE bookid = o.bookid)"도서명"
      ,o.saleprice
      ,o.orderdate
     FROM Orders o
     WHERE o.orderid <=5;




	


