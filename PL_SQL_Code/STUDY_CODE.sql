--01045020614 처럼 전화번호에 -가 안붙어 있다면 붙여주는 코드
--PNUM이 전화번호 0187924758 처럼 옛날 번호도 가능
SELECT SUBSTR(REPLACE(PNUM, '01'||SUBSTR(PNUM, 3, 1), '01'||SUBSTR(PNUM, 3, 1)||'-'), 1, LENGTH(PNUM) - 3)||SUBSTR(REPLACE(PNUM, SUBSTR(PNUM, -5, 1), SUBSTR(PNUM, -5, 1)||'-'), -5) AS 전화번호 FROM PHONE;-- REPLACE(SUBSTR(PNUM, 3) != '-', ;




-- 연습문제 풀이

--SELECT DEPNO, DNAME, AVG_SAL, MAX_SAL, MIN_SAL, CNT FROM EMP;

--SELECT D.DEPTNO, D.DNAME, AVG(SAL) AVG_SAL, MAX(SAL) MAX_SAL, MIN(SAL) MIN_SAL, COUNT(*) CNT FROM DEPT D, EMP E WHERE DEPTNO <= 30;

--DO IT 239-2번 문제
SELECT D.DEPTNO, D.DNAME, TRUNC(AVG(SAL)) AVG_SAL, MAX(SAL) MAX_SAL, MIN(SAL) MIN_SAL, COUNT(*) CNT FROM DEPT D, EMP E WHERE D.DEPTNO = E.DEPTNO GROUP BY D.DEPTNO, D.DNAME;

SELECT E.ENAME FROM DEPT D, EMP E;

--DO IT 239-3번 문제
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.EMPNO, E.JOB, E.SAL FROM EMP E, DEPT D WHERE E.DEPTNO(+) = D.DEPTNO GROUP BY D.DEPTNO, D.DNAME, E.ENAME, E.EMPNO, E.JOB, E.SAL ORDER BY DEPTNO;

--영운(GROUP BY 삭제: 필요 없었음)
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO "DEPTNO_1", S.GRADE, S.LOSAL, S.HISAL, M.EMPNO, M.ENAME
FROM EMP E, EMP M, DEPT D, SALGRADE S WHERE D.DEPTNO = E.DEPTNO(+) AND E.MGR = M.EMPNO(+) AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+)
GROUP BY D.DEPTNO, D.DNAME,  E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO, S.GRADE, S.LOSAL, S.HISAL, M.EMPNO, M.ENAME ORDER BY D.DEPTNO;

--영운(최종)
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO "DEPTNO_1", S.GRADE, S.LOSAL, S.HISAL, M.EMPNO, M.ENAME
FROM EMP E, EMP M, DEPT D, SALGRADE S WHERE D.DEPTNO = E.DEPTNO(+) AND E.MGR = M.EMPNO(+) AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+) ORDER BY D.DEPTNO, E.EMPNO;

--시연
SELECT C.DEPTNO,DNAME,A.EMPNO,A.ENAME,A.MGR,A.SAL,A.DEPTNO DEPTNO_1,D.LOSAL,D.HISAL,D.GRADE,A.MGR,B.ENAME
FROM EMP 
A RIGHT OUTER JOIN DEPT C ON A.DEPTNO = C.DEPTNO
LEFT JOIN SALGRADE D ON A.SAL BETWEEN D.LOSAL AND D.HISAL
LEFT JOIN EMP B ON A.MGR = B.EMPNO
ORDER BY C.DEPTNO,A.EMPNO;

-- HAVING E.SAL BETWEEN S.LOSAL AND S.HISAL
-- SAL BETWEEN '1991-09-01' AND '1991-09-30'

SELECT * FROM EMP;

SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO FROM EMP;

SELECT * FROM EMP ORDER BY DEPTNO, ENAME;


--DO IT 174~5 페이지

--1번
SELECT EMPNO, RPAD(SUBSTR(EMPNO, 1, 2), LENGTH(EMPNO), '*') AS MASKING_EMPNO, ENAME, RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') MASKING_ENAME FROM EMP WHERE LENGTH(ENAME) = 5;

