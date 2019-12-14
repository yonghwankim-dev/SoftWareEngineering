package db;

import javax.servlet.http.HttpServletRequest;
import db.*;
import java.lang.*;
import java.util.*;
import java.sql.*;

public class Delete {
	public boolean deleteStudent(HttpServletRequest request) 
	{
		String[] values = request.getParameterValues("delete_check");
		
		String values_list = "";
		String sql;
		
		for(int i=0;i<values.length;i++)
		{
			if(i+1==values.length)
			{
				values_list += values[i];
			}else{
				values_list += values[i] + ",";
			}
		}
		
		sql = "delete from student where stdno in("+values_list+")";
		int message=0;
		try{
		    Connection Conn = DBConn.getMySqlConnection();
		    Statement stmt = Conn.createStatement();
		    
		    message = stmt.executeUpdate(sql);
			
		    stmt.close();
		    Conn.close();
		   
		}catch(SQLException e)
		{
			System.out.println(e);
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
		if(message>0)
		{
			return true;
		}else {
			return false;	
		}
		
		
	}
}
