package product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;
import product.dao.ProductDAO;

public class ProductDeleteService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        //선택된 상품 ID를 배열로 받음
        String[] productIds = request.getParameterValues("productIds");

        //만약 선택된 상품이 없으면, 바로 목록으로 리다이렉트
        if (productIds == null || productIds.length == 0) {
            return "/manager/productListForm.do";  //삭제할 항목이 없으면 목록으로 돌아감
        }

        //상품 삭제 처리
        ProductDAO productDAO = ProductDAO.getInstance();
        for (String productId : productIds) {
            productDAO.deleteProduct(Integer.parseInt(productId));
        }

        return "/manager/productListForm.do";  //삭제 완료 후 상품 목록으로 이동
    }
}
