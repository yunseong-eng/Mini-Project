package product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import product.bean.ProductDTO;
import product.dao.ProductDAO;

import review.bean.CommentDTO;
import review.bean.ReviewDTO;
import review.dao.ReviewDAO;

public class DetailFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String productId = request.getParameter("productId");

		ProductDAO dao = ProductDAO.getInstance();
		ProductDTO dto = dao.getProductDetail(productId);
		
		request.setAttribute("dto", dto);

		ProductDAO productDAO = ProductDAO.getInstance();
		ProductDTO productDTO = productDAO.getProductDetail(productId);
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		List<ReviewDTO> reviewList = reviewDAO.getReviewList(productId);
		List<CommentDTO> commentList = reviewDAO.getCommentList(productId);
		
		request.setAttribute("dto", productDTO);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("commentList", commentList);

		return "/product/detailForm.jsp";
	}
}
