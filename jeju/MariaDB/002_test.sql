INSERT INTO user VALUES('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, 20130505);
INSERT INTO user VALUES('EJW', '은지원', 1972, '경북', '011', '88888888', 174, 20140303);
INSERT INTO user VALUES('JKW', '조관우', 1965, '경기', '018', '99999999', 172, 20101010);
INSERT INTO user VALUES('JYP', '조용필', 1950, '경기', '011', '44444444', 166, 20090404);
INSERT INTO user VALUES('KBS', '김범수', 1973, '경남', '011', '22222222', 173, 20120404);
INSERT INTO user VALUES('KKH', '김경호', 1971, '전남', '019', '33333333', 177, 20070707);
INSERT INTO user VALUES('LJB', '임재범', 1963, '서울', '016', '66666666', 182, 20090909);
INSERT INTO user VALUES('LSG', '이승기', 1997, '서울', '011', '11111111', 182, 20080808);
INSERT INTO user(userid, NAME, birthYear, addr, height, mDate) VALUES('SSK', '성시경', 1979, '서울', 186, 20131212);
INSERT INTO user(userid, NAME, birthYear, addr, height, mDate) VALUES('YJS', '윤종신', 1969, '경남', 170, 20050505);

###########################################################################################################################
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('KBS', '운동화', '전자', 30, 2);
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('KBS', '노트북', '전자', 1000, 1);
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('JYP', '모니터', '전자', 200, 1);
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('BBK', '모니터', '전자', 200, 5);
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('KBS', '청바지', '의류', 50, 3);
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('BBK', '메모리', '전자', 80, 10);
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('SSK', '책', '서적', 15, 5);
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('EJW', '책', '서적', 15, 2);
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('EJW', '청바지', '의류', 50, 1);
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('BBK', '운동화', '전자', 30, 2);
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('EJW', '책', '서적', 15, 1);
INSERT INTO buylist(userid, prodname, groupname, price, amount) VALUES('BBK', '운동화', '서적', 30, 2);


SELECT * FROM user;
SELECT * FROM buylist;
delte
#bbk가 구매한 데인터
SELECT * FROM buylist WHERE userid = 'BBK';

#김씨인 사람중 이름과 키를 기준으로 이름 키 주소를 내림 차순으로 출력(이름 뒤에 님 붙여서)
SELECT concat(NAME, '님'), height, addr FROM user WHERE NAME LIKE '김%' ORDER BY NAME, height DESC;

#USER출생년도별 오름차순 이름 주소 키, 충생년도(이름 성 빼고)
SELECT substr(NAME,2,3) AS name, addr, height, birthYear FROM user ORDER BY birthYear ASC;

#모바일 번호가 011로 시작하는 사람이 몇명인지
SELECT COUNT(*) FROM user WHERE mobile1 = '011';

#출생년도가 1960년에서 1979년 까지 태어난 사라들이 구매한 품목
SELECT prodname from buylist WHERE userid IN(SELECT userid from user WHERE birthYear BETWEEN 1960 AND 1979);

#userid별로 구매한 price, amount합계를 출력(이때 userid는name으로 출력
SELECT us.name, SUM(bu.price) AS total_price, sum(bu.amount) AS total_amount FROM user us INNER JOIN buylist bu ON us.userid = bu.userid GROUP BY us.userid;

#주소가 서울인 사람이 구매한 총금액
SELECT SUM(price*amount) AS total_price FROM buylist WHERE userid IN( SELECT userid from user WHERE addr LIKE '서울');

#품목별 판매 총액
SELECT groupname, SUM(price*amount) AS total_price FROM buylist GROUP BY groupname;

#출생년도가 1970 이상인 사람을 대상으로 구매한 갯수가 2개 이상인 것의 판매 총합계
SELECT us.NAME AS name, SUM(bu.price*bu.amount) AS total_price FROM user us 
	INNER JOIN buylist bu ON us.userid = bu.userid WHERE us.birthYear >= 1970 and bu.amount >= 2;
	
#모든유저를 출려 (이름중에 김끼와 조씨는 모두 컬씨로 바꿔서)
SELECT replace(REPLACE(NAME, '김', '컬'), '조', '컬') AS NAME FROM user;

#책을 구매한 사람의 이름 출생년도 주소를 출려
SELECT NAME, birthYear, addr FROM user WHERE userid IN(SELECT userid FROM buylist WHERE prodname = '책');