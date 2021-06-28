package COM.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NoticeWriteDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	int result=0;
	ResultSet rs = null;
	NoticeDTO dto = null;
	

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

	public int upload(NoticeDTO dto, String id) {
		conn();

		String sql = "insert into notice values (notice_seq.nextval, ?, ?, ?, sysdate)";
		

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getNotice_title());
			psmt.setString(2, id);
			psmt.setString(3, dto.getNotice_content());

			
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;

	}

	public ArrayList<NoticeDTO> showBoard() {

		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();

		conn();

		String sql = "select * from notice order by notice_day desc";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
		
			
			while (rs.next()) {
				int num = rs.getInt(1);
				String title = rs.getString(2);
				String id = rs.getString(3);
				String content = rs.getString(4);
				String day = rs.getString(5);
				dto = new NoticeDTO(num, title, id, content, day);
				list.add(dto);
			}
		

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	

	public NoticeDTO showOne(int notice_seq) {
		conn();
		String sql = "select * from notice where notice_seq = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, notice_seq);
			rs = psmt.executeQuery();

			if (rs.next()) {
				int num = rs.getInt(1);
				String title = rs.getString(2);
				String writer = rs.getString(3);
				String content = rs.getString(4);
				String day = rs.getString(5);
				dto = new NoticeDTO(num, title, writer, content, day);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;

	}
/*	
	public int deleteOne(NoticeDTO dto) {
		conn();
		
		String sql = "delete from notice where users_id = ?and notice_seq=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getNotice_id());
			psmt.setInt(2, dto.getNotice_seq());
			
			cnt = psmt.executeUpdate();
			
			
			if(cnt > 0) {
				sql = "delete from reply where notice_seq = ?";
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, dto.getNotice_seq());
				
				result = psmt.executeUpdate();
			}
			
			System.out.println(result);
			
			if(cnt !=0) {
				System.out.println("시앤티작동중");
			}else {
				System.out.println("시앤티 인식을 못함");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	

	}
	
*/	
	
	
	public int deleteOne(NoticeDTO dto) {
		conn();
		
		String sql = "delete from reply where notice_seq = ?";
		
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getNotice_seq());
			
			result = psmt.executeUpdate();
			
			
			if(result > 0 || result == 0) {
				sql = "delete from notice where users_id = ?and notice_seq=?";
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, dto.getNotice_id());
				psmt.setInt(2, dto.getNotice_seq());
				
				cnt = psmt.executeUpdate();
				
			}
			
			System.out.println(result);
			
			if(cnt !=0) {
				System.out.println("시앤티작동중");
			}else {
				System.out.println("시앤티 인식을 못함");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	

	}
	
	
}
