package product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import review.dao.ReviewDAO;

public class DeleteCommentService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String comment_id = request.getParameter("comment_id");
		
		ReviewDAO dao = ReviewDAO.getInstance();
		dao.deleteComment(comment_id);
		
		return null;
	}

}

