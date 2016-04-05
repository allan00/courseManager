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
import model.Message;
import model.Student;
import model.Teacher;


public class VideoListServlet extends HttpServlet {

	public VideoListServlet() {
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
		  List vedio_list = new ArrayList<Message>();
		    Student s =  (Student) request.getSession().getAttribute("student");
		    Teacher t = (Teacher) request.getSession().getAttribute("teacher");
			int teacher_id= t.getId();
			Course c = (Course) request.getSession().getAttribute("course");
			int course_id= c.getId();
		  System.out.println(course_id);
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();
			
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_message where course_id="+course_id;
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				Message v = new Message();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("title"));
				s.setMajor(rs.getString("author"));
				vedio_list.add(s);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("vedio_list", vedio_list);
		request.getRequestDispatcher("/student_vedio_list.jsp").forward(request, response);
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
