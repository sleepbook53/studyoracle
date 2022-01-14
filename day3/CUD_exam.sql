--데이터 입력 INSERT
INSERT INTO BONUS
        ( ename
        , job
        , sal
        , comm)
  VALUES
       ( 'JACK'
       , 'SALEMAN'
       , 4000
       , NULL);
  COMMIT; -- 완전저장
  ROLLBACK; -- 취소 / SLEECT는 COMMIT 안함(INSERT DELATE UPDATE는 해야함)
  
  
-- TEST 테이블 입력 쿼리
INSERT INTO test
        (idx, title, descs)
VALUES
        (1, NULL, '내용증명');
        --- idx와 title은 not NULL

INSERT INTO test
        (idx, title, descs)
VALUES
        (1, '내용증명', NULL); --- 이 상황에서는 한번에 데이터 하나만/ idx에 중복도 안됨
        INSERT INTO test
        (idx, title, descs)
VALUES
        (2, '내용증명2', NULL);
INSERT INTO test
        (idx, title, descs, regatetime)        
VALUES
        (3, '내용증명3','내용내용내용', SYSDATE);
        
        
INSERT INTO test
        (idx, title, descs, regatetime)        
VALUES
        (4, '내용증명4','내용내용내용내용', TO_DATE('2021-12-31', 'yyyy-mm-dd'));
        
-- 시퀀스(오라클에만 있는 것)
---- 뭔가 만들겠다: 크레이트 명령어 CREATE
SELECT SEQ_TEST. CURRVAL FROM dual; -- 현재 값보기
SELECT SEQ_TEST. NEXTVAL FROM dual; -- 다음 값보기

INSERT INTO test
        (idx, title, descs, regatetime)        
VALUES
        (SEQ_TEST. NEXTVAL, '내용증명6','내용내용내용6', SYSDATE); -- 숫자 자동증가
--- 시퀀스는 테이블과 독립적이라 복수로 사용 가능
INSERT INTO test
        (idx, title, descs, regatetime)        
VALUES
        (SEQ_TEST. NEXTVAL, '내용증명6','내용내용내용6', SYSDATE); -- 숫자 자동증가
        
        
-- UPDATE **PK값은 어지간하면 수정하지 않음
UPDATE test
  SET title = '내용증명요?'
    , descs = '내용증명됩니다?'
  WHERE idx = 6 ;

--DELETE
DELETE FROM test
  WHERE idx = 1;


--서브쿼리 => 쿼리 안의 쿼리
SELECT ROWNUM
      , su.ename
      , su.job
      , su.sal
      , su comm
  FROM 
(SELECT ename
      , job
      , sal
      , comm
  FROM emp
  ORDER BY sal DESC
) su
WHERE ROWNUM <= 1;

SELECT ROWNUM, idx, title FROM test;