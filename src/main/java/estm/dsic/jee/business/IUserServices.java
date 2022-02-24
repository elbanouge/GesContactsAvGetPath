package estm.dsic.jee.business;

import estm.dsic.jee.dal.User;

public interface IUserServices {

	public boolean save(User u);

	public User auth(String email, String pass);

}
