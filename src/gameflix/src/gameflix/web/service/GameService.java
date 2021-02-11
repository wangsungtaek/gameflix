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

	public ArrayList<Game> getGameList(int page) {
		ArrayList<Game> list = new ArrayList<Game>();
		
		int start = 1 + (page-1)*3; // 1 4 7 10
		int end = page * 3; // 3 6 9 12 15
		
		String sql = "SELECT * FROM GAME_VIEW WHERE num BETWEEN ? AND ?";
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int getCount() {
		String sql = "SELECT count(*) cnt FROM GAME";
		int cnt=0;
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	public static void main(String[] args) {
//		GameService service = new GameService();
//		
//		ArrayList<Game> list = (ArrayList<Game>) service.getNewGameList();
//		for(Game g : list) {
//			System.out.println(g.getG_name()+", "+g.getG_cnt()+", "+g.getG_date()+", "+g.getG_imgPath());
//		}
//		System.out.println(service.getCount());
	}
}
