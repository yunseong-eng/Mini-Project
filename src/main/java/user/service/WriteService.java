package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class WriteService implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		UserDTO userDTO = new UserDTO();
		
		userDTO.setName(request.getParameter("name"));
		userDTO.setUser_id(request.getParameter("user_id"));
		userDTO.setPwd(request.getParameter("pwd"));
		userDTO.setGender(request.getParameter("gender"));
		userDTO.setEmail1(request.getParameter("email1"));
		userDTO.setEmail2(request.getParameter("email2"));
		userDTO.setTel1(request.getParameter("tel1"));
		userDTO.setTel2(request.getParameter("tel2"));
		userDTO.setTel3(request.getParameter("tel3"));
		userDTO.setZipcode(request.getParameter("zipcode"));
		userDTO.setAddr1(request.getParameter("addr1"));
		userDTO.setAddr2(request.getParameter("addr2"));
		
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.write(userDTO);
		
		return "none";
	}
}
