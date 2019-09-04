package cn.edu.neu.model;

public class Stock {
	private int stockId;
	private int goodsId;
	private int sizeId;
	private int colorId;
	private int stockNum;
	private int salesNum;
	private String goodsName;
	private String sizeName;
	private String colorName;
	public Stock() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Stock(int stockId, int goodsId, int sizeId, int colorId, int stockNum, int salesNum, String goodsName,
			String sizeName, String colorName) {
		super();
		this.stockId = stockId;
		this.goodsId = goodsId;
		this.sizeId = sizeId;
		this.colorId = colorId;
		this.stockNum = stockNum;
		this.salesNum = salesNum;
		this.goodsName = goodsName;
		this.sizeName = sizeName;
		this.colorName = colorName;
	}
	public int getStockId() {
		return stockId;
	}
	public void setStockId(int stockId) {
		this.stockId = stockId;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getSizeId() {
		return sizeId;
	}
	public void setSizeId(int sizeId) {
		this.sizeId = sizeId;
	}
	public int getColorId() {
		return colorId;
	}
	public void setColorId(int colorId) {
		this.colorId = colorId;
	}
	public int getStockNum() {
		return stockNum;
	}
	public void setStockNum(int stockNum) {
		this.stockNum = stockNum;
	}
	public int getSalesNum() {
		return salesNum;
	}
	public void setSalesNum(int salesNum) {
		this.salesNum = salesNum;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getSizeName() {
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	@Override
	public String toString() {
		return "Stock [stockId=" + stockId + ", goodsId=" + goodsId + ", sizeId=" + sizeId + ", colorId=" + colorId
				+ ", stockNum=" + stockNum + ", salesNum=" + salesNum + ", goodsName=" + goodsName + ", sizeName="
				+ sizeName + ", colorName=" + colorName + "]";
	}
	
	
}
