package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;
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
		sqlSession.insert("usersSQL.write", usersDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public UsersDTO usersLogin(String user_id, String pwd) {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("pwd", pwd);

		SqlSession sqlSession = sqlSessionFactory.openSession();
		UsersDTO usersDTO = sqlSession.selectOne("usersSQL.login", map);
		sqlSession.close();
		return usersDTO;
	}

	public UsersDTO getUsers(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UsersDTO usersDTO = sqlSession.selectOne("usersSQL.getMember", user_id);
		sqlSession.close();
		return usersDTO;
	}

	public void updateUsers(UsersDTO usersDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("usersSQL.updateUsers", usersDTO);
		sqlSession.commit();
		sqlSession.close();
	}

}