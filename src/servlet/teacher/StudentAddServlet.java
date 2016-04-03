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


public class StudentAddServlet extends HttpServlet {

	public StudentAddServlet() {
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
		String student_id = request.getParameter("student_id");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String clazz = request.getParameter("clazz");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String academy = request.getParameter("academy");
		String grade = request.getParameter("grade");
		String major = request.getParameter("major");
		String password = "123456";
		
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "INSERT INTO table_student(student_id,name,sex,phone,email,academy,grade,clazz,major,password) VALUES(?,?,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
            ps.setString(1, student_id); //对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
            ps.setString(2, name); 
            ps.setString(3, sex); 
            ps.setString(4, phone); 
            ps.setString(5, email);
            ps.setString(6, academy); 
            ps.setString(7, grade); 
            ps.setString(8, clazz); 
            ps.setString(9, major); 
            ps.setString(10, password); 
            int i=ps.executeUpdate();
				
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("message", "添加成功 ");
		request.getRequestDispatcher("/Teacher/StudentList").forward(request, response);
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
