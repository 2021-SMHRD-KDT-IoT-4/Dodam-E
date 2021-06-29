package COM.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReceiveDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	int result=0;
	ResultSet rs = null;
	ArrayList<ReceiveDTO> list=null;
	ReceiveDTO	dto=null;
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
	
	
	public ArrayList<ReceiveDTO> receive_all() {
		conn();
		
		list=new ArrayList<ReceiveDTO>();

		String sql = "select * from receive_info ";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while(rs.next()) {

				int receive_seq = rs.getInt(1);
				int receive_num=rs.getInt(2);
				String receive_loca=rs.getString(3);
				 float receive_la= rs.getFloat(4);
				 float receive_ha= rs.getFloat(5);
			
				

					dto = new ReceiveDTO(receive_seq,receive_num,receive_loca, receive_la, receive_ha);
				list.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

}
