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

public class CourseUpdateServlet extends HttpServlet {

	public CourseUpdateServlet() {
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
		String course_name = request.getParameter("course_name");
		String teacher_name = request.getParameter("teacher_name");
		String stu_number = request.getParameter("stu_number");

		try {
			Connection con = JdbcUtil.getConn();
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "UPDATE table_course SET name=?,teacher_name=?,stu_number=? WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, course_name);
			ps.setString(2, teacher_name);
			ps.setString(3, stu_number);
			ps.setInt(4, id);
			int i = ps.executeUpdate();
	
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		request.getRequestDispatcher("/Teacher/CourseList").forward(request, response);
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
