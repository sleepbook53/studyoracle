## 2���� �н�
### WHERE��

```SQL
SELECT ename, job, sal, sal*12 AS annsal
	FROM emp
WHERE sal*12 >= 10000;