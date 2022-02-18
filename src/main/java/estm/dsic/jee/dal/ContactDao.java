package estm.dsic.jee.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ContactDao {
	Connection con;

	public ContactDao(Connection con) {
		this.con = con;
	}

	public boolean addContact(Contact contact) {
		boolean bool = false;

		String req = "INSERT INTO `gestioncontacts`.`contacts` (`name`, `adresse`, `email`, `tel`) VALUES (?, ?, ?, ?);";
		try {

			PreparedStatement ps = this.con.prepareStatement(req);
			ps.setString(1, contact.getNom());
			ps.setString(2, contact.getAdresse());
			ps.setString(3, contact.getEmail());
			ps.setString(4, contact.getTel());

			if (ps.executeUpdate() >= 1) {
				bool = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return bool;
	}

	public ArrayList<Contact> getContacts(String val) {
		ArrayList<Contact> arrayList = new ArrayList<Contact>();
		String req = "SELECT * FROM `gestioncontacts`.`contacts`";

		if (val != null) {
			req = "SELECT * FROM `gestioncontacts`.`contacts` where name like '%" + val + "%' or adresse like '%" + val
					+ "%' or email like '%" + val + "%'or tel like '%" + val + "%' ";
		}

		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(req);

			while (rs.next()) {
				Contact contact = new Contact(rs.getInt("id_contact"), rs.getString("name"), rs.getString("adresse"),
						rs.getString("email"), rs.getString("tel"));
				arrayList.add(contact);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arrayList;
	}

	public boolean modContact(Contact contact) {
		boolean bool = false;

		String req = "UPDATE `gestioncontacts`.`contacts` SET `name`=?, `adresse`=?, `email`=?, `tel`=? WHERE  `id_contact`=?;";
		try {

			PreparedStatement ps = con.prepareStatement(req);
			ps.setString(1, contact.getNom());
			ps.setString(2, contact.getAdresse());
			ps.setString(3, contact.getEmail());
			ps.setString(4, contact.getTel());
			ps.setInt(5, contact.getId_contact());

			if (ps.executeUpdate() >= 1) {
				bool = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return bool;
	}

	public Contact getContactByID(int idCon) {
		Contact contact = null;
		String req = "SELECT * FROM `gestioncontacts`.`contacts` WHERE `id_contact` =" + idCon + ";";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(req);

			while (rs.next()) {
				contact = new Contact(rs.getInt("id_contact"), rs.getString("name"), rs.getString("adresse"),
						rs.getString("email"), rs.getString("tel"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return contact;
	}

	public boolean delContact(int idCon) {
		boolean bool = false;

		String req = "DELETE FROM `gestioncontacts`.`contacts` WHERE  `id_contact`=?;";
		try {

			PreparedStatement ps = con.prepareStatement(req);
			ps.setInt(1, idCon);

			if (ps.executeUpdate() >= 1) {
				bool = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return bool;
	}

}
