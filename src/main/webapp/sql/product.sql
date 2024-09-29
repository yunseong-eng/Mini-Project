-- 상품 테이블
CREATE TABLE products (
    ctg char(50) not null,               -- 카테고리 (MEN, WOMEN, KIDS, SPORTS 중 하나)
    product_id int auto_increment primary key,  -- 상품 id (고유값)
    product_name varchar(150) not null,   -- 상품 이름
    product_price int not null default 0, -- 상품 가격
    product_qty int default 0,            -- 상품 개수
    hit int default 0,                    -- 조회수
    reply int default 0,                  -- 후기수
    product_image varchar(255) not null,  -- 상품 이미지 파일 경로
    product_description text,             -- 상품 설명
    logtime timestamp default current_timestamp -- 상품 등록 시간
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
