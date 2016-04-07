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

public class StudentPasswordUpdateServlet extends HttpServlet {

	public StudentPasswordUpdateServlet() {
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
		String  password= request.getParameter("password");
		String  password_sure= request.getParameter("password_sure");		
		if(!password.equals(password_sure)){
			request.setAttribute("message", "输入密码不一致，请重新输入 ");
		}
		else {
		try {
			Connection con = JdbcUtil.getConn();
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "UPDATE table_student SET password=? WHERE student_id=?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, password);
			ps.setString(2, student_id);
			int i = ps.executeUpdate();
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("message", "密码修改成功 ");
		request.getRequestDispatcher("/Student/StudentInformationList").forward(request, response);
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
