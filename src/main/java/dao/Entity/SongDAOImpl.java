package dao.Entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.DatabaseConnection;
import dao.relation.Category_SongDAO;
import dao.relation.Song_AtristDAO;
import dao.relation.Song_PlaylistDAO;
import model.Song;

public class SongDAOImpl implements EntityDao {
	@Override
	public List<Object> all() {
		Connection conn = null;
		Song_AtristDAO daoRelationArtist = new Song_AtristDAO();
		Category_SongDAO daoRelationCategory = new Category_SongDAO();
		Song_PlaylistDAO daoRelationPlaylist = new Song_PlaylistDAO();
		List<Object> resultList = new ArrayList<Object>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM SONG;");
			while (result.next()) {
				String id = result.getString("ID");
				String name = result.getString("NAME");
				String linkImage = result.getString("LINK_IMG");
				String linkSong = result.getString("LINK_SONG");
				java.sql.Time timeSQL = result.getTime("SONG_TIME");
				Song song = new Song(id, name, linkImage, linkSong, timeSQL);
				song.setCategory(daoRelationCategory.findCategoryBySong(song.getIdSong()));
				song.setArtrist(daoRelationArtist.findArtistBySong(song.getIdSong()));
				song.setPlaylists(daoRelationPlaylist.findPlaylistBySong(id));
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

	public List<Object> getSongFIndex(int index, int pageSize) {
		Connection conn = null;
		Song_AtristDAO daoRelationArtist = new Song_AtristDAO();
		Category_SongDAO daoRelationCategory = new Category_SongDAO();
		Song_PlaylistDAO daoRelationPlaylist = new Song_PlaylistDAO();
		List<Object> resultList = new ArrayList<Object>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			String sm = "WITH result as(SELECT ROW_NUMBER() over (order by ID asc ) as numIndex,* FROM SONG)"
					+ "SELECT * FROM result WHERE numIndex between ?*?-? and ?*?;";

			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setInt(1, index);
			ps.setInt(2, pageSize);
			ps.setInt(3, pageSize - 1);
			ps.setInt(4, index);
			ps.setInt(5, pageSize);
			ResultSet result = ps.executeQuery();
			while (result.next()) {
				String id = result.getString("ID");
				String name = result.getString("NAME");
				String linkImage = result.getString("LINK_IMG");
				String linkSong = result.getString("LINK_SONG");
				java.sql.Time timeSQL = result.getTime("SONG_TIME");
				Song song = new Song(id, name, linkImage, linkSong, timeSQL);
				song.setCategory(daoRelationCategory.findCategoryBySong(song.getIdSong()));
				song.setArtrist(daoRelationArtist.findArtistBySong(song.getIdSong()));
				song.setPlaylists(daoRelationPlaylist.findPlaylistBySong(id));
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

	public int sizeListSong() throws SQLException {
		Connection conn = null;
		conn = DatabaseConnection.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery("SELECT COUNT(*) FROM SONG;");
		int temp = 0;
		while (result.next()) {
			temp = result.getInt(1);
		}
		conn.close();
		return temp;

	}

	@Override
	public Object findById(String id) {
		Connection conn = null;
		Song song = null;
		try {
			conn = DatabaseConnection.getConnection();
			Song_AtristDAO daoRelationArtist = new Song_AtristDAO();
			Category_SongDAO daoRelationCategory = new Category_SongDAO();
			Song_PlaylistDAO daoRelationPlaylist = new Song_PlaylistDAO();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM SONG WHERE ID = '" + id + "';");
			if (result.next()) {
				String idSong = result.getString("ID");
				String name = result.getString("NAME");
				String linkImage = result.getString("LINK_IMG");
				String linkSong = result.getString("LINK_SONG");
				java.sql.Time timeSQL = result.getTime("SONG_TIME");
				song = new Song(idSong, name, linkImage, linkSong, timeSQL);
				song.setCategory(daoRelationCategory.findCategoryBySong(song.getIdSong()));
				song.setArtrist(daoRelationArtist.findArtistBySong(song.getIdSong()));
				song.setPlaylists(daoRelationPlaylist.findPlaylistBySong(id));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return song;
	}

	@Override
	public void insert(Object obj) {
		Song song = (Song) obj;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sm = "INSERT INTO SONG VALUES(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, song.getIdSong());
			ps.setString(2, song.getNameSong());
			ps.setString(3, song.getLinkImage());
			ps.setString(4, song.getLinkSong());
			ps.setTime(5, song.getTime());
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

	@Override
	public void update(Object obj) {
		Song song = (Song) obj;
		delete(song.getIdSong());
		insert(song);
	}

	@Override
	public void delete(String id) {
//		Song song = (Song) obj;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			statement.executeUpdate("DELETE FROM CATEGORY_SONG WHERE ID_SONG = '" + id + "';");
			statement.executeUpdate("DELETE FROM SONG_ARTIST WHERE ID_SONG = '" + id + "';");
			statement.executeUpdate("DELETE FROM SONG WHERE ID = '" + id + "';");
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
		SongDAOImpl test = new SongDAOImpl();
		System.out.println(test.all().size());
//		System.out.println(test.findById("S01"));
	}

}
