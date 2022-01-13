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
    ON e. deptno = d. deptno;-- ON, INNER JOIN의 조건을 만들어줌
  
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
  
  
  --PLSQL INNER JOIN 방식
SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e. deptno
     , d. dname
  FROM emp e, dept d 
  WHERE  e. deptno = d. deptno -- tip. WHERE 1 = 1 로 해도 문제 없음
     AND e. JOB = 'SALESMAN';
  --- 개발자들이 inner join 귀찮아서 where씀.(join과 on은 함께)
  --- PLSQL과 MLSQL에서 이런 방식 함께 사용함
 
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
  --- LEFT와 RIGHT의 기준점에 따라 값이 달라질 수 있음.
  --- 기준점보다 데이터가 많으면 기준점 만큼만 도출
  --- 기준점보다 데이터가 적으면 NULL값으로 도출
  
  -- 오라클만의 OUTTER JOIN 문법
  SELECT e. empno
     , e. ename
     , e. job
     , TO_CHAR(e.hiredate, 'yyyy-mm-dd') hiredate
     , e. deptno
     , d. dname
  FROM emp e, dept d
  WHERE e. deptno = d. deptno(+); --PLSQL LEFT OUTER JOIN
  ---WHERE e. deptno(+) = d. deptno); --PLSQL RIGHT OUTER JOIN
  
  --3개 테이블 INNER JOIN
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
  
  ----3개 테이블 OUTER JOIN
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
  
  
  