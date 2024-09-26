package product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class ProductWriteFormService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        // 상품 등록 폼 페이지로 이동
        return "/manager/productWriteForm.jsp";
    }
}
