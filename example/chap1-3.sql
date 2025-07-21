
-- 사용자 이름이 'ryan' 인 사용자의 모든 주문을 조회하는 쿼리

select *
from users
where username = 'ryan'
;

-- 유저의 아이디가 1번인 사용자가 올린 게시물
select *
from posts
where user_id =1 and POST_TYPE = 'video'
;

-- 유저아이디가 1번인 유저의 모든 피드게시물 또는 모든 유저의 비디오 게시물

select *
from posts
where user_id = 1 or POST_TYPE = 'video'
;

select *
from posts
where user_id <> 1
;

-- 가입일이 2022년도인 사용자를 찾기
select *
from users
where registration_date >= to_date('2022-01-01','YYYY-MM-DD')
and REGISTRATION_DATE<=to_date('2022-12-31','YYYY-MM-DD')
;

select *
from users
where REGISTRATION_DATE between to_date('2022-01-01','YYYY-MM-DD')
          and to_date('2022-12-31','YYYY-MM-DD')
;
select *
from users
where REGISTRATION_DATE not between to_date('2022-01-01','YYYY-MM-DD')
          and to_date('2022-12-31','YYYY-MM-DD')
;
-- not을 붙여서 반대결과를 뽑을수있음

-- 유저 아이디가 1 또는 9 또는 21인 사용자 정보 조회
select *
From users
where user_id = 1 or user_id = 9 or user_id = 21
;

-- IN : 특정 값의 집합에 포함되는지 확인
select *
from users
where user_id in(1,9,21)
;

select *
from users
where user_id not in(1,9,21)
;

-- LIKE : 특정 패턴과 일치하는 값을 조회
-- % : 0개 이상의 문자 (아무거나 몇개가 와도됨)
-- _: 1개의 문자 (아무거나 1개만 와야함)
-- username이 p로 시작하는 사용자 조회
select *
from users
where username Like 'p%'
;

-- u로 끝나는 사용자, 주로 확장자를 찾을때 많이 사용
select *
from users
where username Like '%chu'
;

select *
from users
where username Like 'r_an' --ryan, roan,rian 언더바 2개면 2글자
;

-- 해시태그에서 일상이 들어간 해시태그 전체조회
select *
from hashtags
where tag_name Like '%일상%'
;
-- like 문도 Not like 로 부정문 가능
select *
from hashtags
where tag_name not Like '%일상%'
;


-- manager_id 가 null인 사용자 조회

select *
from users
where manager_id is null -- null을 찾을 때에는 =이 아닌 is, is not 으로 비교해서 찾아야한다.
;


