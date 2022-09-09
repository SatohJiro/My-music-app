package dao;

import dao.Entity.ArtristDAOImpl;
import dao.Entity.CategoryDAOImpl;
import dao.Entity.EntityDao;
import dao.Entity.MVDAOImpl;
import dao.Entity.PlaylistDAOImpl;
import dao.Entity.SongDAOImpl;
import dao.Entity.UserDAOImpl;

public class DAOFactory {
	private static DAOFactory instance = new DAOFactory();

	public static DAOFactory getInstance() {
		return instance;
	}

	public EntityDao getAtristDAO() {
		return new ArtristDAOImpl();
	}

	public EntityDao getCategoryDAO() {
		return new CategoryDAOImpl();
	}

	public EntityDao getMVDAO() {
		return new MVDAOImpl();
	}

	public EntityDao getPlaylistDAO() {
		return new PlaylistDAOImpl();
	}

	public EntityDao getSongDAOImpl() {
		return new SongDAOImpl();
	}

	public EntityDao getUserDAOImpl() {
		return new UserDAOImpl();
	}
}
