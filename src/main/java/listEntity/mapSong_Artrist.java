package listEntity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.DAOFactory;
import dao.DatabaseConnection;
import dao.Entity.EntityDao;
import model.Song;

public class mapSong_Artrist {
	public List<Song> getListSongByArtrist(String idArtrist) {
		Connection conn = null;
		EntityDao songdao = DAOFactory.getInstance().getSongDAOImpl();
		List<Song> resultList = new ArrayList<Song>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM SONG a join SONG_ARTRIST b on a.idSong=b.idSong WHERE IDARTRIST= '"
							+ idArtrist + "';");
			while (result.next()) {
				String id = result.getString("ID");
				String name = result.getString("NAME");
				String linkImage = result.getString("lINKIMAGE");
				String linkSong = result.getString("lINKSONG");
				java.sql.Time timeSQL = result.getTime("TIME");
				Song song = new Song(id, name, linkImage, linkSong, timeSQL);
				resultList.add(song);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultList;
	}
}
