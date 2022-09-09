package filter;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import dao.DAOFactory;
import dao.Entity.EntityDao;
import model.User;

/**
 * Servlet Filter implementation class RegisterFilter
 */
@WebFilter("/RegisterFilter")
public class RegisterFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public RegisterFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		String Rname = request.getParameter("Rusername");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String genderInt = request.getParameter("gender");
		StringTokenizer dateString = new StringTokenizer(request.getParameter("dob"), "-");
		String name = request.getParameter("name");
		String pass = request.getParameter("Rpassword");
		String RepeatPass = request.getParameter("repassword");

		EntityDao daouser = DAOFactory.getInstance().getUserDAOImpl();
		User user = (User) daouser.findById(Rname);

		HttpServletRequest req = (HttpServletRequest) request;
		Part filePart = req.getPart("avatar");
		if (Rname.equals("") || email.equals("") || address.equals("") || phone.equals("") || genderInt == null
				|| !dateString.hasMoreTokens() || name.equals("") || pass.equals("") || RepeatPass.equals("")
				|| filePart.getSize() == 0) {
			request.setAttribute("email", email);
			request.setAttribute("address", address);
			request.setAttribute("phone", phone);
			request.setAttribute("name", name);
			request.setAttribute("errorRegister", "Đăng ký không thành công, vui lòng nhập đầy đủ thông tin");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else if (pass.length() < 6) {
			request.setAttribute("Pmsg", "Mật khẩu có độ dài lớn hơn 6!");
			request.setAttribute("email", email);
			request.setAttribute("address", address);
			request.setAttribute("phone", phone);
			request.setAttribute("name", name);
			request.setAttribute("errorRegister", "Đăng ký không thành công, vui lòng đăng ký lại");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else if (user != null) {
			request.setAttribute("Rmsg", "Username : " + Rname + " đã tồn tại");
			request.setAttribute("email", email);
			request.setAttribute("address", address);
			request.setAttribute("phone", phone);
			request.setAttribute("name", name);
			request.setAttribute("errorRegister", "Đăng ký không thành công, vui lòng đăng ký lại");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else
			chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
