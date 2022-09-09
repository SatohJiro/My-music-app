package dao.tool;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.Entity.UserDAOImpl;

public class PagingUserDao {
	int pageSize = 4;

	public int getNumPage() throws SQLException {
		UserDAOImpl userDao = new UserDAOImpl();
		int temp = userDao.sizeListUser() / pageSize;
		if (userDao.sizeListUser() % pageSize != 0) {
			temp += 1;
		}
		return temp;
	}

	public List<Object> getUserFIndex(int index) {
		UserDAOImpl userDao = new UserDAOImpl();
		return userDao.getUsersFByIndex(index, pageSize);
	}

}
