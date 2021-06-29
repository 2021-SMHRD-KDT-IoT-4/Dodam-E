package COM.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class RouteDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	RouteDTO dto = null;
	ArrayList<RouteDTO> list = null;
	ReceiveDTO dto1=null; 
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

	public int upload(String user, String child, String route,float Route_la,float Route_ha) {
		conn();

		String sql = "insert into route values(route_seq.nextval,?,?,?,?,?,sysdate)";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, user);
			psmt.setString(2,child);
			psmt.setString(3, route);
			psmt.setFloat(4, Route_la);
			psmt.setFloat(5,Route_ha);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();
		}

		return cnt;

	}

	public ArrayList<RouteDTO> showboard(String user) {

		list = new ArrayList<RouteDTO>();
		conn();

		String sql = "select * from route where users_id=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user);
			
			rs = psmt.executeQuery();

			while (rs.next()) {

				int route_seq = rs.getInt(1);
				String route_user=rs.getString(2);
				String route_child=rs.getString(3);
				String route = rs.getString(4);
				float route_la = rs.getFloat(5);
				float route_ha = rs.getFloat(6);
				String checktime = rs.getString(7);
				

				dto = new RouteDTO(route_seq,route_user,route_child, route, route_la,route_ha,checktime);
				list.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public ArrayList<RouteDTO> showOne(String name) {
		list = new ArrayList<RouteDTO>();
		conn();
		String sql = " select * from route where users_id =?";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, name);
			rs = psmt.executeQuery();

			while (rs.next()) {

				int route_seq = rs.getInt(1);
				String route_user = rs.getString(2);
				String route_child = rs.getString(3);
				String route = rs.getString(4);
				 float route_la = rs.getFloat(5);
				 float route_ha = rs.getFloat(6);
				String checktime = rs.getString(7);

				dto = new RouteDTO(route_seq, route_user, route_child, route,route_la ,route_ha, checktime);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public ArrayList<ReceiveDTO> loca() {
		ArrayList<ReceiveDTO> list = new ArrayList<ReceiveDTO>();
		conn();

		String sql = "select * from Receive_info";

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while(rs.next()) {

				int receive_seq = rs.getInt(1);
				int receive_num=rs.getInt(2);
				String receive_loca=rs.getString(3);
				 float receive_la= rs.getFloat(4);
				 float receive_ha= rs.getFloat(5);
			
				

					dto1 = new ReceiveDTO(receive_seq,receive_num,receive_loca, receive_la, receive_ha);
				list.add(dto1);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;

	}

}
