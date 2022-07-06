--LEE 

SELECT * FROM CUSTOM;

SELECT USERNAME, RPAD(SUBSTR(JUMIN, 1, 8), 14, '*') JUMIN FROM CUSTOM;


SELECT * FROM CUSTOM;

SELECT ADDR1, COUNT(*), ROUND(AVG(POINT)) FROM CUSTOM GROUP BY ADDR1;

SELECT SEX, COUNT(*), ROUND(AVG(AGE)) FROM CUSTOM GROUP BY SEX; 

SELECT CASE SEX WHEN '1' THEN '남자' WHEN '0' THEN '여자' END GENDER, COUNT(*), ROUND(AVG(AGE)) FROM CUSTOM GROUP BY SEX;

SELECT CASE 컬럼명
	WHEN 1 THEN 100
	WHEN 2 THEN 200
	WHEN 3 THEN 300
	WHEN 4 THEN 400
	ELSE 500
END AS 별칭
FROM DUAL;
	
SELECT
CASE 컬럼명 WHEN 1 THEN 100 ELSE 0,
CASE 컬럼명 WHEN 2 THEN 200 ELSE 0,
CASE 컬럼명 WHEN 3 THEN 300 ELSE 0,
CASE 컬럼명 WHEN 4 THEN 400 ELSE 0,
FROM DUAL;
	
	
SELECT * FROM CUSTOM;

SELECT CASE ADDR1
WHEN '서울특별시' THEN '서울'
WHEN '경기도' THEN '경기'
WHEN '경상남도' THEN '경남'
END ADDR
FROM CUSTOM;


--JOIN문
--EQUIE JOIN(INNER JOIN)
--NON-EQUIE JOIN
--OUTER JOIN
--CROSS JOIN
--SELF JOIN

SELECT * FROM TAB;


SELECT * FROM CUSTOM;
SELECT * from COMPAny;
SELECT * FROM COMPANY WHERE USERID = 'nu7634';
SELECT * FROM CUSTOM WHERE USERNAME = '신동오';
SELECT * FROM POINT WHERE USERID = 'nu7634';
SELECT * FROM SALES WHERE USERID = 'nu7634';


--EQUIE JOIN(INNER JOIN)
SELECT A.USERID, USERNAME, AGE, ADDR1, B.USERID, COMPANY, PAY
FROM CUSTOM A, COMPANY B
WHERE A.USERID = B.USERID;

--이 방법이 표준이지만 지금은 둘다 가능하다.
SELECT A.USERID, USERNAME, AGE, ADDR1, B.USERID, COMPANY, PAY
FROM CUSTOM A INNER JOIN COMPANY B
ON A.USERID = B.USERID ORDER BY AGE;

--'CUSTOM'에서 UserID, UserName을 검색하고 POINT 테이블에서 제품 구입, 로그인에 관계된 POINT점수(Product, Login)을 검색
SELECT A.USERID, USERNAME, PRODUCT, LOGIN
FROM CUSTOM A, POINT B
WHERE A.USERID = B.USERID AND LOGIN >= 10 ORDER BY LOGIN;

SELECT A.USERID, USERNAME, PRODUCT, LOGIN
FROM CUSTOM A INNER JOIN POINT B
ON A.USERID = B.USERID
WHERE LOGIN >= 10; -- AND LOGIN >= 10 ORDER BY LOGIN;

--OUTER JOIN(외부조인)

SELECT COUNT(*) FROM CUSTOM;	--459
SELECT COUNT(*) FROM COMPANY;	--464


SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A , COMPANY B
WHERE A.USERID = B.USERID(+)
ORDER BY B.COMPANY DESC;


SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A , COMPANY B
WHERE A.USERID(+) = B.USERID;
ORDER BY B.COMPANY DESC;


---------------------------------------------------------------------------
--현재 데이터의 수가 서로 다르므로 조인할때 어떤 것을 기준으로 할 것인지 정해주는 방법
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A LEFT OUTER JOIN COMPANY B
ON A.USERID = B.USERID
ORDER BY B.COMPANY DESC;


SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A RIGHT OUTER JOIN COMPANY B
ON A.USERID(+) = B.USERID;
ORDER BY B.COMPANY DESC;



--CROSS JOIN(상호 조인)
-- 459*464 약 21만개
SELECT A.USERID, USERNAME, AGE, ADDR1, B.USERID, COMPANY, PAY
FROM CUSTOM A, COMPANY B;

SELECT A.USERID, USERNAME, AGE, ADDR1, B.USERID, COMPANY, PAY
FROM CUSTOM A CROSS JOIN COMPANY B;

SELECT A.USERID, USERNAME, AGE, ADDR1, B.USERID, COMPANY, PAY
FROM CUSTOM A CROSS JOIN COMPANY B WHERE A.USERID = B.USERID;	--이렇게 WHERE 조건을 주면 INNER JOIN이 된다.

