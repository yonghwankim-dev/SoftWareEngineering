package db;

public class Student extends User {
	private String major;
	private String grade;
	private String personal_id;
	private String birthdate;

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getPersonal_id() {
		return personal_id;
	}

	public void setPersonal_id(String personal_id) {
		this.personal_id = personal_id;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public Student(String name, String id, String birthdate, String major, String grade, String personal_id,
			String phoneNumber, String identify, String password) {
		super(name, id, password, phoneNumber, identify);
		this.major = major;
		this.grade = grade;
		this.personal_id = personal_id;
		this.birthdate = birthdate;
	}
	public Student(String name, String id, String birthdate, String major, String grade, String personal_id,
			String phoneNumber) {
		super(name, id,phoneNumber);
		this.major = major;
		this.grade = grade;
		this.personal_id = personal_id;
		this.birthdate = birthdate;
	}
}
