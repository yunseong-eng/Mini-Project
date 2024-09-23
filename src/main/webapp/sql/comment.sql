--댓글 테이블
CREATE TABLE COMMENT(
	comment_id int auto_increment primary key,		-- 댓글 아이디 (고유값)
	product_id int not null,						-- 상품 아이디(외래키)
	review_id int not null,						-- 후기 아이디 (외래키)
	user_id varchar(150),						-- 작성자 아이디 (외래키)
	comment_iontent text not null,				-- 댓글 내용
	like int default 0,							-- 좋아요
	logtime timestamp default current_timestamp,		-- 댓글 작성 날짜

	foreign key (review_id) references review(review_id),	-- review 테이블과 연관
	foreign key (user_id) references users(user_id)		-- users 테이블과 연관
);
