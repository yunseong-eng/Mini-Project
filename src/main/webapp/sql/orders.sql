-- 구매 테이블
CREATE TABLE orders (
    order_id int auto_increment primary key,   -- 주문 아이디 (고유값)
    user_id varchar(150),                      -- 주문자 아이디 (외래키)
    product_id int not null,                   -- 상품 아이디 (외래키)
    product_qty int default 0,                 -- 상품 개수
    logtime timestamp default current_timestamp,  -- 주문 날짜
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
