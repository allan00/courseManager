package servlet.teacher;

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


public class TeacherWelcomeServlet extends HttpServlet {

	public TeacherWelcomeServlet() {
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
		Teacher t =  (Teacher) request.getSession().getAttribute("teacher");
		
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();
			int teacher_id = t.getId();
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_course where teacher_id="+teacher_id;
			//System.out.println(sql);
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				Course c1 = new Course();
				c1.setId(rs.getInt("id"));
				c1.setName(rs.getString("name"));
				c1.setState(Integer.valueOf(rs.getInt("state")));
				c1.setTeacher_id(teacher_id);
				course_list.add(c1);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("course_list", course_list);
		//request.getSession().setAttribute("course", course_list);
		request.getRequestDispatcher("/teacher_index.jsp").forward(request, response);
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
