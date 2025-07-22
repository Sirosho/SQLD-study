
select *
from users
where username = 'pikachu'
;

select *
from posts
where CREATION_DATE between to_date('2023-01-01','YYYY-MM-DD')
                    and to_date('2023-12-31','YYYY-MM-DD')
;
select username,email
from users
where user_id in (1,2,3,4,5,6,7,8)
;

select post_id,content
from posts
where content like '%#먹스타그램%'
;

select *
from posts
where user_id = 1 and post_type = 'photo'
;

select username
from users
where user_id not between(1)
            and(20)







