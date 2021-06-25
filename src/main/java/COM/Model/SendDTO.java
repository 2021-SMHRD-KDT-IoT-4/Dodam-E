package COM.Model;

public class SendDTO {

	private int send_seq;
	private String send_machine;
	private String send_day;
	
	
	
	public SendDTO(int send_seq, String send_machine, String send_day) {
		super();
		this.send_seq = send_seq;
		this.send_machine = send_machine;
		this.send_day = send_day;
	}
	
	public SendDTO(String send_machine ) {
		
		
		this.send_machine = send_machine;
	
	}



	public int getSend_seq() {
		return send_seq;
	}



	public void setSend_seq(int send_seq) {
		this.send_seq = send_seq;
	}



	public String getSend_machine() {
		return send_machine;
	}



	public void setSend_machine(String send_machine) {
		this.send_machine = send_machine;
	}



	public String getSend_day() {
		return send_day;
	}



	public void setSend_day(String send_day) {
		this.send_day = send_day;
	} 
	

	
	
	
	
	
	
}
