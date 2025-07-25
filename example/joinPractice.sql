CREATE TABLE members (
                         member_id number PRIMARY KEY,
                         name VARCHAR2(50),
                         email VARCHAR2(100)
);
CREATE TABLE orders (
                        order_id number PRIMARY KEY,
                        member_id number,
                        product_name VARCHAR2(100),
                        amount number,
                        order_date DATE
);
-- members
INSERT INTO members VALUES (1, '홍길동', 'hong@gmail.com');
INSERT INTO members VALUES (2, '김철수', 'kim@gmail.com');
INSERT INTO members VALUES (3, '이영희', 'lee@gmail.com');

-- orders
INSERT INTO orders VALUES (101, 1, '노트북', 1200000, '2024-12-01');
INSERT INTO orders VALUES (102, 1, '마우스', 25000, '2024-12-05');
INSERT INTO orders VALUES (103, 2, '키보드', 55000, '2025-01-15');
INSERT INTO orders VALUES (104, 4, '모니터', 300000, '2025-01-20');



SELECT *
FROM MEMBERS
;

SELECT *
FROM MEMBERS M,ORDERS O
WHERE M.MEMBER_ID = O.MEMBER_ID
;

SELECT *
FROM MEMBERS M,ORDERS O
WHERE M.MEMBER_ID = O.MEMBER_ID
;









