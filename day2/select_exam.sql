SELECT * FROM emp
 WHERE ename LIKE 'J%';
 ## 2���� �н�
### WHERE��

```SQL
SELECT ename, job, sal, sal*12 AS annsal
FROM emp
WHERE sal*12 >= 10000;

SELECT ename, job, sal, sal, comm
    FROM emp
    WHERE comm IS NULL;;

-- NULL. �Լ��� HVL() ���߿� to be continued
SELECT ename, job, sal, sal, comm
    FROM emp
    WHERE comm IS NOT NULL;;

-- ����
SELECT * FROM emp;
SELECT * FROM dept;


SELECT empno, ename, job FROM emp;
WHERE comn is not NULL
UNION ALL
SELECT deptno, dname, loc FROM dept;
    