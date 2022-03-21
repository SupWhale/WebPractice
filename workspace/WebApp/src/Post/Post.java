package Post;

public class Post {
	String Type;
	String title;
	String Content;
	String Writer;
	String datemonth;
	int Count;
	public Post() {
		this.Type = "";
		this.title = "";
		this.Content = "";
		this.Writer = "";
		this.datemonth = "";
		this.Count = 0;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		this.Type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		this.Content = content;
	}
	public String getWriter() {
		return Writer;
	}
	public void setWriter(String writer) {
		Writer = writer;
	}
	public String getDate() {
		return datemonth;
	}
	public void setDate(String date) {
		datemonth = date;
	}
	public int getCount() {
		return Count;
	}
	public void setCount(int count) {
		this.Count = count;
	}
}
