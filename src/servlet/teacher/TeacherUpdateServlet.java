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

public class TeacherUpdateServlet extends HttpServlet {

	public TeacherUpdateServlet() {
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
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String  phone= request.getParameter("phone");
		String  password= request.getParameter("password");

		try {
			Connection con = JdbcUtil.getConn();
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "UPDATE table_teacher SET name=?,sex=?,phone=?,password=? WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2,sex );
			ps.setString(3, phone);
			ps.setString(4, password);

			ps.setInt(5, id);
			int i = ps.executeUpdate();
	
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("message", "修改成功 ");
		request.getRequestDispatcher("/Teacher/TeacherList").forward(request, response);
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
