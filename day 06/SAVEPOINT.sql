-- 현재 MYSQL DB엔진 종류확인
-- InnoDB(최신 버전엔진), MyIAM(구버전 5.5이하)
-- MYISAM 트랜잭션 처리가 필요 X
SHOW TABLE STATUS LIKE 'accounts';

SELECT *FROM information_schema.INNODB_TRX it;

