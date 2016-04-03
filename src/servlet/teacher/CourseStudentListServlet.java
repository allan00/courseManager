package servlet.teacher;

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
import model.Course;
import model.Student;
import model.Teacher;


public class CourseStudentListServlet extends HttpServlet {

	public CourseStudentListServlet() {
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
		List student_list = new ArrayList<Student>();
		List map_list = new ArrayList<Course>();
		Teacher t =  (Teacher) request.getSession().getAttribute("teacher");
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();
			int teacher_id = t.getId();
			// 要执行的SQL语句
			String sql = "SELECT A.id,B.name,A.state FROM teacher_course_map A,table_course B where teacher_id="+teacher_id+" and A.course_id = B.id";
			//System.out.println(sql);
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				Course map = new Course();
				map.setId(rs.getInt("id"));
				map.setName(rs.getString("name"));
				int state = rs.getInt("state");
				map.setState(state);
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
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_student";
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				Student s = new Student();
				s.setId(rs.getInt("id"));
				s.setStudent_id(rs.getString("student_id"));
				s.setName(rs.getString("name"));
				s.setSex(rs.getString("sex"));
				s.setPhone(rs.getString("phone"));
				s.setEmail(rs.getString("email"));
				s.setAcademy(rs.getString("academy"));
				s.setGrade(rs.getInt("grade"));
				s.setMajor(rs.getString("major"));
				s.setClazz(rs.getString("clazz"));
				s.setPassword(rs.getString("password"));
				student_list.add(s);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("student_list", student_list);
		request.getRequestDispatcher("/student_list.jsp").forward(request, response);

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
