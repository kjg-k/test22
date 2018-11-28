package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBClose;
import db.DBOpen;

public class Suggest extends HttpServlet {
static final long serialVersionUID = 1L;
	
	public Suggest() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("utf-8");
		
		PrintWriter out = resp.getWriter();
		
		String keyword = req.getParameter("keyword");
		System.out.println("servlet keyword : " + keyword);
		
		int cnt = 0;
		
		if (keyword == null) {
			keyword = "";
		}
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(id) as cnt ");
		sql.append(" FROM member ");
		sql.append(" WHERE id LIKE '" + keyword + "%' ");
		sql.append(" ORDER BY id ");		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
			sql.delete(1, sql.toString().length());
			
			sql.append(" SELECT id, mname, tel, email ");
			sql.append(" FROM member ");
			sql.append(" WHERE id LIKE '" + keyword + "%' ");
			sql.append(" ORDER BY id ");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			out.print(cnt + "|");
			
			while (rs.next()) {
				cnt--;
				String id = rs.getString("id");
				String mname = rs.getString("mname");
				String tel = rs.getString("tel");
				String email = rs.getString("email");
				
				out.print(id);
				out.print("/");
				out.print(mname);
				out.print("/");
				out.print(tel);
				out.print("/");
				out.print(email);
				
				if (cnt > 0) {
					out.print(",");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
}
