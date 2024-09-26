package product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import product.bean.ProductDTO;
import product.bean.ProductListPaging;
import product.dao.ProductDAO;
import com.control.CommandProcess;

public class ProductListFormService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        // 현재 페이지 번호
        int pg = 1;
        if (request.getParameter("pg") != null) {
            pg = Integer.parseInt(request.getParameter("pg"));
        }

        // 한 페이지에 보여줄 상품 수
        int pageSize = 5;

        // 전체 상품 수 조회
        ProductDAO productDAO = ProductDAO.getInstance();
        int totalA = productDAO.getTotalProducts(); // 총 상품 수

        // 페이징 처리
        ProductListPaging productPaging = new ProductListPaging();
        productPaging.setCurrentPage(pg);
        productPaging.setPageBlock(3); // 한 번에 보여줄 페이지 블록 수
        productPaging.setPageSize(pageSize);
        productPaging.setTotalA(totalA);
        productPaging.makePagingHTML();

        // 상품 목록 조회
        int startNum = (pg - 1) * pageSize;
        List<ProductDTO> productList = productDAO.getProductList(startNum, pageSize);

        // 이미지 경로 처리
        for (ProductDTO product : productList) {
            if (product.getProductImage() != null && !product.getProductImage().startsWith("/storage/")) {
                product.setProductImage("/storage/" + product.getProductImage());
            }
        }

        // 데이터 JSP에 전달
        request.setAttribute("productList", productList);
        request.setAttribute("productPaging", productPaging);

        return "/manager/productListForm.jsp";
    }
}
