-- 1. 부서 테이블 (DEPARTMENTS) 생성
CREATE TABLE DEPARTMENTS
(
    id   NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL
);

-- 2. 사원 테이블 (EMPLOYEES) 생성
CREATE TABLE EMPLOYEES
(
    id      NUMBER PRIMARY KEY,
    name    VARCHAR2(50) NOT NULL,
    dept_id NUMBER -- DEPARTMENTS 테이블의 id를 참조할 연결고리
);


-- 3. 각 테이블에 예시 데이터 삽입
-- 부서 테이블에는 3개의 부서를 넣어봅시다.
INSERT INTO DEPARTMENTS (id, name)
VALUES (10, '기획팀');
INSERT INTO DEPARTMENTS (id, name)
VALUES (20, '개발팀');
INSERT INTO DEPARTMENTS (id, name)
VALUES (30, '디자인팀');


-- 사원 테이블에는 4명의 사원을 넣어봅시다.
INSERT INTO EMPLOYEES (id, name, dept_id)
VALUES (101, '김철수', 10); -- 기획팀
INSERT INTO EMPLOYEES (id, name, dept_id)
VALUES (102, '박영희', 20); -- 기획팀
INSERT INTO EMPLOYEES (id, name, dept_id)
VALUES (103, '이지은', 20); -- 기획팀
INSERT INTO EMPLOYEES (id, name, dept_id)
VALUES (104, '최민준', 30); -- 기획팀


select *
from employees;
select *
from departments;

-- JOIN은 두 테이블을 가로로 합치는 문법
-- X * Y 형태로 결과가 나옵니다.
SELECT EMPLOYEES.ID,
       EMPLOYEES.NAME,
       DEPARTMENTS.ID,
       DEPARTMENTS.NAME
FROM EMPLOYEES,
     DEPARTMENTS
WHERE EMPLOYEES.DEPT_ID = DEPARTMENTS.ID
;


-- 오라클 조인
SELECT E.ID,
       E.NAME,
       D.ID,
       D.NAME AS DEPT_NAME
FROM EMPLOYEES E,
     DEPARTMENTS D
WHERE E.DEPT_ID = D.ID
;

-- 표준 조인
SELECT E.ID,
       E.NAME,
       D.ID,
       D.NAME AS DEPT_NAME
FROM EMPLOYEES E
         JOIN DEPARTMENTS D
              ON E.DEPT_ID = D.ID
;

SELECT *
FROM LIKES
ORDER BY USER_ID;
;


-- 피드 조회 (피드번호, 회원이름, 회원이메일, 피드내용)
SELECT
        P.POST_ID,
       U.USERNAME,
       U.EMAIL,
       P.CONTENT
FROM POSTS P
INNER JOIN USERS U -- JOIN 앞에 INNER가 디폴트로 생략되어있다.
ON P.USER_ID = U.USER_ID
;

-- 해시태그 테이블 조회
SELECT * FROM POSTS;

-- 1001번 해시태그가 붙은 게시물을 조회
SELECT
    PT.POST_ID,
    H.TAG_NAME,
    P.CONTENT
FROM POST_TAGS PT,HASHTAGS H,POSTS P
WHERE PT.TAG_ID = H.TAG_ID
AND H.TAG_ID = 1001
AND PT.POST_ID = P.POST_ID
ORDER BY PT.POST_ID
--WHERE TAG_ID = 1001
--ORDER BY POST_ID
;





SELECT *
FROM HASHTAGS;




SELECT
    PT.POST_ID,
    H.TAG_NAME,
    P.CONTENT
FROM POST_TAGS PT
INNER JOIN HASHTAGS H
ON PT.TAG_ID = H.TAG_ID
INNER JOIN POSTS P
ON PT.POST_ID = P.POST_ID
WHERE H.TAG_NAME LIKE '%일상%'
ORDER BY PT.POST_ID
--WHERE TAG_ID = 1001
--ORDER BY POST_ID
;