--2번
SELECT  EMPNO, ENAME, SAL, SAL, TRUNC(SAL/21.5, 2) AS DAY_PAY, ROUND(SAL/21.5/8, 1) AS TIME_PAY FROM EMP;  

--3번
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') AS HIREDATE, TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월'), 'YYYY-MM-DD') AS R_JOB, NVL2(COMM, TO_CHAR(COMM), 'N/A') FROM EMP;

--4번
SELECT EMPNO, ENAME, MGR,
(CASE 
	WHEN MGR IS NULL THEN 
		'0000'
	WHEN SUBSTR(MGR, 1,2) = '75' THEN 
		'5555'
	WHEN SUBSTR(MGR, 1,2) = '76' THEN 
		'6666'
	WHEN SUBSTR(MGR, 1,2) = '77' THEN 
		'7777'
	WHEN SUBSTR(MGR, 1,2) = '78' THEN 
		'8888'
	ELSE TO_CHAR(MGR)
END) AS CHG_MGR
FROM EMP;


--DO IT 213-5번
SELECT 
DEPTNO, TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, COUNT(*) AS CNT, MAX(SAL) AS MAX_SAL, SUM(SAL) AS SUM_SAL, AVG(SAL) AS AVG_SAL 
FROM EMP GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));

--DO IT 125~6페이지
--1번
SELECT * FROM EMP WHERE ENAME LIKE '%S';

--2번
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

--3번
	--집합 연산자X
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE DEPTNO IN(20, 30) AND SAL > 2000; 

	--집합 연산자O
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE DEPTNO = 30 AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE DEPTNO = 20 AND SAL > 2000; 

--4번
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO FROM EMP WHERE SAL < 2000 OR SAL > 3000;


--5번
SELECT ENAME, EMPNO, SAL, DEPTNO FROM EMP WHERE ENAME LIKE '%E%' AND DEPTNO = 30 AND (SAL NOT BETWEEN 1000 AND 2000);

--6번
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP 
WHERE COMM IS NULL
	AND MGR IS NOT NULL
	AND (JOB = 'CLERK' OR JOB = 'MANAGER') AND NOT ENAME LIKE '_L%';


SELECT RPAD(SUBSTR(EMPNO, 1, 1), LENGTH(EMPNO), '*') FROM EMP;

SELECT LPAD(SUBSTR(EMPNO, -1), LENGTH(EMPNO), '*') FROM EMP;


SELECT TRIM(LPAD(SUBSTR(EMPNO, -1), LENGTH(EMPNO))) FROM EMP;

SELECT MOD(10, 0) FROM DUAL;


SELECT * FROM EMP;


SELECT TO_NUMBER('1300') - TO_NUMBER('1500') FROM DUAL;  

SELECT DECODE(MGR, '7698', 'BLAKE') AS MGRT FROM EMP;

SELECT (CASE  WHEN MGR = 7698 THEN 'BLAKE' ELSE NULL END) AS MGRT FROM EMP;

SELECT COUNT(EMPNO), SUM(COMM)/14, AVG(COMM) FROM EMP;

SELECT SUM(DISTINCT SAL), SUM(ALL SAL), SUM(SAL) FROM EMP;

SELECT SUM(SAL), SUM(COMM) FROM EMP;

SELECT COUNT(DISTINCT JOB) FROM EMP;

SELECT DEPTNO, EMPNO 직원번호, 
		SAL 연봉, 
		ROUND(AVG(SAL) OVER(PARTITION by DEPTNO)) 직원평균연봉, 
		SUM(SAL) OVER(PARTITION BY DEPTNO) 전체연봉
FROM EMP;

SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO;

SELECT DEPTNO, JOB, AVG(SAL) FROM EMP GROUP BY DEPTNO, JOB ORDER BY DEPTNO;

SELECT DEPTNO, JOB, SAL, AVG(SAL) FROM EMP GROUP BY DEPTNO, JOB, SAL ORDER BY DEPTNO;

SELECT * FROM EMP ORDER BY DEPTNO;

SELECT DEPTNO, JOB, SAL, AVG(SAL) FROM EMP WHERE DEPTNO  >= 20 GROUP BY DEPTNO, JOB, SAL ORDER BY DEPTNO;

