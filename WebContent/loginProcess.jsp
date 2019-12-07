<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    	<%!
	/*****************************************************************************************/
	
	
	//사용자 인증 로직
	//이름과 암호를 비교하며 승인되면 true, 승인이 안되면 false를 반환한다.
	
	//로그인 승인시 true, 아니면 false
	private boolean authorizeStatus = false;
	
	//authorizeMembership(String trialUsername, String trialPassword)
	//사용자 이름과 암호를 비교하여 로그인 승인 여부를 결정하는 서브루틴
	//trialUsername : 로그인을 시도하는 사용자 이름
	//trialPassword : 로그인을 시도하는 사용자가 입력한 암호
	//로그인 승인하면 true를 반환하고, 승인 거부 시 false를 반환한다.
	
	private static boolean authorizeMembership(String trialUsername, String trialPassword)
	{	
		try{
			String sql = "select * from student";
			Connection Conn = DBConn.getMySqlConnection();
			Statement stmt = Conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			
			while(rs.next())
			{
				if(rs.getString(1).equals(trialUsername) && rs.getString(9).equals(trialPassword))
				{
					
					return true;		
				}
			}
			
			sql = "select * from manager";
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				if(rs.getString(3).equals(trialUsername) && rs.getString(4).equals(trialPassword))
				{
					return true;		
				}
			}
			
		
			
		}catch(SQLException e)
		{
			System.out.println(e);
		}catch(Exception el)
		{
			System.out.println(el);
		}
		return false;	
	}
%>
		<%
		/***********************************************************************************************/
		//웹 페이지 헤더 영역
		//세션에 기록된 사용자 이름 및 암로를 읽어와서 로그인 유효성을 검증한다.
		String trialUsername = null;
		String trialPassword = null;
		String membershipUsername = null;
		String membershipPassword = null;
		Cookie objectUsername = null;
		Cookie objectPassword = null;
		String Username=null;
		String userIdentity=null;
		authorizeStatus = false;
	
		//POST 방식으로 넘어온 데이터 중 trialUsername이라는 데이터가 있는지 확인
		if(request.getParameter("id")!=null)
		{
			trialUsername = request.getParameter("id");
			
			//trialUsername이 존재하면, trialPassword라는 데이터도 있는지 확인
			if(request.getParameter("passwd")!=null)
			{
				trialPassword = request.getParameter("passwd");
				
				//trialUsername과 trialPassword가 모두 수신되면,
				//위에서 선언한 authorizeMembership 서브루틴을 호출하여 로그인 요청한다.
				
				authorizeStatus = authorizeMembership(trialUsername, trialPassword);
				
			}
		}
	
	
		//로그인 요청이 승인되었다면.
		if(authorizeStatus)
		{
			//membershipUsername이라 이름붙인 세션변수에 사용자 이름을 기록한다.
			session.setAttribute("membershipUsername", trialUsername);
			//membershipPassword이라 이름붙인 세션변수에 사용자 암호를 기록한다.
			session.setAttribute("membershipPassword", trialPassword);
			
			try{
				String sql = "select * from student";
				Connection Conn = DBConn.getMySqlConnection();
				Statement stmt = Conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				boolean flag = false;
				while(rs.next() && flag==false)
				{
					if(rs.getString(1).equals(session.getAttribute("membershipUsername")))
					{
						Username = rs.getString(2);
						userIdentity = "S";
						flag = true;
						
					}
				}
				
				sql = "select * from manager";
				rs = stmt.executeQuery(sql);
				
				while(rs.next() && flag==false)
				{
					if(rs.getString(3).equals(trialUsername) && rs.getString(4).equals(trialPassword))
					{
						Username = rs.getString(1);
						userIdentity = "M";
						flag = true;
					}
				}
				
				if(userIdentity.equals("S"))
				{
					
					%>
					
					<script>
					location.href="./student_logout.jsp";
					</script>
					 
					<%
				}else if(userIdentity.equals("M")){
					
					%>
					 
						<script>
						location.href="./manager_logout.jsp";
						</script>
						
					<%
				}
			}catch(SQLException e)
			{
				System.out.println(e);
			}catch(Exception el)
			{
				System.out.println(el);
			}
			
			
			//세션의 유효기간은 현재 시점으로부터 12시간이다. 60초*60*12 ->12시간
			session.setMaxInactiveInterval(12*60*60); 
		}
		%>    
	
	
