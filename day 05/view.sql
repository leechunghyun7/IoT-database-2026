-- 인덱스


-- 인덱스 생성용 테이블

CREATE TABLE Noidx_Book(
bookid integer,
bookname varchar(40),
publisher varchar(40),
isbn varchar(13),
releaseyear integer,
price decimal(8,0)
);

CREATE TABLE Idx_Book(
bookid integer,
bookname varchar(40),
publisher varchar(40),
isbn varchar(13),
releaseyear integer,
price decimal(8,0)
PRIMARY key(bookid)
);

-- Noidex_Book 인덱스 걸기
CREATE UIQUE INDEX idx_book ON Noidx_Book(bookid);

INSERT INTO Idx-Book VALUES (NULL,'프로젝트 헤일메리','미디어','97891111111111',2022,18000);

INSERT INTO Noidx VALUES (NULL,'프로젝트 헤일메리','미디어','97891111111111',2022,18000);

-- pk인덱스가 있는 Idx_Bookdp ekfms dlseprtm todtjd
CREATE INDEX idx_book_bookname ON Idx_Book(bookname);

-- 두컬럼으로 인덱스
CREATE INDEX idx_book_isbn_releaseyear ON Idx_Book(isbn,releaseyear);

-- 만약 삭제하고 싶으면 먼저 삭제후 생성해얃욈
DROP INDEX idx_book_isbn_releaseyear ON Idx_Book;

-- 현재 테이블 상태 분석
ANALYZE TABLE Book;
-- 테이블 인덱스 최적화
OPTIMIZE TABLE Book;
