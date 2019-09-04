package cn.edu.neu.model;

import java.util.List;

public class Color {
	private int colorId;
	private String colorName;
	private List<Goods> goods;
	
	public Color() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Color(int colorId, String colorName, List<Goods> goods) {
		super();
		this.colorId = colorId;
		this.colorName = colorName;
		this.goods = goods;
	}
	public int getColorId() {
		return colorId;
	}
	public void setColorId(int colorId) {
		this.colorId = colorId;
	}
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(obj instanceof Color){
			if(((Color) obj).getColorId()==this.getColorId())
				return true;
		}
		return super.equals(obj);
	}
	@Override
	public String toString() {
		return "Color [colorId=" + colorId + ", colorName=" + colorName + ", goods=" + goods + "]";
	}
	
	
}
