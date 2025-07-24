
SELECT
    USERNAME,
    REGISTRATION_DATE
    FROM USERS
ORDER BY REGISTRATION_DATE DESC
;

SELECT
    post_id,
    user_id,
    content,
    creation_date
FROM
    POSTS
ORDER BY
    creation_date DESC
;


SELECT
    post_id,
    post_type,
    creation_date
FROM
    POSTS
ORDER BY POST_TYPE,CREATION_DATE
;

-- 별칭으로도 정렬 가능
SELECT
    USERNAME AS UNAME,
    REGISTRATION_DATE
FROM USERS
ORDER BY UNAME DESC
;




-- 적힌 순번으로도 정렬 가능 실무에서는 안쓰임
SELECT
    USERNAME AS UNAME, -- 1번
    REGISTRATION_DATE -- 2번
FROM USERS
ORDER BY 1 DESC
;



-- 이렇게 적는 방식을 섞어서 써도 가능
SELECT
    USERNAME AS UNAME, -- 1번
    REGISTRATION_DATE -- 2번
FROM USERS
ORDER BY UNAME DESC, 2 ASC
;

SELECT
    user_id,
    COUNT(*) AS post_count
FROM
    POSTS
GROUP BY
    user_id
ORDER BY COUNT(*) DESC;

SELECT
    user_id,
    COUNT(*) AS post_count
FROM
    POSTS
GROUP BY
    user_id
ORDER BY COUNT(*) DESC,USER_ID ASC;-- 집계함수도 적을수있음
--        COUNT(*) 기준으로 내림차순 정렬된것중에 중복되는건 USER_ID로 정렬




SELECT
    post_id ,
    user_id,
    content,
    creation_date
FROM
    POSTS
ORDER BY
    CASE
        WHEN user_id = 21 THEN 1 -- user_id가 1이면 1순위
        ELSE 2                   -- 나머지는 2순위
        END,-- 1차 정렬 기준: CASE 표현식
        CREATION_DATE DESC
   ;



SELECT FULL_NAME,BIO

FROM USER_PROFILES
ORDER BY LENGTH(BIO) DESC
;


SELECT POST_ID,
       COUNT(*) AS "댓글 수"

FROM COMMENTS
GROUP BY POST_ID
ORDER BY "댓글 수" DESC
;

SELECT *
FROM POSTS
ORDER BY
    CASE
        WHEN POST_TYPE= 'photo' THEN 0
        WHEN POST_TYPE= 'video' THEN 100
        END DESC,
   CREATION_DATE DESC
;





