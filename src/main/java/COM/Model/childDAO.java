package COM.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;


public class childDAO {
	childDTO info = null;
	ArrayList<childDTO> c_list = null;
	ArrayList<childDTO> c_one_list = null;
	childDTO c_dto = null;
	
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
	
	public ArrayList<childDTO> All_Child_info() {

		c_list = new ArrayList<childDTO>();
		conn();

		try {
			String sql = "select * from child";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String c_name = rs.getString(1);
				String c_age = rs.getString(2);
				String c_gender = rs.getString(3);
				String c_school = rs.getString(4);
				info = new childDTO(c_name, c_age, c_gender,c_school);
				c_list.add(info);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return c_list;
	}
	
	
	
	public int child_insert(childDTO dto, SendDTO sdto) {
		
		conn();
		
		String sql = "insert into child values(?, ?, ?, ?, ?, ?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getC_id());
			psmt.setString(2, dto.getC_name());
			psmt.setString(3, dto.getC_age());
			psmt.setString(4, dto.getC_gender());
			psmt.setString(5, dto.getC_school());
			psmt.setString(6, dto.getC_send_machine());

			cnt = psmt.executeUpdate();
			System.out.println(cnt);
			
			if(cnt>0) {
				sql = "insert into send values (send_seq.nextval, ?, sysdate)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, sdto.getSend_machine());
				
				result=psmt.executeUpdate();
				
			}
			System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
			
		}
		
		return cnt;
		
		
	}
	


	public ArrayList<childDTO> Child_one_info(UserDTO dto) {

		c_one_list = new ArrayList<childDTO>();
		
		conn();

		try {
			String sql = "select * from child where users_id = ?";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());

			rs = psmt.executeQuery();

			while (rs.next()) {
				String user_id = rs.getString(1);
				String c_name = rs.getString(2);
				String c_age = rs.getString(3);
				String c_gender = rs.getString(4);
				String c_school = rs.getString(5);
				String c_send_machine = rs.getString(6);
				
				
				c_dto = new childDTO(user_id, c_name, c_age, c_gender, c_school, c_send_machine);
				
				c_one_list.add(c_dto);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return c_one_list;
	}
	
	
	

}
