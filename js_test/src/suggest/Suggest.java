package suggest;

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
		sql.append(" select count(sqlquery) cnt ");
		sql.append(" FROM suggest ");
		sql.append(" WHERE sqlquery LIKE '" + keyword + "%' ");
		sql.append(" ORDER BY sqlquery ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
			sql.delete(1, sql.toString().length());
			
			sql.append(" select sqlquery ");
			sql.append(" FROM suggest ");
			sql.append(" WHERE sqlquery LIKE '" + keyword + "%' ");
			sql.append(" ORDER BY sqlquery ");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			out.print(cnt + "|");
			
			while (rs.next()) {
				cnt--;
				String key = rs.getString("sqlquery");
				out.print(key);
				
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
