package servlet.student;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.JdbcUtil;
import model.Assignment;
import model.Course;
import model.Message;
import model.Student;
import model.Teacher;

public class StudentAssignmentCommittedListServlet extends HttpServlet {

	public StudentAssignmentCommittedListServlet() {
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
		List<Assignment> assignment_list = new ArrayList<Assignment>();
		String type = request.getParameter("type");
		Student s = (Student) request.getSession().getAttribute("student");
		String student_id = s.getStudent_id();
		Course c = (Course) request.getSession().getAttribute("course");
		int course_id = c.getId();
		try {
			Connection con = JdbcUtil.getConn();
			// if(!con.isClosed())
			// System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();

			// 要执行的SQL语句
			String sql = "select A.* from table_assignment A,assignment_answer B where A.id=B.assignmentId and B.studentId='"
					+ student_id + "' and A.course_id = " + course_id;
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				Assignment s1 = new Assignment();
				s1.setId(rs.getInt("id"));
				s1.setTitle(rs.getString("title"));
				s1.setContent(rs.getString("content"));
				s1.setDate_begin(rs.getTimestamp("date_begin"));
				s1.setDeadline(rs.getTimestamp("deadline"));
				s1.setCourseId(rs.getInt("course_id"));
				assignment_list.add(s1);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("assignment_list", assignment_list);
		request.getRequestDispatcher("/student_assignment_committed_list.jsp").forward(request, response);
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
