package db;
import db.*;
import java.sql.*;
import java.util.*;
import java.lang.*;

public class Update {
	public boolean ChangeStudentInfo(Student student) {
		String sql="";
		int message=0;
		try {
			Connection conn = DBConn.getMySqlConnection();
			Statement stmt = conn.createStatement();
			sql = "update student set name="+student.getName()+", major="+student.getMajor()
			+", grade="+student.getGrade()+", phone="+student.getPhoneNumber()+" where stdno="+student.getId();
			message = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(message>0)
		{
			return true;
		}else {
			return false;
		}
	}
}
