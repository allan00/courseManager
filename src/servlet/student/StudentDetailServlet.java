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
import model.Student;
import model.Teacher;

public class StudentDetailServlet extends HttpServlet {

	public StudentDetailServlet() {
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
		String student_id = String.valueOf(request.getParameter("student_id"));
		Student s = new Student();

		try {
			Connection con = JdbcUtil.getConn();
			// if(!con.isClosed())
			// System.out.println("Succeeded connecting to the Database!");
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_student WHERE student_id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, student_id); // 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			ResultSet rs = ps.executeQuery();
			
			if (rs != null) {
				rs.next();
				s.setId(rs.getInt("id"));
				s.setStudent_id(rs.getString("student_id"));
				s.setName(rs.getString("name"));
				s.setSex(rs.getString("sex"));
				s.setClazz(rs.getString("clazz"));
				s.setPhone(rs.getString("phone"));
				s.setEmail(rs.getString("email"));
				s.setAcademy(rs.getString("academy"));
				s.setPassword(rs.getString("password"));
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
		request.setAttribute("student", s);
		request.getRequestDispatcher("/student_update.jsp").forward(request, response);
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
