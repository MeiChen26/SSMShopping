package cn.edu.neu.service;


import java.util.List;
import java.util.Map;

import cn.edu.neu.core.common.Page;

import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Stock;

public interface GoodsService {

	Page<Goods> getGoodsByCate(String cateId,String sort);

	List<Goods> getNewGoods();

	List<Goods> getSalesGoods();

	Page<Goods> searchGoods(String keyword,String sort);

	Goods getGoodsDetailById(String goodsId);
	
	Goods getGoodsSizesById(String goodsId);
	
	Goods getGoodsColorsById(String goodsId);

	Page<Goods> getAdminSearchGoods(String cateId, String goodsName, String startPrice, String endPrice, String sort);

	Goods getGoodsById(String goodsId);

	void addGoods(Goods goods);

	void updateGoods(Goods goods);

	void delGoods(String goodsId);

	void addGoodsPics(String goodsId, String[] goodspicpaths);

	void delGoodsPics(String picId);

	void delGoodsByIds(String[] goodsIds);

	void updateGoodsSizesById(String goodsId, List<String> insertIdsIds,List<String> delIdsIds);

	void updateGoodsColorsById(String goodsId, List<String> insertIds, List<String> delIds);

	List<Stock> getGoodsStocksById(String goodsId);

	void updateGoodsStocksById(String[] goodsId, String[] sizeId, String[] colorId, String[] stockNum);

	String[] getGoodsSizeIds(String goodsId);

	String[] getGoodsColorIds(String goodsId);


}
