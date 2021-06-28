package COM.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReplyDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	ReplyDTO dto = null;
	
	
	public void conn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@192.168.0.77:1521:xe";
			String db_id = "secondProject";
			String db_pw = "1234";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	
	public void close() {

		try {
			if (rs != null) {
				rs.close();
			}

			if (psmt != null) {

				psmt.close();
			}

			if (conn != null) {

				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	
	public int reply_upload(ReplyDTO dto, String u_id, int n_seq) {
		conn();

		String sql = "insert into reply values (reply_seq.nextval, ?, ?, ?, sysdate)";
		

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, u_id);
			psmt.setInt(2, n_seq);
			psmt.setString(3, dto.getReply_content());

			
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;

	}
	
/*	
	public ReplyDTO showReplyOne(int notice_seq) {
		conn();
		String sql = "select * from reply where notice_seq = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, notice_seq);
			rs = psmt.executeQuery();

			if (rs.next()) {
				int num = rs.getInt(1);
				String users_id = rs.getString(2);
				int n_seq = rs.getInt(3);
				String reply_content = rs.getString(4);
				String reply_day = rs.getString(5);
				dto = new ReplyDTO(num, users_id, n_seq, reply_content, reply_day);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;

	}
	
*/
	
	public ArrayList<ReplyDTO> showReply(int notice_seq) {

		ArrayList<ReplyDTO> R_list = new ArrayList<ReplyDTO>();

		conn();

		String sql =  "select * from reply where notice_seq = ? order by reply_day asc";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, notice_seq);
			rs = psmt.executeQuery();
			
			
			while (rs.next()) {
				int num = rs.getInt(1);
				String users_id = rs.getString(2);
				int n_seq = rs.getInt(3);
				String reply_content = rs.getString(4);
				String reply_day = rs.getString(5);
				dto = new ReplyDTO(num, users_id, n_seq, reply_content, reply_day);
				R_list.add(dto);
			}
		

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return R_list;
	}
	
	
	public int DeleteOneReply(String num) {
		
		conn();
		
		String sql = "delete from Reply where reply_seq = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, num);
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	
}
