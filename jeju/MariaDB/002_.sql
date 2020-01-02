USE jeju;

INSERT INTO goods VALUES(1, '냉장고', 2, 850000);
INSERT INTO goods VALUES(2, '세탁기', 3, 550000);
INSERT INTO goods VALUES(3, '저자레인지', 2, 350000);
INSERT INTO goods VALUES(4, 'HDTV', 3, 1500000);

SELECT * FROM goods;

#INSERT INTO goods(CODE, su, dan) VALUES(4,3,1500000);
#INSERT INTO goods(NAME, su, dan) VALUES('py',3, 1500000);

INSERT INTO goods(CODE, NAME, su) VALUES(5, '드론',1);
UPDATE goods SET dan = 1000000 WHERE CODE =5;

DELETE FROM goods WHERE CODE =5;

INSERT INTO goods VALUES(5, 'VR기기',2, 1440000);
INSERT INTO goods VALUES(6, 'Drone',1, 890000);
INSERT INTO goods(CODE, NAME, su) values(7, '고성능컴퓨터',3);

# 이름이 냉장고이고 단가가 75000이상ㅇ니 데이터 출력
# 단가가 75000이하인 제품 출력
# 단가가 50000이상이고 1200000이하인 제품출력
# 판매 수량이 3개 이상인 제품명과 단가의 출력

SELECT * FROM goods WHERE dan >=75000 and NAME='냉장고';
SELECT * FROM goods WHERE dan <= 75000;
SELECT * FROM goods WHERE dan >= 50000 AND dan <= 1200000;
SELECT NAME, dan from goods WHERE su >=3 ;

SELECT * FROM goods;


#########################################################################################
INSERT INTO student2 VALUES(20120001, '고길동', 'm', 27, '선박','seoul','010-000-4512',5000);
INSERT INTO student2 VALUES(20120002, '최둘리', 'm', 22, '역사','pusan','010-999-9999',4500);
INSERT INTO student2 VALUES(20120003, '도우너', 'w', 15, '역사','daegu','010-555-5555',6500);
INSERT INTO student2 VALUES(20120004, '김만덕', 'w', 15, '유아','mokpo','010-555-7777',7000);
INSERT INTO student2 VALUES(20120005, '류현진', 'm', 22, '컴퓨터공학','seoul','010-122-2222',8000);
INSERT INTO student2 VALUES(20120006, '손흥민', 'm', 22, '컴퓨터공학','seoul','010-999-9999',8000);


SELECT major, SUM(money) FROM student2 GROUP BY major;
SELECT COUNT(*) FROM student2;
SELECT * FROM student2 WHERE NAME LIKE '최%';
SELECT * FROM student2 WHERE addr LIKE 'seoul' AND name LIKE '고%';
SELECT COUNT(*) '정채 행수', COUNT(money) '급여건수', MAX(money) '최대급여', MIN(money) '최소급여', ROUND(avg(money),2) '평균급여' FROM student2;# 이상함
SELECT MAX(money) - MIN(money) AS 급여구간 FROM student2;
# 그룹 함수이기 때문에 그룹값을 상수화 해야 정상적으로 계산됨
# SELECT (money-MIN(money)) / (MAX(money)-MIN(money)) AS 정규화 FROM student;
# 프로그램으로 변경 (사용자변수 @, @@ 시스템변수)
SELECT MIN(money) INTO @minvalue FROM student2;
SELECT @minvalue;
SELECT MAX(money) - MIN(money) INTO @rangevalue FROM student2;
SELECT @rangevalue;
SELECT (money-@minvalue)/@rangevalue AS 정규화값 FROM student2;


SELECT * FROM student2;

###############################################################################################################

INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES('충주여자고등학교', '충주시', 'CH00000001',300);
INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES('신성여자고등학교', '제주시', 'IC00000001',560);
INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES('종로여자고등학교', '종로구', 'JR00000001',300);
INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES('제주여자고등학교', '제주시', 'SE00000001',300);

INSERT INTO student(NAME, kor, mat, eng, schoolcode) VALUES('전공인', 81, 81, 81, 'SE00000001');
INSERT INTO student(NAME, kor, mat, eng, schoolcode) VALUES('전공이', 81, 81, 81, 'SE00000001');
INSERT INTO student(NAME, kor, mat, eng, schoolcode) VALUES('전공삼', 91, 100, 100, 'CH00000001');
INSERT INTO student(NAME, kor, mat, eng, schoolcode) VALUES('전공사', 100, 100, 100, 'CH00000001');
INSERT INTO student(NAME, kor, mat, eng, schoolcode) VALUES('고려인', 100, 100, 100, 'CH00000001');
INSERT INTO student(NAME, kor, mat, eng, schoolcode) VALUES('종로구', 100, 81, 71, 'IC00000001');
INSERT INTO student(NAME, kor, mat, eng, schoolcode) VALUES('종로구', 100, 81, 71, 'IC00000001');

