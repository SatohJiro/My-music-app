package model;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class Song {
	private String idSong;
	private String nameSong;
	private String linkImage;
	private String linkSong;
	private Time time;
	private List<Category> category;
	private List<Artrist> artrist;
	private List<Playlist> playlists;

	public Song(String idSong, String nameSong, String linkImage, String linkSong, Time time) {
		this.idSong = idSong;
		this.nameSong = nameSong;
		this.linkImage = linkImage;
		this.linkSong = linkSong;
		this.time = time;
		category = new ArrayList<Category>();
		artrist = new ArrayList<Artrist>();
	}

	public String getIdSong() {
		return idSong;
	}

	public void setIdSong(String idSong) {
		this.idSong = idSong;
	}

	public String getNameSong() {
		return nameSong;
	}

	public void setNameSong(String nameSong) {
		this.nameSong = nameSong;
	}

	public String getLinkImage() {
		return linkImage;
	}

	public void setLinkImage(String linkImage) {
		this.linkImage = linkImage;
	}

	public String getLinkSong() {
		return linkSong;
	}

	public void setLinkSong(String linkSong) {
		this.linkSong = linkSong;
	}

	public Time getTime() {
		return time;
	}

	public String getTime1() {
		String[] minute = (time.getHours() + "").split("");
		String[] second = (time.getMinutes() + "").split("");
		String minutes = "";
		String seconds = "";
		if (minute.length == 2) {
			minutes = time.getHours() + "";
		} else
			minutes = "0" + time.getHours();
		if (second.length == 2) {
			seconds = time.getMinutes() + "";
		} else
			seconds = "0" + time.getMinutes();
		return minutes + ":" + seconds;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	public List<Artrist> getArtrist() {
		return artrist;
	}

	public void setArtrist(List<Artrist> artrist) {
		this.artrist = artrist;
	}

	public String getNameArtist() {
		String temp = "";
		for (int i = 0; i < artrist.size(); i++) {
			if (i == artrist.size() - 1) {
				temp += artrist.get(i).getNameArtrist();
			} else {
				temp += artrist.get(i).getNameArtrist() + ", ";
			}
		}
		return temp;
	}

	public List<Category> getCategory() {
		return category;
	}

	public String getMainCategory() {
		String temp = "";
		for (int i = 0; i < category.size(); i++) {
			temp += category.get(i).getNameCategory() + "\t";
		}
		return temp;
	}

	public void setCategory(List<Category> category) {
		this.category = category;
	}

	public List<Playlist> getPlaylists() {
		return playlists;
	}

	public void setPlaylists(List<Playlist> playlists) {
		this.playlists = playlists;
	}

	@Override
	public String toString() {
		return "Song [idSong=" + idSong + ", nameSong=" + nameSong + ", linkImage=" + linkImage + ", linkSong="
				+ linkSong + ", time=" + time + ", category=" + category + ", artrist=" + artrist + ", playlists="
				+ playlists + "]" + "\n";
	}

}
