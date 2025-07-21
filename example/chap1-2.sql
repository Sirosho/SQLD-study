-- users 테이블의 모든 컬럼과 모든 데이터를 조회한다.
SELECT * -- users테이블의 모든정보, 실무에서는 안쓰는게 좋다. 유지보수나 보안면에서 직접 다 적어주는것이 좋음
from users
;

SELECT email,username -- 적힌 순서대로 표가 작성됨
FROM USERS
;

--POSTS 테이블에서 모든 게시물의 정보를 보고싶음
SELECT ALL post_type -- SELECT 뒤에는 ALL이 디폴트로 숨겨져 있음 중복을 포함해서 보여달라는 뜻
from POSTS
;

select DISTINCT post_type -- DISTINCT를 넣으면 중복제거된 값으로 출력
FROM POSTS
;


-- 열 별칭 정하기
SELECT 
    username as "사용자 이름"
    ,email as "이메일" 
FROM USERS
;

-- AS는 생략 가능
SELECT 
    username "사용자 이름"
    ,email "이메일" 
FROM USERS
;

-- 띄어 쓰기가 없으면 따옴표 생략 가능
SELECT 
    username "사용자 이름" -- 이거는 띄어쓰기가 있어서 불가능 별칭에만 쌍따옴표 
    ,email 이메일
FROM USERS
;


-- 사용자 이름에 추가 문자열을 연결해서 조회

-- '' : String
-- "" : Alias(별칭)

--          문자열에 문자열더하기 +가 아니고 ||를 씀 오라클에서만 가능함
SELECT USERNAME ||'님, 환영합니다!' AS "환영인사말" --오라클에서만 가능함
from users
;


SELECT follower_id || '님이' || following_id ||'님을 팔로우합니다.'
From FOLLOWS
;

-- 사용자의 이름과 가입일을 조합
select username || '(가입일 : ' || registration_date || ')' As "사용자 정보"
from USERS


