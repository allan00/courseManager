package servlet.teacher;

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
import model.Student;
import model.Teacher;

public class AbleCourseServlet extends HttpServlet {

	public AbleCourseServlet() {
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
		int id = Integer.valueOf(request.getParameter("id"));
	    String state = request.getParameter("state");
	
		try {
			Connection con = JdbcUtil.getConn();
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "UPDATE teacher_course_map SET state=? WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, state);
			ps.setInt(2, id);
			int i = ps.executeUpdate();
	
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(state.equals("0"))
		{
			request.setAttribute("message", "关闭成功 ");
			request.getRequestDispatcher("/Teacher/TeacherCourseList").forward(request, response);
			return;	
			
		}
		else {
		request.setAttribute("message", "开启成功 ");
		request.getRequestDispatcher("/Teacher/TeacherCourseList").forward(request, response);
		return;}
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
