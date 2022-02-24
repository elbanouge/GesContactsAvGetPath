package estm.dsic.jee.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
	Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

	// for register user
	public boolean saveUser(User user) {
		boolean set = false;
		try {
			// Insert register data to database
			String query = "insert into users(name,email,password) values(?,?,?)";

			PreparedStatement pt = this.con.prepareStatement(query);
			pt.setString(1, user.getName());
			pt.setString(2, user.getEmail());
			pt.setString(3, user.getPassword());

			pt.executeUpdate();
			set = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return set;
	}

	// user login
	public User login(String name, String pass) {
		User usr = null;
		try {
			String query = "select * from users where name=? and password=?";
			PreparedStatement pst = this.con.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, pass);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				usr = new User();
				usr.setId(rs.getInt("id_user"));
				usr.setName(rs.getString("name"));
				usr.setEmail(rs.getString("email"));
				usr.setPassword(rs.getString("password"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return usr;
	}

}
