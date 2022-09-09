package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import dao.DAOFactory;
import dao.Entity.EntityDao;
import model.User;

@WebServlet(urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		EntityDao daouser = DAOFactory.getInstance().getUserDAOImpl();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String msg = "";
		User user = (User) daouser.findById(username);
		if (user == null || !password.equals(user.getPassword())) {
			msg = "Thông Tin tài khoản hoặc mật khẩu không chính xác";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else {
			request.setAttribute("user", "login");
			session.setAttribute("user", user);
			if (user.isRole() == false) {
				System.out.println("Đăng nhập thành công User");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
			if (user.isRole() == true) {
				System.out.println("Đăng nhập thành công Admin");
				request.getRequestDispatcher("/songs.jsp?indexPage=1").forward(request, response);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
