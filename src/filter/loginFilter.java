package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

//登录过滤器
public class loginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response;
		// 禁止缓存
		// hresponse.setHeader("Pragma","No-cache");
		// hresponse.setHeader("Cache-Control","no-cache");
		// hresponse.setHeader("Expires","0");
		
		
		HttpSession session = hrequest.getSession();
		Student student = (Student) session.getAttribute("student");
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		Manager manager = (Manager) session.getAttribute("manager");
		// System.out.println("RequestURI:"+hrequest.getRequestURI());
		// System.out.println("ServletPath:"+hrequest.getServletPath());
		// System.out.println("getPathInfo:"+hrequest.getPathInfo());
		
		
//	/////测试teacher的免登录代码
//			if(teacher==null){
//			Teacher t =new Teacher();
//			t.setId(2);
//			t.setAccount("teacher");
//			t.setName("bengbeng");
//			teacher = t;
//			hrequest.getSession().setAttribute("teacher",t);
//			}
//			/////

		if (student != null || teacher != null || manager != null) {
			String path = hrequest.getServletPath();

			if (path.indexOf("/Student/") > -1) {
				if (student == null) {
					hrequest.setAttribute("message", "无权限查看");
					if (teacher != null) {
						hrequest.getRequestDispatcher("/teacher_index.jsp")
								.forward(request, response);
						return;
					} else if (manager != null) {
						hrequest.getRequestDispatcher("/manager_index.jsp")
								.forward(request, response);
						return;
					} else {
						hrequest.getRequestDispatcher("/index.jsp").forward(
								request, response);
						return;
					}
				}
				else {
					chain.doFilter(request, response);
				}
			}
			
			else if (path.indexOf("/Teacher/") > -1) {
				if (teacher == null) {
					hrequest.setAttribute("message", "无权限查看");
					if (student != null) {
						hrequest.getRequestDispatcher("/student_index.jsp").forward(request, response);
						return;
					} else if (manager != null) {
						hrequest.getRequestDispatcher("/manager_index.jsp").forward(request, response);
						return;
					} else {
						hrequest.getRequestDispatcher("/index.jsp").forward(request, response);
						return;
					}
				}
				else {
					chain.doFilter(request, response);
				}
			}
			
			else if (path.indexOf("/Manager/") > -1) {
				if (manager == null) {
					hrequest.setAttribute("message", "无权限查看");
					if (teacher != null) {
						hrequest.getRequestDispatcher("/teacher_index.jsp")
								.forward(request, response);
						return;
					} else if (student != null) {
						hrequest.getRequestDispatcher("/student_index.jsp")
								.forward(request, response);
						return;
					} else {
						hrequest.getRequestDispatcher("/index.jsp").forward(
								request, response);
						return;
					}
				}
				else {
					chain.doFilter(request, response);
				}
			} else {
				hrequest.setAttribute("message", "登录超时或未登录");
				hrequest.getRequestDispatcher("/index.jsp").forward(
						request, response);
				return;
			}

		}

		else {
			hrequest.setAttribute("message", "登录超时或未登录");
			hrequest.getRequestDispatcher("/index.jsp").forward(
					request, response);
			return;
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
