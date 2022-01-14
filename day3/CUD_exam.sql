--������ �Է� INSERT
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
  COMMIT; -- ��������
  ROLLBACK; -- ��� / SLEECT�� COMMIT ����(INSERT DELATE UPDATE�� �ؾ���)
  
  
-- TEST ���̺� �Է� ����
INSERT INTO test
        (idx, title, descs)
VALUES
        (1, NULL, '��������');
        --- idx�� title�� not NULL

INSERT INTO test
        (idx, title, descs)
VALUES
        (1, '��������', NULL); --- �� ��Ȳ������ �ѹ��� ������ �ϳ���/ idx�� �ߺ��� �ȵ�
        INSERT INTO test
        (idx, title, descs)
VALUES
        (2, '��������2', NULL);
INSERT INTO test
        (idx, title, descs, regatetime)        
VALUES
        (3, '��������3','���볻�볻��', SYSDATE);
        
        
INSERT INTO test
        (idx, title, descs, regatetime)        
VALUES
        (4, '��������4','���볻�볻�볻��', TO_DATE('2021-12-31', 'yyyy-mm-dd'));
        
-- ������(����Ŭ���� �ִ� ��)
---- ���� ����ڴ�: ũ����Ʈ ��ɾ� CREATE
SELECT SEQ_TEST. CURRVAL FROM dual; -- ���� ������
SELECT SEQ_TEST. NEXTVAL FROM dual; -- ���� ������

INSERT INTO test
        (idx, title, descs, regatetime)        
VALUES
        (SEQ_TEST. NEXTVAL, '��������6','���볻�볻��6', SYSDATE); -- ���� �ڵ�����
--- �������� ���̺�� �������̶� ������ ��� ����
INSERT INTO test
        (idx, title, descs, regatetime)        
VALUES
        (SEQ_TEST. NEXTVAL, '��������6','���볻�볻��6', SYSDATE); -- ���� �ڵ�����
        
        
-- UPDATE **PK���� �������ϸ� �������� ����
UPDATE test
  SET title = '���������?'
    , descs = '��������˴ϴ�?'
  WHERE idx = 6 ;

--DELETE
DELETE FROM test
  WHERE idx = 1;


--�������� => ���� ���� ����
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