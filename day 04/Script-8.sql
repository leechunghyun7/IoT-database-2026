--ALTER 객체수정

-- NewBook 테이블에 ISBN 컬럼을 추가하시오
ALTER TABLE NewBook 
  ADD isbn CHAR(13);

-- 데이터 추가
INSERT SERT INTO NewBook VALUES
(1,'프로젝트 헤일메리','알에이치',22000,'9788925588735');

SELECT * FROM NewBook;

-- NewBook 
-- 이전에 데이터에 empty가 들어감
ALTER TABLE NewBook 
ADD genre VARCHAR(10) NOT NULL;

SELECT ISNULL(genre) FROM NewBook
WHERE bookid =1;

-- NewBook에 isbn을 삭제하시오
ALTER TABLE NewBook 
DROP COLUMN isbn;

-- NEWbook publisher 에 notnull 제약조건 추가
ALTER TABLE NewBook 
MODIFY publisher VARCHAR(40) NOT NULL;

-- 기본키 추가는 ALTER로 잘 하지 않습니다
ALTER TABLE NewBook 
ADD PRIMARY KEY(bookid);

