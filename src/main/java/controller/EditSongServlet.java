package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.jaudiotagger.audio.AudioFile;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.exceptions.CannotReadException;
import org.jaudiotagger.audio.exceptions.InvalidAudioFrameException;
import org.jaudiotagger.audio.exceptions.ReadOnlyFileException;
import org.jaudiotagger.tag.TagException;

import dao.DAOFactory;
import dao.Entity.ArtristDAOImpl;
import dao.Entity.CategoryDAOImpl;
import dao.Entity.EntityDao;
import dao.Entity.SongDAOImpl;
import dao.relation.Category_SongDAO;
import dao.relation.Song_AtristDAO;
import model.Artrist;
import model.Category;
import model.Song;

@WebServlet(urlPatterns = "/EditSongServlet")
@MultipartConfig
public class EditSongServlet extends HttpServlet {
	private static final String UPLOAD_IMAGESONG_DIRECTORY = "assets/img/music/listNewSong";
	private static final String UPLOAD_SONG_DIRECTORY = "assets/music/listNewSong";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		String idSong = request.getParameter("idSong");
		String nameSong = request.getParameter("songName");
		String nameArtrist = request.getParameter("songArtist");
		String category = request.getParameter("songTopic");

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// constructs the directory path to store upload file
		String uploadImagePath = getServletContext().getRealPath("") + File.separator + UPLOAD_IMAGESONG_DIRECTORY;
		File uploadDir = new File(uploadImagePath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		// parses the request's content to extract file data
		Part filePart = request.getPart("songImage");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		filePart.write(uploadImagePath + "/" + idSong + extractFileName(fileName));
		String linkAvatar = "./assets/img/music/listNewSong/" + idSong + extractFileName(fileName);
		System.out.println(linkAvatar);

		String uploadSongPath = getServletContext().getRealPath("") + File.separator + UPLOAD_SONG_DIRECTORY;
		File uploadDir1 = new File(uploadSongPath);
		if (!uploadDir1.exists()) {
			uploadDir1.mkdir();
		}
		// parses the request's content to extract file data
		Part filePartSong = request.getPart("songLink");
		String fileNameSong = Paths.get(filePartSong.getSubmittedFileName()).getFileName().toString();
		filePartSong.write(uploadSongPath + "/" + idSong + extractFileName(fileNameSong));
		String songLink = "./assets/music/listNewSong/" + idSong + ".mp3";

		File file = new File(uploadSongPath + "/" + idSong + extractFileName(fileNameSong));
		AudioFile audioFile;
		int totalTime = 0;
		try {
			audioFile = AudioFileIO.read(file);
			totalTime = audioFile.getAudioHeader().getTrackLength();
			System.out.println(audioFile.getAudioHeader().getTrackLength() + " time");
		} catch (CannotReadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TagException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ReadOnlyFileException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidAudioFrameException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int minutes = totalTime / 60;
		int seconds = totalTime % 60;
		System.out.println(minutes);
		System.out.println(seconds);

		EntityDao daoSong = DAOFactory.getInstance().getSongDAOImpl();

		Song song = new Song(idSong, nameSong, linkAvatar, songLink, new Time(minutes, seconds, 0));
		daoSong.update(song);

		CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
		System.out.println(category);
		Category cat = categoryDAO.findByName(category);

		if (cat != null) {
			System.out.println(cat.getIdCategory());
			Category_SongDAO cateSongDao = new Category_SongDAO();
			try {
				cateSongDao.insert(song, cat.getIdCategory());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			ArtristDAOImpl artristDao = new ArtristDAOImpl();
			Artrist artrist = artristDao.findByName(nameArtrist);
			Song_AtristDAO song_artristDao = new Song_AtristDAO();
			song_artristDao.insert(song, artrist.getIdArtrist());

			System.out.println("Đã update bài hát : " + song);
		} else
			System.out.println("Không thể sửa bài hát");
		request.getRequestDispatcher("songs.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	public String extractFileName(String fileName) {
		int temp = fileName.lastIndexOf(".");
		return fileName.substring(temp);
	}
}
