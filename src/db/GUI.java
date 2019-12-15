package db;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.ChangedCharSetException;

import java.sql.*;
import java.util.*;
import java.io.UnsupportedEncodingException;
import java.lang.*;
import db.*;

public class GUI {
	Validate valid = new Validate();
	public String clickOnLoginButton(String id, String password,HttpSession session) {
		return valid.requestToLogin(id, password,session);
		
	}

	public boolean clickOnSelectButton() {
		return false;
	}

	public boolean clickOnDeleteButton(HttpServletRequest request) {
		Delete delete = new Delete();
		return delete.deleteStudent(request);
	}

	public boolean clickOnUpdateButton(HttpServletRequest request) {
		Student student = readStudentInfo(request);
		Update update = new Update();
		boolean result = update.ChangeStudentInfo(student);
		return result;
	}

	public boolean clickOnSignUpButton(HttpServletRequest request) {
		Insert insert = new Insert();
		String temp_identity = request.getParameter("identity");
		String identity = "";
		identity = readIdentify(temp_identity);
		
		String name = request.getParameter("name");
		String birthdate = request.getParameter("birthdate");
		String major = request.getParameter("major");
		String grade = request.getParameter("grade");
		String phone = request.getParameter("phone");
		String personal_id = request.getParameter("personal_id");
		String passwd = request.getParameter("passwd");
		
		
		String id = request.getParameter("id2");
		if(id==null || id.equals("") || id.equals("null"))
		{
			System.out.println("id is null");
		}
		if(identity.equals("S"))
		{
			Student student = new Student(name, id, birthdate, major, grade, personal_id, phone, "S", passwd);
			insert.registerStudent(student);
			return true;
		}else if(identity.equals("M")){
			Manager manager = new Manager(name, id, passwd, phone,"M");
			insert.registerManager(manager);
			return true;
		}else {
			return false;
		}
	}

	public boolean clickOnInsertButton(HttpServletRequest request) {
		Insert insert = new Insert();
		
		Student student = readStudentInfo(request);
		
		boolean result = insert.registerStudent(student);
		if(result==true)
		{
			return true;
		}else {
			return false;
		}
		
	}

	public boolean clickOnLogOutButton(HttpSession session, HttpServletResponse response) {
		
		return valid.requestToLogOut(session, response);
	}

	public void readStudentSearchInfo(HttpServletRequest request) {

	}

	public String readIdentify(String identity) {
		if(identity.equals("student"))
		{
			return "S";
		}else {
			return "M";
		}

	}

	public Student readStudentInfo(HttpServletRequest request) {
		String name = request.getParameter("name");
		String birthdate = request.getParameter("birthdate");
		String major = request.getParameter("major");
		String grade = request.getParameter("grade");
		String phone = request.getParameter("phone");
		String personal_id = request.getParameter("personal_id");
		String passwd = request.getParameter("passwd");
		String id = request.getParameter("id");
		Student student = new Student(name, id, birthdate, major, grade, personal_id, phone, "S", passwd);
		return student;

	}

	public ResultSet requestToSelect(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String name = request.getParameter("name");
		String stdno = request.getParameter("id");
		String birthdate_start = request.getParameter("birthdate_start");
		String birthdate_end = request.getParameter("birthdate_end");
		String major = request.getParameter("major");
		String grade = request.getParameter("grade");
		String personal_id = request.getParameter("personal_id");
		String phone = request.getParameter("phone");

		String where_name = "";
		String where_stdno = "";
		String where_birthdate_between = "";
		String where_major = "";
		String where_grade = "";
		String where_personal_id = "";
		String where_phone="";
		if(name.equals(""))
			where_name = "";
		else
			where_name = "name like '" + name +"%'";
		
		if(stdno.equals(""))
			where_stdno = "";
		else
			where_stdno = "stdno like '" + stdno + "%'";
		
		if((!birthdate_start.equals("")) && !(birthdate_end.equals("")))
		{
			where_birthdate_between = "birthdate between '" + birthdate_start + "' and '" + birthdate_end +"'";
		}else if((!birthdate_start.equals("")) && birthdate_end.equals("")){
			where_birthdate_between = "birthdate > '" + birthdate_start + "'";
		}else if((birthdate_start.equals("")) && !(birthdate_end.equals("")))
			where_birthdate_between = "birthdate < '" + birthdate_start + "'";
		else {
			where_birthdate_between = "";
		}
		
		if(major.equals(""))
			where_major = "";
		else
			where_major = "major like '" + major+"%'";
		
		if(grade.equals(""))
			where_grade = "";
		else
			where_grade = "grade=" + grade;
		
		if(personal_id.equals(""))
			where_personal_id = "";
		else
			where_personal_id = "personal_id like '" + personal_id + "%'";
		
		if(phone.equals(""))
			where_phone = "";
		else
			where_phone = "phone like '" + phone + "%'";
		
		String AND = " and ";
		
		String sql = "select * from student where " + where_name + AND + where_stdno + AND + where_birthdate_between +
				AND + where_major + AND + where_grade + AND + where_personal_id + AND + where_phone;
		System.out.println(sql);
		try {
			Connection conn = DBConn.getMySqlConnection();
			Statement stmt;
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}

	
	public void openLoginWindow() {

	}

	public Student openStudentTabWindow(HttpSession session) {
		Student student=null;
		String stdno = (String)session.getAttribute("membershipUsername");
		try {
			Connection conn = DBConn.getMySqlConnection();
			Statement stmt;
			stmt = conn.createStatement();
			String sql = "select * from student where stdno="+stdno;
			
			ResultSet rs = stmt.executeQuery(sql);


			while(rs.next())
			{
				student = new Student(
						rs.getString("name"),
						rs.getString("stdno"),
						rs.getString("birthdate"),
						rs.getString("major"),
						rs.getString("grade"),
						rs.getString("personal_id"),
						rs.getString("phone"),
						"S",
						rs.getString("pwd"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return student;
	}

	public ResultSet openManagerTabWindow() {
		Connection conn;
		Statement stmt;
		String sql="";
		ResultSet rs=null;
		try {
			conn = DBConn.getMySqlConnection();
			
			stmt = conn.createStatement();
			sql = "select * from student";
			stmt.executeQuery(sql);
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public void openUserSignupWindow() {

	}
	
	public void openStudentSearchWindow() {

	}
	
	public void openInsertStudentWindow() {

	}
	
	public Student openStudentInfoWindow(HttpServletRequest request) {
		Student student=null;
		String stdno = request.getParameter("id");
		try {
			Connection conn = DBConn.getMySqlConnection();
			Statement stmt;
			stmt = conn.createStatement();
			String sql = "select * from student where stdno="+stdno;
			
			ResultSet rs = stmt.executeQuery(sql);

			
			while(rs.next())
			{
				student = new Student(
						rs.getString("name"),
						rs.getString("stdno"),
						rs.getString("birthdate"),
						rs.getString("major"),
						rs.getString("grade"),
						rs.getString("personal_id"),
						rs.getString("phone"),
						"S",
						rs.getString("pwd"));
			}
			if(student==null)
			{
				student = new Student("","","","","","","","","");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return student;
	}
}
