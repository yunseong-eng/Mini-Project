package product.dao;

import product.bean.ProductDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

public class ProductDAO {
    private SqlSessionFactory sqlSessionFactory;

    //싱글톤 패턴 적용
    private static ProductDAO instance = new ProductDAO();

    //외부에서 객체를 생성할 수 없도록 private 생성자
    private ProductDAO() {
        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //싱글톤 인스턴스 반환
    public static ProductDAO getInstance() {
        return instance;
    }

    //카테고리별 상품 조회
    public List<ProductDTO> getProductsByCategory(String ctg) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("productMapper.getProductsByCategory", ctg);
        }
    }

    //상품 등록 메소드
    public void insertProduct(ProductDTO productDTO) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            sqlSession.insert("productMapper.insertProduct", productDTO);
            sqlSession.commit();
        }
    }

    //전체 상품 목록 조회 메소드 추가
    public List<ProductDTO> getAllProducts() {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("productMapper.getAllProducts");
        }
    }

    //페이징 처리를 위한 상품 목록 조회 메소드 추가
    public List<ProductDTO> getProductList(int startNum, int pageSize) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            Map<String, Integer> paramMap = Map.of("startNum", startNum, "pageSize", pageSize);
            return sqlSession.selectList("productMapper.getProductList", paramMap);
        }
    }

    //총 상품 수 조회 메소드 추가
    public int getTotalProducts() {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("productMapper.getTotalProducts");
        }
    }
   
    //상품삭제
    public void deleteProduct(int productId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            sqlSession.delete("productMapper.deleteProduct", productId);
            sqlSession.commit();
        }
    }
    
    //상품수정
    public ProductDTO getProductById(int productId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("productMapper.getProductById", productId);
        }
    }
    //DB반영
    public void updateProduct(ProductDTO productDTO) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            sqlSession.update("productMapper.updateProduct", productDTO);
            sqlSession.commit();
        }
    }
}
