package dao.Entity;

import java.sql.SQLException;
import java.util.List;

public interface EntityDao {
	public List<Object> all();

	public void insert(Object obj) throws SQLException;

	public void update(Object obj);

	public void delete(String id);

	public Object findById(String objId);

}
