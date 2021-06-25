package COM.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SendDAO {
	
	ArrayList<SendDTO> s_list = null;
	SendDTO s_info = null;
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	int result=0;
	ResultSet rs = null;
	
	
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
	
	
	
	public ArrayList<SendDTO> All_Send_info() {

		s_list = new ArrayList<SendDTO>();
		conn();

		try {
			String sql = "select * from send";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String send_seq = rs.getString(1);
				String send_machine = rs.getString(2);
				String send_day = rs.getString(3);
				
				s_info = new SendDTO(cnt, send_machine, send_day);
				s_list.add(s_info);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return s_list;
	}
	
}
