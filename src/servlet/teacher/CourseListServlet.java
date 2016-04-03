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


public class CourseListServlet extends HttpServlet {

	public CourseListServlet() {
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
		List course_list = new ArrayList<Course>();
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
				Course s = new Course();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				course_list.add(s);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("course_list", course_list);
		request.getRequestDispatcher("/course_list1.jsp").forward(request, response);

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
