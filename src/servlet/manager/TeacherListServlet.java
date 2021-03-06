package servlet.manager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;    
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  

import util.JdbcUtil;
import model.Student;
import model.Teacher;


public class TeacherListServlet extends HttpServlet {

	public TeacherListServlet() {
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
		List teacher_list = new ArrayList<Teacher>();
		String type = request.getParameter("type");
		try {
			Connection con = JdbcUtil.getConn();
//			if(!con.isClosed())
//				System.out.println("Succeeded connecting to the Database!");
			Statement statement;
			statement = con.createStatement();
			// 要执行的SQL语句
			String sql = "SELECT * FROM table_teacher";
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()) {
				Teacher s = new Teacher();
				s.setId(rs.getInt("id"));
				s.setAccount(rs.getString("account"));
				s.setName(rs.getString("name"));
				s.setSex(rs.getString("sex"));
				s.setPhone(rs.getString("phone"));
				s.setEmail(rs.getString("email"));
				s.setAcademy(rs.getString("academy"));
				s.setAddress(rs.getString("address"));
				s.setPassword(rs.getString("password"));
				teacher_list.add(s);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("teacher_list", teacher_list);	
		if(type == null){
			request.getRequestDispatcher("/manager_index.jsp").forward(request, response);
			return;
		}
		else if(type.equals("manage")){
		request.getRequestDispatcher("/manager_manage.jsp").forward(request, response);
		return;
		}

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
