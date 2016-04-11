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
import model.Assignment;
import model.Assignment_answer;
import model.Assignment_answer_son;
import model.Assignment_son;
import model.Message;
import model.Message_son;
import model.Student;
import model.Teacher;

public class AssignmentAnswerDetailServlet extends HttpServlet {

	public AssignmentAnswerDetailServlet() {
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
		String id = request.getParameter("assignmentAnswerId");
		String type = request.getParameter("type");
		Assignment_answer ans = null;
		List<Assignment_answer_son> son_list = new ArrayList<Assignment_answer_son>();
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = JdbcUtil.getConn();
			// if(!con.isClosed())
			// System.out.println("Succeeded connecting to the Database!");
			// 要执行的SQL语句
			String sql = "SELECT * FROM assignment_answer WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id); // 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ans = new Assignment_answer();
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
			} else {
				System.out.println("the result set is empty");
			}

			sql = "SELECT * FROM assignment_answer_son WHERE assignmentAnswerId=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id); // 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			rs = ps.executeQuery();

			while (rs.next()) {
				Assignment_answer_son son = new Assignment_answer_son();
				son.setId(rs.getInt("id"));
				son.setFileName(rs.getString("fileName"));
				son.setPath(rs.getString("path"));
				son_list.add(son);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		}
		request.setAttribute("assignment_answer", ans);
		request.setAttribute("son_list", son_list);
		request.getRequestDispatcher("/teacher_score_assignment.jsp").forward(request, response);
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
