package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import user.bean.UsersDTO;
import user.dao.UsersDAO;

public class UpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setUser_id(request.getParameter("user_id"));
		usersDTO.setPwd(request.getParameter("pwd"));
		usersDTO.setName(request.getParameter("name"));
		usersDTO.setTel1(request.getParameter("tel1"));
		usersDTO.setTel2(request.getParameter("tel2"));
		usersDTO.setTel3(request.getParameter("tel3"));
		usersDTO.setEmail1(request.getParameter("email1"));
		usersDTO.setEmail2(request.getParameter("email2"));
		usersDTO.setGender(request.getParameter("gender"));
		usersDTO.setZipcode(request.getParameter("zipcode"));
		usersDTO.setAddr1(request.getParameter("addr1"));
		usersDTO.setAddr2(request.getParameter("addr2"));
		
		UsersDAO usersDAO = UsersDAO.getInstance();
		usersDAO.updateUsers(usersDTO);
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "none";
	}

}
