package cn.edu.neu.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.neu.core.common.Page;

import cn.edu.neu.model.Goods;
import cn.edu.neu.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsAction extends BaseAction{

	@Autowired
	private GoodsService goodsService;
	
	
	@RequestMapping("/getGoodsByCate")
	public String getGoodsByCate(@RequestParam String cateId,@RequestParam(required=false) String sort,Map<String,Page<Goods>> m){
		Page<Goods> goods=goodsService.getGoodsByCate(cateId,sort);
		m.put("goods", goods);
		//System.out.println(goods.getList());
		return "/goods/goodsList";
	}
	
	//@ResponseBody
	@RequestMapping("/getNewGoods")
	public String getNewGoods(Map<String,List<Goods>> m){
		List<Goods> newGoods=goodsService.getNewGoods();
		m.put("newGoods", newGoods);
		return "/goods/newGoods";
	}
	
	//@ResponseBody
	@RequestMapping("/getSalesGoods")
	public String getSalesGoods(Map<String,List<Goods>> m){
		List<Goods> salesGoods=goodsService.getSalesGoods();
		m.put("salesGoods", salesGoods);
		return "/goods/salesGoods";
	}
	
	@RequestMapping("/searchGoods")
	public String searchGoods(HttpServletRequest request,@RequestParam String keyword,@RequestParam(required=false) String sort,Map<String,Page<Goods>> m) throws UnsupportedEncodingException{
		System.out.println(keyword);
		Page<Goods> searchGoods=goodsService.searchGoods(keyword,sort);
		m.put("searchGoods", searchGoods);
		
		return "/goods/searchGoods";
	}
	
	@RequestMapping("/getGoodsDetailById")
	public String getGoodsDetailById(@RequestParam String goodsId,Map<String,Goods> m){
		Goods goodsDetail=goodsService.getGoodsDetailById(goodsId);
		Goods goodsSizes=goodsService.getGoodsSizesById(goodsId);
		Goods goodsColors=goodsService.getGoodsColorsById(goodsId);
		m.put("goodsDetail", goodsDetail);
		m.put("goodsSizes", goodsSizes);
		m.put("goodsColors",goodsColors);
		return "/goods/goodsDetail";
	}
	

}
