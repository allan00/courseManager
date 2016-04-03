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

public class TeacherCourseAddServlet extends HttpServlet {

	public TeacherCourseAddServlet() {
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
		PreparedStatement ps = null;
		Connection con = null;
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");
		int teacher_id = t.getId();
		String courseName = request.getParameter("courseName");

		try {
			con = JdbcUtil.getConn();
			// if(!con.isClosed())
			// System.out.println("Succeeded connecting to the Database!");

			// 要执行的SQL语句
			String sql = "INSERT INTO table_course(teacher_id,name,state) VALUES(?,?,1)";
			ps = con.prepareStatement(sql);
			// 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			ps.setInt(1, teacher_id);
			ps.setString(2, courseName);
			int i = ps.executeUpdate();
			request.setAttribute("message", "添加成功 ");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("message", e);
		} finally {
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
			request.getRequestDispatcher("/Teacher/TeacherCourseList").forward(
					request, response);
			return;
		}
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
