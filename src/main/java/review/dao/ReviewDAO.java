package review.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import product.bean.ProductDTO;
import product.dao.ProductDAO;
import review.bean.CommentDTO;
import review.bean.ReviewDTO;

public class ReviewDAO {
//DB ------------------------------------------------
    private SqlSessionFactory sqlSessionFactory;

    //싱글톤 패턴 적용
    private static ReviewDAO instance = new ReviewDAO();

    //외부에서 객체를 생성할 수 없도록 private 생성자
    private ReviewDAO() {
        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //싱글톤 인스턴스 반환
    public static ReviewDAO getInstance() {
        return instance;
    }
    
//DB ------------------------------------------------

    // 리뷰 리스트
	public List<ReviewDTO> getReviewList(String productId) {
		 try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
	            return sqlSession.selectList("reviewMapper.getReviewList", productId);
	        }
	}
	
	// 댓글 리스트
	public List<CommentDTO> getCommentList(String productId) {
		 try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
	            return sqlSession.selectList("reviewMapper.getCommentList", productId);
	        }
	}

	
	// 댓글 쓰기
	public void commentWrite(Map<String, Object> map) {
		 try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
	            sqlSession.selectList("reviewMapper.commentWrite", map);
	            sqlSession.commit();
	        }
		
	}
	//댓글 삭제
	public void deleteComment(String comment_id) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            sqlSession.selectList("reviewMapper.deleteComment", comment_id);
            sqlSession.commit();
        }
	}
    
}

