package db;

public class GUI {
	Validate valid;
	public int clickOnLoginButton(String id, String password) {
		valid.requestToLogin(id, password);
		return 1;
		
	}

	public boolean clickOnSelectButton() {
		return false;
	}

	public boolean clickOnDeleteButton() {
		return false;
	}

	public boolean clickOnUpdateButton() {
		return false;
	}

	public boolean clickOnSignUpButton() {
		return false;
	}

	public boolean clickOnInsertButton() {
		return false;
	}

	public boolean clickOnLogOutButton() {

		return false;
	}

	public void readStudentSearchInfo() {
	}

	public void readIdentify() {

	}

	public void readStudentInfo() {

	}

	public boolean requestToSelect() {
		return false;
	}

	public void openLoginWindow() {

	}

	public void openStudentTabWindow() {

	}

	public void openManagerTabWindow() {

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
