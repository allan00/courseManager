package servlet.teacher;

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

import util.Constans;
import util.JdbcUtil;
import model.Assignment;
import model.Course;
import model.Message;
import model.Student;
import model.Teacher;


public class AssignmentListServlet extends HttpServlet {

	public AssignmentListServlet() {
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
		int page_current = 1;
		int page_count = 1;
		int size = Constans.ROW_PER_PAGE;
		int row_count  = 0;
		int begin = 0;
		if(request.getParameter("page")!=null){
			page_current = Integer.valueOf(request.getParameter("page"));
		}
		
		List assignment_list = new ArrayList<Assignment>();
		String type = request.getParameter("type");
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");
		int teacher_id= t.getId();
		Course c = (Course) request.getSession().getAttribute("course");
		int course_id= c.getId();
		try {
			Connection con = JdbcUtil.getConn();
			Statement statement;
			statement = con.createStatement();
			
			// 要执行的SQL语句
			String sql = "SELECT count(*) FROM table_assignment where course_id="+course_id;
			ResultSet rs = statement.executeQuery(sql);
			if(rs.next()) {
				row_count = rs.getInt(1);
			}
			
			page_count=(row_count + size - 1)/size;
			if(page_count<1)
				page_count = 1;
			page_current = page_current<1?1:page_current;//如果page<1,则page=1
			page_current = page_current>page_count?page_count:page_current;//如果page大于总页数1,则page设为最大值
			begin=(page_current-1)*size;
			
			sql = "SELECT * FROM table_assignment where course_id="+course_id+" limit "+begin+","+size;
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				Assignment s = new Assignment();
				s.setId(rs.getInt("id"));
				s.setTitle(rs.getString("title"));
				s.setContent(rs.getString("content"));
				s.setDate_begin(rs.getTimestamp("date_begin"));
				s.setDeadline(rs.getTimestamp("deadline"));
				s.setCourseId(rs.getInt("course_id"));
				assignment_list.add(s);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("assignment_list", assignment_list);
		request.setAttribute("page_count", page_count);
		request.setAttribute("page_current", page_current);

		if(type == null){
			request.getRequestDispatcher("/assignment_list.jsp").forward(request, response);
			return;
		}
		else if(type.equals("manage")){
		request.getRequestDispatcher("/assignment_manage.jsp").forward(request, response);
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
