package servlet.teacher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Course;
import model.Document;
import model.Video;
import util.JdbcUtil;

import com.jspsmart.upload.File;



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
		Course c = (Course) request.getSession().getAttribute("course");
		int course_id= c.getId();
		String type = request.getParameter("type");	
		List<Video> video_list = new ArrayList<Video>();

		try {
			Connection con = JdbcUtil.getConn();
        //		if(!con.isClosed())
           //		System.out.println("Succeeded connecting to the Database!");
	          Statement statement;
	          statement = con.createStatement();
			String sql = "SELECT * FROM table_video WHERE course_id="+course_id;
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Video s= new Video();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("Name"));
				s.setFileName(rs.getString("fileName"));
				s.setPath(rs.getString("path"));
				s.setPic_path(rs.getString("pic_path"));
				s.setUploadtime(rs.getTimestamp("upload_time"));
				s.setCourse_id(rs.getString("course_id"));
				video_list.add(s);
				}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("video_list", video_list);
		if(type == null){
			request.getRequestDispatcher("/video_list.jsp").forward(request, response);
			return;
			}
			else if(type.equals("manage")){
			request.getRequestDispatcher("/video_manage.jsp").forward(request, response);
			return;
			}
		
		
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
