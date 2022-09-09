package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConnection {
	private static String url = "jdbc:sqlserver://localhost;databaseName=zingmp3;instance=SQLEXPRESS02;sendStringParametersAsUnicode=true;user=sa;password=123456;";
	static {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		final Properties prop = new Properties();
		prop.put("charSet", "ISO-8859-1");
		return DriverManager.getConnection(url, prop);
	}

	public static void main(String[] args) throws SQLException {
		Connection con = DatabaseConnection.getConnection();
		if (con == null) {
			System.out.println("null");
		}
	}
}
