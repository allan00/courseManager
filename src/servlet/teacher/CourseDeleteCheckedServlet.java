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


public class CourseDeleteCheckedServlet extends HttpServlet {

	public CourseDeleteCheckedServlet() {
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
		String[] checkArray = request.getParameterValues("checkList");
		Connection con = null;
		PreparedStatement ps = null;
		int size = 0;
		if(checkArray==null)
		{
			System.out.println("checkArray is null");
			request.getRequestDispatcher("/Teacher/TeacherWelcome").forward(request, response);
			return;
		}
		String sql = "DELETE FROM table_course WHERE id in(";
		for(int i=0;i<checkArray.length;i++)
		{
			sql= sql+checkArray[i]+",";
		}
		sql = sql.substring(0,sql.length()-1)+")";					//截去最后一个","
		//System.out.println(sql);
		try {
			con = JdbcUtil.getConn();
			ps=con.prepareStatement(sql);
            int i=ps.executeUpdate();
            request.setAttribute("message", "删除成功 ");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		}
		
		request.getRequestDispatcher("/Teacher/TeacherWelcome").forward(request, response);
		return;
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
