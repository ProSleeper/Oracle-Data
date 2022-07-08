-- �������� Ǯ��

--SELECT DEPNO, DNAME, AVG_SAL, MAX_SAL, MIN_SAL, CNT FROM EMP;

--SELECT D.DEPTNO, D.DNAME, AVG(SAL) AVG_SAL, MAX(SAL) MAX_SAL, MIN(SAL) MIN_SAL, COUNT(*) CNT FROM DEPT D, EMP E WHERE DEPTNO <= 30;

--DO IT 239-2�� ����
SELECT D.DEPTNO, D.DNAME, TRUNC(AVG(SAL)) AVG_SAL, MAX(SAL) MAX_SAL, MIN(SAL) MIN_SAL, COUNT(*) CNT FROM DEPT D, EMP E WHERE D.DEPTNO = E.DEPTNO GROUP BY D.DEPTNO, D.DNAME;

SELECT E.ENAME FROM DEPT D, EMP E;

--DO IT 239-3�� ����
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.EMPNO, E.JOB, E.SAL FROM EMP E, DEPT D WHERE E.DEPTNO(+) = D.DEPTNO GROUP BY D.DEPTNO, D.DNAME, E.ENAME, E.EMPNO, E.JOB, E.SAL ORDER BY DEPTNO;

--����(GROUP BY ����: �ʿ� ������)
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO "DEPTNO_1", S.GRADE, S.LOSAL, S.HISAL, M.EMPNO, M.ENAME
FROM EMP E, EMP M, DEPT D, SALGRADE S WHERE D.DEPTNO = E.DEPTNO(+) AND E.MGR = M.EMPNO(+) AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+)
GROUP BY D.DEPTNO, D.DNAME,  E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO, S.GRADE, S.LOSAL, S.HISAL, M.EMPNO, M.ENAME ORDER BY D.DEPTNO;

--����(����)
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO "DEPTNO_1", S.GRADE, S.LOSAL, S.HISAL, M.EMPNO, M.ENAME
FROM EMP E, EMP M, DEPT D, SALGRADE S WHERE D.DEPTNO = E.DEPTNO(+) AND E.MGR = M.EMPNO(+) AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+) ORDER BY D.DEPTNO, E.EMPNO;

--�ÿ�
SELECT C.DEPTNO,DNAME,A.EMPNO,A.ENAME,A.MGR,A.SAL,A.DEPTNO DEPTNO_1,D.LOSAL,D.HISAL,D.GRADE,A.MGR,B.ENAME
FROM EMP 
A RIGHT OUTER JOIN DEPT C ON A.DEPTNO = C.DEPTNO
LEFT JOIN SALGRADE D ON A.SAL BETWEEN D.LOSAL AND D.HISAL
LEFT JOIN EMP B ON A.MGR = B.EMPNO
ORDER BY C.DEPTNO,A.EMPNO;

-- HAVING E.SAL BETWEEN S.LOSAL AND S.HISAL
-- SAL BETWEEN '1991-09-01' AND '1991-09-30'



--1. EMP ���̺��� Blake�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի����ڸ� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT ENAME, HIREDATE FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE');


--2. EMP ���̺��� ��� �޿� �̻��� �޴� ��� �������� ���ؼ� ������ ��ȣ�� �̸��� ����ϴ� SELECT���� �ۼ��Ͻÿ�. �� �޿��� ���� ������ ����Ͽ���.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL >= (SELECT AVG(SAL) FROM EMP) ORDER BY SAL DESC;


--3. EMP ���̺��� �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� �������� ���� ��� ��ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�. �� �����ȣ ������ ����Ͽ���.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE ENAME LIKE '%L%' ORDER BY EMPNO;

SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%') ORDER BY EMPNO;


--4. EMP ���̺��� �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT ENAME, JOB, SAL FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND LOC = 'DALLAS';



--5. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT ENAME, SAL FROM EMP WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');



--6. EMP ���̺��� SALES�μ� ����� �̸�,������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT E.ENAME, JOB FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');



SELECT * FROM SALGRADE;
SELECT * FROM DEPT;



--7. EMP ���̺��� ������ �μ� 30�� ���� ���޺��� ���� ����� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT * FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30);


--8. EMP ���̺��� �μ� 10���� �μ� 30�� ����� ���� ������ �ð� �ִ� ����� �̸��� ������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.

SELECT * FROM EMP WHERE DEPTNO = 10;



--9. EMP ���̺��� FORD�� ������ ���޵� ���� ����� ��� ������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT * FROM EMP E WHERE (SELECT JOB FROM EMP WHERE ENAME = 'WARD') = JOB AND (SELECT SAL FROM EMP WHERE ENAME = 'WARD') = SAL AND ENAME <> 'WARD';
--FORD�� ���� ���� ��� �ִ� WARD�� ��ü



--10. EMP ���̺��� ������ JONES�� ���ų� ������ FORD�̻��� ����� ������ �̸�,����,�μ���ȣ,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
-- �� ������, ������ ���� ������ ����Ͽ���.

SELECT ENAME, JOB, SAL FROM EMP WHERE (SELECT JOB FROM EMP WHERE ENAME = 'JONES') = JOB AND SAL >= (SELECT SAL FROM EMP WHERE ENAME = 'JAMES') AND ENAME <> 'JONES' ORDER BY JOB, SAL DESC;
--���⵵ JONES�� ���� �������� FORD���� �� ���� ������ ��� JAMES�� ��ü



--11. EMP ���̺��� SCOTT �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT ENAME, JOB, SAL FROM EMP WHERE (SAL = (SELECT SAL FROM EMP WHERE ENAME = 'MARTIN') OR SAL = (SELECT SAL FROM EMP WHERE ENAME = 'FORD')) AND (ENAME <>' MARTIN' OR ENAME <> 'FORD');
--SCOTT�� ����! WARD�� �޿��� ���� ����� ����...
--SCOTT�� MARTIN���� ��ü


--(SELECT SAL FROM EMP WHERE LOC = 'CHICAGO')
--12. EMP ���̺��� CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�,������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT ENAME, JOB FROM EMP WHERE JOB  IN(SELECT JOB FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO') GROUP BY JOB);


--13. EMP ���̺��� �μ����� ������ ��� ���޺��� ���� ����� �μ���ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

SELECT ENAME, JOB FROM EMP WHERE JOB  IN(SELECT JOB FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO') GROUP BY JOB);

SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;



SELECT DEPTNO FROM EMP GROUP BY DEPTNO;

SELECT DEPTNO FROM EMP GROUP BY DEPTNO;

SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO;

SELECT EMPNO, ENAME, SAL FROM EMP WHERE (SELECT SAL FROM EMP GROUP BY DEPTNO) > (SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO);-- AND DEPTNO IN((SELECT DEPTNO FROM EMP GROUP BY DEPTNO));



--14. EMP ���̺��� �������� ������ ��� ���޺��� ���� ����� �μ���ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
--
--
-- 
--
-- 
--
--15. EMP ���̺��� ��� �Ѹ� �̻����κ��� ���� ���� �� �ִ� ����� ����,�̸�,�����ȣ,�μ���ȣ�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
--
-- 
--
-- 
--
--16. EMP ���̺��� ���� ����� �����ȣ,�̸�,����,�μ���ȣ�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.












