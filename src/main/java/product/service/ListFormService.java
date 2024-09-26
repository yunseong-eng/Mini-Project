package product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import product.bean.ProductDTO;
import product.dao.ProductDAO;

public class ListFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String ctg = "men";
		//request.getParameter("ctg");
		
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> list = dao.getProductsByCategory(ctg);
		
		request.setAttribute("list", list);
		System.out.println("list = " + list);
		return "/product/listForm.jsp";
	}

}
