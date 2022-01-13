--JOIN
--INNER JOIN
SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e.deptno
     , d. dname
  FROM emp e
  INNER JOIN dept d
    ON e. deptno = d. deptno;-- ON, INNER JOIN�� ������ �������
  
  -- selection
  SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e. deptno
     , d. dname
  FROM emp e
  INNER JOIN dept d
    ON e. deptno = d. deptno
  WHERE e. JOB = 'SALESMAN';
  
  
  --PLSQL INNER JOIN ���
SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e. deptno
     , d. dname
  FROM emp e, dept d 
  WHERE  e. deptno = d. deptno -- tip. WHERE 1 = 1 �� �ص� ���� ����
     AND e. JOB = 'SALESMAN';
  --- �����ڵ��� inner join �����Ƽ� where��.(join�� on�� �Բ�)
  --- PLSQL�� MLSQL���� �̷� ��� �Բ� �����
 
 -- LEFE OUTER JOIN
 SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e. deptno
     , d. dname
  FROM emp e
  LEFT OUTER JOIN dept d
    ON e. deptno = d. deptno;
-- RIGHT OUTER JOIN
SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e. deptno
     , d. dname
  FROM emp e
  RIGHT OUTER JOIN dept d
    ON e. deptno = d. deptno;
  --- LEFT�� RIGHT�� �������� ���� ���� �޶��� �� ����.
  --- ���������� �����Ͱ� ������ ������ ��ŭ�� ����
  --- ���������� �����Ͱ� ������ NULL������ ����
  
  -- ����Ŭ���� OUTTER JOIN ����
  SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e. deptno
     , d. dname
  FROM emp e, dept d
  WHERE e. deptno = d. deptno(+); --PLSQL LEFT OUTER JOIN
  ---WHERE e. deptno(+) = d. deptno); --PLSQL RIGHT OUTER JOIN
  
  --3�� ���̺� INNER JOIN
   SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e. deptno
     , d. dname
     , b. comm
  FROM emp e, dept d, bonus b
  WHERE e. deptno = d. deptno
  AND e.ename = b. ename;
  
  ----3�� ���̺� OUTER JOIN
   SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e. deptno
     , d. dname
     , b. comm
  FROM emp e, dept d, bonus b
  WHERE e. deptno(+) = d. deptno
  AND e. ename = b. ename(+);
  
  
  