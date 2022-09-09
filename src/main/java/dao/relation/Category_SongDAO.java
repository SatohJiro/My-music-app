package dao.relation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.DatabaseConnection;
import model.Category;
import model.Song;

public class Category_SongDAO {
	public List<Song> findSongByCategory(String idCategory) {
		Connection conn = null;
//		Song_AtristDAO daoRelationArtist = new Song_AtristDAO();
//		Song_PlaylistDAO daoRelationPlaylist = new Song_PlaylistDAO();
		List<Song> resultList = new ArrayList<Song>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT a.* FROM SONG a join CATEGORY_SONG b on a.ID=b.ID_SONG WHERE b.ID_CATEGORY='"
							+ idCategory + "';");
			while (result.next()) {
				String id = result.getString("ID");
				String name = result.getString("NAME");
				String linkImage = result.getString("LINK_IMG");
				String linkSong = result.getString("LINK_SONG");
				java.sql.Time timeSQL = result.getTime("SONG_TIME");
				Song song = new Song(id, name, linkImage, linkSong, timeSQL);
//				song.setArtrist(daoRelationArtist.findArtistBySong(song.getIdSong()));
//				song.setPlaylists(daoRelationPlaylist.findPlaylistBySong(id));
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

	public List<Category> findCategoryBySong(String idSong) {
		Connection conn = null;
		List<Category> resultList = new ArrayList<Category>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery(
					"SELECT a.* FROM CATEGORY a join CATEGORY_SONG b on a.ID=b.ID_CATEGORY WHERE b.ID_SONG='" + idSong
							+ "';");
			while (result.next()) {
				String idCategory = result.getString("ID");
				String name = result.getString("NAME");
				Category cate = new Category(idCategory, name);
				resultList.add(cate);
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
	public void insert(Song song,String categoryId) throws SQLException {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sm = "INSERT INTO CATEGORY_SONG VALUES(?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, categoryId);
			ps.setString(2, song.getIdSong());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException ignored) {
			}
		}

	}

	public static void main(String[] args) {
		Category_SongDAO test = new Category_SongDAO();
		System.out.println(test.findCategoryBySong("S05"));
		System.out.println(test.findSongByCategory("C02"));
	}
}
