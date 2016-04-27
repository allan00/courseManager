package servlet.teacher;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Sheet;
import jxl.Workbook;
import model.Course;
import model.Student;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import util.JdbcUtil;
import util.Md5Util;

public class StudentImportServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public StudentImportServlet() {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
			request.getRequestDispatcher("/Teacher/StudentList").forward(request, response);
			return;
		}

		File f;
		try {
			f = uploadFile(request);
			importFile(request, response, f);
			f.deleteOnExit();
			request.getRequestDispatcher("/Teacher/StudentList").forward(request, response);
			return;
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 上传文件
	private File uploadFile(HttpServletRequest request) throws Exception {
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		File uploadFile = null;
		List items = upload.parseRequest(request);
		Iterator iter = items.iterator();
		while (iter.hasNext()) {
			FileItem item = (FileItem) iter.next();
			if (!item.isFormField()) {
				String name = item.getName();
				String fileName = name.substring(name.lastIndexOf("\\") + 1, name.length()); // 获取原文件名
				String uploadpath = request.getRealPath("temp");
				File filepath = new File(uploadpath);
				if (!filepath.exists()) {
					filepath.mkdirs();
				}
				String path = request.getRealPath("temp") + File.separator + fileName;
				uploadFile = new File(path);
				item.write(uploadFile);
			}
		}
		return uploadFile;
	}

	// 解析并导入学生
	private boolean importFile(HttpServletRequest request, HttpServletResponse response, File file) throws IOException {
		Course c = (Course)request.getSession().getAttribute("course");
		int courseId = c.getId();
		StringBuilder message = new StringBuilder();
		InputStream is = null;
		jxl.Workbook rwb = null;
		Student s = new Student();
		try {
			// 1 从Excel文件读取数据表
			// Java Excel
			// API既可以从本地文件系统的一个文件(.xls)，也可以从输入流中读取Excel数据表。
			// 读取Excel数据表的第一步是创建Workbook(术语：工作薄)，下面的代码片段举例说明了应该如何操作：
			// (完整代码见ExcelReading.java)
			// 构建Workbook对象, 只读Workbook对象
			// 直接从本地文件创建Workbook
			// 从输入流创建Workbook
			is = new FileInputStream(file);
			rwb = Workbook.getWorkbook(is);
			// 一旦创建了Workbook，我们就可以通过它来访问Excel
			// Sheet(术语：工作表)。参考下面的代码片段：
			// 获取第一张Sheet表
			Sheet rs = (Sheet) rwb.getSheet(0);
			// 我们既可能通过Sheet的名称来访问它，也可以通过下标来访问它。如果通过下标来访问的话，
			// 要注意的一点是下标从0开始，就像数组一样。

			// 一旦得到了Sheet，我们就可以通过它来访问Excel
			// Cell(术语：单元格)。参考下面的代码片段：
			// System.out.println(((jxl.Sheet)
			// rs).getColumns());;
			// System.out.println(((jxl.Sheet)
			// rs).getRows());;

			// 初始化第一行数据
			String str[] = { "序号", "学号", "姓名", "性别", "电话", "邮箱", "学院", "年级", "班级", "专业" };
			for (int i = 0; i < str.length; i++) {
				if (!str[i].equals(rs.getCell(i, 0).getContents())) {
					rwb.close();
					is.close();
					request.setAttribute("message", "导入excel格式错误,请下载模板重新导入");
					return false;
				}
			}
			for (int j = 1; j < rs.getRows(); j++) {
				for (int i = 1; i < rs.getColumns(); i++) {
					String st = rs.getCell(i, j).getContents();
					switch (i) {
					case 1:
						s.setStudent_id(st);// 账号
						break;
					case 2:
						s.setName(st);
						break;
					case 3:
						s.setSex(st);
						break;
					case 4:
						s.setPhone(st);
						break;
					case 5:
						s.setEmail(st);
						break;
					case 6:
						s.setAcademy(st);
						break;
					case 7:
						s.setGrade((st));
						break;
					case 8:
						s.setClazz(st);
						break;
					case 9:
						s.setMajor(st);
						break;
					}
				}
				s.setPassword("123456");
				importbase(s, courseId,message);
			}
			message.append("导入结束");
			request.setAttribute("message", message);
			// OperateUtil.add(request, "导入excel表",
			// "导入了"+rs.getColumns()+"条学生基本个人信息的数据");

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			rwb.close();
			is.close();
		}
		return true;
	}

	private void importbase(Student s, int courseId,StringBuilder message) {
		if (s == null)
			return;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i = 0 ;
		try {
			// 查询系统中是否已经存在该学号的学生
			con = JdbcUtil.getConn();
			String sql = "select * from table_student where student_id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, s.getStudent_id());
			rs = ps.executeQuery();
//			JdbcUtil.close(null, ps);

			//导入到学生表
			if (!rs.next()) {
				sql = "INSERT INTO table_student(student_id,name,sex,phone,email,academy,grade,clazz,major,password) VALUES(?,?,?,?,?,?,?,?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setString(1, s.getStudent_id());
				ps.setString(2, s.getName());
				ps.setString(3, s.getSex());
				ps.setString(4, s.getPhone());
				ps.setString(5, s.getEmail());
				ps.setString(6, s.getAcademy());
				ps.setString(7, s.getGrade());
				ps.setString(8, s.getClazz());
				ps.setString(9, s.getMajor());
				ps.setString(10, s.getPassword());
				i = ps.executeUpdate();
				JdbcUtil.close(null, ps);
			}
			else{
				message.append("学号："+s.getStudent_id()+"的学生已存在\n");
			}
			
			//先判断学生是否已选修该课程
			sql = "select * from student_course_map where student_id=? and course_id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, s.getStudent_id());
			ps.setInt(2, courseId);
			rs = ps.executeQuery();
			
			if (!rs.next()) {
			//导入到选课表
			sql = "INSERT INTO student_course_map(student_id,course_id) VALUES(?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, s.getStudent_id());
			ps.setInt(2, courseId);
			i = ps.executeUpdate();
			}
			else{
				message.append("学号："+s.getStudent_id()+"的学生已选修该课程\n");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(null, ps);
			JdbcUtil.closeConnection(con);
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
