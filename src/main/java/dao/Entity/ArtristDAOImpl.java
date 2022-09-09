package dao.Entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.DatabaseConnection;
import model.Artrist;
import model.Category;

public class ArtristDAOImpl implements EntityDao {

	@Override
	public List<Object> all() {
		Connection conn = null;
		List<Object> resultList = new ArrayList<Object>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM ARTIST;");
			while (result.next()) {
				String idArtrist = result.getString("ID");
				String nameArtrist = result.getString("NAME");
				String linkImage = result.getString("AVATAR");
				int numFollow = result.getInt("FOLLOWER");
				Artrist artrist = new Artrist(idArtrist, nameArtrist, linkImage, numFollow);
				resultList.add(artrist);
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
		
		Artrist artrist = (Artrist) obj;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sm = "INSERT INTO ARTIST VALUES(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, artrist.getIdArtrist());
			ps.setString(2, artrist.getNameArtrist());
			ps.setString(3, artrist.getLinkImage());
			ps.setInt(4, artrist.getNumFollow());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("false");
			
		} finally {
			try {
				conn.close();
			} catch (SQLException ignored) {
			}

		}
		
	}

	@Override
	public void update(Object obj) {
		Artrist artrist = (Artrist) obj;
		Connection conn = null;

		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			statement.executeUpdate("DELETE FROM ARTIST WHERE ID = '" + artrist.getIdArtrist() + "';");
			String sm = "INSERT INTO ARTRIST VALUES(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, artrist.getIdArtrist());
			ps.setString(2, artrist.getNameArtrist());
			ps.setString(3, artrist.getLinkImage());
			ps.setInt(4, artrist.getNumFollow());
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
//		Artrist artrist = (Artrist) obj;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			statement.executeUpdate("DELETE FROM ARTIST WHERE ID = '" + id + "';");
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
		Artrist artrist = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM ARTIST WHERE ID = '" + objId + "';");
			if (result.next()) {
				String idArtrist = result.getString("ID");
				String nameArtrist = result.getString("NAME");
				String linkImage = result.getString("AVATAR");
				int numFollow = result.getInt("FOLLOWER");
				artrist = new Artrist(idArtrist, nameArtrist, linkImage, numFollow);
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
		return artrist;
	}

	public Artrist findByName(String objName) {
		Connection conn = null;
		Artrist artrist = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM ARTIST WHERE NAME = N'" + objName + "';");
			if (result.next()) {
				String idArtrist = result.getString("ID");
				String nameArtrist = result.getString("NAME");
				String linkImage = result.getString("AVATAR");
				int numFollow = result.getInt("FOLLOWER");
				artrist = new Artrist(idArtrist, nameArtrist, linkImage, numFollow);
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
		return artrist;
	}

	public static void main(String[] args) {
		ArtristDAOImpl test = new ArtristDAOImpl();
		System.out.println(test.all());
	}

}
