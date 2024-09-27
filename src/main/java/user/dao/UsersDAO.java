package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UsersDTO;

public class UsersDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static UsersDAO instance = new UsersDAO();

	public static UsersDAO getInstance() {
		return instance;
	}

	public UsersDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean isExistId(String user_id) {
		boolean exist = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UsersDTO usersDTO = sqlSession.selectOne("usersSQL.isExistId", user_id);
		if (usersDTO != null)
			exist = true; // id가 존재, 사용 불가능
		sqlSession.close();
		return exist;
	}

	public void usersWrite(UsersDTO usersDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("usersSQL.usersWrite", usersDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public UsersDTO usersLogin(String user_id, String pwd) {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("pwd", pwd);

		SqlSession sqlSession = sqlSessionFactory.openSession();
		UsersDTO usersDTO = sqlSession.selectOne("usersSQL.usersLogin", map);
		sqlSession.close();
		return usersDTO;
	}

	public UsersDTO getUsers(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UsersDTO usersDTO = sqlSession.selectOne("usersSQL.getUsers", user_id);
		sqlSession.close();
		return usersDTO;
	}

	public void updateUsers(UsersDTO usersDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("usersSQL.updateUsers", usersDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void deleteUser(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("usersSQL.deleteUser", user_id);
		sqlSession.commit();
		sqlSession.close();
	}

	// 1.전체 회원 수 조회 메서드 추가
	public int getTotalUsers() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalUsers = sqlSession.selectOne("usersSQL.getTotalUsers");
		sqlSession.close();
		return totalUsers;
	}

	// 2.회원 목록 조회 메서드 추가 (페이징 처리)
	public List<UsersDTO> getUserList(int startNum, int pageSize) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("pageSize", pageSize);

		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UsersDTO> userList = sqlSession.selectList("usersSQL.getUserList", map);
		sqlSession.close();
		return userList;
	}
}
