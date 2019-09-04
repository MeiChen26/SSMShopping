package cn.edu.neu.mapper;

import java.util.List;
import java.util.Map;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Stock;

public interface GoodsMapper {

	List<Goods> findAllGoodsByCateId(Page<Goods> page);

	List<Goods> findNewGoods();

	List<Goods> findSalesGoods();

	List<Goods> findGoodsByKeyword(Page<Goods> page);

	Goods findGoodsDetailById(String goodsId);

	Goods findGoodsSizesById(String goodsId);

	Goods findGoodsColorsById(String goodsId);

	List<Goods> findGoodsBySearchKeyword(Page<Goods> page);

	Goods findGoodsById(String goodsId);

	void saveGoods(Goods goods);

	void updateGoods(Goods goods);

	void delGoodsSize(String goodsId);

	void delGoodsColor(String goodsId);

	void delGoodsPic(String goodsId);

	void delGoods(String goodsId);

	void saveGoodsPics(Map<String,Object> m);

	void delGoodsPicById(String picId);

	void delGoodsSizes(String goodsId, String delId);

	void saveGoodsSizes(String goodsId, String insertId);

	void delGoodsColors(String goodsId, String delId);

	void saveGoodsColors(String goodsId, String insertId);

	List<Stock> findGoodsStocksByGoodsId(String goodsId);

	void updateGoodsStockById(String goodsId, String sizeId, String colorId, String stockNum);

	String[] findGoodsSizeIds(String goodsId);

	String[] findGoodsColorIds(String goodsId);

	void delGoodsStock(String goodsId);

	

}
