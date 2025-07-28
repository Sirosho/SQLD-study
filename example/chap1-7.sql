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


COMMIT;

select *
from employees;
select *
from departments;


-- 카티션곱 표준문법
SELECT *
FROM EMPLOYEES
CROSS JOIN DEPARTMENTS
;
-- 카티션곱 오라클문법
SELECT *
FROM EMPLOYEES,DEPARTMENTS
;

-- NATURAL JOIN
-- 겹치는게 있으면 알아서 붙여줄테니 별칭도 빼고 그냥 겹치는 컬럼 하나만 넣어라
-- NATURAL JOIN은 공통 조인 매칭컬럼의 별칭을 표기해선 안된다.
    SELECT
        USER_ID,
        U.USERNAME,
        U.EMAIL,
        UP.FULL_NAME,
        UP.BIO
    FROM USERS U
    NATURAL JOIN USER_PROFILES UP
    ;


SELECT
   *
FROM USERS U
NATURAL JOIN USER_PROFILES UP

;





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
SELECT P.POST_ID,
       U.USERNAME,
       U.EMAIL,
       P.CONTENT
FROM POSTS P
         INNER JOIN USERS U -- JOIN 앞에 INNER가 디폴트로 생략되어있다.
                    ON P.USER_ID = U.USER_ID
;

-- 해시태그 테이블 조회
SELECT *
FROM POSTS;

-- 1001번 해시태그가 붙은 게시물을 조회
SELECT PT.POST_ID,
       H.TAG_NAME,
       P.CONTENT
FROM POST_TAGS PT,
     HASHTAGS H,
     POSTS P
WHERE PT.TAG_ID = H.TAG_ID
  AND H.TAG_ID = 1001
  AND PT.POST_ID = P.POST_ID
ORDER BY PT.POST_ID
--WHERE TAG_ID = 1001
--ORDER BY POST_ID
;



SELECT *
FROM HASHTAGS;



SELECT PT.POST_ID,
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

-- 댓글 테이블 조회
SELECT *
FROM COMMENTS;
SELECT *
FROM POSTS;


-- 댓글과 게시물의 피드의 내용을 함꼐 조회

-- 오라클 조인, 표준조인 (DB에 따른 분류)
-- 내부조인, 외부 조인 (DB와 관계없이 분류)

SELECT P.POST_ID,
       P.CONTENT,
       P.VIEW_COUNT,
       TO_CHAR(P.CREATION_DATE, 'YYYY-MM-DD') AS CREATED_AT,
       C.COMMENT_TEXT

FROM POSTS P
         INNER JOIN COMMENTS C
                    ON P.POST_ID = C.POST_ID
;

SELECT P.USER_ID,
       U.USERNAME,
       P.POST_ID,
       P.CONTENT,
       P.VIEW_COUNT,
       TO_CHAR(P.CREATION_DATE, 'YYYY-MM-DD') AS CREATED_AT,
       C.USER_ID,
       U2.USERNAME                            AS COMMENTER,
       C.COMMENT_TEXT

FROM POSTS P
         INNER JOIN COMMENTS C
                    ON P.POST_ID = C.POST_ID
         INNER JOIN USERS U
                    ON P.USER_ID = U.USER_ID
         INNER JOIN USERS U2
                    ON C.USER_ID = U2.USER_ID
;

-- OUTER JOIN
SELECT *
FROM USERS; -- 필수정보
SELECT *
FROM USER_PROFILES;
-- 선택정보


-- INNER JOIN의 문제점 : 값이 매칭되는 경우만 조회되므로
-- 상세프로필을 안적은 회원은 나타나지 않음.
SELECT U.USER_ID,
       U.USERNAME,
       U.EMAIL,
       UP.FULL_NAME,
       UP.BIO
FROM USERS U
         JOIN USER_PROFILES UP
              ON U.USER_ID = UP.USER_ID
;
-- 우선 회원정보는 모두 조회하고 단, 상세프로필이 있으면 걔네만 같이 조회해라


SELECT
    *
FROM USERS U
LEFT OUTER JOIN USER_PROFILES UP
ON U.USER_ID = UP.USER_ID
ORDER BY U.USER_ID
;

-- 오라클 외부 조인: LEFT -> 오른쪽 조건에 (+), RIGHT -> 왼쪽 조건에 (+)
SELECT
    *
FROM USERS U, USER_PROFILES UP
WHERE U.USER_ID = UP.USER_ID (+)
ORDER BY U.USER_ID
;


-- NATURAL JOIN
-- 겹치는게 있으면 알아서 붙여줄테니 별칭도 빼고 그냥 겹치는 컬럼 하나만 넣어라
-- NATURAL JOIN은 공통 조인 매칭컬럼의 별칭을 표기해선 안된다.
SELECT
    USER_ID,
    U.USERNAME,
    U.EMAIL,
    UP.FULL_NAME,
    UP.BIO
FROM USERS U
NATURAL JOIN USER_PROFILES UP
;

-- NATURAL JOIN과 결과가 같이 나옴
SELECT
    USER_ID,
    U.USERNAME,
    U.EMAIL,
    UP.FULL_NAME,
    UP.BIO
FROM USERS U
JOIN USER_PROFILES UP
USING (USER_ID)
;


-- SELF JOIN
SELECT
    U1.USER_ID,
    U1.USERNAME,
    U1.MANAGER_ID,
    NVL(U2.USERNAME,'상사없음' )AS MANAGER_USERNAME
FROM USERS U1
LEFT JOIN USERS U2
ON U1.MANAGER_ID = U2.USER_ID
ORDER BY U1.USER_ID
;

-- 카티션곱 표준문법
SELECT *
FROM EMPLOYEES
         CROSS JOIN DEPARTMENTS
;
-- 카티션곱 오라클문법
SELECT *
FROM EMPLOYEES,DEPARTMENTS
;


-- '좋아요'를 누른 사용자의 ID 목록 (중복 제거됨)
SELECT user_id FROM LIKES
INTERSECT
-- '댓글'을 작성한 사용자의 ID 목록 (중복 제거됨)
SELECT user_id FROM COMMENTS;


-- '좋아요'를 누른 사용자의 ID 목록
SELECT user_id FROM LIKES
MINUS
-- '댓글'을 작성한 사용자의 ID 목록
SELECT user_id FROM COMMENTS;

