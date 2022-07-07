--2022-07-04 ����#####################################################################################################################################################################

SELECT * FROM EMP;

--2. EMP ���̺��� �޿��� 3000�̻��� ����� ������ �����ȣ,�̸�,������,�޿��� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL >= 3000 ORDER BY SAL;


--3. EMP ���̺��� �����ȣ�� 7782�� ����� �̸��� �μ���ȣ�� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.
SELECT ENAME, EMPNO FROM EMP WHERE EMPNO = 7782;


--4. EMP ���̺��� �Ի����� February 20, 1981�� May 1, 1981 ���̿� �Ի��� ����� �̸�,����,�Ի����� ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �Ի��� ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '1981-02-20' AND '1981-05-01' ORDER BY HIREDATE;


--5. EMP ���̺��� �μ���ȣ�� 10,20�� ����� ��� ������ ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �̸������� �����Ͽ���.
SELECT * FROM EMP WHERE DEPTNO IN(10, 20) ORDER BY ENAME;


--6. EMP ���̺��� �޿��� 1500�̻��̰� �μ���ȣ�� 10,30�� ����� �̸��� �޿��� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� HEADING�� Employee�� Monthly Salary�� ����Ͽ���.
SELECT ENAME AS "Employee", SAL AS "Monthly Salary" FROM EMP WHERE SAL >=1500 AND DEPTNO IN(10, 30) ORDER by SAL;


--7. EMP ���̺��� 1982�⿡ �Ի��� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP WHERE HIREDATE BETWEEN '1982-01-01' AND '1982-12-31';
--�̰� �̷��� �ϸ� ������ �ϴµ� ���� 1982�⸸�� ���ϴ� �ڵ�� �ϴ� �� �ٶ����ҵ�




--8. EMP ���̺��� COMM�� NULL�� �ƴ� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP WHERE NVL(COMM, 0) <> 0;			
SELECT * FROM EMP WHERE NVL2(COMM, 'O', 'X') = 'O';
--���� �Ʒ��� ���̴� ���� �ۼ��ϸ鼭�� �ñ��ߴ� �ǵ� NULL �̸� �ڿ� �������� ���� ��ȯ�ϴµ� ������ 0�� �����ߴ�. �ٵ� �ش� ���� ���� 0�̶��? �̰� ������ �� ���� �ִٰ� �����ߴµ�, ���ó� �ٸ� �Լ��� �־���.
--NVL2�Լ��� �̿��ϸ� ���ڸ��� �ٸ� ���� ������ �� �� �־ ����ϰ� ������ �� ���� �� �ϴ�.


--9. EMP ���̺��� ���ʽ��� �޿����� 10%�� ���� ��� �������� ���Ͽ� �̸�,�޿�,���ʽ��� ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM >= SAL*0.1;
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM >= ROUND(SAL*0.1);
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM >= TRUNC(SAL*0.1);
--���ʽ��� �޿��� 10% �̻��̶�� �����ߴ�. �׸��� 0.1�� ���ؼ� �޿��� 10%�� ���ߴµ� �̶� �Ҽ����� ���� �� �ִµ� �װ� ��� ó���� �� ��츦 ���������̴�.
--ROUND�� �ݿø� ���ִµ� ����ó�� �ι�° ���ڸ� �������� ������ �Ҽ��� ù��° �ڸ����� �ݿø��ؼ� ������ �����ش�.
--TRUNC�� �Ҽ��κ��� ���� ������ ������ ������ش�.


--10. EMP ���̺��� ������ Clerk�̰ų� Analyst�̰� �޿��� 1000,3000,5000�� �ƴ� ��� ����� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP WHERE JOB IN('CLERK', 'ANALYST') AND NOT SAL IN(1000, 3000, 5000);
SELECT * FROM EMP WHERE JOB IN(UPPER('Clerk'), UPPER('Analyst')) AND NOT SAL IN(1000, 3000, 5000);
--ó���� ���� ������� ��ҹ��� �����ؼ� ��������� �ȵƴ�. �׷��� �ٽ� ���̺��� ���� ������ ���� �빮�ڶ� �����ߴ�.
--������ ���� ���� �빮�ڷ� ������� �Ʒ��� UPPER �Լ��� �̿��ؼ� �� �빮�ڷ� �ٲ㼭 �����ߴ�. �ߵȴ�.


--11. EMP ���̺��� �̸��� L�� �� �ڰ� �ְ�  �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP WHERE ENAME LIKE '%LL%' AND (DEPTNO = 30 OR MGR = 7782);
SELECT * FROM EMP WHERE ENAME LIKE '%LL%' AND DEPTNO = 30 OR MGR = 7782;
--���⼭ ������� ���ߴ� �Ǽ��� �״�� �ߴ�. '%'�� ������ LIKE�� ����ϴµ� ���ó� =�� ���� ���Ҵ�. �׷��� ���� �Ǽ� ������ ������ ���� �� ����.
--�׸��� � ������ ()�������� ������ ���� �����ٵ� �Ƹ� PL/SQL�� ������������?


