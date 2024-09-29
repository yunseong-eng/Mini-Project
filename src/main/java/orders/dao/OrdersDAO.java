package orders.dao;

import orders.bean.OrdersDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

public class OrdersDAO {
    private SqlSessionFactory sqlSessionFactory;

    private static OrdersDAO instance = new OrdersDAO();

    private OrdersDAO() {
        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static OrdersDAO getInstance() {
        return instance;
    }

    // 사용자 ID로 주문 목록 조회
    public List<OrdersDTO> getOrdersByUserId(String userId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("ordersMapper.getOrdersByUserId", userId);
        }
    }

    // 주문 ID로 주문 상세 정보 조회
    public OrdersDTO getOrderDetail(int orderId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("ordersMapper.getOrderDetail", orderId);
        }
    }
}
