package svc;
import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class LoginSvc {

	public MemberBean getMember(String id) {
		MemberBean member = null;
		Connection con = null;
		try {
			con = getConnection();
			MemberDAO memberDao = MemberDAO.getInstance();
			memberDao.setConnection(con);
			
			member = memberDao.selectMember(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		
		return member;
	}

}
