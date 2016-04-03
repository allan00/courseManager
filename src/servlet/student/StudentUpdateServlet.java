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

public class StudentUpdateServlet extends HttpServlet {

	public StudentUpdateServlet() {
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
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String clazz = request.getParameter("clazz");
		String  phone= request.getParameter("phone");
		String email = request.getParameter("email");
		String academy = request.getParameter("academy");
		String  password= request.getParameter("password");
		String  grade= request.getParameter("grade");
		String  major= request.getParameter("major");
		try {
			Connection con = JdbcUtil.getConn();
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "UPDATE table_student SET name=?,sex=?,clazz=?,phone=?,email=?,academy=?,password=? WHERE student_id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, student_id);
			ps.setString(2, name);
			ps.setString(3,sex );
			ps.setString(4,clazz );
			ps.setString(5, phone);
			ps.setString(6,email);
			ps.setString(7, academy);
			ps.setString(8,grade);
			ps.setString(9,major );
			ps.setString(10,password );
			int i = ps.executeUpdate();
	
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("message", "修改成功 ");
		request.getRequestDispatcher("/Student/StudentList").forward(request, response);
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
