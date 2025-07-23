-- 1. POSTS 테이블에 숫자 타입의 view_count 컬럼을 추가합니다.
ALTER TABLE POSTS
    ADD (view_count NUMBER);

-- 2. 모든 게시물에 100 ~ 50000 사이의 임의의 조회수 데이터를 넣어줍니다.
UPDATE POSTS
SET view_count = TRUNC(DBMS_RANDOM.VALUE(100, 50000));

-- 3. 변경사항을 최종 저장합니다.
COMMIT;

select 8
From posts;

select username
from users;

select count(username)
from users;
-- 모든 집계함수는 null은 제외하고 계산함
select count(manager_id)
from users;


-- POSTS 테이블에서 view_count의 최솟값과 최댓값을 찾습니다.
SELECT MIN(view_count) AS "최저 조회수",
       MAX(view_count) AS "최고 조회수"
FROM POSTS;


-- 모든 게시물의 view_count를 합산합니다.
SELECT view_count
FROM POSTS;

UPDATE POSTS
set view_count = null
where post_id = 2;

SELECT AVG(VIEW_COUNT)   AS "평균 조회수",
       SUM(VIEW_COUNT)   AS "총 조회수",
       COUNT(VIEW_COUNT) AS "게시물 수"
FROM POSTS
WHERE post_id BETWEEN 1 AND 3
;


-- 유저별로 피드를 몇개씩 썼는지 알고 싶다.
select user_id,
       count(*) as "유저별 피드 수"
from posts
group by user_id -- user_id가 같은 게시물끼리 묶는다
order by user_id
;

select user_id,
       post_type,
       count(*) as "유저의 종류별 피드 수"
from posts
group by user_id, post_type
order by user_id, post_type
;


select user_id,
       count(*) as "유저별 피드 수"
from posts
group by user_id -- user_id가 같은 게시물끼리 묶는다
order by user_id
;

-- WHERE 은 집계 전의 필터링
-- HAVING 은 집계 후의 필터링


SELECT user_id,
       COUNT(*) AS post_count
FROM POSTS
GROUP BY user_id
HAVING COUNT(*) >= 10 -- 게시물을 10개이상 쓴 사용자만 조회
;



-- POSTS 테이블에서 장문(20글자이상)의 피드를 쓴 게시물들
-- 유저별로 보고싶음
SELECT USER_ID,
       COUNT(*) AS "장문 게시물 수"
FROM POSTS
WHERE LENGTH(CONTENT) >= 25
GROUP BY USER_ID
HAVING COUNT(*) >= 5
;


SELECT post_id,
       COUNT(*) AS like_count
FROM LIKES
WHERE creation_date >= TO_DATE('2024-01-01', 'YYYY-MM-DD') -- 1. 개별 '좋아요' 데이터를 먼저 필터링
GROUP BY post_id -- 2. 게시물 ID 별로 그룹화
HAVING COUNT(*) >= 20; -- 3. 그룹별 '좋아요' 수가 20개 이상인 그룹만 필터링
;
-- 집계함수는 쓸수있는데가 정해져있음


SELECT POST_TYPE,
       COUNT(*) AS COUNT
FROM POSTS
GROUP BY POST_TYPE
;


SELECT POST_ID,
       COUNT(*) AS COMMENT_COUNT
FROM COMMENTS
GROUP BY POST_ID
;

SELECT *
FROM POSTS
;

SELECT FOLLOWING_ID,

       COUNT(*) AS FOLLOW_COUNT
FROM FOLLOWS
GROUP BY FOLLOWING_ID
;





SELECT POST_ID,

       COUNT(*) AS "댓글수"
FROM COMMENTS
GROUP BY POST_ID
HAVING COUNT(*) >=5
;



SELECT USER_ID,
       COUNT(*) AS "작성수"
FROM POSTS
WHERE USER_ID BETWEEN 1 AND 8
GROUP BY USER_ID
;

SELECT
    USER_ID,
    SUM(USER_ID) AS "작성한 게시물 수"
FROM
    POSTS
GROUP BY
    USER_ID
;



SELECT *
FROM
    POSTS
;







