package dao.Entity;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.DatabaseConnection;
import model.Playlist;
import model.Song;
import model.User;

public class UserDAOImpl implements EntityDao {

	@Override
	public List<Object> all() {
		Connection conn = null;
		List<Object> resultList = new ArrayList<Object>();
		try {
			conn = DatabaseConnection.getConnection();
			PlaylistDAOImpl playlistDao = new PlaylistDAOImpl();

			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM [USER];");
			while (result.next()) {
				String nameUser = result.getString("USERNAME");
				String password = result.getString("PASSWORD");
				String email = result.getString("EMAIL");
				boolean gender = result.getBoolean("GENDER");
				Date birthday = result.getDate("DATE_OF_BIRTH");
				String phone = result.getString("TELEPHONE");
				String address = result.getString("ADDRESS");
				String name = result.getString("NAME");
				String avatar = result.getString("AVATAR");
				boolean role = result.getBoolean("ROLE");
				User user = new User(nameUser, password, email, gender, birthday, phone, address, name, avatar, role);
				List<Playlist> playlist = playlistDao.findByUser(user);
				if (playlist != null || playlist.size() > 0) {
					user.setPlaylists(playlist);
				}
//				System.out.println(user);
				resultList.add(user);
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
		User user = (User) obj;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			String sm = "INSERT INTO [USER] VALUES(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, user.getNameUser());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmail());
			ps.setBoolean(4, user.getGender());
			ps.setDate(5, user.getBirthday());
			ps.setString(6, user.getPhone());
			ps.setString(7, user.getAddress());
			ps.setString(8, user.getName());
			ps.setString(9, user.getAvatar());
			ps.setString(10, user.getStringRole());
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("lỗi ko insert được");
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
		User user = (User) obj;
		delete(user.getNameUser());
		insert(user);

	}

	@Override
	public void delete(String id) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			statement.executeUpdate("DELETE FROM [USER] WHERE USERNAME = '" + id + "';");
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
		User user = null;
		try {
			conn = DatabaseConnection.getConnection();

			PlaylistDAOImpl playlistDao = new PlaylistDAOImpl();

			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM [USER] WHERE USERNAME = '" + objId + "';");
			if (result.next()) {
				String nameUser = result.getString("USERNAME");
				String password = result.getString("PASSWORD");
				String email = result.getString("EMAIL");
				boolean gender = result.getBoolean("GENDER");
				Date birthday = result.getDate("DATE_OF_BIRTH");
				String phone = result.getString("TELEPHONE");
				String address = result.getString("ADDRESS");
				String name = result.getString("NAME");
				String avatar = result.getString("AVATAR");
				boolean role = result.getBoolean("ROLE");
				user = new User(nameUser, password, email, gender, birthday, phone, address, name, avatar, role);
				user.setPlaylists(playlistDao.findByUser(user));
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
		return user;
	}

	public int sizeListUser() throws SQLException {
		Connection conn = null;
		conn = DatabaseConnection.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet result = stmt.executeQuery("SELECT COUNT(*) FROM [USER];");
		int temp = 0;
		while (result.next()) {
			temp = result.getInt(1);
		}
		conn.close();
		return temp;
	}

	public List<Object> getUsersFByIndex(int index, int pageSize) {
		Connection conn = null;
		List<Object> resultList = new ArrayList<Object>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			String sm = "WITH result as(SELECT ROW_NUMBER() over (order by USERNAME asc ) as numIndex,* FROM [USER])"
					+ "SELECT * FROM result WHERE numIndex between ?*?-? and ?*?;";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setInt(1, index);
			ps.setInt(2, pageSize);
			ps.setInt(3, pageSize - 1);
			ps.setInt(4, index);
			ps.setInt(5, pageSize);
			ResultSet result = ps.executeQuery();
			while (result.next()) {
				String nameUser = result.getString("USERNAME");
				String password = result.getString("PASSWORD");
				String email = result.getString("EMAIL");
				boolean gender = result.getBoolean("GENDER");
				Date birthday = result.getDate("DATE_OF_BIRTH");
				String phone = result.getString("TELEPHONE");
				String address = result.getString("ADDRESS");
				String name = result.getString("NAME");
				String avatar = result.getString("AVATAR");
				boolean role = result.getBoolean("ROLE");
				User user = new User(nameUser, password, email, gender, birthday, phone, address, name, avatar, role);
				resultList.add(user);
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

	public static void main(String[] args) throws SQLException {
		UserDAOImpl test = new UserDAOImpl();
//		System.out.println(test.all());
//		test.insert(new User("ABCDEFG", "1234567", "trananhq2345@gmail.com", false, new Date(2021, 12, 1), "0989702459",
//				"1234567", "Anh", null));
//		test.all();
		test.delete("SatohJiro");
		test.delete("SatohJiro1");
		test.delete("123456");
		test.delete("zingmp7");
//		System.out.println(test.all());
		System.out.println(test.getUsersFByIndex(1, 5));
//		System.out.println(test.findById("zingmp3"));
	}
}
