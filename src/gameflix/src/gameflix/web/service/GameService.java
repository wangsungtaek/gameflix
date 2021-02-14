package gameflix.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import gameflix.web.entity.Game;

public class GameService {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "scott";
	private String pw = "tiger";
	
	private Connection conn;
	private PreparedStatement prst;
	private ResultSet rs;

	// DB연결
	private void setCon() {
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("접속성공");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 게임 테이블 생성
	public void createTable(String name) {
		String sql = "";
		if(name.equals("G_GAME")) {
			sql = "CREATE TABLE G_GAME (\n"
					+ "	g_name VARCHAR2(30) PRIMARY KEY,\n"
					+ "	g_date DATE NOT NULL,\n"
					+ "	g_cnt NUMBER NOT NULL,\n"
					+ "	g_imgPath VARCHAR2(100) NOT NULL,\n"
					+ "	g_link VARCHAR2(100) NOT NULL\n"
					+ ")";
		} else if(name.equals("G_BADGE")) {
			sql = "CREATE TABLE G_BADGE (\n"
					+ "	b_grade NUMBER PRIMARY KEY,\n"
					+ "	g_name VARCHAR2(30) REFERENCES G_GAME(g_name),\n"
					+ "	b_score NUMBER NOT NULL,\n"
					+ "	b_path VARCHAR2(100) NOT NULL\n"
					+ ")";
		} else if(name.equals("G_PLAYLOG")) {
			sql = "CREATE TABLE G_PLAYLOG (\n"
					+ "	play_no NUMBER PRIMARY KEY,\n"
					+ "	m_no NUMBER REFERENCES G_MEMBER(m_no),\n"
					+ "	g_name VARCHAR2(30) REFERENCES G_GAME(g_name),\n"
					+ "	p_score NUMBER NOT NULL\n"
					+ ")";
		}
		System.out.println(sql);
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.execute();

			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 게임 뷰 생성
	public void createView(String name) {
		String	sql = "";
		if(name.equals("NEWGAME")) {
			sql = "CREATE VIEW NEWGAME\n"
					+ "AS\n"
					+ "SELECT * FROM ( \n"
					+ "	SELECT ROWNUM num, s.* FROM (\n"
					+ "		SELECT * FROM G_GAME ORDER BY G_DATE DESC\n"
					+ "		) s\n"
					+ ")";
		} else if(name.equals("HOTGAME")) {
			sql = "CREATE VIEW HOTGAME\n"
					+ "AS\n"
					+ "SELECT * FROM (\n"
					+ "	SELECT ROWNUM num, s.* FROM (\n"
					+ "		SELECT * FROM G_GAME ORDER BY g_cnt DESC\n"
					+ "	) s\n"
					+ ")";
		}
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.execute();

			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 게임 추가
	public void insertGame(Game game) {
		
		String sql = "INSERT INTO G_GAME VALUES(?,SYSDATE,0,?,?)";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setString(1, game.getG_name());
			prst.setString(2, game.getG_imgPath());
			prst.setString(3, game.getG_link());
			prst.execute();

			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 전체 게임 읽기
	public ArrayList<Game> getGameList() {
		ArrayList<Game> list = new ArrayList<Game>();
		
		String sql = "SELECT * FROM G_GAME ORDER BY g_date DESC";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				
				String g_name = rs.getString("G_NAME");
				Date g_date = rs.getDate("G_DATE");
				int g_cnt = rs.getInt("G_CNT");
				String g_imgPath = rs.getString("G_IMGPATH");
				String g_link = rs.getString("G_LINK");
				Game game = new Game(g_name, g_date, g_cnt, g_imgPath, g_link);
				list.add(game);
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 페이지별 게임 읽기
	public ArrayList<Game> getGameList(int page, int cnt) {
		ArrayList<Game> list = new ArrayList<Game>();
		
		int start = 1 + (page-1)*cnt; // 1 4 7 10
		int end = page * cnt; // 3 6 9 12 15
		
		String sql = "SELECT * FROM NEWGAME WHERE num BETWEEN ? AND ?";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, start);
			prst.setInt(2, end);
			rs = prst.executeQuery();
			while(rs.next()) {
				
				String g_name = rs.getString("G_NAME");
				Date g_date = rs.getDate("G_DATE");
				int g_cnt = rs.getInt("G_CNT");
				String g_imgPath = rs.getString("G_IMGPATH");
				String g_link = rs.getString("G_LINK");
				Game game = new Game(g_name, g_date, g_cnt, g_imgPath, g_link);
				list.add(game);
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 인기게임 3개
	public ArrayList<Game> getHotGameList() {
		ArrayList<Game> list = new ArrayList<Game>();
		String sql = "SELECT * FROM HOTGAME WHERE NUM IN(1,2,3)";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				
				String g_name = rs.getString("G_NAME");
				Date g_date = rs.getDate("G_DATE");
				int g_cnt = rs.getInt("G_CNT");
				String g_imgPath = rs.getString("G_IMGPATH");
				String g_link = rs.getString("G_LINK");
				Game game = new Game(g_name, g_date, g_cnt, g_imgPath, g_link);
				list.add(game);
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 신규게임 3개
	public ArrayList<Game> getNewGameList() {
		ArrayList<Game> list = new ArrayList<Game>();
		String sql = "SELECT * FROM NEWGAME WHERE NUM IN(1,2,3)";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				
				String g_name = rs.getString("G_NAME");
				Date g_date = rs.getDate("G_DATE");
				int g_cnt = rs.getInt("G_CNT");
				String g_imgPath = rs.getString("G_IMGPATH");
				String g_link = rs.getString("G_LINK");
				Game game = new Game(g_name, g_date, g_cnt, g_imgPath, g_link);
				list.add(game);
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 등록된 게임 갯수
	public int getCount() {
		String sql = "SELECT count(*) cnt FROM G_GAME";
		int cnt=0;
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 게임삭제
	public void deleteGame(String name) {
		String[] sql = {
			"DELETE FROM G_BADGE WHERE g_name = ?",
			"DELETE FROM G_PLAYLOG WHERE g_name =  ?",
			"DELETE FROM G_GAME WHERE g_name = ?"
		};
		try {
			setCon();
			for(int i=0; i<sql.length; i++) {
				prst = conn.prepareStatement(sql[i]);
				prst.setString(1, name);
				prst.execute();
			}
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		GameService service = new GameService();
		service.createTable("G_GAME");
		service.createTable("G_BADGE");
		service.createTable("G_PLAYLOG");
	}
}
