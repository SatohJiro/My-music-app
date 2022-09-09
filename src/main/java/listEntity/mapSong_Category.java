package listEntity;

import java.util.ArrayList;
import java.util.List;

import model.MV;

public class mapSong_Category {
	List<MV> listMV;

	public mapSong_Category() {
		this.listMV = new ArrayList<MV>();
	}

	public List<MV> getListMV() {
		return listMV;
	}

	public void setListMV(List<MV> listMV) {
		this.listMV = listMV;
	}

}
