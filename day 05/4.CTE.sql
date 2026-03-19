-- Common Table Expression
SELECT*
SELECT (o.custid,sum(o.saleprice)AS "TotalPrice"
FROM Orders o
GROUP BY o.custid)t
WHERE t.TotalPrice>31000;
;


WITH order_sum AS 
SELECT o.custid,sum(o.saleprice)AS "TotalPrice"
FROM Orders o
GROUP BY o.custid
)
SELECT*
FROM order_sum
WHERE TotalPrice >31000;