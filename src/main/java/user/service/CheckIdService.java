package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import user.dao.UserDAO;

public class CheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String id = request.getParameter("id");
		
		//DB
		UserDAO userDAO = UserDAO.getInstance();
		
		//id가 있으면 true(사용 불가능), id가 없으면 false(사용 가능)
		boolean exist = userDAO.isExistId(id);
		
		request.setAttribute("exist", exist);
		return "/user/checkId.jsp";
	}

}