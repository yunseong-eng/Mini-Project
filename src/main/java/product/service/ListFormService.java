package product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import product.bean.ProductDTO;
import product.dao.ProductDAO;

public class ListFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//String ctg = "men";
		String ctg = request.getParameter("ctg");
		String filter= request.getParameter("filter");
		String align = request.getParameter("align");
		
		Map<String, Object> map = new HashMap<>();
		map.put("ctg", ctg != null ? ctg : "men"); // 기본 카테고리 설정
		map.put("filter", filter != null ? filter : "logtime"); // 기본 정렬 기준
		map.put("align", align != null ? align : "desc"); // 기본 정렬 방향
		
		System.out.println(ctg + ", " + filter + ", " + align);
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> list = dao.getProductsList(map);
		
		request.setAttribute("list", list);
		request.setAttribute("map", map);
		
		System.out.println(list.get(0).getProductPrice());
		
		return "/product/listForm.jsp";
	}

}
