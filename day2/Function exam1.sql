--TO NUMBER
SELECT TO_NUMBER(REPLACE('2400$', '$', '')) + 100 FROM dual;
SELECT TO_NUMBER('��õ���') FROM dual;

-- TO DATE
SELECT TO_DATE('2022-01-12') FROM dual;
SELECT TO_DATE('') FROM dual;
SELECT TO_DATE('01-12-2022', 'mm/dd/yy') FROM dual;
------���� ���� ����� �ٸ��� ������ �̷������� ������ �������


--NVLL
SELECT ename, job, sal, sal*12 AS annsal,NVL(comm, 0) comm
	FROM emp
ORDER BY sal DESC;
--- ����
SELECT ename, job, sal, sal*12 AS annsal,NVL(comm, 0) comm,
				(sal*12) + NVL(comn, 0) AS annsal
	FROM emp
ORDER BY sal DESC;


-- �����Լ� SUM, COUNT, MAX, MIN, AVG
SELECT sal, NVL(comm,0) comnm  FROM emp;
SELECT SUM(sal) totalsalary FROM emp;
SELECT SUM(NVL(comm,0)) totalcommision  FROM emp;
SELECT MAX(sal) FROM emp;  --- �� ���� ���� �޴� ���
SELECT MIN(sal) FROM emp;
SELECT AVG(sal) FROM emp; --- ��հ�
SELECT ROUND(AVG(sal),0) Sal_avg FROM emp; -- ��հ�, �Ҽ��� ���

-- GROUP BY, ���� ��� ����ϰ� ���� �� ���
SELECT MAX(sal), job
  FROM emp
  GROUP BY job; --- ���踦 �� �ʿ䰡 �ִ°� �׷����� �ʿ���. 
  ----Ŀ�� �ϳ������� �Ѱ谡 ����
  SELECT MAX(sal) �����ִ�, SUM(sal) ��������޿��հ�, job
  FROM emp
  GROUP BY job;
  
  SELECT MAX(sal) �����ִ�, SUM(sal) ��������޿��հ�, job, deptno
  FROM emp
  GROUP BY job, deptno; --- ���� �÷� ������� �׷� ���̷� �Է��������
  
  --HAVING Ȱ��
 SELECT MAX(sal) �����ִ�, SUM(sal) ��������޿��հ�, job
  FROM emp
  HAVING MAX(sal)> 4000 --- ������ �׷���� �Ʒ� ��ġ�ؾ���
  GROUP BY job;
  
  SELECT deptno , job, sal
    FROM emp
    ORDER BY deptno, job; --- ���������� ���, ���������� ���� ǥ���ؾ���
    --- ���� �⺻, �׷� emp ���̺��� ������ �޿��� �����?
  SELECT deptno, job, AVG(sal)
  FROM emp
  GROUP BY deptno, job
  HAVING AVG(sal) >= 3000
  ORDER BY deptno, job;
  
    --- �� �غ���
SELECT deptno, job, AVG(sal), MAX(sal), MIN(sal), SUM(sal), COUNT(sal)
  FROM emp
  GROUP BY deptno, job
  HAVING AVG(sal) >= 1000
  ORDER BY deptno, job;
  
--ROLLUP
SELECT deptno, NVL(job,'�հ�') job, ROUND(AVG(sal),0) �޿����, MAX(sal) �޿��ִ�, SUM(sal) �޿��հ�, COUNT(*) �׷캰������
  FROM emp
GROUP BY ROLLUP(deptno, job);
  --HAVING AVG(sal) >= 1000
  --ORDER BY deptno, job; - �Ѿ��� ���� �� �� ����