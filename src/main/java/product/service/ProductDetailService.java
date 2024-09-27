package product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import product.bean.ProductDTO;
import product.dao.ProductDAO;

public class ProductDetailService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String productId = request.getParameter("productId");
		
		ProductDAO dao = ProductDAO.getInstance();
		ProductDTO dto = dao.getProductDetail(productId);
		
		request.setAttribute("dto", dto);
		
		return "/product/productDetail.jsp";
	}

}
