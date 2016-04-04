package servlet.teacher;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Column;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Course;
import model.Teacher;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import util.JdbcUtil;

public class MessageAddServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MessageAddServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @param
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
			request.getRequestDispatcher("/MessageList").forward(request,
					response);
			return;
		}
		
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");
		String title = "", author = "", content = "";
		Timestamp date = new Timestamp(System.currentTimeMillis());
		Course course  = (Course)request.getSession().getAttribute("course");
		int course_id = course.getId();
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
				if (field.equals("title")) {
					title = item.getString("UTF-8");// 这里需要看你页面的编码方式
				}
				if (field.equals("author")) {
					author = item.getString("UTF-8");// 这里需要看你页面的编码方式
				}
				if (field.equals("content")) {
					content = item.getString("UTF-8");
				}
				if (field.equals("course")) {
					course_id = Integer.valueOf(item.getString("UTF-8"));
				}
			}
			con = JdbcUtil.getConn();
			String sql = "INSERT INTO table_message(title,author,content,date,course_id) VALUES(?,?,?,?,?)";
			ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, title); 
			ps.setString(2, author);
			ps.setString(3, content);
			ps.setTimestamp(4, date);
			ps.setInt(5, course_id);
			int i = ps.executeUpdate();
			
			//获取刚刚插入通知的id
			int message_id = 0;
			rs = ps.getGeneratedKeys();
			if (rs.next())
				message_id=rs.getInt(1);

			
			Iterator iter2 = items.iterator();
			while (iter2.hasNext()) {
				FileItem item = (FileItem) iter2.next();
				String field = item.getFieldName();
				// 如果是文件，则上传
				if (!item.isFormField()) {
					String name = item.getName();
					String year = (new java.util.Date().getYear() + 1900)+"";
					int m = new java.util.Date().getMonth()+1;
					String month = m<10?("0"+m):(""+m);
					String fileName = returnDate() + "-"+name.substring(name.lastIndexOf("\\") + 1, name.length()); // 获取原文件名
					String uploadpath = request.getRealPath("/document/upload/message/" + year+ month);
					
					//如果不存在目录则新建
					File filepath = new File(uploadpath);
					if (!filepath.exists()) {
						filepath.mkdirs();
					}
					
					String path = uploadpath+ File.separator + fileName;
					File uploadFile = new File(path);
					item.write(uploadFile);
					
				
					String directory = "/document/upload/message/" + year+ month;
					sql = "INSERT INTO table_message_son(fileName,path,message_id) VALUES(?,?,?)";
					ps = con.prepareStatement(sql);
					ps.setString(1, fileName);
					ps.setString(2, directory);
					ps.setLong(3, message_id);
					i = ps.executeUpdate();
				}
			}
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs, ps);
			JdbcUtil.closeConnection(con);
		}
		request.setAttribute("message", "发布成功 ");
		request.getRequestDispatcher("/Teacher/MessageList?type=manage").forward(request, response);
		return;
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
