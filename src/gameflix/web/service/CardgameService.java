package gameflix.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import gameflix.web.entity.Member;

public class CardgameService {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setCon() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String info="jdbc:oracle:thin:@localhost:1521:xe";
		con=DriverManager.getConnection(info,"scott","tiger");
		System.out.println("접속 성공!");
	}
	
	public void createPlaySeq() {	
		try {
			setCon();
			String sql="CREATE SEQUENCE g_playlog_no_seq\r\n"
					+ "	INCREMENT BY 1\r\n"
					+ "	START WITH 1\r\n"
					+ "	MINVALUE 1\r\n"
					+ "	MAXVALUE 10000\r\n"
					+ "	nocache";
			stmt= con.createStatement();
			rs=stmt.executeQuery(sql);
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
	
	public void CardPlayLog(int m_no,String g_name, int count) {
		
		try {
			setCon();
			String sql="INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,m_no);
			pstmt.setString(2, g_name);
			pstmt.setInt(3,count);
			pstmt.executeUpdate();
			con.commit(); 
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db 처리 에러");
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 에러");
		}
	}

	public void createCardBadge() {	
		try {
			setCon();
			String sql="CREATE SEQUENCE g_badge_no_seq\r\n"
					+ "	INCREMENT BY 1\r\n"
					+ "	START WITH 1\r\n"
					+ "	MINVALUE 1\r\n"
					+ "	MAXVALUE 6\r\n"
					+ "	nocache";
			stmt= con.createStatement();
			rs=stmt.executeQuery(sql);
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

	public void CardBadge(String g_name) {
		
		String[] sql= {
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',0,1500,'img/badge/grade-6.png')",
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',1501,3000,'img/badge/grade-5.png')",
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',3001,3500,'img/badge/grade-4.png')",
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',3501,4000,'img/badge/grade-3.png')",
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',4001,4500,'img/badge/grade-2.png')",
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',4501,10000,'img/badge/grade-1.png')"
		};
		
		try {
			setCon();
			for(int idx=0;idx<sql.length;idx++) {
				pstmt=con.prepareStatement(sql[idx]);
				pstmt.executeUpdate();
			}
			con.commit(); 
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db 처리 에러");
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 에러");
		}
	}
	
	public String selectbadge(int m_no) {
        String badge="";
        try {
           setCon();
           String sql="SELECT DISTINCT b.b_path\r\n"
           		+ "FROM G_PLAYLOG p, G_BADGE b\r\n"
           		+ "WHERE (SELECT max(p_score) FROM G_PLAYLOG WHERE g_name='카드게임' and m_no=?)\r\n"
           		+ "BETWEEN b.b_score_low AND b.b_score_high";
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1,m_no);
           rs = pstmt.executeQuery();
           if(rs.next()) {
        	   badge=rs.getString(1);
			}
           rs.close();
           pstmt.close();
           con.close();
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           System.out.println("DB에러"+e.getMessage());
        }catch (Exception e) {
           // TODO Auto-generated catch block
           System.out.println("일반에러"+e.getMessage());
        }
        return badge;
	}

	public String selectGname(String link) {
        String g_name="";
        try {
           setCon();
           String sql="SELECT g_name from G_GAME where g_link=?";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1,link);
           rs = pstmt.executeQuery();
           if(rs.next()) {
        	   g_name=rs.getString(1);
			}
           rs.close();
           pstmt.close();
           con.close();
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           System.out.println("DB에러"+e.getMessage());
        }catch (Exception e) {
           // TODO Auto-generated catch block
           System.out.println("일반에러"+e.getMessage());
        }
        return g_name;
	}

    
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CardgameService dao=new CardgameService();
		//String a=dao.selectbadge();
	}

}
