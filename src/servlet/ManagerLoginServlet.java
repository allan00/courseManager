package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.JdbcUtil;

import java.sql.Connection;    
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  

import model.Manager;
import model.Student;
import model.Teacher;


public class ManagerLoginServlet extends HttpServlet {

	public ManagerLoginServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Manager t = new Manager();
		String accout = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();
			
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_manager where accout='"+accout+"' and password='"+password+"'";
			ResultSet rs = statement.executeQuery(sql);
			if(rs.next()){
				t.setId(rs.getInt("id"));
				t.setAccout(rs.getString("accout"));
				t.setPassword(rs.getString("password"));
		
			}
			else{
				request.setAttribute("message", "用户名或密码错误");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;  
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("manager", t);
		request.getRequestDispatcher("/Manager/TeacherList").forward(request, response);
		return;
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
