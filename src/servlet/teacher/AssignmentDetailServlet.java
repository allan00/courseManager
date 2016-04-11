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
import model.Assignment_son;
import model.Course;
import model.Message;
import model.Message_son;
import model.Student;
import model.Teacher;

public class AssignmentDetailServlet extends HttpServlet {

	public AssignmentDetailServlet() {
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
		String id = request.getParameter("id");
		String type = request.getParameter("type");	
		Assignment as= new Assignment();
		List<Assignment_son> assignment_son_list = new ArrayList<Assignment_son>();
		List<Assignment_answer> committed_list = new ArrayList<Assignment_answer>();
		List<Student> uncommitted_list = new ArrayList<Student>();
		Connection con = null;
		PreparedStatement ps = null;
		Course c = (Course)request.getSession().getAttribute("course");
		int courseId = c.getId();

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
				as.setId(assignmentId);
				as.setTitle(rs.getString("title"));
				as.setContent(rs.getString("content"));
				as.setDate_begin(rs.getTimestamp("date_begin"));
				as.setDeadline(rs.getTimestamp("deadline"));
				as.setCourseId(rs.getInt("course_id"));
				}
			else{
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
			
			//查询已提交作业的作业信息
			sql = "select * from assignment_answer where assignmentId = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, assignmentId); // 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			rs = ps.executeQuery();
			
			while (rs.next()) {
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
				committed_list.add(ans);
				}
			
			//查询未提交作业的学生信息
			sql = "select * from table_student A,student_course_map B where A.student_id=B.student_id "
					+ "and B.course_id=? and A.student_id not in (select studentId from assignment_answer "
					+ "where assignmentId = ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, courseId);
			ps.setInt(2, assignmentId); 
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Student stu = new Student();
				stu.setId(rs.getInt("id"));
				stu.setStudent_id(rs.getString("student_id"));
				stu.setName(rs.getString("name"));
				stu.setSex(rs.getString("sex"));
				stu.setPhone(rs.getString("phone"));
				stu.setEmail(rs.getString("email"));
				stu.setAcademy(rs.getString("academy"));
				stu.setGrade(rs.getString("grade"));
				stu.setMajor(rs.getString("major"));
				stu.setClazz(rs.getString("clazz"));
				stu.setPassword(rs.getString("password"));
				uncommitted_list.add(stu);
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		}
		request.setAttribute("assignment", as);
		request.setAttribute("assignment_son_list", assignment_son_list);
		request.setAttribute("committed_list", committed_list);
		request.setAttribute("uncommitted_list", uncommitted_list);
		
		if(type == null){
			request.getRequestDispatcher("/assignment_detail.jsp").forward(request, response);
			return;
			}
			else if(type.equals("update")){
			request.getRequestDispatcher("/assignment_update.jsp").forward(request, response);
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
