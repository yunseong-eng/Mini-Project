package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import user.dao.UsersDAO;

public class DeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("user_id");
		
		UsersDAO usersDAO = UsersDAO.getInstance();
		
		usersDAO.deleteUser(id);
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "none";
	}

}
