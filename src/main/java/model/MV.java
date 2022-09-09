package model;

import java.sql.Time;
import java.util.List;

import dao.Entity.SongDAOImpl;

public class MV {
	private String idMV;
	private String nameMV;
	private Time timeMV;
	private String imageMV;
	private String idSong;
	private String linkVideo;

	public MV(String idMV, String nameMV, Time timeMV, String imageMV, String idSong, String linkVideo) {
		this.idMV = idMV;
		this.nameMV = nameMV;
		this.timeMV = timeMV;
		this.imageMV = imageMV;
		this.idSong = idSong;
		this.linkVideo = linkVideo;
	}

	public MV() {
		super();
	}

	public String getIdMV() {
		return idMV;
	}

	public void setIdMV(String idMV) {
		this.idMV = idMV;
	}

	public String getNameMV() {
		return nameMV;
	}

	public void setNameMV(String nameMV) {
		this.nameMV = nameMV;
	}

	public Time getTimeMV() {
		return timeMV;
	}

	public String getTimeMV1() {
		String[] minute = (timeMV.getHours() + "").split("");
		String[] second = (timeMV.getMinutes() + "").split("");
		String minutes = "";
		String seconds = "";
		if (minute.length == 2) {
			minutes = timeMV.getHours() + "";
		} else
			minutes = "0" + timeMV.getHours();
		if (second.length == 2) {
			seconds = timeMV.getMinutes() + "";
		} else
			seconds = "0" + timeMV.getMinutes();
		return minutes + ":" + seconds;
	}

	public void setTimeMV(Time timeMV) {
		this.timeMV = timeMV;
	}

	public String getImageMV() {
		return imageMV;
	}

	public void setImageMV(String imageMV) {
		this.imageMV = imageMV;
	}

	public String getIdSong() {
		return idSong;
	}

	public void setIdSong(String idSong) {
		this.idSong = idSong;
	}

	public String getLinkVideo() {
		return linkVideo;
	}

	public void setLinkVideo(String linkVideo) {
		this.linkVideo = linkVideo;
	}

	public Song getSongById() {
		Song song;
		if (idSong != null) {
			SongDAOImpl songDao = new SongDAOImpl();
			song = (Song) songDao.findById(idSong);
		} else {
			song = null;
		}
		return song;
	}

	public List<Artrist> getArtist() {
		List<Artrist> artists = getSongById().getArtrist();
		return artists;
	}

	public Artrist getMainArtist() {
		return getArtist().get(0);
	}

	public String nameArtists() {
		return getSongById().getNameArtist();
	}

	@Override
	public String toString() {
		return "MV [idMV=" + idMV + ", nameMV=" + nameMV + ", timeMV=" + timeMV + ", imageMV=" + imageMV + ", idSong="
				+ idSong + ", linkVideo=" + linkVideo + "]";
	}

	public static void main(String[] args) {
		MV test = new MV();
		test.setIdSong(null);
	}
}
