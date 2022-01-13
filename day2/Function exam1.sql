--TO NUMBER
SELECT TO_NUMBER(REPLACE('2400$', '$', '')) + 100 FROM dual;
SELECT TO_NUMBER('이천사백') FROM dual;

-- TO DATE
SELECT TO_DATE('2022-01-12') FROM dual;
SELECT TO_DATE('') FROM dual;
SELECT TO_DATE('01-12-2022', 'mm/dd/yy') FROM dual;
------나라에 따라 양식이 다르기 때문에 이런식으로 설명을 해줘야함


--NVLL
SELECT ename, job, sal, sal*12 AS annsal,NVL(comm, 0) comm
	FROM emp
ORDER BY sal DESC;
--- 수정
SELECT ename, job, sal, sal*12 AS annsal,NVL(comm, 0) comm,
				(sal*12) + NVL(comn, 0) AS annsal
	FROM emp
ORDER BY sal DESC;


-- 집계함수 SUM, COUNT, MAX, MIN, AVG
SELECT sal, NVL(comm,0) comnm  FROM emp;
SELECT SUM(sal) totalsalary FROM emp;
SELECT SUM(NVL(comm,0)) totalcommision  FROM emp;
SELECT MAX(sal) FROM emp;  --- 돈 제일 많이 받는 사람
SELECT MIN(sal) FROM emp;
SELECT AVG(sal) FROM emp; --- 평균값
SELECT ROUND(AVG(sal),0) Sal_avg FROM emp; -- 평균값, 소수점 깎기

-- GROUP BY, 열로 묶어서 출력하고 싶을 떄 사용
SELECT MAX(sal), job
  FROM emp
  GROUP BY job; --- 집계를 할 필요가 있는건 그룹핑이 필요함. 
  ----커리 하나가지곤 한계가 있음
  SELECT MAX(sal) 월급최대, SUM(sal) 직업군당급여합계, job
  FROM emp
  GROUP BY job;
  
  SELECT MAX(sal) 월급최대, SUM(sal) 직업군당급여합계, job, deptno
  FROM emp
  GROUP BY job, deptno; --- 실제 컬럼 개수대로 그룹 바이로 입력해줘야함
  
  --HAVING 활용
 SELECT MAX(sal) 월급최대, SUM(sal) 직업군당급여합계, job
  FROM emp
  HAVING MAX(sal)> 4000 --- 원래는 그룹바이 아래 위치해야함
  GROUP BY job;
  
  SELECT deptno , job, sal
    FROM emp
    ORDER BY deptno, job; --- 오름차순이 기분, 내림차순은 따로 표시해야함
    --- 위는 기본, 그럼 emp 테이블에서 직군별 급여의 평균은?
  SELECT deptno, job, AVG(sal)
  FROM emp
  GROUP BY deptno, job
  HAVING AVG(sal) >= 3000
  ORDER BY deptno, job;
  
    --- 더 해보자
SELECT deptno, job, AVG(sal), MAX(sal), MIN(sal), SUM(sal), COUNT(sal)
  FROM emp
  GROUP BY deptno, job
  HAVING AVG(sal) >= 1000
  ORDER BY deptno, job;
  
--ROLLUP
SELECT deptno, NVL(job,'합계') job, ROUND(AVG(sal),0) 급여평균, MAX(sal) 급여최대, SUM(sal) 급여합계, COUNT(*) 그룹별직원수
  FROM emp
GROUP BY ROLLUP(deptno, job);
  --HAVING AVG(sal) >= 1000
  --ORDER BY deptno, job; - 롤업할 때는 쓸 일 없음