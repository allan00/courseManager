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
import model.Course;
import model.Student;
import model.Teacher;

public class StudentCourseWelcomeServlet extends HttpServlet {

	public StudentCourseWelcomeServlet() {
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
		int course_id = Integer.valueOf(request.getParameter("course_id"));
		// System.out.println(course_id);
		Teacher course_teacher = new Teacher();
		Course c = null;
		Connection con = null;
		Statement statement = null;
		ResultSet rs = null;

		try {
			con = JdbcUtil.getConn();
			statement = con.createStatement();
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_course where id=" + course_id;
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				c = new Course();
				c.setId(course_id);
				c.setName(rs.getString("name"));
				c.setState(rs.getInt("state"));
				c.setTeacher_id(Integer.valueOf(rs.getString("teacher_id")));
			}

			sql = "SELECT B.* FROM table_course A,table_teacher B where A.teacher_id = B.id and A.id="+ course_id;
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				course_teacher.setId(rs.getInt("id"));
				course_teacher.setName(rs.getString("name"));
				course_teacher.setSex(rs.getString("sex"));
				course_teacher.setPhone(rs.getString("phone"));
				course_teacher.setEmail(rs.getString("email"));
				course_teacher.setAddress(rs.getString("address"));
				course_teacher.setAcademy(rs.getString("academy"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		}
		if (c != null) {
			request.getSession().setAttribute("course", c);
		}
		if (course_teacher != null) {
			request.getSession().setAttribute("course_teacher", course_teacher);
		}
		request.getRequestDispatcher("/Student/StudentVideoList").forward(
				request, response);
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
