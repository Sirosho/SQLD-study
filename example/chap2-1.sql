

-- 합집합 연산
SELECT USER_ID AS "LIKES USER ID" , POST_ID FROM LIKES
UNION ALL
SELECT USER_ID "COMMENTS USER ID" FROM COMMENTS
;



SELECT USER_ID FROM LIKES
UNION
SELECT USER_ID  FROM COMMENTS
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


SELECT
    U.USER_ID,
    U.USERNAME,
    PC.POST_COUNT
FROM USERS U
JOIN (
    SELECT USER_ID, COUNT(*) AS POST_COUNT
    FROM POSTS
    GROUP BY USER_ID
) PC
ON PC.USER_ID = U.USER_ID
;



SELECT * FROM LIKES
ORDER BY USER_ID
;

SELECT
    A.USER_ID,
    U.USERNAME,
    A.TOTAL_LIKES
    FROM(
        SELECT
            USER_ID,
            COUNT(*) AS TOTAL_LIKES
        FROM LIKES
        GROUP BY USER_ID
        )A
INNER JOIN USERS U
ON A.USER_ID = U.USER_ID
;

-- 스칼라 서브쿼리 == 연관 서브쿼리
-- 연관 서브쿼리: 서브쿼리가 한 번 실행되고 끝나는게 아니라
-- 바깥쪽 메인쿼리 한 행을 실행할때마다 반복실행
SELECT
    U.USER_ID,
    U.USERNAME,
    (SELECT BIO FROM USER_PROFILES UP WHERE U.USER_ID = UP.USER_ID) AS BIO
FROM USERS U
;

SELECT * FROM USERS;


-- 피드별로 피드의 ID와 피드의 내용과 각 피드가 받은 좋아요 수를 한번에 조회

SELECT
    POST_ID,
    CONTENT
FROM POSTS;

SELECT POST_ID,COUNT(*) AS LIKE_COUNT
FROM LIKES
GROUP BY POST_ID
ORDER BY POST_ID
;

SELECT
    POST_ID,COUNT(*) AS REPLY_COUNT
FROM COMMENTS
GROUP BY POST_ID
ORDER BY POST_ID
;



-- NON 스칼라 ver
SELECT
    P.POST_ID,
    P.CONTENT,
    NVL(LC.LIKE_COUNT,0) AS LIKE_COUNT,
    NVL(RC.REPLY_COUNT,0) AS REPLY_COUNT
FROM POSTS P
LEFT OUTER JOIN (
      SELECT POST_ID,COUNT(*) AS LIKE_COUNT
      FROM LIKES
      GROUP BY POST_ID) LC
ON P.POST_ID = LC.POST_ID
LEFT OUTER JOIN (
            SELECT
            POST_ID,COUNT(*) AS REPLY_COUNT
            FROM COMMENTS
            GROUP BY POST_ID
            ORDER BY POST_ID) RC
ON LC.POST_ID = RC.POST_ID
ORDER BY P.POST_ID
;


-- 스칼라 ver

SELECT
    p.post_id,
    p.content,
    (SELECT COUNT(*) FROM LIKES l WHERE l.post_id = p.post_id) AS "좋아요 수",
    (SELECT COUNT(*) FROM COMMENTS c WHERE c.post_id = p.post_id) AS "댓글 수"
FROM
    POSTS p
;


-- 게시물을 한 번이라도 작성한 적이 있는 모든 사용자의 이름을 알려주세요

SELECT
    DISTINCT U.USER_ID,
             U.USERNAME
FROM POSTS P
JOIN USERS U
ON P.USER_ID = U.USER_ID
ORDER BY USER_ID
;

SELECT
    u.username
FROM
    USERS u
WHERE
    EXISTS (SELECT 1 -- SELECT 절에 무엇이 오든 상관없어요. 존재 여부만 체크!
            FROM POSTS p
            WHERE p.user_id = u.user_id)
; -- 바깥 쿼리의 사용자가 쓴 게시물이 있는지 확인

SELECT
    U.USER_ID,U.USERNAME
FROM
    USERS U
ORDER BY U.USER_ID
;

SELECT P.USER_ID,P.POST_ID
FROM POSTS P
ORDER BY P.USER_ID
;






















