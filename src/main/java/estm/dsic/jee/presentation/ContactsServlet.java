package estm.dsic.jee.presentation;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import estm.dsic.jee.business.ContactServices;
import estm.dsic.jee.dal.Contact;

/**
 * Servlet implementation class ContactsServlet
 */
@WebServlet("/")
public class ContactsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContactServices contactServices;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactsServlet() {
		super();
		contactServices = new ContactServices();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insert(request, response);
				break;
			case "/delete":
				delete(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				update(request, response);
				break;
			case "/recherche":
				recherche(request, response);
				break;
			default:
				list(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void list(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		ArrayList<Contact> contactsList = contactServices.getAll(null);
		request.setAttribute("listContacts", contactsList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("contacts-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("contact-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Contact contact = contactServices.getContactByID(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("contact-form.jsp");
		request.setAttribute("contact", contact);
		dispatcher.forward(request, response);

	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

		String nom = request.getParameter("nom");
		String adresse = request.getParameter("adresse");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		Contact contact = new Contact(nom, adresse, email, tel);
		contactServices.add(contact);
		response.sendRedirect("list");
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String nom = request.getParameter("nom");
		String adresse = request.getParameter("adresse");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");

		Contact contact = new Contact(id, nom, adresse, email, tel);
		contactServices.edit(contact);
		response.sendRedirect("list");
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		contactServices.delete(id);
		response.sendRedirect("list");

	}

	private void recherche(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		ArrayList<Contact> conList = null;
		HttpSession session = request.getSession();
		String val = request.getParameter("value");

		if (val != null) {
			conList = contactServices.getAll(val);
			session.setAttribute("listContacts", conList);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("contacts-list.jsp");
		dispatcher.forward(request, response);
	}

}