--2022-07-05 ����#####################################################################################################################################################################
--1. ���� ��¥�� ����ϰ� �� ���̺��� Current Date�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT SYSDATE "Current Date" FROM DUAL;


--2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, ROUND(SAL*1.15) AS "New Salary", ROUND(SAL*0.15) AS "Inscrease" FROM EMP ORDER BY "New Salary";


--3. EMP ���̺��� �̸�,�Ի���,�Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,6), '��') FROM EMP;


--4. EMP ���̺��� �̸�,�Ի���, �Ի��Ϸκ��� ��������� ����,�޿�, �Ի��Ϻ��� ��������� �޿��� �Ѱ踦 ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS ����, SAL, SAL*ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "�� �޿�" FROM EMP;


--5. EMP ���̺��� ������ ����� ��µǵ��� �ۼ��Ͻÿ�.
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



--6. EMP ���̺��� ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ ����� ��*���� ��ġ)�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, LPAD(SUBSTR(SAL, 1, 15), 14, '*') FROM EMP;


--7. EMP ���̺��� ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB,  TO_CHAR(HIREDATE,'YYYY-MM-DD') AS �Ի���, TO_CHAR(HIREDATE, 'DY')||'����' AS "�Ի��� ����" FROM EMP;


--8. EMP ���̺��� �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME AS "�̸�", LENGTH(ENAME) AS "�̸��� ���ڼ�", JOB FROM EMP GROUP BY ENAME, JOB HAVING LENGTH(ENAME) >= 6;


--9. EMP ���̺��� ��� ����� ������ �̸�,����,�޿�,���ʽ�,�޿�+���ʽ��� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, SAL, COMM, SAL+COMM FROM EMP;

select * from EMP;




--2022-07-06 ����#####################################################################################################################################################################

--SELECT 
--case SEX 
--when '1' then '����'
--when '0' then '����'
--end gender,
--COUNT(*) �ο��� FROM CUSTOM
--GROUP BY SEX;
--
--WHEN '1' THEN '����' ELSE '����'
--
--SELECT 
--CASE �÷���                         
--	WHEN 1 THEN 100                          
--	WHEN 2 THEN 200                         
--	WHEN 3 THEN 300                         
--	WHEN 4 THEN 400                          
--	ELSE 500                        
--END AS RESULT             
--FROM DUAL;
--
--
--
--
--1. EMP ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT COUNT(EMPNO) �ο���, MAX(SAL) "�ִ� �޿�", MIN(SAL) "�ּ� �޿�", SUM(SAL) "�޿��� ��" FROM EMP;


--2. EMP ���̺��� �� �������� �ִ� �޿�,�ּ� �޿�,�޿��� ���� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT JOB �ο���, MAX(SAL) "�ִ� �޿�", MIN(SAL) "�ּ� �޿�", SUM(SAL) "�޿��� ��" FROM EMP GROUP BY JOB;


--3. EMP ���̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT JOB ����, COUNT(SAL) "�ο���" FROM EMP GROUP BY JOB;


--4. EMP ���̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT MAX(SAL) - MIN(SAL) "�޿� ��" FROM EMP;


--5. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(group by)
--
--H_YEAR  COUNT(*)  MIN(SAL)  MAX(SAL)  AVG(SAL)  SUM(SAL)
--
-------- --------- --------- --------- --------- ---------
--
--    81       10       950      5000    2282.5	  22825
--
--    82        1      1300      1300      1300      1300
--
--    80        1       800       800       800       800

SELECT TO_CHAR(HIREDATE, 'YY') AS "H_YEAR",  COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE, 'YY');


--6. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(case,sum)
--
--    TOTAL      1980      1981      1982      1983
--
----------- --------- --------- --------- ---------
--
--       12         1        10         1         0

SELECT SUM(COUNT(JOB)) TOTAL,
	SUM(COUNT(CASE WHEN TO_CHAR(HIREDATE, 'YY') = '80' THEN HIREDATE END)) AS "1980",
	SUM(COUNT(CASE WHEN TO_CHAR(HIREDATE, 'YY') = '81' THEN HIREDATE END)) AS "1981",
	SUM(COUNT(CASE WHEN TO_CHAR(HIREDATE, 'YY') = '82' THEN HIREDATE END)) AS "1982",
	SUM(COUNT(CASE WHEN TO_CHAR(HIREDATE, 'YY') = '83' THEN HIREDATE END)) AS "1983"
FROM EMP GROUP BY JOB;

