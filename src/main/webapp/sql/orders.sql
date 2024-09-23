--구매 테이블
CREATE TABLE ORDERS(
	order_id int auto_increment primary key,		-- 주문 아이디 (고유값)
	user_id varchar(150),					-- 주문자 아이디 (외래키)
	product_id int not null,					-- 상품 아이디 (외래키)
	product_qty int default 0,				-- 상품 개수
	logtime timestamp default current_timestamp,	-- 주문 날짜

	session_data varchar(255),				-- 구매 후 저장되는 세션 정보?

	foreign key (user_id) references users(id), -- users 테이블과 연관
	foreign key (product_id) references products(product_id) -- products 테이블과 연관
);
