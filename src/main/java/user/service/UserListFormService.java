package user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import user.bean.UsersDTO;
import user.bean.UserListPaging;
import user.dao.UsersDAO;

public class UserListFormService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        // 현재 페이지 번호 가져오기
        int pg = 1;
        if (request.getParameter("pg") != null) {
            pg = Integer.parseInt(request.getParameter("pg"));
        }

        // 한 페이지에 보여줄 회원 수 설정
        int pageSize = 5;

        // 전체 회원 수 조회
        UsersDAO usersDAO = UsersDAO.getInstance();
        int totalA = usersDAO.getTotalUsers(); // 총 회원 수

        // 페이징 처리
        UserListPaging userPaging = new UserListPaging();
        userPaging.setCurrentPage(pg);
        userPaging.setPageBlock(3); // 한 번에 보여줄 페이지 블록 수
        userPaging.setPageSize(pageSize);
        userPaging.setTotalA(totalA);
        userPaging.makePagingHTML();

        // 회원 목록 조회
        int startNum = (pg - 1) * pageSize;
        List<UsersDTO> userList = usersDAO.getUserList(startNum, pageSize);

        // 데이터 JSP에 전달
        request.setAttribute("userList", userList);
        request.setAttribute("userPaging", userPaging);

        // 회원 목록 JSP로 이동
        return "/manager/userListForm.jsp";
    }
}
