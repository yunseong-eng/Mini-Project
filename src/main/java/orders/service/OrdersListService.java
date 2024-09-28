package orders.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import orders.dao.OrdersDAO;
import orders.bean.OrdersDTO;
import com.control.CommandProcess;

public class OrdersListService implements CommandProcess {
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        
        if (userId == null) {
            return "/user/loginForm.jsp";  // userId가 없으면 로그인 페이지로 이동
        }
        
        OrdersDAO ordersDAO = OrdersDAO.getInstance();
        List<OrdersDTO> orderList = ordersDAO.getOrdersByUserId(userId);

        request.setAttribute("orderList", orderList);
        return "/orders/ordersList.jsp";  // 구매 목록 화면으로 이동
    }
}
