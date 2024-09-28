--후기 테이블
CREATE TABLE review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,  -- 후기 아이디(고유값)
    product_id INT NOT NULL,                   -- 상품 아이디(외래키)
    user_id VARCHAR(150) NOT NULL,             -- 후기 작성자 id (외래키)
    review_content TEXT NOT NULL,              -- 후기 내용
    review_like INT DEFAULT 0,                 -- 좋아요 수
    logtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 후기 작성 날짜
    FOREIGN KEY (user_id) REFERENCES users(user_id), -- USERS 외래키
    FOREIGN KEY (product_id) REFERENCES products(product_id) -- PRODUCTS 아이디
);