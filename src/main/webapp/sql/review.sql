-- 후기 테이블
CREATE TABLE review (
    review_id int auto_increment primary key,  -- 후기 아이디(고유값)
    product_id int not null,                   -- 상품 아이디(외래키)
    user_id varchar(150) not null,             -- 후기 작성자 id (외래키)
    review_content text not null,              -- 후기 내용
    review_like int default 0,                 -- 좋아요 수
    logtime timestamp default current_timestamp,  -- 후기 작성 날짜
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
