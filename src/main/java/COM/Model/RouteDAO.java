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

	public int upload(UserDTO user, childDTO child, String route) {
		conn();

		String sql = "insert into route values(route_seq.nextval,?,?,?,sysdate)";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, user.getId());
			psmt.setString(2, child.getC_name());
			psmt.setString(3, route);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close();
		}

		return cnt;

	}

	public ArrayList<RouteDTO> showboard() {

		list = new ArrayList<RouteDTO>();
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

	public ArrayList<RouteDTO> showOne(childDTO name) {
		list = new ArrayList<RouteDTO>();
		conn();
		String sql = " select * from route where route_child =?";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, name.getC_name());
			rs = psmt.executeQuery();

			while (rs.next()) {

				int route_seq = rs.getInt(1);
				String route = rs.getString(2);
				String route_user = rs.getString(3);
				String route_child = rs.getString(4);
				String checktime = rs.getString(5);

				dto = new RouteDTO(route_seq, route_user, route_child, route, checktime);
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
