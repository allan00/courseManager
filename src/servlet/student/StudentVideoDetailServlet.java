package servlet.student;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.JdbcUtil;
import model.Message;
import model.Message_son;
import model.Student;
import model.Teacher;
import model.Video;

public class StudentVideoDetailServlet extends HttpServlet {

	public StudentVideoDetailServlet() {
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
		String video_id = request.getParameter("id");
		Connection con = null;
		PreparedStatement ps = null;
		Video video = new Video();
		try {
			con = JdbcUtil.getConn();
			// if(!con.isClosed())
			// System.out.println("Succeeded connecting to the Database!");
			
			// 要执行的SQL语句
			
			ResultSet rs = null;			
			 String sql = "SELECT * FROM table_video WHERE id="+video_id;
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next()) {	
				video.setId(rs.getInt("id"));
				video.setName(rs.getString("name"));
				video.setFileName(rs.getString("fileName"));
				video.setPath(rs.getString("path"));
				video.setUploadtime(rs.getTimestamp("upload_time"));
				video.setPic_path(rs.getString("pic_path"));
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		}
		request.setAttribute("video", video);
		
			request.getRequestDispatcher("/student_video_detail.jsp").forward(request, response);
			return;
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
