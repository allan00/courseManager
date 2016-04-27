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
import model.Course;
import model.Student;
import model.Teacher;


public class StudentListServlet extends HttpServlet {

	public StudentListServlet() {
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
		List student_list = new ArrayList<Student>();
		Course c = (Course) request.getSession().getAttribute("course");
		int course_id= c.getId();
		try {
			Connection con = JdbcUtil.getConn();
			Statement statement;
			statement = con.createStatement();
			
			// 要执行的SQL语句
			String sql = "SELECT count(*) FROM table_student A,student_course_map B where A.student_id=B.student_id and B.course_id ="+course_id;
			ResultSet rs = statement.executeQuery(sql);
			if(rs.next()) {
				row_count = rs.getInt(1);
			}
			page_count=(row_count + size - 1)/size;
			if(page_count<1)
				page_count = 1;
			page_current = page_current>page_count?page_count:page_current;//如果page大于总页数1,则page设为最大值
			page_current = page_current<1?1:page_current;//如果page<1,则page=1
			begin=(page_current-1)*size;
			sql = "SELECT A.* FROM  table_student A,student_course_map B where A.student_id=B.student_id and B.course_id ="+course_id+" limit "+begin+","+size;
			rs = statement.executeQuery(sql);
		
			while(rs.next()) {
				Student s = new Student();
				s.setId(rs.getInt("id"));
				s.setStudent_id(rs.getString("student_id"));
				s.setName(rs.getString("name"));
				s.setSex(rs.getString("sex"));
				s.setPhone(rs.getString("phone"));
				s.setEmail(rs.getString("email"));
				s.setAcademy(rs.getString("academy"));
				s.setGrade(rs.getString("grade"));
				s.setMajor(rs.getString("major"));
				s.setClazz(rs.getString("clazz"));
				s.setPassword(rs.getString("password"));
				student_list.add(s);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("student_list", student_list);
		request.setAttribute("page_count", page_count);
		request.setAttribute("page_current", page_current);
		
		
			request.getRequestDispatcher("/student_list.jsp").forward(request, response);
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
