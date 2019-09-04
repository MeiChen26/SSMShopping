package cn.edu.neu.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Color;
import cn.edu.neu.model.Size;

@Controller
@RequestMapping("/admin/color")
public class ColorAction extends BaseAction{

	@RequestMapping("/getAdminColors")
	public String getAdminColors(Map<String,Page<Color>> m){
		Page<Color> colors=this.getServMgr().getColorService().getAllColors();
		m.put("colors",colors);
		return "/admin/color/colorList";
	}
	

	@RequestMapping("/handleColor")
	public String handleColor(@RequestParam(required=false) String colorId,Map<String,Color> m){
		if(colorId!=null && !colorId.equals("")){
			Color color=this.getServMgr().getColorService().getColorById(colorId);
			m.put("color", color);
		}
		return "/admin/color/handleColor";
	}
	
	@RequestMapping("/doHandleColor")
	public String doHandleColor(HttpServletRequest request,Color color){
		System.out.println("color:"+color);
		try{
			if(color.getColorId()==0){
				this.getServMgr().getColorService().addColor(color);
				this.addMessage("添加商品颜色成功");
				this.addRedirURL("返回",getReferUrl());	
			}
			else{
				this.getServMgr().getColorService().updateColor(color);
				this.addMessage("修改商品颜色成功");
				this.addRedirURL("返回",getReferUrl());			
			}
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("操作商品颜色失败");  
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
	
	@RequestMapping("/delColor")
	public String delColor(@RequestParam String colorId){
		try{
			this.getServMgr().getColorService().delColor(colorId);
			this.addMessage("删除商品颜色成功");
			this.addRedirURL("返回",getReferUrl());	
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
			this.addMessage("目前仍有这个颜色的商品，无法删除该颜色");
			this.addRedirURL("返回","@back");
		}
		return EXECUTE_RESULT;
	}
}