--SELF JOIN
SELECT * FROM CUSTOM ORDER BY USERNAME;

SELECT DISTINCT A.* FROM CUSTOM A, CUSTOM B WHERE A.USERNAME = B.USERNAME AND A.USERID <> B.USERID ORDER BY A.USERNAME;


--'CUSTOM' 테이블에서 '제주도'에 살고 있는 사람 중에 동일한 이름을 갖는 행을 검색
SELECT A.*
FROM CUSTOM A INNER JOIN CUSTOM B
ON A.USERNAME = B.USERNAME
WHERE A.USERID <> B.USERID AND A.ADDR1 = '제주도' AND B.ADDR1 = '제주도';
	
	
SELECT A.* FROM CUSTOM A, CUSTOM B WHERE A.ADDR1 = '제주도' AND B.ADDR1 = '제주도' AND A.USERNAME = B.USERNAME AND  A.USERID <> B.USERID;
-- AND B.ADDR1 = '제주도') AND A.USERNAME = B.USERNAME ORDER BY A.USERNAME;


--3개 이상의 테이블
--CUSTOM: USERID, USERNAME
--COMPANY: COMPANY, DEPTH
--POINT: PRODUCT, LOGIN

	
SELECT M.USERID, M.USERNAME, C.COMPANY, C.DEPT, P.PRODUCT, P.LOGIN FROM
CUSTOM M, COMPANY C, POINT P WHERE M.USERID = C.USERID AND M.USERID = P.USERID;



SELECT A.USERID, USERNAME, COMPANY, DEPT, PRODUCT, LOGIN
FROM CUSTOM A INNER JOIN COMPANY B
ON A.USERID = B.USERID INNER JOIN POINT C
ON A.USERID = C.USERID;

--파생 테이블과 조인

SELECT * FROM SALES;

--아이디별로  판매횟수와 판매금액의 합 검색
SELECT USERID, COUNT(*) CNT, SUM(PRICE) 합 FROM SALES GROUP BY USERID HAVING SUM(PRICE) >= 2000000;


--INLINE-VIEW
SELECT A.USERID, USERNAME, ADDR1, HAP
FROM CUSTOM A ,(
SELECT USERID, SUM(PRICE) HAP FROM SALES
GROUP BY USERID HAVING SUM(PRICE) >= 1500000) B
WHERE A.USERID = B.USERID;


SELECT * FROM CUSTOM;

CREATE TABLE JEJU
AS
SELECT * FROM CUSTOM WHERE ADDR1 = '제주도';

CREATE TABLE SEOUL
AS
SELECT * FROM CUSTOM WHERE ADDR1 = '서울특별시';

CREATE TABLE KYUNG
AS
SELECT * FROM CUSTOM WHERE ADDR1 = '경기도';

SELECT * FROM TAB;

SELECT * FROM JEJU;
SELECT * FROM SEOUL;
SELECT * FROM KYUNG;

SELECT * FROM 
(
	SELECT * FROM JEJU
	UNION
	SELECT * FROM SEOUL
	UNION
	SELECT * FROM KYUNG
) ORDER BY USERID DESC;

--SUBQUERY(하위 쿼리)
--COMPANY 테이블에서 USERID, COMPANY, DEPT, PAY, 평균월급

SELECT * FROM COMPANY;

SELECT ROUND(AVG(PAY)) A_PAY FROM COMPANY;

SELECT USERID, COMPANY, DEPT PAY,
(
	SELECT ROUND(AVG(PAY)) A_PAY FROM COMPANY
) A_PAY
FROM COMPANY;


--CUSTOM 테이블에서 평균 나이보다 많은 사원의 정보 검색
SELECT * FROM CUSTOM;

SELECT ROUND(AVG(AGE)) FROM CUSTOM;

SELECT * FROM CUSTOM WHERE AGE>=(SELECT ROUND(AVG(AGE)) FROM CUSTOM);

--현대자동차 그룹에 근무하는 직원
SELECT * FROM COMPANY WHERE COMPANY='현대자동차 서비스';
SELECT * FROM COMPANY WHERE COMPANY LIKE '현대자동차 서비스';
SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차 서비스';

