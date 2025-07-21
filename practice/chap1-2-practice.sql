
SELECT DISTINCT *
from HASHTAGS
;

SELECT content,creation_date
from POSTS
;

SELECT user_id
from LIKES
;

SELECT 
full_name AS "전체 이름"
,bio AS "자기소개"
from USER_PROFILES
;

SELECT user_id || ' 님이 ' || COMMENT_TEXT ||' 라고 댓글을 남겼습니다.' as "댓글알림"
from Comments
;