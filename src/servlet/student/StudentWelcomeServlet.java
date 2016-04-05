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
import view.V_StudentCourseMap;
import model.Course;
import model.Student;
import model.Teacher;


public class StudentWelcomeServlet extends HttpServlet {

	public StudentWelcomeServlet() {
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
		  List map_list = new ArrayList<Course>();
		  Student s =  (Student) request.getSession().getAttribute("student");	
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();
			String student_id = s.getStudent_id();
			// 要执行的SQL语句
			String sql = "SELECT A.id,B.name,B.id FROM student_course_map A,table_course B where student_id="+student_id+" and A.course_id = B.id";			
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				V_StudentCourseMap map = new V_StudentCourseMap();
				map.setId(rs.getInt("id"));
				map.setCourse_name(rs.getString("name"));
				map.setCourse_id(rs.getInt("B.id"));
				map_list.add(map);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("map_list", map_list);
		List course_list = new ArrayList<Course>();
			// 要执行的SQL语句
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_course";
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				Course c = new Course();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				course_list.add(c);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("course_list", course_list);
		
		
		request.getRequestDispatcher("/student_index.jsp").forward(request, response);
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
