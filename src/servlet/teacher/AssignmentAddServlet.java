package servlet.teacher;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;    
import java.sql.PreparedStatement;
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  

import util.JdbcUtil;
import model.Student;


public class AssignmentAddServlet extends HttpServlet {

	public AssignmentAddServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String title = request.getParameter("title");
		String content= request.getParameter("content");
		String deadline = request.getParameter("deadline");
		int course_map_id = Integer.valueOf(request.getParameter("course_map_id"));
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "INSERT INTO table_assignment(title,content,deadline,course_map_id) VALUES(?,?,?,?)";
			ps=con.prepareStatement(sql);
           //对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
            ps.setString(1, title); 
            ps.setString(2, content);
            ps.setString(3, deadline); 
            ps.setInt(4, course_map_id); 
            int i=ps.executeUpdate();
				
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("message", "添加成功 ");
		request.getRequestDispatcher("/AssignmentList").forward(request, response);
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
