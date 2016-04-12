package servlet.teacher;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import util.JdbcUtil;
import model.Course;
import model.Student;
import model.Teacher;

public class CourseAddServlet extends HttpServlet {

	public CourseAddServlet() {
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

	@SuppressWarnings("finally")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
			request.getRequestDispatcher("/Teacher/TeacherWelcome").forward(request,
					response);
			return;
		}
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");
		String name = "";
		String pic_path = "";
		String pic_name = "";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// 获取文本信息
		try {
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				String field = item.getFieldName();
				//如果是文本框则获取文本信息
				if (field.equals("name")) {
					name = item.getString("UTF-8");// 这里需要看你页面的编码方式
				}
				if (!item.isFormField()) {
					pic_name = item.getName();
					String year = (new java.util.Date().getYear() + 1900)+"";
					int m = new java.util.Date().getMonth()+1;
					String month = m<10?("0"+m):(""+m);
					pic_name = returnDate() + "-"+pic_name.substring(pic_name.lastIndexOf("\\") + 1, pic_name.length()); // 获取原文件名
					String uploadpath = request.getRealPath("/document/upload/course/"+name);
					pic_path = "//document//upload//course//"+name;
					//如果不存在目录则新建
					File filepath = new File(uploadpath);
					if (!filepath.exists()) {
						filepath.mkdirs();
					}
					
					String path = uploadpath+ File.separator + pic_name;
					File uploadFile = new File(path);
					item.write(uploadFile);
				}
			}
			con = JdbcUtil.getConn();
			String sql = "INSERT INTO table_course(name,teacher_id,state,pic_path,pic_name) VALUES(?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, name); 
			ps.setInt(2, t.getId());
			ps.setInt(3, 1);
			ps.setString(4, pic_path);
			ps.setString(5, pic_name);
			int i = ps.executeUpdate();

		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		finally {
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
		}
		request.getRequestDispatcher("/Teacher/TeacherWelcome").forward(
				request, response);
		return;
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
	
	private String returnDate() {
		int year = new java.util.Date().getYear();
		String year2 = (year + 1900) + "";
		String month = (new java.util.Date().getMonth() + 1) + "";
		String date = new java.util.Date().getDate() + "";
		String hour = new java.util.Date().getHours() + "";

		String minute = new java.util.Date().getMinutes() + "";
		String seconds = new java.util.Date().getSeconds() + "";
		if (month.length() < 2) {
			month = "0" + month;
		}
		if (hour.length() < 2) {
			hour = "0" + hour;
		}
		return year2 + month + date + hour + minute + seconds;
	}

}
