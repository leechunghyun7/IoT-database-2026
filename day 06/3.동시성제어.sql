/*동시성 제어(Concurrency Control)*/

-- 테이블 수정
ALTER TABLE accounts
MODIFY owner varchar(40) NOT NULL,
MODIFY balance int NOT NULL;

truncate TABLE accounts;

SELECT * FROM accounts;

SELECT @@autocommit;

ROLLBACK;

-- 새로 데이터 입력

INSERT INTO accounts (id,owner,balance)
VALUES (1,'KIM',10000),(2,'LEE',20000),(3,'sung',10000000);

SELECT *FROM accounts;

-- 기본 락 실행
-- 세션 1번
UPDATE accounts
   SET balance = balance -1000
   WHERE id =2;

-- Non -Reapeatable Read
-- 격리수준 하강

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT*FROM employees WHERE salary>5000
