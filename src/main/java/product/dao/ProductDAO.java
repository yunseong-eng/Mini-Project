package product.dao;

import product.bean.ProductDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

public class ProductDAO {
    private SqlSessionFactory sqlSessionFactory;

    // 싱글톤 패턴 적용
    private static ProductDAO instance = new ProductDAO();

    // 외부에서 객체를 생성할 수 없도록 private 생성자
    private ProductDAO() {
        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 싱글톤 인스턴스 반환
    public static ProductDAO getInstance() {
        return instance;
    }

    // 카테고리별 상품 조회
    public List<ProductDTO> getProductsByCategory(String ctg) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        List<ProductDTO> products = sqlSession.selectList("productMapper.getProductsByCategory", ctg);
        sqlSession.close();
        return products;
    }

    // 상품 등록 메소드
    public void insertProduct(ProductDTO productDTO) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        sqlSession.insert("productMapper.insertProduct", productDTO);
        sqlSession.commit();
        sqlSession.close();
    }

	public ProductDTO getProductDetail(String productId) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
        ProductDTO dto = sqlSession.selectOne("productMapper.getProductDetail", productId);
        sqlSession.close();
        
		return dto;
	}
}
