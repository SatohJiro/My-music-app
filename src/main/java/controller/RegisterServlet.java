package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import dao.DAOFactory;
import dao.Entity.EntityDao;
import model.User;

@WebServlet(urlPatterns = "/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String UPLOAD_DIRECTORY = "assets/img/avatars";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

		// customize date
		int month = Integer.valueOf(dateString.nextToken());
		int day = Integer.valueOf(dateString.nextToken());
		int year = Integer.valueOf(dateString.nextToken());
		Date date = new Date(year, month, day);
		// create Dao for checking exist user
		EntityDao daouser = DAOFactory.getInstance().getUserDAOImpl();
		User user = (User) daouser.findById(Rname);

		// check gender
		boolean gender = false;
		if (genderInt == null || genderInt.equals("1")) {
			gender = true;
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// constructs the directory path to store upload file
		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

		// parses the request's content to extract file data
		Part filePart = request.getPart("avatar");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		filePart.write(uploadPath + "/" + Rname + extractFileName(fileName));
		String linkAvatar = "./assets/img/avatars/" + Rname + extractFileName(fileName);
		System.out.println(uploadPath + "/" + Rname + extractFileName(fileName));

		// saving
		User newUser = new User(Rname, pass, email, gender, date, phone, address, name, linkAvatar, false);
		System.out.println(Rname + " " + email + " " + address + " " + phone + " " + gender + " " + date + " " + name
				+ " " + pass + " " + RepeatPass + " " + linkAvatar);
		System.out.println("Đăng ký thành công");
		System.out.println("Đăng nhập thành công");
		try {
			daouser.insert(newUser);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("sucRegister", "Đăng ký thành công");
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public String extractFileName(String fileName) {
		int temp = fileName.lastIndexOf(".");
		return fileName.substring(temp);
	}
}
