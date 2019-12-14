package db;
import db.*;
import java.sql.*;
import java.io.IOException;
import java.lang.*;
import java.util.*;

public class Insert {
	public boolean registerStudent(Student student) {
		int message=0;
		try{
		    Connection Conn = DBConn.getMySqlConnection();
		    Statement stmt = Conn.createStatement();
		    String sql = "insert into student(name,major,personal_id,phone,grade,identity,birthdate,pwd)" +  
					"values('"+student.getName()+"','"+student.getMajor()+"','"+student.getPersonal_id()
					+"','"+student.getPhoneNumber()+"','"+student.getGrade()+"','"+student.getIdentify()+"','"+student.getBirthdate()+"','"+student.getPassword()+"')";
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

	public boolean registerManager(Manager manager) {
		int message=0;
		try{
		    Connection Conn = DBConn.getMySqlConnection();
		    Statement stmt = Conn.createStatement();
			String sql = "insert into manager(name,phone,id,pwd,identity)" +  
					"values('"+manager.getName()+"','"+manager.getPhoneNumber()+"','"+manager.getId()
					+"','"+manager.getPassword()+"','"+manager.getIdentify()+"')";
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
