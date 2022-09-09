package dao.Entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.DatabaseConnection;
import model.Category;

public class CategoryDAOImpl implements EntityDao {

	@Override
	public List<Object> all() {
		Connection conn = null;
		List<Object> resultList = new ArrayList<Object>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM CATEGORY;");
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

	@Override
	public void insert(Object obj) {
	
		Category cate = (Category) obj;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sm = "INSERT INTO CATEGORY VALUES(?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, cate.getIdCategory());
			ps.setString(2, cate.getNameCategory());
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
		Category cate = (Category) obj;
		Connection conn = null;

		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			statement.executeUpdate("DELETE FROM CATEGORY WHERE ID = '" + cate.getIdCategory() + "';");
			String sm = "INSERT INTO CATEGORY VALUES(?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, cate.getIdCategory());
			ps.setString(2, cate.getNameCategory());
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
//		Category cate = (Category) obj;
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement statement = conn.createStatement();
			statement.executeUpdate("DELETE FROM CATEGORY WHERE ID= '" + id + "';");
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
		Category cate = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM CATEGORY WHERE ID = '" + objId + "';");
			if (result.next()) {
				String id = result.getString("ID");
				String name = result.getString("NAME");
				cate = new Category(id, name);
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
		return cate;
	}

	public Category findByName(String objName) {
		Connection conn = null;
		Category cate = null;
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM CATEGORY WHERE NAME = N'" + objName + "';");
			if (result.next()) {
				String id = result.getString("ID");
				String name = result.getString("NAME");
				cate = new Category(id, name);
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
		return cate;
	}

	public static void main(String[] args) {
		CategoryDAOImpl dao = new CategoryDAOImpl();
		Category cate = dao.findByName("Tâm Trạng");
		System.out.println(cate.getIdCategory());
	}
}
