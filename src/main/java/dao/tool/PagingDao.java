package dao.tool;

import java.sql.SQLException;
import java.util.List;

import dao.Entity.SongDAOImpl;
import model.Song;

public class PagingDao {
	private int pageSize = 5;

	public int getNumPage() throws SQLException {
		SongDAOImpl songDao = new SongDAOImpl();
		int temp = songDao.sizeListSong() / pageSize;
		if (songDao.sizeListSong() % pageSize != 0)
			temp++;
		return temp;

	}

	public List<Object> getSongFIndex(int index) {
		SongDAOImpl songDao = new SongDAOImpl();
		return songDao.getSongFIndex(index, pageSize);
	}

	public static void main(String[] args) throws SQLException {
		

	}
}
