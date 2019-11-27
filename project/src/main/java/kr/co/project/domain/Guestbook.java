package kr.co.project.domain;

public class Guestbook {
	private int gno;
	private String id;
	private String content;
	private String insert_date;
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}
	@Override
	public String toString() {
		return "Guestbook [gno=" + gno + ", id=" + id + ", content=" + content + ", insert_date=" + insert_date + "]";
	}
	
}
