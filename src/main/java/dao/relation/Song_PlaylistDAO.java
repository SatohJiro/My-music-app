package dao.relation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.DAOFactory;
import dao.DatabaseConnection;
import dao.Entity.EntityDao;
import model.Playlist;
import model.Song;
import model.User;

public class Song_PlaylistDAO {
	public List<Song> findSongByPlaylist(String idPlaylist) {
		Connection conn = null;
//		Song_AtristDAO daoRelationArtist = new Song_AtristDAO();
//		Category_SongDAO daoRelationCategory = new Category_SongDAO();
		List<Song> resultList = new ArrayList<Song>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT a.* FROM SONG a join SONG_PLAYLIST b on a.ID=b.ID_SONG WHERE b.ID_PLAYLIST='"
							+ idPlaylist + "';");
			while (result.next()) {
				String id = result.getString("ID");
				String name = result.getString("NAME");
				String linkImage = result.getString("LINK_IMG");
				String linkSong = result.getString("LINK_SONG");
				java.sql.Time timeSQL = result.getTime("SONG_TIME");
				Song song = new Song(id, name, linkImage, linkSong, timeSQL);
//				song.setCategory(daoRelationCategory.findCategoryBySong(song.getIdSong()));
//				song.setArtrist(daoRelationArtist.findArtistBySong(song.getIdSong()));
				resultList.add(song);
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

	public List<Playlist> findPlaylistBySong(String idSong) {
		Connection conn = null;
		List<Playlist> resultList = new ArrayList<Playlist>();
		EntityDao userdao = DAOFactory.getInstance().getUserDAOImpl();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery(
					"SELECT a.* FROM PLAYLIST a join SONG_PLAYLIST b on a.ID=b.ID_PLAYLIST WHERE b.ID_SONG='" + idSong
							+ "';");
			while (result.next()) {
				String idPlaylist = result.getString("ID");
				String namePlaylist = result.getString("NAME");
				String linkImage = result.getString("LINK_IMAGE");
				String nameCreator = result.getString("ID_CREATOR");
				Playlist playlist = new Playlist(idPlaylist, namePlaylist, linkImage,
						(User) userdao.findById(nameCreator));
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

	public static void main(String[] args) {
		Song_PlaylistDAO test = new Song_PlaylistDAO();
		System.out.println(test.findSongByPlaylist("P01"));
	}
}
