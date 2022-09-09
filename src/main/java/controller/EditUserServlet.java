package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Entity.UserDAOImpl;
import model.User;

@WebServlet(urlPatterns = "/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("utf-8");
		UserDAOImpl userDao = new UserDAOImpl();
		String nameUser = req.getParameter("userName");
		User user = (User) userDao.findById(nameUser);

		String newName = (String) req.getParameter("newName");
		String newEmail = (String) req.getParameter("newEmail");
		String newPhone = (String) req.getParameter("newPhone");
		String newAddress = (String) req.getParameter("newAddress");

		String roleInt = req.getParameter("role");
		String genderInt = req.getParameter("gender");

		boolean gender = false;
		if (genderInt == null || genderInt.equals("1")) {
			gender = true;
		}
		boolean role = false;
		if (roleInt == null || roleInt.equals("1")) {
			role = true;
		}
		System.out.println("old : " + user);
		user.setName(newName);
		user.setEmail(newEmail);
		user.setPhone(newPhone);
		user.setAddress(newAddress);
		user.setGender(gender);
		user.setRole(role);

		System.out.println("new : " + user);
		userDao.update(user);
		req.getRequestDispatcher("users.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}
