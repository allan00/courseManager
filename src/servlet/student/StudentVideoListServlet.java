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
import model.Video;


public class StudentVideoListServlet extends HttpServlet {

	public StudentVideoListServlet() {
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
		  List video_list = new ArrayList<Message>();
		    Student s =  (Student) request.getSession().getAttribute("student");
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
			String sql = "SELECT * FROM table_video where course_id="+course_id;
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				Video v = new Video();
				v.setId(rs.getInt("id"));
				v.setName(rs.getString("name"));
				v.setFileName(rs.getString("fileName"));
				v.setPath(rs.getString("path"));
				v.setPic_path(rs.getString("pic_path"));
				v.setUploadtime(rs.getTimestamp("upload_time"));
				v.setCourse_id(rs.getString("course_id"));
				video_list.add(v);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("video_list", video_list);
		request.getRequestDispatcher("/student_video_list.jsp").forward(request, response);
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
