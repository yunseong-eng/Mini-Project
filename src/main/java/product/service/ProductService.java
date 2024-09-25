package product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.control.CommandProcess;
import product.bean.ProductDTO;
import product.dao.ProductDAO;

public class ProductService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        // 카테고리 파라미터를 가져옴
        String ctg = request.getParameter("category");

        // ProductDAO를 통해 해당 카테고리의 상품 목록을 가져옴
        ProductDAO productDAO = ProductDAO.getInstance();
        List<ProductDTO> products = productDAO.getProductsByCategory(ctg);

        // JSP로 데이터 전달
        request.setAttribute("products", products);
        request.setAttribute("category", ctg);

        // 결과 페이지로 이동
        return "/product/productList.jsp";
    }
}
