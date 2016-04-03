package servlet.manager;

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

public class TeacherDetailServlet extends HttpServlet {

	public TeacherDetailServlet() {
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
		Teacher s = new Teacher();

		try {
			Connection con = JdbcUtil.getConn();
			// if(!con.isClosed())
			// System.out.println("Succeeded connecting to the Database!");
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_teacher WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id); // 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			ResultSet rs = ps.executeQuery();
			
			if (rs != null) {
				rs.next();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setSex(rs.getString("sex"));
				s.setPhone(rs.getString("phone"));
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
		request.setAttribute("teacher", s);
		request.getRequestDispatcher("/teacher_update.jsp").forward(request, response);
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
