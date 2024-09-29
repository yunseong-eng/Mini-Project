-- 회원 테이블
CREATE TABLE users (
    name varchar(150) not null,          -- 이름
    user_id varchar(150) primary key,    -- 아이디
    pwd varchar(70) not null,            -- 비밀번호
    gender varchar(10),                  -- 성별
    email1 varchar(150),                 -- 이메일
    email2 varchar(50),
    tel1 varchar(10),                    -- 전화번호
    tel2 varchar(10),
    tel3 varchar(10),
    zipcode varchar(10),                 -- 우편번호
    addr1 varchar(300),                  -- 주소
    addr2 varchar(300)                   -- 상세 주소
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
