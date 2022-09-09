package dao.Entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.DAOFactory;
import dao.DatabaseConnection;
import dao.relation.Song_PlaylistDAO;
import model.Playlist;
import model.User;

public class PlaylistDAOImpl implements EntityDao {

	@Override
	public List<Object> all() {
		Connection conn = null;
		EntityDao userdao = DAOFactory.getInstance().getUserDAOImpl();
		Song_PlaylistDAO daoRelationPlaylist = new Song_PlaylistDAO();
		List<Object> resultList = new ArrayList<Object>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM PlAYLIST;");
			while (result.next()) {
				String idPlaylist = result.getString("ID");
				String namePlaylist = result.getString("NAME");
				String linkImage = result.getString("LINK_IMAGE");
				String nameCreator = result.getString("ID_CREATOR");
				Playlist playlist = new Playlist(idPlaylist, namePlaylist, linkImage,
						(User) userdao.findById(nameCreator));
				playlist.setListSong(daoRelationPlaylist.findSongByPlaylist(idPlaylist));
				resultList.add(playlist);
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

	@Override
	public void insert(Object obj) {
		Playlist playlist = (Playlist) obj;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			String sm = "INSERT INTO PLAYLIST VALUES(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, playlist.getIdPlaylist());
			ps.setString(2, playlist.getNamePlaylist());
			ps.setString(3, playlist.getLinkImage());
			ps.setString(4, playlist.getCreator().getNameUser());
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
		Playlist playlist = (Playlist) obj;
		Connection conn = null;

		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			statement.executeUpdate("DELETE FROM PLAYLIST WHERE ID = '" + playlist.getIdPlaylist() + "';");
			String sm = "INSERT INTO PLAYLIST VALUES(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, playlist.getIdPlaylist());
			ps.setString(2, playlist.getNamePlaylist());
			ps.setString(3, playlist.getLinkImage());
			ps.setString(4, playlist.getCreator().getNameUser());
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
	public void delete(String id) {
//		Playlist playlist = (Playlist) obj;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			statement.executeUpdate("DELETE FROM PLAYLIST WHERE ID = '" + id + "';");
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
	public Object findById(String objId) {
		Connection conn = null;
		Playlist playlist = null;
		try {
			conn = DatabaseConnection.getConnection();
			UserDAOImpl userdao = new UserDAOImpl();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM PLAYLIST WHERE ID = '" + objId + "';");
			if (result.next()) {
				String idPlaylist = result.getString("ID");
				String namePlaylist = result.getString("NAME");
				String linkImage = result.getString("LINK_IMAGE");
				String nameCreator = result.getString("ID_CREATOR");
				playlist = new Playlist(idPlaylist, namePlaylist, linkImage, (User) userdao.findById(nameCreator));
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
		return playlist;
	}

	public List<Playlist> findByUser(User user) {
		Connection conn = null;
		Song_PlaylistDAO daoRelationPlaylist = new Song_PlaylistDAO();
		List<Playlist> list = new ArrayList<Playlist>();
		try {
			conn = DatabaseConnection.getConnection();
			UserDAOImpl userdao = new UserDAOImpl();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM PLAYLIST WHERE ID_CREATOR = '" + user.getNameUser() + "';");
			if (result.next()) {
				String idPlaylist = result.getString("ID");
				String namePlaylist = result.getString("NAME");
				String linkImage = result.getString("LINK_IMAGE");
				String nameCreator = result.getString("ID_CREATOR");
				Playlist playlist = new Playlist(idPlaylist, namePlaylist, linkImage, user);
				playlist.setListSong(daoRelationPlaylist.findSongByPlaylist(idPlaylist));
				list.add(playlist);
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
		return list;
	}

	public static void main(String[] args) {
		PlaylistDAOImpl test = new PlaylistDAOImpl();
//		System.out.println(test.all());
		System.out.println();
		User user = new User();
		user.setNameUser("zingmp3");
		System.out.println(test.findByUser(user));
	}

}
