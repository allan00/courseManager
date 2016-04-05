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
		List<Student> student_list = new ArrayList<Student>();
		Course c = (Course)request.getSession().getAttribute("course");
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();
			// 要执行的SQL语句
			String sql = "SELECT B.* FROM student_course_map A,table_student B where A.student_id = b.student_id and A.course_id = "+c.getId();
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
