<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    	<%!
	/*****************************************************************************************/
	
	
	//����� ���� ����
	//�̸��� ��ȣ�� ���ϸ� ���εǸ� true, ������ �ȵǸ� false�� ��ȯ�Ѵ�.
	
	//�α��� ���ν� true, �ƴϸ� false
	private boolean authorizeStatus = false;
	
	//authorizeMembership(String trialUsername, String trialPassword)
	//����� �̸��� ��ȣ�� ���Ͽ� �α��� ���� ���θ� �����ϴ� �����ƾ
	//trialUsername : �α����� �õ��ϴ� ����� �̸�
	//trialPassword : �α����� �õ��ϴ� ����ڰ� �Է��� ��ȣ
	//�α��� �����ϸ� true�� ��ȯ�ϰ�, ���� �ź� �� false�� ��ȯ�Ѵ�.
	
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
		//�� ������ ��� ����
		//���ǿ� ��ϵ� ����� �̸� �� �Ϸθ� �о�ͼ� �α��� ��ȿ���� �����Ѵ�.
		String trialUsername = null;
		String trialPassword = null;
		String membershipUsername = null;
		String membershipPassword = null;
		Cookie objectUsername = null;
		Cookie objectPassword = null;
		String Username=null;
		String userIdentity=null;
		authorizeStatus = false;
	
		//POST ������� �Ѿ�� ������ �� trialUsername�̶�� �����Ͱ� �ִ��� Ȯ��
		if(request.getParameter("id")!=null)
		{
			trialUsername = request.getParameter("id");
			
			//trialUsername�� �����ϸ�, trialPassword��� �����͵� �ִ��� Ȯ��
			if(request.getParameter("passwd")!=null)
			{
				trialPassword = request.getParameter("passwd");
				
				//trialUsername�� trialPassword�� ��� ���ŵǸ�,
				//������ ������ authorizeMembership �����ƾ�� ȣ���Ͽ� �α��� ��û�Ѵ�.
				
				authorizeStatus = authorizeMembership(trialUsername, trialPassword);
				
			}
		}
	
	
		//�α��� ��û�� ���εǾ��ٸ�.
		if(authorizeStatus)
		{
			//membershipUsername�̶� �̸����� ���Ǻ����� ����� �̸��� ����Ѵ�.
			session.setAttribute("membershipUsername", trialUsername);
			//membershipPassword�̶� �̸����� ���Ǻ����� ����� ��ȣ�� ����Ѵ�.
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
			
			
			//������ ��ȿ�Ⱓ�� ���� �������κ��� 12�ð��̴�. 60��*60*12 ->12�ð�
			session.setMaxInactiveInterval(12*60*60); 
		}
		%>    
	
	
