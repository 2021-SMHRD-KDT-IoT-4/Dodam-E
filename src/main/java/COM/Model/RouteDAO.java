package COM.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RouteDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	RouteDTO dto = null;

	public void conn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";

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

	public int upload(String route) {
		conn();

		String sql = "insert into route values(route_seq.nextval,?,sysdate)";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1,route);
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();
		}

		return cnt;

	}

	public ArrayList<RouteDTO> showboard() {
		
		ArrayList<RouteDTO> list = new ArrayList<RouteDTO>();
		conn();

		String sql = "select * from route order by day desc";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {

				int route_seq = rs.getInt(1);
				String route = rs.getString(2);
				String checktime = rs.getString(3);
				

				dto = new RouteDTO(route_seq, route, checktime);
				list.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public RouteDTO showOne( int route_num) {
		conn();
		String sql= " select * from route where route_seq =?";
		
		try {
			psmt=conn.prepareStatement(sql);
			
			psmt.setInt(1,route_num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				int route_seq = rs.getInt(1);
				String route = rs.getString(2);
				String checktime = rs.getString(3);
		
				
					
				dto= new RouteDTO(route_seq, route, checktime);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}
		
	
	
	
	public ArrayList<ReceiveDTO> loca() {
		ArrayList<ReceiveDTO> list = new ArrayList<ReceiveDTO>();
		conn();
		
		
		String sql = "select * from Receive_info  ";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {

				int receive_seq = rs.getInt(1);
				int receive_num = rs.getInt(2);
				String receive_loca = rs.getString(3);
							

				ReceiveDTO dto = new ReceiveDTO(receive_seq, receive_num, receive_loca);
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


