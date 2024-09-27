package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import user.bean.UsersDTO;
import user.dao.UsersDAO;

public class UpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("userId");
		
		UsersDAO usersDAO = UsersDAO.getInstance();
		UsersDTO usersDTO = usersDAO.getUsers(id);
		
		request.setAttribute("userDTO", usersDTO);
		
		return "/user/updateForm.jsp";
	}

}