SELECT DEPTNO, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO) ORDER BY DEPTNO;

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO, JOB) ORDER BY DEPTNO;

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) FROM EMP GROUP BY CUBE(DEPTNO, JOB) ORDER BY DEPTNO;

SELECT DEPTNO, JOB, SAL, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) FROM EMP GROUP BY ROLLUP (DEPTNO, JOB, SAL) ORDER BY DEPTNO;

SELECT DEPTNO, JOB, SAL, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) FROM EMP GROUP BY CUBE (DEPTNO, JOB, SAL) ORDER BY DEPTNO;

--DO IT 212~213페이지
--1번
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT
FROM EMP GROUP BY DEPTNO;

--2번
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB HAVING COUNT(*) >= 3;


--3번
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM EMP GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO ;


--4번
--0은 추가수당이 존재하는 것이라고 판단하는 코드
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM, COUNT(*) AS CNT FROM EMP GROUP BY NVL2(COMM, 'O', 'X');

-- 0과 NULL을 둘다 추가수당(COMM) 이 없다고 판단해서 출력하는 코드
SELECT DECODE(COMM, NULL, 'X', 0, 'X', 'O') AS EXIST_COMM, COUNT(DECODE(COMM, NULL, 0, 0, 0, 1)) AS CNT FROM EMP GROUP BY DECODE(COMM, NULL, 0, 0, 0, 1), DECODE(COMM, NULL, 'X', 0, 'X', 'O');
--좋은 코드는 아닌듯...

--여기 조건은 생각해야될 것이, COMM의 값이 0이나 NULL이나 사실상 못받는 건 똑같다고 봐야하는건지?
--일단 동일하다고 생각하고 코드 작성하자


SELECT * FROM emp;

--5번
SELECT
DEPTNO, TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, COUNT(*) AS CNT, MAX(SAL) AS MAX_SAL, SUM(SAL) AS SUM_SAL, AVG(SAL) AS AVG_SAL 
FROM EMP GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));

SELECT * FROM EMP E, SALGRADE S

--DO IT 287~289
--1번
INSERT INTO DEPT VALUES(50, 'ORACLE', 'BUSAN');
INSERT INTO DEPT VALUES(60, 'SQL', 'ILSAN');
INSERT INTO DEPT VALUES(70, 'SELECT', 'INCHEON');
INSERT INTO DEPT VALUES(80, 'DML', 'BUNDANG');
--내가 보기에는 거꾸로 들어갔는데 뭐가 순서가 맞는건가?

--2번
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES(7201, 'TEST_USER1', 'MANAGER', 7788, TO_DATE('2016-01-02'), 4500, NULL, 50);
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES(7202, 'TEST_USER2', 'CLERK', 7201, TO_DATE('2016-02-21'), 1800, NULL, 50);
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES(7203, 'TEST_USER3', 'ANALYST', 7201, TO_DATE('2016-04-11'), 3400, NULL, 60);
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES(7204, 'TEST_USER4', 'SALESMAN', 7201, TO_DATE('2016-05-31'), 2700, 300, 60);
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES(7205, 'TEST_USER5', 'CLERK', 7201, TO_DATE('2016-07-20'), 2600, NULL, 70);
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES(7206, 'TEST_USER6', 'CLERK', 7201, TO_DATE('2016-09-09'), 2600, NULL, 70);
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES(7207, 'TEST_USER7', 'LECTURER', 7201, TO_DATE('2016-10-28'), 2300, NULL, 80);
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES(7208, 'TEST_USER8', 'STUDENT', 7201, TO_DATE('2018-03-09'), 1200, NULL, 80);

--3번
UPDATE EMP SET DEPTNO = 70 WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 50);

--4번
UPDATE EMP SET DEPTNO = 80, SAL=SAL*1.1 WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO = 60);

SELECT * FROM EMP ORDER BY DEPTNO;

--5번
DELETE FROM EMP WHERE EMPNO IN(SELECT EMPNO FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND GRADE = 5);


--DO IT 262~263
--1번
SELECT JOB, EMPNO, ENAME, SAL, E.DEPTNO, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');


--2번
SELECT E.EMPNO, ENAME, DNAME, TO_CHAR(HIREDATE, 'YYYY') AS HIREDATE, LOC, SAL, GRADE 
FROM EMP E, DEPT D, SALGRADE S 
WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN S.LOSAL AND S.HISAL AND SAL > (SELECT AVG(SAL) FROM EMP) ORDER BY SAL DESC, E.EMPNO;

