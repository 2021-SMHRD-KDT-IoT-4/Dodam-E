package COM.Model;

public class ReceiveDTO {
      
	
	private int receive_seq;
	private int receive_num;
	private String receive_loca;
	
	public ReceiveDTO(int receive_seq, int receive_num, String receive_loca) {
		super();
		this.receive_seq = receive_seq;
		this.receive_num = receive_num;
		this.receive_loca = receive_loca;
	}
	
	public int getReceive_seq() {
		return receive_seq;
	}

	public void setReceive_seq(int receive_seq) {
		this.receive_seq = receive_seq;
	}

	public int getReceive_num() {
		return receive_num;
	}

	public void setReceive_num(int receive_num) {
		this.receive_num = receive_num;
	}

	public String getReceive_loca() {
		return receive_loca;
	}

	public void setReceive_loca(String receive_loca) {
		this.receive_loca = receive_loca;
	}
}