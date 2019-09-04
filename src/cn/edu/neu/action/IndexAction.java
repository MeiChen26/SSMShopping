package cn.edu.neu.action;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.neu.model.Category;
import cn.edu.neu.model.Goods;

@Controller
public class IndexAction extends BaseAction{
	
	@RequestMapping("/index")
	public String getIndexPage(Map<String,List> m){
		//System.out.println("indexaction");
		List<Category> cates=this.getServMgr().getCateService().getAllCates();
		List<Goods> newGoods=this.getServMgr().getGoodsService().getNewGoods();
		List<Goods> salesGoods=this.getServMgr().getGoodsService().getSalesGoods();
		m.put("cates", cates);
		m.put("newGoods",newGoods);
		m.put("salesGoods", salesGoods);
		return "home";
	}
}
