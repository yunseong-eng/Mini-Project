--후기/댓글 전체 테이블(트리거)
CREATE TABLE BOARD (
	board_id int auto_increment primary key, 		-- 게시글 아이디 (고유값)
	user_id varchar(150),						-- 작성자 아이디 (외래키, USERS 테이블의 userId)
	content text not null,						-- 게시글 내용
	logtime timestamp default current_timestamp,		-- 작성 날짜

	foreign key (user_id) references users(user_id)		-- 외래키
);
