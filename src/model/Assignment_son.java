package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Assignment_son {
	private long id; 
	private String path;   //保存路径
	private String file_name;
	private String assignment_id;
	private long reader_id;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)	
	
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
	public String getAssignment_id() {
		return assignment_id;
	}
	public void setAssignment_id(String assignment_id) {
		this.assignment_id = assignment_id;
	}
	public long getReader_id() {
		return reader_id;
	}
	public void setReader_id(long reader_id) {
		this.reader_id = reader_id;
	}

	
	
	
}