--3번
--A부터 차례로 접근해가면서 만들었다. 앞으로도 이런 방법이 좋을 듯. 뭔가 내 자신이 논리적으로 이해하면서 만든다는 느낌이 든다.

--A. 30번 부서에 존재하는 부서 출력
SELECT DISTINCT JOB FROM EMP WHERE DEPTNO = 30;

--B. 30번 부서에서 존재하지 않는 JOB을 출력
SELECT DISTINCT JOB FROM EMP WHERE JOB NOT IN(SELECT DISTINCT JOB FROM EMP WHERE DEPTNO = 30);

--C. 부서번호가 10번인 사람들의 출력(EMP와 DEPT를 조인해서 뒤에 DNAME과 LOC이 나오도록했다.)
SELECT EMPNO, ENAME, JOB, E.DEPTNO, DNAME, LOC 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 10 
ORDER BY E.ENAME;

--D. 최종 코드
SELECT EMPNO, ENAME, JOB, E.DEPTNO, DNAME, LOC 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO 
	AND E.DEPTNO = 10 
	AND JOB IN
		(SELECT DISTINCT JOB 
		 	FROM EMP 
			WHERE JOB NOT IN
					(SELECT DISTINCT JOB 
						FROM EMP 
						WHERE DEPTNO = 30));
ORDER BY E.ENAME;


--4번
--다중행 함수 사용
--A. 직책이 SALESMAN인 사람들의 최고급여

SELECT
	MAX(SAL)
FROM 
	EMP 
WHERE 
	JOB = 'SALESMAN';

--B. 최종코드
SELECT
	EMPNO,
	ENAME,
	SAL,
	GRADE
FROM 
	EMP,
	SALGRADE
WHERE
	SAL 
		BETWEEN 
			LOSAL 
			AND 
			HISAL
	AND
	SAL > 	(SELECT
				MAX(SAL)
			FROM 
				EMP 
			WHERE 
				JOB = 'SALESMAN')
ORDER BY EMPNO;

--다중행 함수 '미'사용
--A. 직책이 SALESMAN인 사람들의 최고급여
SELECT
	SAL
FROM 
	EMP 
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');

--B. 최종코드
SELECT
	EMPNO,
	ENAME,
	SAL,
	GRADE
FROM 
	EMP,
	SALGRADE
WHERE
	SAL 
		BETWEEN 
			LOSAL 
			AND 
			HISAL
	AND
	SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
ORDER BY EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.DEPTNO AS MGR_EMPNO, E1.ENAME AS MGR_ENAME
FROM EMP E1 JOIN DEPT E2 ON (E1.DEPTNO = E2.DEPTNO)
WHERE SAL <=
ORDER BY E1.EMPNO;

SELECT  * FROM EMP;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, MGR, SAL, E.DEPTNO, LOSAL, HISAL, GRADE,  * FROM EMP E OUTER JOIN DEPT D WHERE 


SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO AS DEPTNO_1, LOSAL, HISAL, GRADE, M.EMPNO AS MGR_EMPNO, M.ENAME AS MGR_ENAME
FROM DEPT D LEFT OUTER JOIN EMP E ON(D.DEPTNO = E.DEPTNO) 
			LEFT OUTER JOIN SALGRADE S ON(SAL BETWEEN LOSAL AND HISAL) 
			LEFT OUTER JOIN EMP M ON(E.MGR = M.EMPNO)
ORDER BY D.DEPTNO , E.EMPNO;

CREATE TABLE EMP_RECORD AS SELECT * FROM EMP WHERE 1 <> 1;
SELECT * FROM EMP_RECORD;

BEGIN
INSERT INTO EMP_RECORD(EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO) VALUES(1111, 'TEST_USER', 'TEST_JOB', TO_DATE(SYSDATE, 'YYYY-MM-DD'), 3000, 40);
END;



BEGIN
FOR K IN (SELECT 사원명, 직급 FROM 사원) LOOP
I := I + 1;
SANAME_COL(I) := K.사원명;
SAJIK_COL(I) := K.직급;
END LOOP;


