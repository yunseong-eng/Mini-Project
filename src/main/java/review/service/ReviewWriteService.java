package review.service;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review.dao.ReviewDAO;
import com.control.CommandProcess;

public class ReviewWriteService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        System.out.println("ReviewWriteService 호출됨");

        // 세션에서 사용자 ID 가져오기
        String userId = (String) request.getSession().getAttribute("userId");
        int productId = Integer.parseInt(request.getParameter("productId"));
        String reviewContent = request.getParameter("reviewContent");

        // DB 저장을 위한 데이터 준비
        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("productId", productId);
        map.put("reviewContent", reviewContent);

        // DAO를 통해 리뷰 저장
        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        reviewDAO.writeReview(map);

        // 리뷰 작성 후 해당 상품의 상세 페이지로 리디렉션
        response.sendRedirect(request.getContextPath() + "/product/detailForm.do?productId=" + productId);
        
        return null; // 여기서 JSP로 이동하지 않도록 null 반환
    }
}
