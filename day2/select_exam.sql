SELECT * FROM emp
 WHERE ename LIKE 'J%';
 ## 2일차 학습
### WHERE절

```SQL
SELECT ename, job, sal, sal*12 AS annsal
FROM emp
WHERE sal*12 >= 10000;

SELECT ename, job, sal, sal, comm
    FROM emp
    WHERE comm IS NULL;;

-- NULL. 함수명 HVL() 나중에 to be continued
SELECT ename, job, sal, sal, comm
    FROM emp
    WHERE comm IS NOT NULL;;

-- 집합
SELECT * FROM emp;
SELECT * FROM dept;


SELECT empno, ename, job FROM emp;
WHERE comn is not NULL
UNION ALL
SELECT deptno, dname, loc FROM dept;
    