SELECT * FROM CUSTOM WHERE USERID IN(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');
SELECT * FROM CUSTOM WHERE USERID NOT IN(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');

SELECT A.* FROM CUSTOM A, COMPANY B WHERE A.USERID = B.USERID AND COMPANY LIKE '현대자동차%';

--4회 이상 판매 기록이 있는 고객들의 기본 정보를 검색

SELECT * FROM SALES;

--SELECT A.* FROM CUSTOM A, SALES B WHERE A.USERID = B.USERID AND  SELECT * FROM SALES WHERE USERID COUNT(B.USERID) >= 4;-- ORDER BY A.USERID ;


SELECT * FROM CUSTOM A WHERE (SELECT * FROM SALES S WHERE COUNT(A.USERID = S.USERID);-- ORDER BY A.USERID ;

--4회 이상 판매기록이 있는 고객
SELECT USERID, COUNT(*) CNT FROM SALES GROUP BY USERID HAVING COUNT(*) >=4; 

--하위 쿼리 방식
--4회 이상 판매 기록이 있는 고객의 기본 정보 출력(위의 코드를 그대로 넣어줬다. COUNT는 빼고
SELECT * FROM CUSTOM WHERE USERID IN(SELECT USERID FROM SALES GROUP BY USERID HAVING COUNT(*) >=4);


--4회 이상 판매 기록이 있는 고객의 기본 정보를 조인으로 출력 (INLINE_JOIN)
SELECT A.*, CNT 
FROM CUSTOM A, 
(SELECT USERID, COUNT(*) CNT FROM SALES
GROUP BY USERID HAVING COUNT(*) >=4)
B WHERE A.USERID = B.USERID;


--ANY(범위가 포함), ALL(범위가 미포함)
-- > ANY: 최소값보다 큰 데이터
-- < ANY: 최대값보다 작은 데이터
-- > ALL: 최대값보다 큰 데이터
-- < ALL: 최소값보다 작은 데이터

SELECT POINT FROM CUSTOM WHERE ADDR1 = '제주도' ORDER BY POINT;
--최소값 132, 최대값 269

--ANY의 사용법
SELECT * FROM CUSTOM WHERE POINT > ANY (SELECT POINT FROM CUSTOM WHERE ADDR1 = '제주도');

SELECT * FROM CUSTOM WHERE POINT > (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1 = '제주도');

------------------------------------------------------------------------------------------

SELECT * FROM CUSTOM WHERE POINT < ANY (SELECT POINT FROM CUSTOM WHERE ADDR1 = '제주도');

SELECT * FROM CUSTOM WHERE POINT > (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1 = '제주도');

------------------------------------------------------------------------------------------


--ALL의 사용법
SELECT * FROM CUSTOM WHERE POINT > ALL (SELECT POINT FROM CUSTOM WHERE ADDR1 = '제주도');

SELECT * FROM CUSTOM WHERE POINT > (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1 = '제주도');

------------------------------------------------------------------------------------------

SELECT * FROM CUSTOM WHERE POINT < ALL (SELECT POINT FROM CUSTOM WHERE ADDR1 = '제주도');

SELECT * FROM CUSTOM WHERE POINT < (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1 = '제주도');


SELECT * FROM CUSTOM;

UPDATE CUSTOM SET POINT = 130 WHERE USERID = 'nu7634';
------------------------------------------------------------------------------------------

SELECT POINT FROM CUSTOM WHERE AGE >= 70;

SELECT * FROM CUSTOM
WHERE POINT > ANY(SELECT POINT FROM CUSTOM WHERE AGE >= 70); --하위쿼리의 결과가 없으면(못 찾으면) ANY는 상위 쿼리도 안나온다.


SELECT * FROM CUSTOM
WHERE POINT < ALL(SELECT POINT FROM CUSTOM WHERE AGE >= 70); --하위쿼리의 결과가 없어도 ALL은 모든 데이터가 출력된다.

------------------------------------------------------------------------------------------

SELECT * FROM CUSTOM
WHERE USERID IN(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');

SELECT * FROM CUSTOM
WHERE USERID = ANY(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');

--위 두개가 같은 출력
------------------------------------------------------------------------------------------

SELECT * FROM CUSTOM
WHERE USERID NOT IN(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');

SELECT * FROM CUSTOM
WHERE USERID <> ALL(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');
--위 두개가 같은 출력
------------------------------------------------------------------------------------------

--하위쿼리를 이용한 방법(IN 이후 부분만 따로도 실행을 할 수 없다.)
SELECT USERID, USERNAME, ADDR1, SCHOL FROM CUSTOM
WHERE USERID IN
(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');

(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%'); --O

--상관쿼리(EXISTS 이후 부분을 따로는 실행을 할 수 없다.)
SELECT USERID, USERNAME, ADDR1, SCHOL FROM CUSTOM
WHERE EXISTS
(SELECT * FROM COMPANY WHERE USERID = CUSTOM.USERID AND COMPANY LIKE '현대자동차%');

(SELECT * FROM COMPANY WHERE USERID = CUSTOM.USERID AND COMPANY LIKE '현대자동차%'); --X

------------------------------------------------------------------------------------------

SELECT * FROM CUSTOM WHERE ADDR1 = '경기도' AND AGE <= 20;

SELECT * FROM (SELECT * FROM CUSTOM WHERE ADDR1 = '경기도' ORDER BY POINT) A
WHERE A.AGE <= 20;

SELECT * FROM TAB;











