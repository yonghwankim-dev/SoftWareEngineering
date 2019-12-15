package db;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.ChangedCharSetException;

import java.sql.*;
import java.util.*;
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

	public void readStudentSearchInfo() {
		
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

	public boolean requestToSelect() {
		return false;
	}

	
	public void openLoginWindow() {

	}

	public void openStudentTabWindow() {

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
	
	public void openStudentInfoWindow() {

	}
}
