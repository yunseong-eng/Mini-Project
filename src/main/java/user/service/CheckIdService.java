package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import user.dao.UsersDAO;

public class CheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String user_id = request.getParameter("user_id");
		
		//DB
		UsersDAO usersDAO = UsersDAO.getInstance();
		
		//id가 있으면 true(사용 불가능), id가 없으면 false(사용 가능)
		boolean exist = usersDAO.isExistId(user_id);
		
		request.setAttribute("exist", exist);
		return "/user/checkId.jsp";
	}

}
