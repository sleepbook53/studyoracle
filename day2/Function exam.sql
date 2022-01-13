--TO NUMBER
SELECT TO_NUMBER(REPLACE('2400$', '$' '')) + 100 FROM dual;
SELECT TO_NUMBER('이천사백') FROM dyal;

-- TO DATE
SELECT TO_DATE('2022-01-12') FROM daul'
SELECT TO_DATE('01-12-2022') FROM dual'
SELECT TO_DATE('01-12-2022', 'mm/dd/yy') FROM dual'
------나라에 따라 양식이 다르기 때문에 이런식으로 설명을 해줘야함

--NVLL
SELECT ename, job, sal, sal*12 AS annsal,NVL(comn, 0) comn
	FROM emp
ORDER BY sal DESC;
--- 수정
SELECT ename, job, sal, sal*12 AS annsal,NVL(comn, 0) comn,
				(sal*12) + NVL(comn, 0) AS annsal
	FROM emp
ORDER BY sal DESC;

