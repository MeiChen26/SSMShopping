package cn.edu.neu.action;

import javax.annotation.Resource;

import cn.edu.neu.core.Constants;
import cn.edu.neu.core.common.CommonBaseAction;
import cn.edu.neu.model.User;
import cn.edu.neu.service.ServiceManager;


public class BaseAction extends CommonBaseAction{
	@Resource(name="servMgr")
	private ServiceManager servMgr;
	
	public ServiceManager getServMgr() {
		return servMgr;
	}
	
	/* 获取登录用户ID */
	public int getLoginUserId() {
		User user = getLoginUser();
		if (user != null) {
			//return new Long(((BigDecimal) user.get("userid")).longValue());
			return user.getUserId();
		}
		return 0;
	}

	/* 获取登录用户名 */
	public String getLoginUserName() {
		User user = getLoginUser();
		if (user != null) {
			return (String) user.getUserName();
		}
		return null;
	}

	/* 获取登录用户对象 */
	public User getLoginUser() {
		return (User) getSession().getAttribute(Constants.LOGIN_USER);
	}
}
