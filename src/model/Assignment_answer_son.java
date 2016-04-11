package model;

public class Assignment_answer_son {
	private long id; 
	private String path;   //保存路径
	private String file_name;
	private int assignmentAnswerId;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getAssignmentAnswerId() {
		return assignmentAnswerId;
	}
	public void setAssignmentAnswerId(int assignmentAnswerId) {
		this.assignmentAnswerId = assignmentAnswerId;
	}
	
}
