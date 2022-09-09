package model;

public class Artrist {
	private String idArtrist;
	private String nameArtrist;
	private String linkImage;
	private int numFollow;

	public Artrist(String idArtrist, String nameArtrist, String linkImage, int numFollow) {
		super();
		this.idArtrist = idArtrist;
		this.nameArtrist = nameArtrist;
		this.linkImage = linkImage;
		this.numFollow = numFollow;
	}

	public String getIdArtrist() {
		return idArtrist;
	}

	public void setIdArtrist(String idArtrist) {
		this.idArtrist = idArtrist;
	}

	public String getNameArtrist() {
		return nameArtrist;
	}

	public void setNameArtrist(String nameArtrist) {
		this.nameArtrist = nameArtrist;
	}

	public String getLinkImage() {
		return linkImage;
	}

	public void setLinkImage(String linkImage) {
		this.linkImage = linkImage;
	}

	public int getNumFollow() {
		return numFollow/1000;
	}

	public void setNumFollow(int numFollow) {
		this.numFollow = numFollow;
	}

	@Override
	public String toString() {
		return "Artrist [idArtrist=" + idArtrist + ", nameArtrist=" + nameArtrist + ", linkImage=" + linkImage
				+ ", numFollow=" + numFollow + "]";
	}

}
