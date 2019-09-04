package cn.edu.neu.action;

import java.io.File;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Category;

@Controller
@RequestMapping("/admin/cate")
public class AdminCateAction extends BaseAction{
	
	@RequestMapping("/getAdminCates")
	public String getAdminCates(Map<String,Page<Category>> m){
		Page<Category> cates=this.getServMgr().getCateService().getAdminCates();
		m.put("cates", cates);
		return "/admin/cate/cateList";
	}
	
	@RequestMapping("/handleCate")
	public String handleCate(@RequestParam(required=false) String cateId,Map<String,Category> m){
		if(cateId!=null && !cateId.equals("")){
			Category cate=this.getServMgr().getCateService().getCateById(cateId);
			m.put("cate", cate);
		}
		return "/admin/cate/handleCate";
	}
	
	@RequestMapping("/doHandleCate")
	public String doHandleCate(HttpServletRequest request,Category cate){
		System.out.println("cate:"+cate);
		
		String catepicpath="";
		if(cate.getCateId()==0){
			String oriFilename=cate.getCatePicFile().getOriginalFilename();
			String extFilename=oriFilename.substring(oriFilename.indexOf("."), oriFilename.length());
			System.out.println("ext:"+extFilename);
			catepicpath="/images/cate/"+Calendar.getInstance().getTimeInMillis()+extFilename;
			cate.setCatePic(catepicpath);
		}
		else
			catepicpath=cate.getCatePic();
		String path=request.getServletContext().getRealPath(catepicpath);
		File file=new File(path);
		try {
			if(cate.getCatePicFile()!=null)
				cate.getCatePicFile().transferTo(file);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("图片上传失败");
			this.addRedirURL("返回","@back");
			return EXECUTE_RESULT;
		}
		try{
			if(cate.getCateId()==0){
				this.getServMgr().getCateService().addCate(cate);
				this.addMessage("添加商品分类成功");
				this.addRedirURL("返回","/admin/cate/getAdminCates");	
			}
			else{
				this.getServMgr().getCateService().updateCate(cate);
				this.addMessage("修改商品分类成功");
				this.addRedirURL("返回",getReferUrl());			
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("操作商品分类失败");
			this.addRedirURL("返回","@back");
			return EXECUTE_RESULT;
		}
		
		return EXECUTE_RESULT;
	}
	
	@RequestMapping("/delCate")
	public String delCate(@RequestParam String cateId){
		try{
			this.getServMgr().getCateService().delCate(cateId);
			this.addMessage("删除商品分类成功");
			this.addRedirURL("返回",getReferUrl());	
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("删除商品分类失败");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
}
