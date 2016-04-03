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

public class MessageUpdateServlet extends HttpServlet {

	public MessageUpdateServlet() {
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
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String content = request.getParameter("content");
		try {
			Connection con = JdbcUtil.getConn();
			PreparedStatement ps = null;
			// 要执行的SQL语句
			String sql = "UPDATE table_message SET title=?,author=?,content=? WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,title);
			ps.setString(2, author);
			ps.setString(3,content);
			ps.setInt(4,id );
     		int i = ps.executeUpdate();
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("message", "修改成功 ");
		request.getRequestDispatcher("/Teacher/MessageList").forward(request, response);
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
