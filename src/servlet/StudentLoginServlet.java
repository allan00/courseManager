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


public class StudentLoginServlet extends HttpServlet {

	public StudentLoginServlet() {
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
		Student s = new Student();
		String student_id = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			 con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			statement = con.createStatement();
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_student where student_id='"+student_id+"' and password='"+password+"'";
		    rs = statement.executeQuery(sql);
			if(rs.next()){
				s.setId(rs.getInt("id"));
				s.setStudent_id(rs.getString("student_id"));
				s.setName(rs.getString("name"));
				s.setSex(rs.getString("sex"));
				s.setClazz(rs.getString("clazz"));
				s.setPhone(rs.getString("phone"));
				s.setEmail(rs.getString("email"));
				s.setAcademy(rs.getString("academy"));
				s.setPassword(rs.getString("password"));
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
		request.getSession().setAttribute("student", s);
		request.getRequestDispatcher("/Student/StudentWelcome").forward(request, response);
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
