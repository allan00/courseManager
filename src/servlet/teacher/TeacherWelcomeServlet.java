package servlet.teacher;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
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


public class TeacherWelcomeServlet extends HttpServlet {

	public TeacherWelcomeServlet() {
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
		
		
		List course_list = new ArrayList<Course>();
		String type = request.getParameter("type");
		Teacher t =  (Teacher) request.getSession().getAttribute("teacher");
		int teacher_id=t.getId();
		
		
		try {
			Connection con = JdbcUtil.getConn();
			Statement statement;
			statement = con.createStatement();
			
			// 要执行的SQL语句
			String sql = "SELECT count(*) FROM table_course";
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
			sql = "SELECT * FROM table_course where teacher_id="+teacher_id+" limit "+begin+","+size;
			//System.out.println(sql);
			 rs = statement.executeQuery(sql);
			while(rs.next()) {
				Course c1 = new Course();
				c1.setId(rs.getInt("id"));
				c1.setName(rs.getString("name"));
				c1.setState(Integer.valueOf(rs.getInt("state")));
				c1.setPic_path(rs.getString("pic_path"));
				c1.setPic_name(rs.getString("pic_name"));
				course_list.add(c1);
			}
			JdbcUtil.close(rs, statement);
			JdbcUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("course_list", course_list);
		request.setAttribute("page_count", page_count);
		request.setAttribute("page_current", page_current);
		//request.getSession().setAttribute("course", course_list);
		
		if(type == null){
			request.getRequestDispatcher("/teacher_index.jsp").forward(request, response);
			return;}
			else if(type.equals("manage")){
			request.getRequestDispatcher("/teacher_course_manage.jsp").forward(request, response);
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
