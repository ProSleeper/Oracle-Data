--2022-07-04 문제#####################################################################################################################################################################

SELECT * FROM EMP;

--2. EMP 테이블에서 급여가 3000이상인 사원의 정보를 사원번호,이름,담당업무,급여를 출력하는 SELECT 문장을 작성하시오.
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL >= 3000 ORDER BY SAL;


--3. EMP 테이블에서 사원번호가 7782인 사원의 이름과 부서번호를 출력하는 SELECT 문장을 작성하시오.
SELECT ENAME, EMPNO FROM EMP WHERE EMPNO = 7782;


--4. EMP 테이블에서 입사일이 February 20, 1981과 May 1, 1981 사이에 입사한 사원의 이름,업무,입사일을 출력하는 SELECT 문장을 작성하시오. 단 입사일 순으로 출력하시오.
SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '1981-02-20' AND '1981-05-01' ORDER BY HIREDATE;


--5. EMP 테이블에서 부서번호가 10,20인 사원의 모든 정보를 출력하는 SELECT 문장을 작성하시오. 단 이름순으로 정렬하여라.
SELECT * FROM EMP WHERE DEPTNO IN(10, 20) ORDER BY ENAME;


--6. EMP 테이블에서 급여가 1500이상이고 부서번호가 10,30인 사원의 이름과 급여를 출력하는 SELECT 문장을 작성하여라. 단 HEADING을 Employee과 Monthly Salary로 출력하여라.
SELECT ENAME AS "Employee", SAL AS "Monthly Salary" FROM EMP WHERE SAL >=1500 AND DEPTNO IN(10, 30) ORDER by SAL;


--7. EMP 테이블에서 1982년에 입사한 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP WHERE HIREDATE BETWEEN '1982-01-01' AND '1982-12-31';
--이건 이렇게 하면 나오긴 하는데 뭔가 1982년만을 구하는 코드로 하는 게 바람직할듯




--8. EMP 테이블에서 COMM에 NULL이 아닌 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP WHERE NVL(COMM, 0) <> 0;			
SELECT * FROM EMP WHERE NVL2(COMM, 'O', 'X') = 'O';
--위와 아래의 차이는 위를 작성하면서도 궁금했던 건데 NULL 이면 뒤에 지정해준 값을 반환하는데 지금은 0을 지정했다. 근데 해당 값이 원래 0이라면? 이게 문제가 될 수도 있다고 생각했는데, 역시나 다른 함수가 있었다.
--NVL2함수를 이용하면 숫자말고도 다른 값을 지정해 줄 수 있어서 깔끔하게 가져올 수 있을 듯 하다.


--9. EMP 테이블에서 보너스가 급여보다 10%가 많은 모든 종업원에 대하여 이름,급여,보너스를 출력하는 SELECT 문을 작성하여라.
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM >= SAL*0.1;
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM >= ROUND(SAL*0.1);
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM >= TRUNC(SAL*0.1);
--보너스가 급여의 10% 이상이라고 이해했다. 그리고 0.1을 곱해서 급여의 10%를 구했는데 이때 소수점이 나올 수 있는데 그걸 어떻게 처리할 지 경우를 나눠본것이다.
--ROUND는 반올림 해주는데 지금처럼 두번째 인자를 적어주지 않으면 소수점 첫번째 자리에서 반올림해서 정수만 보여준다.
--TRUNC는 소수부분을 전부 버리고 정수만 출력해준다.


--10. EMP 테이블에서 업무가 Clerk이거나 Analyst이고 급여가 1000,3000,5000이 아닌 모든 사원의 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP WHERE JOB IN('CLERK', 'ANALYST') AND NOT SAL IN(1000, 3000, 5000);
SELECT * FROM EMP WHERE JOB IN(UPPER('Clerk'), UPPER('Analyst')) AND NOT SAL IN(1000, 3000, 5000);
--처음에 위에 적힌대로 대소문자 구분해서 적어줬더니 안됐다. 그래서 다시 테이블을 보니 값들이 전부 대문자라서 수정했다.
--위에는 내가 직접 대문자로 적어줬고 아래는 UPPER 함수를 이용해서 다 대문자로 바꿔서 실행했다. 잘된다.


--11. EMP 테이블에서 이름에 L이 두 자가 있고  부서가 30이거나 또는 관리자가 7782인 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP WHERE ENAME LIKE '%LL%' AND (DEPTNO = 30 OR MGR = 7782);
SELECT * FROM EMP WHERE ENAME LIKE '%LL%' AND DEPTNO = 30 OR MGR = 7782;
--여기서 강사님이 말했던 실수를 그대로 했다. '%'를 쓸때는 LIKE를 써야하는데 역시나 =을 쓰고 말았다. 그래도 지금 실수 했으니 다음에 안할 것 같다.
--그리고 어떤 언어에서든 ()연산자의 순위가 가장 높을텐데 아마 PL/SQL도 마찬가지겠지?


--2022-07-05 문제#####################################################################################################################################################################
--1. 현재 날짜를 출력하고 열 레이블은 Current Date로 출력하는 SELECT 문장을 기술하시오.
SELECT SYSDATE "Current Date" FROM DUAL;


--2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장을 기술하시오.
SELECT EMPNO, ENAME, JOB, SAL, ROUND(SAL*1.15) AS "New Salary", ROUND(SAL*0.15) AS "Inscrease" FROM EMP ORDER BY "New Salary";


--3. EMP 테이블에서 이름,입사일,입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,6), '월') FROM EMP;


--4. EMP 테이블에서 이름,입사일, 입사일로부터 현재까지의 월수,급여, 입사일부터 현재까지의 급여의 총계를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, HIREDATE, ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS 월수, SAL, SAL*ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "총 급여" FROM EMP;


--5. EMP 테이블에서 다음의 결과가 출력되도록 작성하시오.
--
--Dream Salary
--
--------------------------------------------------------------
--
--KING earns $5,000.00 monthly but wants $15,000.00
--
--BLAKE earns $2,850.00 monthly but wants $8,550.00
--
--CLARK earns $2,450.00 monthly but wants $7,350.00
--
--. . . . . . . . . .
--
--14 rows selected
SELECT ENAME||' earns' || TO_CHAR(SAL, '$'||'99,999.99') || ' monthly but wants' || TO_CHAR(SAL*3, '$'||'999,999.99') AS "Dream Salary" FROM EMP;



--6. EMP 테이블에서 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈곳은 “*”로 대치)를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, LPAD(SUBSTR(SAL, 1, 15), 14, '*') FROM EMP;


--7. EMP 테이블에서 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, JOB,  TO_CHAR(HIREDATE,'YYYY-MM-DD') AS 입사일, TO_CHAR(HIREDATE, 'DY')||'요일' AS "입사한 요일" FROM EMP;


--8. EMP 테이블에서 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME AS "이름", LENGTH(ENAME) AS "이름의 글자수", JOB FROM EMP GROUP BY ENAME, JOB HAVING LENGTH(ENAME) >= 6;


--9. EMP 테이블에서 모든 사원의 정보를 이름,업무,급여,보너스,급여+보너스를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, JOB, SAL, COMM, SAL+COMM FROM EMP;




