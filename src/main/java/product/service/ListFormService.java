package product.service;


import java.util.ArrayList;
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
		
		filter = (filter != null && !filter.isEmpty()) ? filter : "logtime";
		align = (align != null && !align.isEmpty()) ? align : "desc";
		
		Map<String, Object> map = new HashMap<>();
		map.put("ctg", ctg != null ? ctg : "MEN"); // 기본 카테고리 설정
		map.put("filter", filter); // 기본 정렬 기준
		map.put("align", align); // 기본 정렬 방향
		
		System.out.println(ctg + ", " + filter + ", " + align);
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> list = dao.getProductsList(map);
		
		if (!list.isEmpty()) {
			request.setAttribute("list", list);
		} else {
			request.setAttribute("list", new ArrayList<>());
		}
		
		String ctgTitle = null;
		
		if(ctg.equals("men")) {
			ctgTitle = "남자 운동화";
		}else if(ctg.equals("women")) {
			ctgTitle = "여자 운동화";
		}else if(ctg.equals("kids")) {
			ctgTitle = "아이 운동화";
		}else if(ctg.equals("sports")) {
			ctgTitle = "스포츠 운동화";
		}
		
		request.setAttribute("ctgTitle", ctgTitle);
		request.setAttribute("map", map);
		
		System.out.println(ctgTitle);

		return "/product/listForm.jsp";
	}

}
