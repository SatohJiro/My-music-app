package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Entity.ArtristDAOImpl;
import dao.Entity.CategoryDAOImpl;
import dao.Entity.SongDAOImpl;
import model.Artrist;
import model.Song;

@WebServlet(urlPatterns = "/SongDetailServlet")
public class SongDetailServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SongDAOImpl songDao = new SongDAOImpl();
		ArtristDAOImpl arDao = new ArtristDAOImpl();
		CategoryDAOImpl cateDao = new CategoryDAOImpl();
		String idSong = req.getParameter("EditId");
		Song song = (Song) songDao.findById(idSong);
		req.setAttribute("artrists", arDao.all()); 
		req.setAttribute("categorys", cateDao.all()); 
		req.setAttribute("song", song);
		req.getRequestDispatcher("editSong.jsp").forward(req, resp);
		

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
