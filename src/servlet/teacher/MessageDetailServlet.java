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
import model.Message;
import model.Message_son;
import model.Student;
import model.Teacher;

public class MessageDetailServlet extends HttpServlet {

	public MessageDetailServlet() {
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
		Message s= new Message();
		List<Message_son> message_son_list = new ArrayList<Message_son>();
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = JdbcUtil.getConn();
			// if(!con.isClosed())
			// System.out.println("Succeeded connecting to the Database!");
			
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_message WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id); // 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				s.setId(rs.getInt("id"));
				s.setTitle(rs.getString("title"));
				s.setAuthor(rs.getString("author"));
				s.setContent(rs.getString("content"));
				s.setDate(rs.getTimestamp("date"));
				}
			else{
				System.out.println("the result set is empty");
			}
			
			sql = "SELECT * FROM table_message_son WHERE message_id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, rs.getInt("id")); // 对占位符设置值，占位符顺序从1开始，第一个参数是占位符的位置，第二个参数是占位符的值。
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Message_son son = new Message_son();
				son.setId(rs.getInt("id"));
				son.setFile_name(rs.getString("fileName"));
				son.setPath(rs.getString("path"));
				message_son_list.add(son);
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		}
		request.setAttribute("message", s);
		request.setAttribute("message_son_list", message_son_list);
		if(type == null){
			request.getRequestDispatcher("/message_detail.jsp").forward(request, response);
			return;
			}
			else if(type.equals("update")){
			request.getRequestDispatcher("/message_update.jsp").forward(request, response);
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