--����� ����
SELECT COUNT(*) "TOTAL",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1980 THEN 1 ELSE 0 END) "1980",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1981 THEN 1 ELSE 0 END) "1981",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1982 THEN 1 ELSE 0 END) "1982",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1983 THEN 1 ELSE 0 END) "1983"        
FROM EMP
WHERE EXTRACT(year FROM hiredate) BETWEEN 1980 AND 1983;
--�ڵ� �κ������δ� �޶� ū ���� �Ȱ����ѵ�, ���� ���� CASE���̳� GROUP BY���� �ͼ������� �ʾƼ� �׷���. ���� ����


--
--7. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
--
--JOB         Deptno 10    Deptno 20     Deptno 30     Total
--
-----------   ---------    ---------     ---------     ---------
--
--CLERK            1300         1900           950          4150
--
--SALESMAN                                    5600          5600
--
--PRESIDENT	 5000                                     5000
--
--MANAGER	         2450         2975          2850          8275
--
--ANALYST	                      6000                        6000
 
SELECT JOB,
	SUM(CASE WHEN DEPTNO = 10 THEN SAL END) AS "Deptno 10",
	SUM(CASE WHEN DEPTNO = 20 THEN SAL END) AS "Deptno 20",
	SUM(CASE WHEN DEPTNO = 30 THEN SAL END) AS "Deptno 30",
	SUM(SAL)
FROM EMP GROUP BY JOB;

--����� �ڵ�
SELECT job, 
            NVL(TO_CHAR( SUM(case deptno WHEN 10 then sal end) ), ' ') "Deptno 10",
            NVL(TO_CHAR( SUM(case deptno WHEN 20 then sal end) ), ' ') "Deptno 20",
            NVL(TO_CHAR( SUM(case deptno WHEN 30 then sal end) ), ' ') "Deptno 30",                        
            SUM(sal) "Total"
FROM EMP
GROUP BY job;
--�̰͵� 6���ϰ� �����ϰ� �ڵ��� ���� ����ϴ�. ���ó� CASE���̳� GROUP BY ���� �ͼ������� �ҵ�


--2022-07-07 ����#####################################################################################################################################################################
--
--1. EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME, E.DEPTNO, D.DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO ORDER BY DEPTNO;	--INNER JOIN 
SELECT ENAME, DEPTNO, DNAME FROM EMP E NATURAL JOIN DEPT D ORDER BY DEPTNO; --NATURAL JOIN


--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME, JOB, SAL, D.DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 10;	--INNER JOIN
SELECT ENAME, JOB, SAL, DNAME FROM EMP E NATURAL JOIN DEPT D WHERE LOC = 'NEW YORK'; --NATURAL JOIN


--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME, D.DNAME, D.LOC, COMM FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.COMM > 0;--INNER JOIN
SELECT ENAME, D.DNAME, LOC, COMM FROM EMP E NATURAL JOIN DEPT D WHERE COMM > 0; --NATURAL JOIN


--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME, JOB, D.DNAME, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.ENAME LIKE '%L%';--INNER JOIN
SELECT ENAME, JOB, DNAME, LOC FROM EMP E NATURAL JOIN DEPT D WHERE ENAME LIKE '%L%'; --NATURAL JOIN


--5. �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(�����ڰ� ���� King�� �����Ͽ� ��� ����� ���)
--
--Employee        Emp# Manager         Mgr#
--
------------ --------- ---------- ---------
--
--KING            7839
--
--BLAKE           7698 KING            7839
--
--CLARK           7782 KING            7839
--
--. . . . . . . . . .
--
--14 rows selected.

SELECT E1.ENAME "Employee", E1.EMPNO "Emp#", E2.ENAME "Manager", E2.EMPNO "Mgr#" FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO(+);

SELECT * FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO(+);


--6. EMP ���̺��� �׵��� ������ ���� ���� �Ի��� ����� ���Ͽ� �̸�,�Ի���,������ �̸�, ������ �Ի����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT E1.ENAME "Employee", E1.HIREDATE "�Ի���", E2.ENAME "Manager", E2.HIREDATE "�Ի���" FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO(+) AND E2.HIREDATE - E1.HIREDATE > 0;

--7. EMP ���̺��� ����� �޿��� ����� �޿� �縸ŭ ��*���� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� ��*���� 100�� �ǹ��Ѵ�.
--
--Employee and their salary
--
-------------------------------------------------------------------
--
--KING      **************************************************
--
--BLAKE     ****************************
--
--CLARK     ************************
--
--JONES     *****************************
--
--MARTIN    ************
--
--ALLEN     ****************
--
--TURNER    ***************
--
--. . . . . . . . . .
--
--14 rows selected.

SELECT RPAD(ENAME||'     ', TRUNC(SAL/100) + LENGTH(ENAME||'     '), '*') "Employee and their salary"  FROM EMP;























