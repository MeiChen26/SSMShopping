package cn.edu.neu.model;

public class GoodsSize {
	private Goods goods;
	private Size size;
	
	public GoodsSize() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoodsSize(Goods goods, Size size) {
		super();
		this.goods = goods;
		this.size = size;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Size getSize() {
		return size;
	}
	public void setSize(Size size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "GoodsSize [goods=" + goods + ", size=" + size + "]";
	}
	
}
