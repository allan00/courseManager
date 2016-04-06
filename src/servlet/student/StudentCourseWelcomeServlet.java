package servlet.student;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;    
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  

import util.JdbcUtil;
import model.Course;
import model.Student;
import model.Teacher;


public class StudentCourseWelcomeServlet extends HttpServlet {

	public StudentCourseWelcomeServlet() {
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
		int course_id = Integer.valueOf(request.getParameter("course_id"));
		System.out.println(course_id);
		Course c = null;
		
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_course where id="+course_id;
			//System.out.println(sql);
			ResultSet rs = statement.executeQuery(sql);
			if(rs.next()) {
				c = new Course();
				c.setId(course_id);
				c.setName(rs.getString("name"));
				c.setState(rs.getInt("state"));
				c.setTeacher_id(Integer.valueOf(rs.getString("teacher_id")));
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(c!=null){
			request.getSession().setAttribute("course", c);
		}
		
			request.getRequestDispatcher("/Student/StudentVideoList").forward(request, response);
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
