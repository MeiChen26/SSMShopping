package cn.edu.neu.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Size;

@Controller
@RequestMapping("/admin/size")
public class SizeAction extends BaseAction{

	@RequestMapping("/getAdminSizes")
	public String getAdminSizes(Map<String,Page<Size>> m){
		Page<Size> sizes=this.getServMgr().getSizeService().getAllSizes();
		m.put("sizes",sizes);
		return "/admin/size/sizeList";
	}
	

	@RequestMapping("/handleSize")
	public String handleSize(@RequestParam(required=false) String sizeId,Map<String,Size> m){
		if(sizeId!=null && !sizeId.equals("")){
			Size size=this.getServMgr().getSizeService().getSizeById(sizeId);
			m.put("size", size);
		}
		return "/admin/size/handleSize";
	}
	
	@RequestMapping("/doHandleSize")
	public String doHandleSize(HttpServletRequest request,Size size){
		System.out.println("size:"+size);
		try{
			if(size.getSizeId()==0){
				this.getServMgr().getSizeService().addSize(size);
				this.addMessage("添加商品尺寸成功");
				this.addRedirURL("返回",getReferUrl());	
			}
			else{
				this.getServMgr().getSizeService().updateSize(size);
				this.addMessage("修改商品尺寸成功");
				this.addRedirURL("返回",getReferUrl());			
			}
		}
		catch(Exception e){
			e.printStackTrace();
			this.addMessage("操作商品尺寸失败");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
	
	@RequestMapping("/delSize")
	public String delSize(@RequestParam String sizeId){
		try{
			this.getServMgr().getSizeService().delSize(sizeId);
			this.addMessage("删除商品尺寸成功");
			this.addRedirURL("返回",getReferUrl());	
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("目前仍有这个尺寸的商品，无法删除该尺寸");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
}

