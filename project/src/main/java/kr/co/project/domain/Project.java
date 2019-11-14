package kr.co.project.domain;

public class Project {
	private int pno;
	private String id;
	private String title;
	private String content;
	private String image;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "Project [pno=" + pno + ", id=" + id + ", title=" + title + ", content=" + content + ", image=" + image
				+ "]";
	}
	
	
	
}
