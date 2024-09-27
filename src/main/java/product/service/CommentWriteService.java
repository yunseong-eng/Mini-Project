package product.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import review.dao.ReviewDAO;

public class CommentWriteService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int review_id = Integer.parseInt(request.getParameter("review_id"));
		String user_id = request.getParameter("user_id");
		String comment_iontent = request.getParameter("comment_iontent");
		
		Map<String, Object> map = new HashMap<>();
		map.put("product_id", product_id);
		map.put("review_id", review_id);
		map.put("user_id", user_id);
		map.put("comment_iontent", comment_iontent);
		
		ReviewDAO dao = ReviewDAO.getInstance();
		dao.commentWrite(map);
		
		request.setAttribute("commentWrite", map);
		return "none";
	}

}
