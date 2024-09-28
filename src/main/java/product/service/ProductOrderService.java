package product.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import product.dao.ProductDAO;

public class ProductOrderService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		HttpSession session = request.getSession();//세션생성
		String user_id = (String) session.getAttribute("userId");
		
		if(user_id != null && !user_id.isEmpty()) {
			Map<String, Object> map = new HashMap<>();
			map.put("product_id", product_id);
			map.put("user_id", user_id);
			
			ProductDAO dao = ProductDAO.getInstance();
			dao.insertOrder(map);
		}
		
		return "none";
	}

}
