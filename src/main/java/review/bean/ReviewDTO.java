package review.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewDTO {
	private int review_id, product_id;
	private String user_id, review_title, review_content;
	private int review_like;
	private Date logtime;
}