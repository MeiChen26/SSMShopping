package cn.edu.neu.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.Color;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Size;
import cn.edu.neu.model.Stock;

@Controller
@RequestMapping("/admin/goods")
public class AdminGoodsAction extends BaseAction{
	
	@RequestMapping("/getAdminGoods")
	public String getAdminGoods(@RequestParam(required=false) String cateId,@RequestParam(required=false) String goodsName,
			@RequestParam(required=false) String startPrice,@RequestParam(required=false) String endPrice,
			@RequestParam(required=false) String sort,Map<String,Object> m){
		List<Category> cates=this.getServMgr().getCateService().getAllCates();
		Page<Goods> goods=this.getServMgr().getGoodsService().getAdminSearchGoods(cateId,goodsName,startPrice,endPrice,sort );
		m.put("cates", cates);
		m.put("goods", goods);
		System.out.println(goods);
		return "/admin/goods/goodsList";
	}
	
	@RequestMapping("/handleGoods")
	public String handleGoods(@RequestParam(required=false) String goodsId,Map<String,Object> m){
		if(goodsId!=null && !goodsId.equals("")){
			Goods goods=this.getServMgr().getGoodsService().getGoodsById(goodsId);
			m.put("goods", goods);
		}
		List<Category> cates=this.getServMgr().getCateService().getAllCates();
		m.put("cates", cates);
		return "/admin/goods/handleGoods";
	}
	
