package cn.edu.neu.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.web.multipart.MultipartFile;

public class Goods {
	private int goodsId;
	private int cateId;
	private String goodsName;
	private String goodsDisc;
	@NumberFormat(pattern="##.#")
	private float goodsPrice;
	@NumberFormat(pattern="##.#")
	private float goodsDiscount;
	private int goodsStock;
	private String goodsOrigin;
	private String goodsMaterial;
	private int goodsPostalfee;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date goodsDate;
	private int goodsSales;
	private String goodsPic;
	private MultipartFile goodsPicFile;
	private List<Pic> pics;
	private List<Size> sizes;
	private List<Color> colors;
	private List<Stock> stocks;
	
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Goods(int goodsId, int cateId, String goodsName, String goodsDisc, float goodsPrice, float goodsDiscount,
			int goodsStock, String goodsOrigin, String goodsMaterial, int goodsPostalfee, Date goodsDate,
			int goodsSales, String goodsPic, MultipartFile goodsPicFile, List<Pic> pics, List<Size> sizes,
			List<Color> colors, List<Stock> stocks) {
		super();
		this.goodsId = goodsId;
		this.cateId = cateId;
		this.goodsName = goodsName;
		this.goodsDisc = goodsDisc;
		this.goodsPrice = goodsPrice;
		this.goodsDiscount = goodsDiscount;
		this.goodsStock = goodsStock;
		this.goodsOrigin = goodsOrigin;
		this.goodsMaterial = goodsMaterial;
		this.goodsPostalfee = goodsPostalfee;
		this.goodsDate = goodsDate;
		this.goodsSales = goodsSales;
		this.goodsPic = goodsPic;
		this.goodsPicFile = goodsPicFile;
		this.pics = pics;
		this.sizes = sizes;
		this.colors = colors;
		this.stocks = stocks;
	}

	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsDisc() {
		return goodsDisc;
	}
	public void setGoodsDisc(String goodsDisc) {
		this.goodsDisc = goodsDisc;
	}
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public float getGoodsDiscount() {
		return goodsDiscount;
	}
	public void setGoodsDiscount(float goodsDiscount) {
		this.goodsDiscount = goodsDiscount;
	}
	public int getGoodsStock() {
		return goodsStock;
	}
	public void setGoodsStock(int goodsStock) {
		this.goodsStock = goodsStock;
	}
	public String getGoodsOrigin() {
		return goodsOrigin;
	}
	public void setGoodsOrigin(String goodsOrigin) {
		this.goodsOrigin = goodsOrigin;
	}
	public String getGoodsMaterial() {
		return goodsMaterial;
	}
	public void setGoodsMaterial(String goodsMaterial) {
		this.goodsMaterial = goodsMaterial;
	}
	public int getGoodsPostalfee() {
		return goodsPostalfee;
	}
	public void setGoodsPostalfee(int goodsPostalfee) {
		this.goodsPostalfee = goodsPostalfee;
	}
	public Date getGoodsDate() {
		return goodsDate;
	}
	public void setGoodsDate(Date goodsDate) {
		this.goodsDate = goodsDate;
	}
	public int getGoodsSales() {
		return goodsSales;
	}
	public void setGoodsSales(int goodsSales) {
		this.goodsSales = goodsSales;
	}
	
	public String getGoodsPic() {
		return goodsPic;
	}

	public void setGoodsPic(String goodsPic) {
		this.goodsPic = goodsPic;
	}

	public List<Pic> getPics() {
		return pics;
	}
	public void setPics(List<Pic> pics) {
		this.pics = pics;
	}
	
	public List<Size> getSizes() {
		return sizes;
	}
	public void setSizes(List<Size> sizes) {
		this.sizes = sizes;
	}
	public List<Color> getColors() {
		return colors;
	}
	public void setColors(List<Color> colors) {
		this.colors = colors;
	}

	public MultipartFile getGoodsPicFile() {
		return goodsPicFile;
	}

	public void setGoodsPicFile(MultipartFile goodsPicFile) {
		this.goodsPicFile = goodsPicFile;
	}

	public List<Stock> getStocks() {
		return stocks;
	}


	public void setStocks(List<Stock> stocks) {
		this.stocks = stocks;
	}


	@Override
	public String toString() {
		return "Goods [goodsId=" + goodsId + ", cateId=" + cateId + ", goodsName=" + goodsName + ", goodsDisc="
				+ goodsDisc + ", goodsPrice=" + goodsPrice + ", goodsDiscount=" + goodsDiscount + ", goodsStock="
				+ goodsStock + ", goodsOrigin=" + goodsOrigin + ", goodsMaterial=" + goodsMaterial + ", goodsPostalfee="
				+ goodsPostalfee + ", goodsDate=" + goodsDate + ", goodsSales=" + goodsSales + ", goodsPic=" + goodsPic
				+ ", goodsPicFile=" + goodsPicFile + ", pics=" + pics + ", sizes=" + sizes + ", colors=" + colors
				+ ", stocks=" + stocks + "]";
	}


	
}
