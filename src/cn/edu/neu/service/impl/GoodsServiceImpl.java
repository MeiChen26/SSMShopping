package cn.edu.neu.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;

import cn.edu.neu.mapper.GoodsMapper;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Stock;
import cn.edu.neu.service.GoodsService;

@Service
@Transactional 
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsMapper mapper;
	
	@Override
	public Page<Goods> getGoodsByCate(String cateId,String sort) {
		// TODO Auto-generated method stub
		Page<Goods> page = new Page<Goods>(15);
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("cateId", cateId);
		m.put("sort", sort);
		page.setParams(m);
		List<Goods> goodsList=mapper.findAllGoodsByCateId(page);
		page.setList(goodsList);
		return page;
	}

	@Override
	public List<Goods> getNewGoods() {
		// TODO Auto-generated method stub
		List<Goods> newGoods=mapper.findNewGoods();
		//System.out.println(newGoods);
		return newGoods;
	}

	@Override
	public List<Goods> getSalesGoods() {
		// TODO Auto-generated method stub
		List<Goods> salesGoods=mapper.findSalesGoods();
		System.out.println(salesGoods);
		return salesGoods;
	}

	@Override
	public Page<Goods> searchGoods(String keyword,String sort) {
		// TODO Auto-generated method stub
		System.out.println("-------"+sort);
		Page<Goods> page = new Page<Goods>(15);
		String[] keywords=keyword.split(" ");
		
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("keywords", keywords);
		m.put("sort", sort);
		page.setParams(m);
		List<Goods> goodsList=mapper.findGoodsByKeyword(page);
		System.out.println("-------"+goodsList);
		page.setList(goodsList);
		return page;
	}

	@Override
	public Goods getGoodsDetailById(String goodsId) {
		// TODO Auto-generated method stub
		Goods goodsDetail=mapper.findGoodsDetailById(goodsId);		
		System.out.println(goodsDetail);	
		return goodsDetail;
	}
	@Override
	public Goods getGoodsSizesById(String goodsId) {
		// TODO Auto-generated method stub		
		Goods goodsSizes=mapper.findGoodsSizesById(goodsId);
		System.out.println(goodsSizes);
		return goodsSizes;
	}
	@Override
	public Goods getGoodsColorsById(String goodsId) {
		// TODO Auto-generated method stub
		Goods goodsColors=mapper.findGoodsColorsById(goodsId);
		System.out.println(goodsColors);
		return goodsColors;
	}

	@Override
	public Page<Goods> getAdminSearchGoods(String cateId, String goodsName, String startPrice, String endPrice,
			String sort) {
		// TODO Auto-generated method stub
		String[] goodsNames=null;
		if(goodsName!=null)
			goodsNames=goodsName.split(" ");
		Page<Goods> page = new Page<Goods>(15);
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("cateId", cateId);
		m.put("goodsNames", goodsNames);
		m.put("startPrice", startPrice);
		m.put("endPrice", endPrice);
		m.put("sort", sort);
		System.out.println("=========="+m);
		page.setParams(m);
		List<Goods> goodsList=mapper.findGoodsBySearchKeyword(page);
		page.setList(goodsList);
		return page;
	}

	@Override
	public Goods getGoodsById(String goodsId) {
		// TODO Auto-generated method stub
		return mapper.findGoodsById(goodsId);
	}

	@Override
	public void addGoods(Goods goods) {
		// TODO Auto-generated method stub
		mapper.saveGoods(goods);
	}

	@Override
	public void updateGoods(Goods goods) {
		// TODO Auto-generated method stub
		mapper.updateGoods(goods);
	}

	@Override
	public void delGoods(String goodsId) {
		// TODO Auto-generated method stub
		//mapper.delGoodsStock(goodsId);触发器删除
		mapper.delGoodsSize(goodsId);
		mapper.delGoodsColor(goodsId);
		mapper.delGoodsPic(goodsId);
		mapper.delGoods(goodsId);
	}

	@Override
	public void addGoodsPics(String goodsId, String[] goodspicpaths) {
		// TODO Auto-generated method stub
		Map<String,Object> m=new HashMap<String,Object>();
		for(int i=0;i<goodspicpaths.length;i++){
			if(goodspicpaths[i]!=null&&!goodspicpaths[i].equals("")){
				m.put("goodsId", Integer.parseInt(goodsId));
				m.put("goodsPic", goodspicpaths[i]);
				mapper.saveGoodsPics(m);
			}
		}
		
	}

	@Override
	public void delGoodsPics(String picId) {
		// TODO Auto-generated method stub
		mapper.delGoodsPicById(picId);
	}

	@Override
	public void delGoodsByIds(String[] goodsIds) {
		// TODO Auto-generated method stub
		for(int i=0;i<goodsIds.length;i++){
			mapper.delGoodsSize(goodsIds[i]);
			mapper.delGoodsColor(goodsIds[i]);
			mapper.delGoodsPic(goodsIds[i]);
			mapper.delGoods(goodsIds[i]);
		}
	}

	@Override
	public void updateGoodsSizesById(String goodsId, List<String> insertIds,List<String> delIds) {
		// TODO Auto-generated method stub
		for(int i=0;i<delIds.size();i++){
			mapper.delGoodsSizes(goodsId,delIds.get(i));
		}
		for(int i=0;i<insertIds.size();i++){
			mapper.saveGoodsSizes(goodsId,insertIds.get(i));
		}
	}
	@Override
	public void updateGoodsColorsById(String goodsId, List<String> insertIds, List<String> delIds) {
		// TODO Auto-generated method stub
		for(int i=0;i<delIds.size();i++){
			mapper.delGoodsColors(goodsId,delIds.get(i));
		}
		for(int i=0;i<insertIds.size();i++){
			mapper.saveGoodsColors(goodsId,insertIds.get(i));
		}
	}
	

	@Override
	public List<Stock> getGoodsStocksById(String goodsId) {
		// TODO Auto-generated method stub
		return mapper.findGoodsStocksByGoodsId(goodsId);
	}

	@Override
	public void updateGoodsStocksById(String[] goodsId, String[] sizeId, String[] colorId, String[] stockNum) {
		// TODO Auto-generated method stub
		for(int i=0;i<goodsId.length;i++){
			mapper.updateGoodsStockById(goodsId[i],sizeId[i],colorId[i],stockNum[i]);
		}
	}

	@Override
	public String[] getGoodsSizeIds(String goodsId) {
		// TODO Auto-generated method stub
		return mapper.findGoodsSizeIds(goodsId);
	}

	@Override
	public String[] getGoodsColorIds(String goodsId) {
		// TODO Auto-generated method stub
		return mapper.findGoodsColorIds(goodsId);
	}

	


}
