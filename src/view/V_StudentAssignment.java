package view;

import java.sql.Timestamp;



public class V_StudentAssignment {
	private int id;
	private String title;
	private String content;
	private Timestamp  date_begin;
	private Timestamp deadline;
	private int courseId;
	private int ifcomit;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate_begin() {
		return date_begin;
	}
	public void setDate_begin(Timestamp date_begin) {
		this.date_begin = date_begin;
	}
	public Timestamp getDeadline() {
		return deadline;
	}
	public void setDeadline(Timestamp deadline) {
		this.deadline = deadline;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getIfcomit() {
		return ifcomit;
	}
	public void setIfcomit(int ifcomit) {
		this.ifcomit = ifcomit;
	}
	
}