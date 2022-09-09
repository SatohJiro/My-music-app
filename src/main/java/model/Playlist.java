package model;

import java.util.ArrayList;
import java.util.List;

public class Playlist {
	private String idPlaylist;
	private String namePlaylist;
	private String linkImage;
	private User creator;
	private List<Song> listSong;

	public Playlist(String idPlaylist, String namePlaylist, String linkImage, User creator) {
		this.idPlaylist = idPlaylist;
		this.namePlaylist = namePlaylist;
		this.linkImage = linkImage;
		this.creator = creator;
		this.listSong = new ArrayList<Song>();
	}

	public String getIdPlaylist() {
		return idPlaylist;
	}

	public void setIdPlaylist(String idPlaylist) {
		this.idPlaylist = idPlaylist;
	}

	public String getNamePlaylist() {
		return namePlaylist;
	}

	public void setNamePlaylist(String namePlaylist) {
		this.namePlaylist = namePlaylist;
	}

	public String getLinkImage() {
		return linkImage;
	}

	public void setLinkImage(String linkImage) {
		this.linkImage = linkImage;
	}

	public User getCreator() {
		return creator;
	}
	public String getNameCreator() {
		return creator.getName();
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public static List<Playlist> addAll(List<Object> list) {
		List<Playlist> playlists = new ArrayList<Playlist>();
		for (int i = 0; i < list.size(); i++) {
			playlists.add((Playlist) list.get(i));
		}
		return playlists;
	}

	public List<Song> getListSong() {
		return listSong;
	}

	public void setListSong(List<Song> listSong) {
		this.listSong = listSong;
	}

	@Override
	public String toString() {
		return "Playlist [idPlaylist=" + idPlaylist + ", namePlaylist=" + namePlaylist + ", linkImage=" + linkImage
				+ ", creator=" + creator.getNameUser() + ", listSong=" + listSong + "]";
	}

}
