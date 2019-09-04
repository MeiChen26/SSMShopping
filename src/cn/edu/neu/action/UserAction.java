package cn.edu.neu.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.core.Constants;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.User;
import cn.edu.neu.service.UserService;

@Controller
@RequestMapping("/user")
public class UserAction extends BaseAction{

	@Autowired
	private UserService userService; 
	
	/**
	 * 用户登录
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Map<String,String> login(User user,HttpSession session){
		System.out.println("userlogin:"+user);
		User dbUser=userService.checkUser(user);
		//System.out.println(user.getUserName()+","+user.getPassword()+"--------"+user1);
		Map<String,String> m=new HashMap<String,String>();
		if(dbUser!=null){		
			session.setAttribute(Constants.LOGIN_USER, dbUser);
			m.put("login", "yes");	
		}
		else{
			//this.addMessage(Constants.LOGIN_ERR);
			//this.addRedirURL("返回登录页面", INDEX_PAGE);
			m.put("login","no");	
		}
		return m; 
	}
	
	/**
	 * 用户登出
	 */
	@ResponseBody
	@RequestMapping("/logout")
	public Map<String,String> logout() throws Exception {
		getSession().invalidate();
		Map<String,String> m=new HashMap<String,String>();
		m.put("logout", "yes");
		return m;
	}
	
	/**
	 * 用户注册
	 */
	@ResponseBody
	@RequestMapping("/reg")
	public Map<String,String> reg(User user) throws Exception {	
		System.out.println(user);
		boolean f=userService.regUser(user);
		Map<String,String> m=new HashMap<String,String>();
		if(f)
			m.put("reg", "yes");
		else
			m.put("reg", "no");
		return m;
	}
	
	/**
	 * 检查用户是否重复
	 */
	@ResponseBody
	@RequestMapping("/checkUserName")
	public Map<String,Boolean> checkUserName(@RequestParam String userName) throws Exception {	
		boolean f=userService.checkUserName(userName);
		Map<String,Boolean> m=new HashMap<String,Boolean>();
		m.put("available", f);
		return m;
	}
	
	
	
	
	/**
	 * 获取所有用户列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getAllUsers")
	public String getAllUsers(HttpServletRequest request){
		
		Page<User> findAll = userService.findAll();
		
		request.setAttribute("userList", findAll);
		return "/allUser";
	}
	
	/**
	 * 跳转到添加用户界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toAddUser")
	public String toAddUser(HttpServletRequest request){
		
		return "/addUser";
	}
	/**
	 * 添加用户并重定向
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/addUser")
	public String addUser(User user,HttpServletRequest request){
		user.setUserPass("1");
		user.setUserEmail("1");
		user.setUserSex(1);
		userService.save(user);
		
		return "redirect:/user/getAllUsers";
	}
	
	/**
	 *编辑用户
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateUser")
	public String updateUser(User user,HttpServletRequest request){
		
		
		if(userService.update(user)){
			user = userService.findById(user.getUserId());
			request.setAttribute("user", user);
			return "redirect:/user/getAllUsers";
		}else{
			return "/error";
		}
	}
	/**
	 * 根据id查询单个用户
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/getUser")
	@ResponseBody
	public User getUser(int id,HttpServletRequest request){
		
		User user= userService.findById(id);
		return user;
	}
	/**
	 * 删除用户
	 * @param id
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delUser")
	public void delUser(int id,HttpServletRequest request,HttpServletResponse response){
		String result = "{\"result\":\"error\"}";
		
		if(userService.delete(id)){
			result = "{\"result\":\"success\"}";
		}
		
		response.setContentType("application/json");
		
		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 管理员登录
	 */
	@ResponseBody
	@RequestMapping("/adminlogin")
	public Map<String,String> adminlogin(User user,HttpSession session){
		System.out.println("--------"+user);
		User dbUser=userService.checkAdmin(user);
		//System.out.println(user.getUserName()+","+user.getPassword()+"--------"+user1);
		Map<String,String> m=new HashMap<String,String>();
		if(dbUser!=null){		
			session.setAttribute(Constants.LOGIN_USER, dbUser);
			m.put("login", "yes");	
		}
		else{
			//this.addMessage(Constants.LOGIN_ERR);
			//this.addRedirURL("返回登录页面", INDEX_PAGE);
			m.put("login","no");	
		}
		return m; 
	}

}
