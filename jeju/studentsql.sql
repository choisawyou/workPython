CREATE TABLE authors (
	name VARCHAR(50) NULL DEFAULT NULL,
	address VARCHAR(50) NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

INSERT INTO authors(NAME, address) values("대한이","서울시");
INSERT INTO authors(NAME, address) values("민국이","대전시");
INSERT INTO authors(NAME, address) VALUES("만세","충주시");
# 데이터베이스 (외부접속단위), 테이블, 필드(변수이름), 레코드
# * : 모든 데이다.
SELECT * FROM authors;
SELECT * FROM authors WHERE NAME="대한이"; # ==(X)
SELECT address from authors WHERE NAME="만세";

UPDATE authors SET NAME="대한민국" WHERE NAME="대한이";

DELETE FROM authors WHERE NAME="만세";

# 문제 : 3인분의 성적을 student 테이블에 입력하고 출려
# 이름 국어 영어 수학 총점 평균
# 대한이, 90, 90, 90
# 민국이, 80, 80, 81
# 만세, 100, 100, 100

INSERT INTO students(NAME, kor, eng, math) VALUES("대한이", 90, 90, 90, SUM(kor, eng, math);
INSERT INTO students(NAME, kor, eng, math) VALUES("민국이", 80, 80, 81);
INSERT INTO students(NAME, kor, eng, math) VALUES("만세", 100, 100, 100);

SELECT * FROM students;

SELECT SUM(kor+eng+math) FROM students WHERE NAME="대한이";
SELECT SUM(kor+eng+math) FROM students WHERE NAME="민국이";
SELECT SUM(kor+eng+math) FROM students WHERE NAME="만세";
