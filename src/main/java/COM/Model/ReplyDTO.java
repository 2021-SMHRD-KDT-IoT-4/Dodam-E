package COM.Model;

public class ReplyDTO {
	
	
	private int reply_seq;
	private String users_id;
	private int notice_seq;
	private String reply_content;
	private String reply_day;
	
	
	
	public ReplyDTO(int reply_seq, String users_id, int notice_seq, String reply_content, String reply_day) {
		super();
		this.reply_seq = reply_seq;
		this.users_id = users_id;
		this.notice_seq = notice_seq;
		this.reply_content = reply_content;
		this.reply_day = reply_day;
	}



	public ReplyDTO(String users_id, int notice_seq, String reply_content) {
		super();
		this.users_id = users_id;
		this.notice_seq = notice_seq;
		this.reply_content = reply_content;
	}



	public int getReply_seq() {
		return reply_seq;
	}



	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}



	public String getUsers_id() {
		return users_id;
	}



	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}



	public int getNotice_seq() {
		return notice_seq;
	}



	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}



	public String getReply_content() {
		return reply_content;
	}



	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}



	public String getReply_day() {
		return reply_day;
	}



	public void setReply_day(String reply_day) {
		this.reply_day = reply_day;
	}
	
	
	
	
	
	
	
	
}
