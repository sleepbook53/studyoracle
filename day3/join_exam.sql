--JOIN
SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e.deptno
     , d. dname
  FROM emp e
  INNER JOIN dept d
    ON e. deptno = d. deptno;-- INNER JOIN의 조건을 만들어줌
  
  -- selection
  SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname
  FROM emp e
  INNER JOIN dept d
    ON e. deptno = d. deptno
  WHERE e. JOB = 'SALESMAN';