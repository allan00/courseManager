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

public class TeacherInformationUpdateServlet extends HttpServlet {

	public TeacherInformationUpdateServlet() {
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
		String  account= request.getParameter("account");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String  phone= request.getParameter("phone");
		String  email= request.getParameter("email");
		String  academy= request.getParameter("academy");
		String  address= request.getParameter("address");
		

		try {
			Connection con = JdbcUtil.getConn();
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "UPDATE table_teacher SET account=?,name=?,sex=?,phone=?,email=?,academy=?,address=? WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, account);
			ps.setString(2, name);
			ps.setString(3,sex );
			ps.setString(4, phone);
			ps.setString(5, email);
			ps.setString(6, academy);
			ps.setString(7, address);
			

			ps.setInt(8, id);
			int i = ps.executeUpdate();
	
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("message", "修改成功 ");
		request.getRequestDispatcher("/Teacher/TeacherInformationList").forward(request, response);
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
