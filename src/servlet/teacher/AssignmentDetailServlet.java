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
import model.Message;
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
		String id = String.valueOf(request.getParameter("id"));
		String type = request.getParameter("type");	
		Assignment s= new Assignment();

		try {
			Connection con = JdbcUtil.getConn();
			// if(!con.isClosed())
			// System.out.println("Succeeded connecting to the Database!");
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_assignment WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id); // 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				s.setId(rs.getInt("id"));
				s.setTitle(rs.getString("title"));
				s.setContent(rs.getString("content"));
				s.setDate_begin(rs.getTimestamp("date_begin"));
				s.setDeadline(rs.getTimestamp("deadline"));
				s.setCourseId(rs.getInt("course_id"));
				}
			else{
				System.out.println("the result set is empty");
			}
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("assignment", s);
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
