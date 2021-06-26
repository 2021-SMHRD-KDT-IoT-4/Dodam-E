package COM.Model;

public class NoticeDTO {
	
	private int notice_seq;
	private String notice_title;
	private String notice_id;
	private String notice_content;
	private String notice_day;
	
	
	public NoticeDTO(String notice_id) {
		super();
		this.notice_id = notice_id;
	}
	
	public NoticeDTO(int notice_seq, String notice_id) {
		super();
		this.notice_seq = notice_seq;
		this.notice_id = notice_id;
	}

	
	public NoticeDTO(String notice_title, String notice_id, String notice_content) {
		this.notice_title = notice_title;
		this.notice_id = notice_id;
		this.notice_content = notice_content;
	}


	public NoticeDTO(int notice_seq, String notice_title, String notice_id, String notice_content,
			String notice_day) {
		super();
		this.notice_seq = notice_seq;
		this.notice_title = notice_title;
		this.notice_id = notice_id;
		this.notice_content = notice_content;
		this.notice_day = notice_day;
	}
	
	
	
	public String getNotice_id() {
		return notice_id;
	}


	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}


	public int getNotice_seq() {
		return notice_seq;
	}


	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}


	public String getNotice_title() {
		return notice_title;
	}


	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}



	public String getNotice_content() {
		return notice_content;
	}


	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}


	public String getNotice_day() {
		return notice_day;
	}


	public void setNotice_day(String notice_day) {
		this.notice_day = notice_day;
	}

}