	@RequestMapping("/doHandleGoods")
	public String doHandleGoods(HttpServletRequest request,Goods goods){
		System.out.println("goods:"+goods);
		try {
			String goodspicpath="";
			if(goods.getGoodsId()==0){
				String oriFilename=goods.getGoodsPicFile().getOriginalFilename();
				String extFilename=oriFilename.substring(oriFilename.indexOf("."), oriFilename.length());
				System.out.println("ext:"+extFilename);
				goodspicpath="/images/goods/"+Calendar.getInstance().getTimeInMillis()+extFilename;
				goods.setGoodsPic(goodspicpath);
			}
			else
				goodspicpath=goods.getGoodsPic();
			String path=request.getServletContext().getRealPath(goodspicpath);
			File file=new File(path);
		
			if(goods.getGoodsPicFile()!=null)
				goods.getGoodsPicFile().transferTo(file);
			
			if(goods.getGoodsId()==0){
				this.getServMgr().getGoodsService().addGoods(goods);
				this.addMessage("添加商品成功");
				System.out.println("referurl:"+getReferUrl());
				this.addRedirURL("返回","/admin/goods/getAdminGoods");	
			}
			else{
				this.getServMgr().getGoodsService().updateGoods(goods);
				this.addMessage("修改商品成功");
				this.addRedirURL("返回",getReferUrl());			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("操作商品失败");
			this.addRedirURL("返回","@back");
		}
		
		return EXECUTE_RESULT;
	}
	
	@RequestMapping("/delGoods")
	public String delGoods(@RequestParam String goodsId){
		try{
			this.getServMgr().getGoodsService().delGoods(goodsId);
			this.addMessage("删除商品成功");
			this.addRedirURL("返回",getReferUrl());	
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("删除商品失败");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
	
	@RequestMapping("/getGoodsPics")
	public String getGoodsPics(@RequestParam(required=false) String cateId,@RequestParam(required=false) String goodsName,
			@RequestParam(required=false) String startPrice,@RequestParam(required=false) String endPrice,
			@RequestParam(required=false) String sort,Map<String,Object> m){
		List<Category> cates=this.getServMgr().getCateService().getAllCates();
		m.put("cates", cates);
		Page<Goods> goods=this.getServMgr().getGoodsService().getAdminSearchGoods(cateId,goodsName,startPrice,endPrice,sort );
		m.put("goods", goods);
		return "/admin/goods/goodsPicsList";
	}
	
	@RequestMapping("/handleGoodsPics")
	public String handleGoodsPics(@RequestParam String goodsId,Map<String,Goods> m){
		Goods goods=this.getServMgr().getGoodsService().getGoodsDetailById(goodsId);
		m.put("goods", goods);
		return "/admin/goods/handleGoodsPics";
	}
	
	@RequestMapping("/addGoodsPics")
	public String addGoodsPics(HttpServletRequest request,@RequestParam String goodsId,@RequestParam MultipartFile[] goodsPicFile){
		try {
			String[] goodspicpaths=new String[5];
			if(goodsPicFile!=null&&goodsPicFile.length>0){  
				for(int i=0;i<goodsPicFile.length;i++){
					MultipartFile goodsPic=goodsPicFile[i];
					if(!goodsPic.isEmpty()){
						String oriFilename=goodsPic.getOriginalFilename();
						String extFilename=oriFilename.substring(oriFilename.indexOf("."), oriFilename.length());
						System.out.println("ext:"+extFilename);
						goodspicpaths[i]="/images/goods/pics/"+Calendar.getInstance().getTimeInMillis()+i+extFilename;
									
						String path=request.getServletContext().getRealPath(goodspicpaths[i]);
						File file=new File(path);		
						goodsPic.transferTo(file);
					}
				}
			}
			this.getServMgr().getGoodsService().addGoodsPics(goodsId,goodspicpaths);
			this.addMessage("图片添加成功");
			this.addRedirURL("返回","/admin/goods/handleGoodsPics?goodsId="+goodsId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("图片添加失败");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
	
	@RequestMapping("/delGoodsPics")
	public String delGoodsPics(@RequestParam String picId,@RequestParam String goodsId){
		try{
			this.getServMgr().getGoodsService().delGoodsPics(picId);
			this.addMessage("图片删除成功");
			this.addRedirURL("返回","/admin/goods/handleGoodsPics?goodsId="+goodsId);
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("图片删除失败");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
	
	@RequestMapping("/delGoodsByIds")
	public String delGoodsByIds(@RequestParam String[] goodsIds){
		try{
			this.getServMgr().getGoodsService().delGoodsByIds(goodsIds);
			this.addMessage("商品删除成功");
			this.addRedirURL("返回",getReferUrl());
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("商品删除失败");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
	
	@RequestMapping("/getGoodsSizesAndColors")
	public String getGoodsSizesAndColors(@RequestParam(required=false) String cateId,@RequestParam(required=false) String goodsName,
			@RequestParam(required=false) String startPrice,@RequestParam(required=false) String endPrice,
			@RequestParam(required=false) String sort,Map<String,Object> m){
		List<Category> cates=this.getServMgr().getCateService().getAllCates();
		m.put("cates", cates);
		Page<Goods> goods=this.getServMgr().getGoodsService().getAdminSearchGoods(cateId,goodsName,startPrice,endPrice,sort );
		m.put("goods", goods);
		return "/admin/goods/goodsSizesAndColorsList";
	}
	
	@RequestMapping("/handleGoodsSizes")
	public String handleGoodsSizes(@RequestParam String goodsId,Map<String,Object> m){
		Goods goodsSizes=this.getServMgr().getGoodsService().getGoodsSizesById(goodsId);
		List<Size> sizes=this.getServMgr().getSizeService().getAllSizesWithoutPage();
		//System.out.println("sizes:"+sizes);
		//System.out.println("goodsSizes:"+goodsSizes.getSizes());
		sizes.removeAll(goodsSizes.getSizes());
		m.put("goodsSizes", goodsSizes);
		m.put("sizes", sizes);
		m.put("goodsId",goodsId);
		return "/admin/goods/handleGoodsSizes";
	}
	
	@RequestMapping("/handleGoodsColors")
	public String handleGoodsColors(@RequestParam String goodsId,Map<String,Object> m){
		
		Goods goodsColors=this.getServMgr().getGoodsService().getGoodsColorsById(goodsId);
		List<Color> colors=this.getServMgr().getColorService().getAllColorsWithoutPage();
		//System.out.println("sizes:"+sizes);
		//System.out.println("goodsSizes:"+goodsSizes.getSizes());
		colors.removeAll(goodsColors.getColors());	
		m.put("goodsColors", goodsColors);
		m.put("colors",colors);
		m.put("goodsId",goodsId);
		return "/admin/goods/handleGoodsColors";
	}
	
	@RequestMapping("/doHandleGoodsSizes")
	public String doHandleGoodsSizes(@RequestParam String goodsId,@RequestParam String[] sizeIds){
		try{
			String[] nowIds=this.getServMgr().getGoodsService().getGoodsSizeIds(goodsId);
			List<String> retainIdsList=new ArrayList<String>(Arrays.asList(sizeIds));
			List<String> nowIdsList=new ArrayList<String>(Arrays.asList(nowIds));
			List<String> insertIdsList=new ArrayList<String>(Arrays.asList(sizeIds));
			System.out.println(insertIdsList);
			System.out.println(nowIdsList);
			retainIdsList.retainAll(nowIdsList);
			System.out.println(retainIdsList);
			
			insertIdsList.removeAll(retainIdsList);
			nowIdsList.removeAll(retainIdsList);
			System.out.println(insertIdsList);
			System.out.println(nowIdsList);
			
			this.getServMgr().getGoodsService().updateGoodsSizesById(goodsId,insertIdsList,nowIdsList);
			this.addMessage("商品尺寸更新成功");
			this.addRedirURL("返回","/admin/goods/handleGoodsSizes?goodsId="+goodsId);
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("商品尺寸更新失败");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
	
	@RequestMapping("/doHandlGoodsColors")
	public String doHandlGoodsColors(@RequestParam String goodsId,@RequestParam String[] colorIds){
		try{
			String[] nowIds=this.getServMgr().getGoodsService().getGoodsColorIds(goodsId);
			List<String> retainIdsList=new ArrayList<String>(Arrays.asList(colorIds));
			List<String> nowIdsList=new ArrayList<String>(Arrays.asList(nowIds));
			List<String> insertIdsList=new ArrayList<String>(Arrays.asList(colorIds));
			System.out.println(insertIdsList);
			System.out.println(nowIdsList);
			retainIdsList.retainAll(nowIdsList);
			System.out.println(retainIdsList);
			
			insertIdsList.removeAll(retainIdsList);
			nowIdsList.removeAll(retainIdsList);
			System.out.println(insertIdsList);
			System.out.println(nowIdsList);
			
			this.getServMgr().getGoodsService().updateGoodsColorsById(goodsId,insertIdsList,nowIdsList);
			this.addMessage("商品颜色更新成功");
			this.addRedirURL("返回","/admin/goods/handleGoodsColors?goodsId="+goodsId);
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("商品颜色更新失败");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
	
	@RequestMapping("/getGoodsStocks")
	public String getGoodsStocks(@RequestParam(required=false) String cateId,@RequestParam(required=false) String goodsName,
			@RequestParam(required=false) String startPrice,@RequestParam(required=false) String endPrice,
			@RequestParam(required=false) String sort,Map<String,Object> m){
		List<Category> cates=this.getServMgr().getCateService().getAllCates();
		m.put("cates", cates);
		Page<Goods> goods=this.getServMgr().getGoodsService().getAdminSearchGoods(cateId,goodsName,startPrice,endPrice,sort );
		m.put("goods", goods);
		return "/admin/goods/goodsStocksList";
	}
	
	@RequestMapping("/handleGoodsStocks")
	public String handleGoodsStocks(@RequestParam String goodsId,Map<String,Object> m){
		List<Stock> goodsStocks=this.getServMgr().getGoodsService().getGoodsStocksById(goodsId);	
		m.put("goodsStocks", goodsStocks);
		System.out.println(goodsStocks);
		m.put("goodsId",goodsId);
		return "/admin/goods/handleGoodsStocks";
	}
	
	@RequestMapping("/doHandleGoodsStocks")
	public String doHandleGoodsStocks(String[] goodsId,String[] sizeId,String[] colorId,String[] stockNum){
		try{
			this.getServMgr().getGoodsService().updateGoodsStocksById(goodsId,sizeId,colorId,stockNum);
			this.addMessage("商品库存更新成功");
			this.addRedirURL("返回","/admin/goods/handleGoodsStocks?goodsId="+goodsId[0]);
		
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("商品库存更新失败");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
}
