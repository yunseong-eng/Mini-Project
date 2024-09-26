package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import user.bean.UsersDTO;
import user.dao.UsersDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String user_id = request.getParameter("user_id");
		String pwd = request.getParameter("pwd");
		
		//DB
		UsersDAO usersDAO = UsersDAO.getInstance();
		UsersDTO usersDTO = usersDAO.usersLogin(user_id, pwd);
	
		if(usersDTO == null)
			return "/user/loginFail.jsp";
		else {
			//세션
			HttpSession session = request.getSession(); //세션 생성
			
			session.setAttribute("userName", usersDTO.getName());
			session.setAttribute("userId", user_id);
			session.setAttribute("userEmail", usersDTO.getEmail1()+"@"+usersDTO.getEmail2());
			
			session.setAttribute("userDTO", usersDTO);
		
			return "/user/loginOk.jsp";
		}
	}
}
