package product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import product.bean.ProductDTO;
import product.dao.ProductDAO;

public class ProductSearchService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String search = request.getParameter("search");
		System.out.println(search);
		ProductDAO productDAO = ProductDAO.getInstance();
		List<ProductDTO> list = productDAO.searchProduct(search);

        //이미지 경로 처리
        for (ProductDTO product : list) {
            if (product.getProductImage() != null && !product.getProductImage().startsWith("/storage/")) {
                product.setProductImage("/storage/" + product.getProductImage());
            }
        }

        //데이터 JSP에 전달
		request.setAttribute("search", search);
        request.setAttribute("list", list);
        
        System.out.println("데이터 전달");
		return "/product/searchForm.jsp";
	}

}
