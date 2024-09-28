package review.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import orders.dao.OrdersDAO;
import orders.bean.OrdersDTO;
import com.control.CommandProcess;

public class ReviewWriteFormService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        // 주문 ID를 가져와서 해당 상품 정보를 조회
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrdersDAO ordersDAO = OrdersDAO.getInstance();
        OrdersDTO orderDTO = ordersDAO.getOrderDetail(orderId);

        request.setAttribute("order", orderDTO);
        return "/review/reviewWriteForm.jsp";  // 후기 작성 폼 화면으로 이동
    }
}
