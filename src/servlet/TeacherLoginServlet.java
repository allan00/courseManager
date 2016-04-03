package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;    
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  

import util.JdbcUtil;
import model.Student;
import model.Teacher;


public class TeacherLoginServlet extends HttpServlet {

	public TeacherLoginServlet() {
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
		Connection con = null;
		Statement statement = null;
		ResultSet rs = null;
		Teacher t = new Teacher();
		String account = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			statement = con.createStatement();
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_teacher where account='"+account+"'and password='"+password+"'";
			//System.out.println(sql);
			rs = statement.executeQuery(sql);
			if(rs.next()){
				t.setId(rs.getInt("id"));
				t.setAccount(rs.getString("account"));
				t.setName(rs.getString("name"));
				t.setSex(rs.getString("sex"));
				t.setPhone(rs.getString("phone"));
				t.setEmail(rs.getString("email"));
				t.setAcademy(rs.getString("academy"));
				t.setAddress(rs.getString("address"));
				t.setPassword(rs.getString("password"));
				t.setEmail(rs.getString("email"));
			}
			else{
				request.setAttribute("message", "用户名或密码错误");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("message", "用户名或密码错误");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		finally{
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		}
		request.getSession().setAttribute("teacher", t);
		request.getRequestDispatcher("/Teacher/TeacherWelcome").forward(request, response);
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
