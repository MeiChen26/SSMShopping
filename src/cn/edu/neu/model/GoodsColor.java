package cn.edu.neu.model;

public class GoodsColor {
	private Goods goods;
	private Color color;
	
	public GoodsColor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoodsColor(Goods goods, Color color) {
		super();
		this.goods = goods;
		this.color = color;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Color getColor() {
		return color;
	}
	public void setColor(Color color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "GoodsColor [goods=" + goods + ", color=" + color + "]";
	}
	
	
}
