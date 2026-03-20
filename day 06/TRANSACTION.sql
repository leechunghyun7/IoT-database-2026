/* 트랜잭션 기본 */

CREATE TABLE accounts (
	id INT PRIMARY KEY,
	owner varchar (40),
	balance INT
);

-- 데이터 추가
INSERT INTO accounts(id,owner,balance)
VALUES (1,'KIM',10000),(2,'LEE',20000),(3,'SUNG',10000000);

-- 트랜잭션 사용가능 여부 확인
-- 1 자동커밋상태 (트랜잭션확인 불가)
-- 0트랜잭션 사용 모드
SELECT @@autocommit;


-- 자동커밋 끄기
SET autocommit =0;

-- 트랜잭션 사용순서

START TRANSACTION;


COMMIT;
ROLLBACK;


-- 2. LEE 계좌에서 1000원 출금
START TRANSACTION;

UPDATE accounts
	SET balance = balance-30000
WHERE id =2;

SELECT * FROM accounts;

COMMIT;
ROLLBACK;

-- 3. KIM -> SUNG 5000원 송금

START TRANSACTION;ALTER 


-- KIM 에서 출금
UPDATE accounts
SET balance = balance -5000
WHERE id =1;


UPDATE accounts
SET balance = balance +5000
WHERE id =3;

SELECT  *FROM accounts;

COMMIT;
ROLLBACK;

-- 4. kim -> 송금중 문제 발생

START TRANSACTION;

UPDATE accounts
SET balance = balance -1000
WHERE id =1;

SAVEPOINT sp_transfer;

-- lee에게 입금
UPDATE accounts
SET balance = balance +2000
WHERE id =3;

SELECT  *FROM accounts;

ROLLBACK TO sp_transfer;
COMMIT;