SELECT * FROM school WHERE schoolcode ='CH00000001';
SELECT * FROM student where NAME='고려인';
SELECT NAME, kor, eng, mat from student WHERE NAME='전공인';
SELECT NAME AS 이름, kor AS 국어, eng AS 영어, mat AS 수학  from student WHERE NAME='전공인';
# 서브쿼리
SELECT NAME , kor, eng, mat, FROM student WHERE schoolcode IN (SELECT schoolcode FROM school WHERE scoolname='신성여자고등학교');
SELECT NAME, kor, eng, mat FROM student WHERE name LIKE '전공%';
SELECT NAME, kor, eng, mat FROM student WHERE name LIKE '%공%';
SELECT NAME, kor, eng, mat FROM student WHERE name LIKE '_려_';

SELECT * FROM student WHERE kor>90 and mat>90 AND eng>90;
SELECT * FROM student WHERE kor>90 or mat>90 or eng>90;
SELECT * FROM student WHERE kor>80 or mat<90;
SELECT * FROM student WHERE kor BETWEEN 80 AND 100;

# group by, having, order by, limit
SELECT * FROM student LIMIT 1;
SELECT * FROM student ORDER BY NAME DESC; # limit 2
SELECT * FROM student ORDER BY NAME ASC;

SELECT sc.schoolname, sc.schoolcode, st.name, st.average 
	FROM student st INNER JOIN school sc  # 두개의 조건이 만족, outer : 다 가져온다.
		ON st.schoolcode = sc.schoolcode; 

SELECT NAME AS 이름, kor AS 국어, mat AS 수학, eng AS 영어 
	FROM student WHERE NAME='전공이';
	
SELECT concat(NAME, '님') AS 이름, kor AS 국어, mat AS 수학, eng AS 영어 
	FROM student WHERE NAME='전공인';
	
SELECT concat(NAME, '님') AS 이름, lpad(kor, 10, '*') AS 국어, mat AS 수학, eng AS 영어 # 왼쪽에 채워라 *로 길이가 10개까지
	FROM student WHERE NAME='전공삼';

SELECT replace(concat(NAME, '님'), '님', '형') AS 이름, 
	lpad(kor, 10, '*') AS 국어, mat AS 수학, eng AS 영어 
		FROM student WHERE NAME='전공삼';
		
SELECT substr(replace(concat(NAME, '님'), '님', '형'), 1, 2) AS 이름, # substr(, 1, 2) :시작 끝
	lpad(kor, 10, '*') AS 국어, mat AS 수학, eng AS 영어 
		FROM student WHERE NAME='전공사';
		
SELECT length(substr(replace(concat(NAME, '님'), '님', '형'),1,2)) AS 이름,
	 lpad(kor, 10, '*') AS 국어, mat AS 수학, eng AS 영어 
	 	FROM student WHERE NAME='전공사'; # 한글자의 3바이트 두글자 6바이트
################################################################################################


SELECT * FROM  school;
SELECT * FROM student;
################################################################################################
# 문제 
#전공인의 국어: 80, 영어 : 90으로 변경하고 합계와 평균 그리고 grade 수정
#	계산을 수동으로 하고 변화만 적용하시요
#student중  kor mat 점수만 출력하세요
#student중 average 가 90 이상인 사람의 NAME, schoolcode를 출력
#student중 둫 점술르 출력하되 그이름은 영어 로 하세요
#이름 가운데 자가 공인 사람을 모드 출력
#학교 이름아 충주 여자 고등하교인 사람의 NAME,. total 
#student total을 이용하여 정렬 상위 2사람
# 1.
UPDATE student SET kor = 80 WHERE NAME='전공인';
UPDATE student SET eng = 90 WHERE NAME='전공인';
UPDATE student SET total = kor+mat+eng WHERE NAME = '전공인';
UPDATE student SET average = round(total /3, 2), grade='B' WHERE NAME = '전공인';
UPDATE student SET average = round(total /3, 2), grade=(
	case when average >= 90 then 'A'
	when (average >= 80 and average < 90) then 'B'
	when (average >= 70 AND average < 80) then 'C'
	when (average >= 60 AND average < 70) then 'D'
	ELSE 'F'
END)
	 WHERE NAME = '전공인';

# 2. 
SELECT kor, mat FROM student;

# 3.
SELECT st.name, sc.schoolname from student st INNER JOIN school sc ON st.schoolcode = sc.schoolcode and  st.average > 90 ;

# SELECT NAME, schoolcode FROM student WHERE average >= 90;

# 4.
SELECT eng AS 영어 FROM student;

# 5.
SELECT * FROM student WHERE NAME LIKE '_공_';

# 6.
SELECT st.name, sc.schoolname from student st INNER JOIN school sc ON st.schoolcode = sc.schoolcode and  sc.schoolname = '충주여자고등학교' ;

SELECT NAME, total FROM student WHERE schoolcode IN (SELECT schoolcode from school WHERE schoolname='충주여자고등학교');

# 7. 
SELECT * FROM student ORDER BY total DESC LIMIT 2;

# 저장프로시져 연습
CALL student_select();
CALL student_insert('제주도', 100, 100, 100, 'SE00000001', @res);
SELECT @res;
################################################################################################
SELECT * FROM  school;
SELECT * FROM student;
################################################################################################

# 이름을 변경하는 프로시져를 작성하시오
CALL student_updatename('제주도','제주', @res);
SELECT @res

CALL student_sum();

CALL student_updatenoe();
SELECT * FROM student;