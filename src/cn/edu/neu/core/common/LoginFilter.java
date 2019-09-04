package cn.edu.neu.core.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.neu.core.Constants;



/**
 * Servlet Filter implementation class LoginFilter
 */
/*@WebFilter(dispatcherTypes = {DispatcherType.REQUEST }
					, urlPatterns = { "/*" })*/
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		// request和response对象进行类型转换
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse rep = (HttpServletResponse) response;
		rep.setContentType("text/html;charset=utf-8");
		// 得到session对象
		HttpSession session = req.getSession();
		String actionUrl = req.getServletPath();
		String loginUrl = "/login.jsp";
		System.out.println(actionUrl);
		RequestDispatcher rd = request.getRequestDispatcher(loginUrl);
		// 特殊文件不过滤
		if (actionUrl.endsWith("jpg") || actionUrl.endsWith("gif")
				|| actionUrl.indexOf("css") > 0 || actionUrl.endsWith("js")
				|| actionUrl.startsWith("/test")) {
		} else if ( actionUrl.equals("/index.html")
				|| actionUrl.equals("/user/login")
				|| actionUrl.equals("/user/reg")
				|| actionUrl.equals("/reg.html")) {
		} else if (session.getAttribute("userid") == null) {// 其余文件进行session验证
			req.setAttribute("loginErr", Constants.LOGIN_PROMPT);
			rd.forward(req, rep);
			return;
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);// 继续调用其它的过滤器

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
