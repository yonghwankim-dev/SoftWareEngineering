package db;
import db.*;
import java.sql.*;
import java.io.IOException;
import java.lang.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Validate {
	private boolean authorizeStatus = false;
	
	public String requestToLogin(String id, String password,HttpSession session) {
		
		//POST 방식으로 넘어온 데이터 중 trialUsername이라는 데이터가 있는지 확인
				if(id!=null)
				{
					//trialUsername이 존재하면, trialPassword라는 데이터도 있는지 확인
					if(password!=null)
					{
						//trialUsername과 trialPassword가 모두 수신되면,
						//위에서 선언한 authorizeMembership 서브루틴을 호출하여 로그인 요청한다.

						authorizeStatus = authorizeMembership(id, password);
						
					}
				}
				
				if(authorizeStatus==true)
				{
					return checkUserIdentify(id);
				}
		return null;
	}

	public boolean requestToLogOut(HttpSession session, HttpServletResponse response) {
		session.invalidate();
		try {
			response.sendRedirect("login.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	
	public static String checkUserIdentify(String id) {
		try{
			String sql = "select stdno, identity from student";
			Connection Conn = DBConn.getMySqlConnection();
			Statement stmt = Conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				if(rs.getString(1).equals(id))
				{
					return "S";
				}
			}
			
			sql = "select id, identity from manager";
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				if(rs.getString(1).equals(id))
				{
					return "M";
				}
			}
		}catch(SQLException e)
		{
			System.out.println(e);
		}catch(Exception el)
		{
			System.out.println(el);
		}
		return null;
	}
	
	public String encrypt(User user) {
		String password = "HEX(AES_ENCRYPT('"+user.getPassword()+"',"+user.getId()+"))";
		
		return password;
	}
	
/*****************************************************************************************/
	
	
	//사용자 인증 로직
	//이름과 암호를 비교하며 승인되면 true, 승인이 안되면 false를 반환한다.
	
	//로그인 승인시 true, 아니면 false

	
	//authorizeMembership(String trialUsername, String trialPassword)
	//사용자 이름과 암호를 비교하여 로그인 승인 여부를 결정하는 서브루틴
	//trialUsername : 로그인을 시도하는 사용자 이름
	//trialPassword : 로그인을 시도하는 사용자가 입력한 암호
	//로그인 승인하면 true를 반환하고, 승인 거부 시 false를 반환한다.
	
	private static boolean authorizeMembership(String trialUsername, String trialPassword)
	{	
		
		try{
			
			Connection Conn = DBConn.getMySqlConnection();
			Statement stmt = Conn.createStatement();
			ResultSet rs = null;
			
			String ident = checkUserIdentify(trialUsername);

			if(ident==null)
			{
				return false;
			}
			else if(ident.equals("S"))
			{
				
				
				String sql = "select *, aes_decrypt(unhex(pwd),'"+trialUsername+"') from student";
				rs = stmt.executeQuery(sql);
				
				while(rs.next())
				{
					if(rs.getString(1).equals(trialUsername) && rs.getString(10).equals(trialPassword))
					{
						return true;		
					}
				}
			}else if(ident.equals("M"))
			{
				String sql = "select *, aes_decrypt(unhex(pwd),'"+trialUsername+"') from manager";
				rs = stmt.executeQuery(sql);
				
				while(rs.next())
				{
					
					if(rs.getString(3).equals(trialUsername) && rs.getString(6).equals(trialPassword))
					{
						
						return true;		
					}
				}
			}
				rs.close();
				
		}catch(SQLException e)
		{
			System.out.println(e);
		}catch(Exception el)
		{
			System.out.println(el);
		}
		return false;	
	}
}
