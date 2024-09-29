-- 댓글 테이블
CREATE TABLE comment (
    comment_id int auto_increment primary key,   -- 댓글 아이디 (고유값)
    product_id int not null,                     -- 상품 아이디(외래키)
    review_id int not null,                      -- 후기 아이디 (외래키)
    user_id varchar(150),                        -- 작성자 아이디 (외래키)
    comment_iontent text not null,               -- 댓글 내용
    comment_like int default 0,                  -- 좋아요
    logtime timestamp default current_timestamp, -- 댓글 작성 날짜
    FOREIGN KEY (review_id) REFERENCES review(review_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
