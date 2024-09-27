--후기 테이블
create table review (
	review_id int auto_increment primary key,	-- 후기 아이디(고유값)
	product_id int not null,					-- 상품 아이디(외래키)
	user_id varchar(150) not null,				-- 후기 작성자 id (외래키)
	review_title varchar(400) not null,
	review_content text not null,				-- 후기 내용
	review_like int default 0,						-- 좋아요
	logtime timestamp default current_timestamp,	-- 후기 작성 날짜

	foreign key (user_id) references users(user_id), -- USERS 외래키
	foreign key (product_id) references products(product_id) -- PRODUCTS 아이디
);