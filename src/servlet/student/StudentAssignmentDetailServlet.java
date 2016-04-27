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
import model.Assignment;
import model.Assignment_answer;
import model.Assignment_son;
import model.Message;
import model.Message_son;
import model.Student;
import model.Teacher;

public class StudentAssignmentDetailServlet extends HttpServlet {

	public StudentAssignmentDetailServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		Student t = (Student) request.getSession().getAttribute("student");
		String student_id = t.getStudent_id();
		Assignment s = new Assignment();
		List<Assignment_son> assignment_son_list = new ArrayList<Assignment_son>();
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = JdbcUtil.getConn();
			// if(!con.isClosed())
			// System.out.println("Succeeded connecting to the Database!");
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_assignment WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id); // 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			ResultSet rs = ps.executeQuery();
			int assignmentId = -1;
			if (rs.next()) {
				assignmentId = rs.getInt("id");
				s.setId(assignmentId);
				s.setTitle(rs.getString("title"));
				s.setContent(rs.getString("content"));
				s.setDate_begin(rs.getTimestamp("date_begin"));
				s.setDeadline(rs.getTimestamp("deadline"));
				s.setCourseId(rs.getInt("course_id"));
			} else {
				System.out.println("the result set is empty");
			}

			sql = "SELECT * FROM table_assignment_son WHERE assignment_id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, assignmentId); // 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			rs = ps.executeQuery();

			while (rs.next()) {
				Assignment_son son = new Assignment_son();
				son.setId(rs.getInt("id"));
				son.setFile_name(rs.getString("fileName"));
				son.setPath(rs.getString("path"));
				assignment_son_list.add(son);
			}
			sql = "SELECT * FROM assignment_answer WHERE assignmentId=? and studentId="+student_id;
			ps = con.prepareStatement(sql);
			ps.setInt(1, assignmentId); // 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			rs = ps.executeQuery();

			if (rs.next()) {
				Assignment_answer ans = new Assignment_answer();
				ans.setId(rs.getInt("id"));
				ans.setTitle(rs.getString("title"));
				ans.setContent(rs.getString("content"));
				ans.setUploadTime(rs.getTimestamp("uploadTime"));
				ans.setState(rs.getInt("state"));
				ans.setScore(rs.getDouble("score"));
				ans.setAssignmentId(rs.getInt("assignmentId"));
				ans.setStudentId(rs.getString("studentId"));
				ans.setStudentName(rs.getString("studentName"));
				ans.setCourseId(rs.getInt("courseId"));
				request.setAttribute("assignment_answer", ans);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		}
		request.setAttribute("assignment", s);
		request.setAttribute("assignment_son_list", assignment_son_list);
		request.getRequestDispatcher("/student_assignment_detail.jsp").forward(request, response);
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
