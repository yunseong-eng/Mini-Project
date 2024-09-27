package review.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentDTO {
	private int comment_id, product_id, review_id;
	private String user_id, comment_iontent;
	private int comment_like;
	private Date logtime;
}