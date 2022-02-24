package estm.dsic.jee.business;

import java.sql.Connection;
import estm.dsic.jee.dal.DBConnection;
import estm.dsic.jee.dal.User;
import estm.dsic.jee.dal.UserDao;

public class UserServices implements IUserServices {

	private UserDao userDao;

	public UserServices() {
		Connection con = DBConnection.getConnection();
		userDao = new UserDao(con);
	}

	@Override
	public boolean save(User u) {
		// TODO Auto-generated method stub
		return userDao.saveUser(u);
	}

	@Override
	public User auth(String email, String pass) {
		// TODO Auto-generated method stub
		return userDao.login(email, pass);
	}

}
