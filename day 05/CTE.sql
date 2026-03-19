-- Common Table Expression
SELECT*
SELECT (o.custid,sum(o.saleprice)AS "TotalPrice"
FROM Orders o
GROUP BY o.custid)t
WHERE t.TotalPrice>31000;
;


WITH order_sum AS (
    -- 첫 번째 임시 테이블: 고객별 총 판매액 계산
    SELECT custid, SUM(saleprice) AS TotalPrice
    FROM Orders
    GROUP BY custid
),
customer_sub AS (
    -- 두 번째 임시 테이블: 고객 정보 추출
    SELECT custid, name, address
    FROM Customer
)
-- 메인 쿼리: 두 테이블을 조인하여 결과 출력
SELECT c.name, o.TotalPrice
FROM order_sum o
JOIN customer_sub c ON o.custid = c.custid
WHERE o.TotalPrice > 31000;

WITH RECURSIVE numbers AS(
SELECT 1 AS num -- 시작값
UNION ALL
SELECT num+1
FROM numbers
WHERE num<10
)
SELECT*
FROM numbers;