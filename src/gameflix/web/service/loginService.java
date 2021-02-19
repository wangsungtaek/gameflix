package gameflix.web.service;

import java.sql.*;
import java.util.ArrayList;

import gameflix.web.entity.Member;

public class loginService {

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
	
	public void join(Member ins) {
		
		try {
			setCon();
			String sql="INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, ?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,ins.getM_id());
			pstmt.setString(2,ins.getM_pw());
			pstmt.setString(3,ins.getM_name());
			pstmt.setString(4,ins.getM_email());
			pstmt.setString(5,ins.getM_nickname());
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
	
	public ArrayList<Member> memList(){
		ArrayList<Member> mlist=new ArrayList<Member>();
		try {
			setCon();
			String sql="SELECT * FROM g_member";
			stmt= con.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {				
				mlist.add(new Member(rs.getInt(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6)));
			}
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
		return mlist;
	}
	
	/*
	public Member login(String id,String pass) {
		Member m=null;
		
		try {
			setCon();
			String sql="SELECT * FROM g_member WHERE m_id=? and m_pw=?";
			pstmt = con.prepareStatement(sql);	
			pstmt.setString(1,id);
			pstmt.setString(2,pass);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				m=new Member(rs.getInt(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		System.out.println(m);
		return m;
	}
	*/
	public Member login(Member login) {
        Member m=null;
        try {
           setCon();
           String sql="SELECT * FROM g_member WHERE m_id=? and m_pw=?";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, login.getM_id());
           pstmt.setString(2, login.getM_pw());
           rs = pstmt.executeQuery();
           if(rs.next()) {
              m = new Member(rs.getInt(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6));
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
        return m;
     }
    
    
	public Member idfind(String name,String email) {
		Member m=null;
		
		try {
			setCon();
			String sql="SELECT * FROM g_member WHERE m_name=? and m_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				m=new Member(rs.getInt(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		//System.out.println(m.getM_id());
		return m;
	}
	
	public Member passfind(String id,String name,String email) {
		Member m=null;
		
		try {
			setCon();
			String sql="SELECT * FROM g_member WHERE m_id=? and m_name=? and m_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,name);
			pstmt.setString(3,email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				m=new Member(rs.getInt(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 관련 에러");
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 에러");
			System.out.println(e.getMessage());
		}
		//System.out.println(m.getM_id());
		return m;
	}
	
	public void updatePass(String id, String pass) {
		try {
			setCon();
			// 2. 대화
			con.setAutoCommit(false);
			String sql="UPDATE g_member SET m_pw=? WHERE m_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db 처리 에러");
			try {
				con.rollback();
				System.out.println("에러 발생으로 원복 처리");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("rollback에 문제발생");
			}
		} catch (Exception e) {
			System.out.println("일반 에러");
		}
	}
	
	public void createMemberSeq() {	
		try {
			setCon();
			String sql="CREATE SEQUENCE g_member_no_seq";
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
	
	
	public void createMemberTable() {	
		try {
			setCon();
			String sql="CREATE TABLE G_MEMBER (\n"
					+ "	m_no NUMBER CONSTRAINT g_member_pk PRIMARY KEY,\n"
					+ "	m_id VARCHAR2(30) CONSTRAINT g_member_id_nn NOT NULL,\n"
					+ "	m_pw VARCHAR2(30) CONSTRAINT g_member_pw_nn NOT NULL,\n"
					+ "	m_name VARCHAR2(30) CONSTRAINT g_member_name_nn NOT NULL,\n"
					+ "	m_email VARCHAR2(50) CONSTRAINT g_member_email_nn NOT NULL,\n"
					+ "	m_nickname VARCHAR2(30) CONSTRAINT g_member_nickname NOT NULL\n"
					+ ")";
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
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		loginService dao=new loginService();
		//Member ins=new Member(0,"gggg","ff66","원길동","fff@naver.com", "6번이");
		//dao.join(ins);
		//dao.login("bbbb", "22bb");
		//dao.login("dddd", "44dd");
		//dao.idfind("이길동", "ccc@naver.com");
		//dao.updatePass("himan", "1234");
	}

}
