package servlet.student;

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


public class StudentInformationListServlet extends HttpServlet {

	public StudentInformationListServlet() {
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
		Course c = (Course) request.getSession().getAttribute("course");
		int course_id= c.getId();
		System.out.println(course_id);
		Student s = (Student) request.getSession().getAttribute("student");
		String student_id= s.getStudent_id();
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();
			// 要执行的SQL语句
			String sql = "SELECT A.* FROM  table_student A,student_course_map B where A.student_id=B.student_id and B.course_id ="+course_id;
			ResultSet rs = statement.executeQuery(sql);
		
			while(rs.next()) {
				Student s1 = new Student();
				s1.setId(rs.getInt("id"));
				s1.setStudent_id(rs.getString("student_id"));
				s1.setName(rs.getString("name"));
				s1.setSex(rs.getString("sex"));
				s1.setPhone(rs.getString("phone"));
				s1.setEmail(rs.getString("email"));
				s1.setAcademy(rs.getString("academy"));
				s1.setGrade(rs.getString("grade"));
				s1.setMajor(rs.getString("major"));
				s1.setClazz(rs.getString("clazz"));
				s1.setPassword(rs.getString("password"));
				student_list.add(s1);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("student_list", student_list);
		request.getRequestDispatcher("/student_information_list.jsp").forward(request, response);
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
