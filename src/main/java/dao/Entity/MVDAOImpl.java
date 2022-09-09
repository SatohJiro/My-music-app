package dao.Entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import dao.DatabaseConnection;
import model.MV;

public class MVDAOImpl implements EntityDao {

	@Override
	public List<Object> all() {
		Connection conn = null;
		List<Object> resultList = new ArrayList<Object>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM MV;");
			while (result.next()) {
				String id = result.getString("ID");
				String name = result.getString("NAME");
				Time time = result.getTime("MV_TIME");
				String linkImage = result.getString("IMAGE_MV");
				String idSong = result.getString("ID_SONG");
				String linkVideo = result.getString("LINK_MV");
				MV mv = new MV(id, name, time, linkImage, idSong, linkVideo);
				resultList.add(mv);
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
		MV mv = (MV) obj;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sm = "INSERT INTO PLAYLIST VALUES(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, mv.getIdMV());
			ps.setString(2, mv.getNameMV());
			ps.setTime(3, mv.getTimeMV());
			ps.setString(4, mv.getIdSong());
			ps.setString(5, mv.getLinkVideo());
			ps.execute();

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
		MV mv = (MV) obj;
		Connection conn = null;

		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			statement.executeUpdate("DELETE FROM MV WHERE ID = '" + mv.getIdMV() + "';");
			String sm = "INSERT INTO PLAYLIST VALUES(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, mv.getIdMV());
			ps.setString(2, mv.getNameMV());
			ps.setTime(3, mv.getTimeMV());
			ps.setString(4, mv.getIdSong());
			ps.setString(5, mv.getLinkVideo());
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
//		MV mv = (MV) obj;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			statement.executeUpdate("DELETE FROM MV WHERE ID = '" + id + "';");
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
		MV mv = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM MV WHERE ID = '" + objId + "';");
			if (result.next()) {
				String id = result.getString("ID");
				String name = result.getString("NAME");
				Time time = result.getTime("MV_TIME");
				String linkImage = result.getString("IMAGE_MV");
				String idSong = result.getString("ID_SONG");
				String linkVideo = result.getString("LINK_MV");
				mv = new MV(id, name, time, linkImage, idSong, linkVideo);
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
		return mv;
	}

	public static void main(String[] args) {
		MVDAOImpl test = new MVDAOImpl();
		System.out.println(test.all());
	}

}
