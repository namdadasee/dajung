package dao;
import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.MemberBean;

public class MemberDAO {
	Connection con;
	private static MemberDAO memberDao;

	public static MemberDAO getInstance() {
		if(memberDao == null)
			memberDao = new MemberDAO();
		return memberDao;
	}

	public void setConnection(Connection con) {
		// TODO Auto-generated method stub
		this.con=con;
		
	}

	public int insertMember(MemberBean member) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into member values(?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getAge());
			pstmt.setString(5,member.getGender());
			insertCount = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			close(pstmt);
		}
		return insertCount;
	}

	public MemberBean selectMember(String id) {
		MemberBean member = null;
		
		PreparedStatement pstmt = null;
		ResultSet  rs = null;
		String sql = "select * from member where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberBean();
				member.setId(id);
				member.setPass(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setAge(rs.getInt("age"));
				member.setGender(rs.getString("gender"));
				member.setEmail(rs.getString("email"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return member;
	}

	public int selectListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from member";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) listCount = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return(listCount);
		
	}

	

	public ArrayList<MemberBean> selectMemberList(int page,int limit) {
		ArrayList<MemberBean> memberList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int startrow = (page - 1)*limit +1;
		int endrow = startrow + limit -1;
		
		String sql = "select * from (select rownum rnum,a.* from (select * from member) a) where rnum between ? and ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberList = new ArrayList<MemberBean>();
				do {
					MemberBean member = new MemberBean();
					member.setId(rs.getString("id"));
					member.setPass(rs.getString("password"));
					member.setName(rs.getString("name"));
					member.setAge(rs.getInt("age"));
					member.setGender(rs.getString("gender"));
					member.setEmail(rs.getString("email"));
					memberList.add(member);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return memberList;
	}

}
