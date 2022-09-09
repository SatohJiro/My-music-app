package dao.relation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.DatabaseConnection;
import model.Artrist;
import model.Song;

public class Song_AtristDAO {

	public List<Song> findSongByArtrist(String idAtrist) {
		Connection conn = null;
//		Category_SongDAO daoRelationCategory = new Category_SongDAO();
//		Song_PlaylistDAO daoRelationPlaylist = new Song_PlaylistDAO();
		List<Song> resultList = new ArrayList<Song>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT a.* FROM SONG a join SONG_ARTIST b on a.ID=b.ID_SONG WHERE b.ID_ARTIST='"
							+ idAtrist + "';");
			while (result.next()) {
				String id = result.getString("ID");
				String name = result.getString("NAME");
				String linkImage = result.getString("LINK_IMG");
				String linkSong = result.getString("LINK_SONG");
				java.sql.Time timeSQL = result.getTime("SONG_TIME");
				Song song = new Song(id, name, linkImage, linkSong, timeSQL);
//				song.setCategory(daoRelationCategory.findCategoryBySong(song.getIdSong()));
//				song.setPlaylists(daoRelationPlaylist.findPlaylistBySong(id));
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

	public List<Artrist> findArtistBySong(String idSong) {
		Connection conn = null;
		List<Artrist> resultList = new ArrayList<Artrist>();
		try {
			conn = DatabaseConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT a.* FROM ARTIST a join SONG_ARTIST b on a.ID=b.ID_ARTIST WHERE b.ID_SONG='"
							+ idSong + "';");
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
	public void insert(Song song,String artristId) {
		Connection conn = null;
		try {
			conn = DatabaseConnection.getConnection();
			String sm = "INSERT INTO SONG_ARTIST VALUES(?,?)";
			PreparedStatement ps = conn.prepareStatement(sm);
			ps.setString(1, song.getIdSong());
			ps.setString(2, artristId);
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

	public static void main(String[] args) {
		Song_AtristDAO test = new Song_AtristDAO();
		System.out.println(test.findSongByArtrist("A51"));
		System.out.println(test.findArtistBySong("S14"));
	}

	
}