DECLARE
TYPE EDATA IS TABLE OF EMP%ROWTYPE
INDEX BY BINARY_INTEGER;

EMPDATA EDATA;

I BINARY_INTEGER := 0;
BEGIN
FOR K IN (SELECT * FROM EMP) LOOP
I := I + 1;
EMPDATA(I).EMPNO := K.EMPNO;
EMPDATA(I).ENAME := K.ENAME;
EMPDATA(I).JOB := K.JOB;
EMPDATA(I).MGR := K.MGR;
EMPDATA(I).HIREDATE := K.HIREDATE;
EMPDATA(I).SAL := K.SAL;
EMPDATA(I).COMM := K.COMM;
EMPDATA(I).DEPTNO := K.DEPTNO;

--SELECT ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
--ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO 출력할 것들

DBMS_OUTPUT.PUT_LINE(TO_CHAR(EMPDATA(I).EMPNO)||' : '||EMPDATA(I).ENAME||' : '||EMPDATA(I).JOB||' : '||TO_CHAR(EMPDATA(I).MGR)||' : '|| TO_CHAR(EMPDATA(I).HIREDATE, 'YY/MM/DD')||' : '|| 
TO_CHAR(EMPDATA(I).SAL)||' : '||TO_CHAR(EMPDATA(I).COMM)||' : '|| TO_CHAR(EMPDATA(I).DEPTNO));

END LOOP;
END;

DECLARE
V_DEPTNO DEPT.DEPTNO%TYPE := 50;
V_DNAME DEPT.DNAME%TYPE;
BEGIN
IF V_DEPTNO IN(10, 20, 30, 40) THEN
	SELECT DNAME INTO V_DNAME FROM DEPT WHERE DEPTNO = V_DEPTNO;
ELSE
	V_DNAME := 'N/A';
END IF;
--DBMS_OUTPUT.PUT_LINE('DNAME: ' || (SELECT DNAME FROM DEPT WHERE DEPTNO = V_DEPTNO));
DBMS_OUTPUT.PUT_LINE('DNAME: '|| V_DNAME);
END;


DECLARE
BEGIN
FOR K IN 1..10 LOOP
IF MOD(K,2) != 0 THEN
DBMS_OUTPUT.PUT_LINE('현재 i의 값: '|| TO_CHAR(K));
END IF;
--DBMS_OUTPUT.PUT_LINE('DNAME: ' || (SELECT DNAME FROM DEPT WHERE DEPTNO = V_DEPTNO));
END LOOP;
END;


--478P LOOP방식
DECLARE
V_EMP_ROW EMP%ROWTYPE;
CURSOR c1 IS SELECT * FROM EMP;

BEGIN
OPEN c1;

LOOP
FETCH c1 INTO V_EMP_ROW;
EXIT WHEN c1%NOTFOUND;

DBMS_OUTPUT.PUT_LINE('EMPNO: ' || TO_CHAR(V_EMP_ROW.EMPNO) || ', ENAME: ' || V_EMP_ROW.ENAME
						|| ', JOB: ' || V_EMP_ROW.JOB || ', SAL: ' || TO_CHAR(V_EMP_ROW.SAL) || ', DEPTNO: ' || TO_CHAR(V_EMP_ROW.DEPTNO));
END LOOP;
CLOSE c1;
END;

--478P FOR LOOP방식
DECLARE
V_EMP_ROW EMP%ROWTYPE;
CURSOR c1 IS SELECT * FROM EMP;
BEGIN
FOR K IN c1 LOOP
DBMS_OUTPUT.PUT_LINE('EMPNO: ' || TO_CHAR(K.EMPNO) || ', ENAME: ' || K.ENAME
						|| ', JOB: ' || K.JOB || ', SAL: ' || TO_CHAR(K.SAL) || ', DEPTNO: ' || TO_CHAR(K.DEPTNO));
END LOOP;
END;


--479P
DECLARE
v_wrong DATE;
BEGIN
	SELECT ENAME INTO v_wrong
	FROM EMP
	WHERE EMPNO = 7369;
	DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실해되지 않습니다.');
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('오류가 발생하였습니다.' ||'[' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') || ']');
	DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
	DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
	--예외처리 부분
END;

































