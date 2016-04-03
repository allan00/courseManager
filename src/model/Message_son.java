package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Message_son {
	private long id; 
	private long table_id;
	private String path;   //保存路径
	private String file_name;
	private String message_id;
	private long reader_id;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getTable_id() {
		return table_id;
	}
	public void setTable_id(long table_id) {
		this.table_id = table_id;
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
	public long getReader_id() {
		return reader_id;
	}
	public void setReader_id(long reader_id) {
		this.reader_id = reader_id;
	}
	public String getMessage_id() {
		return message_id;
	}
	public void setMessage_id(String message_id) {
		this.message_id = message_id;
	}
	
	
	
}
