package product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import product.bean.ProductDTO;
import product.dao.ProductDAO;

public class ProductModifyService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        //선택된 상품 ID를 받아온다.
        String productId = request.getParameter("productIds");

        if (productId == null || productId.isEmpty()) {
            throw new Exception("Product ID is missing");
        }

        //상품 정보를 조회하고 JSP에 전달
        ProductDAO productDAO = ProductDAO.getInstance();
        ProductDTO productDTO = productDAO.getProductById(Integer.parseInt(productId));

        if (productDTO == null) {
            throw new Exception("Product not found");
        } else {
            System.out.println("Product found: " + productDTO.getProductName()); 
        }

        //상품 정보를 JSP로 전달
        request.setAttribute("productDTO", productDTO);

        return "/manager/productModifyForm.jsp";
    }
}
