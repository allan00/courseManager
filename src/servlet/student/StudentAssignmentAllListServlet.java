package servlet.student;

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
import view.V_StudentAssignment;
import model.Assignment;
import model.Course;
import model.Message;
import model.Student;
import model.Teacher;


public class StudentAssignmentAllListServlet extends HttpServlet {

	public StudentAssignmentAllListServlet() {
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
		
		List<V_StudentAssignment> assignment_list = new ArrayList<V_StudentAssignment>();
		String type = request.getParameter("type");
		Student s = (Student) request.getSession().getAttribute("student");
		String student_id= s.getStudent_id();
		Course c = (Course) request.getSession().getAttribute("course");
		int course_id= c.getId();
		try {
			Connection con = JdbcUtil.getConn();
			Statement statement;
			statement = con.createStatement();
			
			// 要执行的SQL语句
			String sql = "SELECT count(*) FROM assignment_answer where courseId="+course_id;
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
			
			// 要执行的SQL语句
			sql = "select *,if(id in (select assignmentId from assignment_answer where courseId ="+course_id+"  and studentId = '"+student_id+"'),1,0)  as ifcomit from table_assignment  where course_id ="+course_id+" limit "+begin+","+size;
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				V_StudentAssignment s1 = new V_StudentAssignment();
				s1.setId(rs.getInt("id"));
				s1.setTitle(rs.getString("title"));
				s1.setContent(rs.getString("content"));
				s1.setDate_begin(rs.getTimestamp("date_begin"));
				s1.setDeadline(rs.getTimestamp("deadline"));
				s1.setCourseId(rs.getInt("course_id"));
				s1.setIfcomit(rs.getInt("ifcomit"));
				assignment_list.add(s1);
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

		
			request.getRequestDispatcher("/student_assignment_all_list.jsp").forward(request, response);
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
